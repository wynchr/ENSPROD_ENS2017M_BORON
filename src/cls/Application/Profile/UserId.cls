/// Utilisateurs de l'application
Class Application.Profile.UserId Extends %Persistent
{

Parameter DOMAIN As STRING = "ciges";

Parameter PASSWORDMINSIZE = 0;

Parameter PASSWORDSPECCHAR = 0;

/// Nom d'utilisateur
Property username As %String(MAXLEN = "");

/// Mot de passe
Property password As %String(MAXLEN = "");

/// salt utilisé pour le cryptage du mot de passe
Property salt As %String(MAXLEN = "");

/// Nom de famille
Property lastName As %String(MAXLEN = "");

/// Prénom
Property firstName As %String(MAXLEN = "");

/// Paramètres du profil utilisateur
Property params As Application.Profile.Parameter;

Property group As Application.Profile.Group;

Property default As Application.Profile.Default;

Relationship settings As Application.Profile.UserIdSetting [ Cardinality = children, Inverse = userId ];

Index userIdProfileIdx On username [ Unique ];

Method %OnValidateObject() As %Status [ Private, ServerOnly = 1 ]
{
	q:(..username="") $$$ERROR(5001,$$$Text("Nom d'utilisateur obligatoire"))
	q:(..password="") $$$ERROR(5001,$$$Text("Mot de passe obligatoire"))
	q:(..lastName="") $$$ERROR(5001,$$$Text("Nom de famille obligatoire"))
	q:(..firstName="") $$$ERROR(5001,$$$Text("Prénom obligatoire"))
	q $$$OK
}

Method %OnAddToSaveSet(depth As %Integer = 3, insert As %Integer = 0, callcount As %Integer = 0) As %Status [ Private, ServerOnly = 1 ]
{
	if (insert) {
		s existsId=..getIdByUsername(..username)
		q:(existsId'=0) $$$ERROR(5001,$$$Text("Un utilisateur ayant le même identifiant existe déjà"))
	}
	q $$$OK
}

/// Retourne l'ID d'un utilisateur selon un nom d'utilisateur et un mot de passe.<br/>
ClassMethod getUserIdForConnection(username As %String = "", password As %String = "", ByRef userId As %Integer) As %Status
{
	s sc=$$$OK
	try {	
		THROW:(($ZSTRIP(username,"*W")="") || ($ZSTRIP(password,"*W")="")) ##class(%Exception.StatusException).CreateFromStatus($$$ERROR(5001,$$$Text("Veuillez encoder un nom d'utilisateur et un mot de passe")))
		s userId=..getIdByUsername(username)
		THROW:(userId=0) ##class(%Exception.StatusException).CreateFromStatus($$$ERROR(5001,$$$Text("Cet utilisateur n'existe pas")))
		s user=..%OpenId(userId)
		THROW:('$ISOBJECT(user)) ##class(%Exception.StatusException).CreateFromStatus($$$ERROR(5001,$$$Text("Une erreur est survenue lors de la récupération de l'utilisateur")))
		THROW:('user.isPasswordValid(password)) ##class(%Exception.StatusException).CreateFromStatus($$$ERROR(5001,$$$Text("Nom d'utilisateur/Mot de passe incorrect")))
		THROW:('user.getParam("isActive")) ##class(%Exception.StatusException).CreateFromStatus($$$ERROR(5001,$$$Text("L'utilisateur est désactivé")))
	} catch (ex) {
		s userId=0
		s sc=ex.AsStatus()
	}
	q sc
}

/// Retourne l'ID d'un utilisateur selon un nom d'utilisateur
ClassMethod getIdByUsername(username As %String = "") As %Integer
{
	&sql(select ID into :userId from Application_Profile.UserId where username=:username)
	q ($S(SQLCODE=0:userId,1:0))
}

/// Vérifie le mot de passe d'un utilisateur
Method isPasswordValid(password As %String = "") As %Boolean
{
	s pbkdf2Password=##class(%SYSTEM.Encryption).PBKDF2(password,128000,..salt,20)
	q (..password=pbkdf2Password)
}

/// Retourne le nom complet de l'utilisateur
Method getCompleteName(separator As %String = " ") As %String
{
	q ..lastName_separator_..firstName
}

/// Récupère le paramètre demandé, en chaînant user->group->defauft
Method getParam(paramName As %String = "") As %String
{
	q:(paramName="") ""
	s prop=$PROPERTY(..params,paramName)
	if ($ISOBJECT(prop)) {
		if (prop.%IsA("%Collection.AbstractIterator")) {
			q:($METHOD(prop,"Count")>0) prop
		} else {
			q prop.%Id()
		}
	} else {
		q:(prop'="") prop
	}
	if ($ISOBJECT(..group)) {
		s prop=$PROPERTY(..group.params,paramName)
		if ($ISOBJECT(prop)) {
			if (prop.%IsA("%Collection.AbstractIterator")) {
				q:($METHOD(prop,"Count")>0) prop
			} else {
				q prop.%Id() 
			}
		} else  {
			q:(prop'="") prop
		}	
	}
	if ($ISOBJECT(..default)) {
		s prop=$PROPERTY(..default.params,paramName)
		if ($ISOBJECT(prop)) {
			if (prop.%IsA("%Collection.AbstractIterator")) {
				q:($METHOD(prop,"Count")>0) prop
			} else {
				q prop.%Id()
			}
		} else {
			q:(prop'="") prop
		}
	}
	q ""
}

/// Récupère un paramètre utilisateur selon son nom
Method getSettingObj(name As %String) As Application.Profile.UserIdSetting
{
	s userSetting=""
	s kSetting=""
	s setting=..settings.GetNext(.kSetting)
	while (kSetting'="") {
		if (setting.name=name) {
			s userSetting=setting
			q
		}
		s setting=..settings.GetNext(.kSetting)	
	}
	q userSetting
}

/// Récupère la valeur (en string) d'un paramètre utilisateur selon son nom
Method getSettingValue(name As %String) As %String
{
	s setting=..getSettingObj(name)
	q:($ISOBJECT(setting)) setting.valueString
	q ""
}

/// Récupère la valeur (en stream) d'un paramètre utilisateur selon son nom
Method getSettingValueStream(name As %String) As %GlobalCharacterStream
{
	s setting=..getSettingObj(name)
	q:($ISOBJECT(setting)) setting.valueStream
	q ""
}

/// Initialise la valeur (en string) d'un paramètre utilisateur selon son nom
Method setSettingValue(name, value As %String) As %Status
{
	s setting=..getSettingObj(name)
	if ($ISOBJECT(setting)) {
		s setting.valueString=value	
	} else {
		s setting=##class(Application.Profile.UserIdSetting).%New()
		s setting.userId=##this
		s setting.name=name
		s setting.valueString=value
	}	
	q setting.%Save()
}

/// Initialise la valeur (en stream) d'un paramètre utilisateur selon son nom
Method setSettingValueStream(name, value As %GlobalCharacterStream) As %Status
{
	s setting=..getSettingObj(name)
	if ($ISOBJECT(setting)) {
		s setting.valueStream=value	
	} else {
		s setting=##class(Application.Profile.UserIdSetting).%New()
		s setting.userId=##this
		s setting.name=name
		s setting.valueStream=value
	}	
	q setting.%Save()
}

/// Enregistre d'un nouveau mot de passe en passant par le cryptage de ce dernier
Method storeNewPassword(password As %String = "") As %Status
{
	s sc=$$$OK
	try {
		THROW:($L(password)<..#PASSWORDMINSIZE) ##class(%Exception.StatusException).CreateFromStatus($$$ERROR(5001,$$$FormatText($$$Text("Le mot de passe doit faire au moins %1 caractères"),..#PASSWORDMINSIZE)))		
		if (..#PASSWORDSPECCHAR) {
			s specCharFound=0
			s specCharList=$LB("-",",",";",".",":","/","(",")","{","}","[","]","$","%","£","+","=","\","*","#","|","@","&","'","!","?","<",">")
			s p=0
			while ($LISTNEXT(specCharList,p,specChar)) {
				if ($F(password,specChar)>0) {
					s specCharFound=1
					q
				}
			}
			THROW:('specCharFound) ##class(%Exception.StatusException).CreateFromStatus($$$ERROR(5001,$$$FormatText($$$Text("Le mot de passe doit contenir des caractères non-alphanumérique ( %1 )"),$LTS(specCharList,""))))
		}
		s newSalt=##class(%SYSTEM.Encryption).GenCryptRand(20)
		s ..salt=newSalt
		s pbkdf2Password=##class(%SYSTEM.Encryption).PBKDF2(password,128000,newSalt,20)
		s ..password=pbkdf2Password
	} catch (ex) {
		s sc=ex.AsStatus()
	}
	q sc
}

Storage Default
{
<Data name="UserIdDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>username</Value>
</Value>
<Value name="3">
<Value>password</Value>
</Value>
<Value name="4">
<Value>lastName</Value>
</Value>
<Value name="5">
<Value>firstName</Value>
</Value>
<Value name="6">
<Value>params</Value>
</Value>
<Value name="7">
<Value>group</Value>
</Value>
<Value name="8">
<Value>default</Value>
</Value>
<Value name="9">
<Value>salt</Value>
</Value>
</Data>
<DataLocation>^Application.Profile.UserIdD</DataLocation>
<DefaultData>UserIdDefaultData</DefaultData>
<ExtentSize>100000</ExtentSize>
<IdLocation>^Application.Profile.UserIdD</IdLocation>
<IndexLocation>^Application.Profile.UserIdI</IndexLocation>
<StreamLocation>^Application.Profile.UserIdS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
