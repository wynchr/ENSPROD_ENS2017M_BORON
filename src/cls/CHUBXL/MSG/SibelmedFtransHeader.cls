/// Header commun message Ftrans
Class CHUBXL.MSG.SibelmedFtransHeader Extends Ens.Request [ ClassType = persistent, ProcedureBlock ]
{

/// Id Message origine
Property rawMsg As CHUBXL.DATA.RawMessageString;

/// Numéro de séquence unique SIBELMED
Property HEADSEQ As %String(TRUNCATE = 1);

/// Identification du message
Property HEADMSGID As %String(TRUNCATE = 1);

/// Origine du message (no de la fonction SIBELMED)
Property HEADFROM As %String(TRUNCATE = 1);

/// Login de l'utilisateur
Property HEADUSERID As %String(TRUNCATE = 1);

/// Date et heure de modification dans la DB SIBELMED
/// Format: AAAA-MM-jj.HH:MM:SS
Property HEADDATE As %String(TRUNCATE = 1);

/// Numero unique du Patient dans le system SIBELMED
Property NDOSM As %String(TRUNCATE = 1);

/// Type de record
Property TYPERECORD As %String(TRUNCATE = 1);

/// C : Création <BR>
/// R : Rectification <BR>
/// D : Suppression logique d'une admission : Zone 30 = "*" ou suppression d'un mouvement <BR>
/// A : Réactivation d'une admission <BR>
Property CODEMVT As %String(TRUNCATE = 1);

Storage Default
{
<Data name="SibelmedFtransHeaderDefaultData">
<Subscript>"SibelmedFtransHeader"</Subscript>
<Value name="1">
<Value>rawMsg</Value>
</Value>
<Value name="2">
<Value>HEADSEQ</Value>
</Value>
<Value name="3">
<Value>HEADMSGID</Value>
</Value>
<Value name="4">
<Value>HEADFROM</Value>
</Value>
<Value name="5">
<Value>HEADUSERID</Value>
</Value>
<Value name="6">
<Value>HEADDATE</Value>
</Value>
<Value name="7">
<Value>NDOSM</Value>
</Value>
<Value name="8">
<Value>TYPERECORD</Value>
</Value>
<Value name="9">
<Value>CODEMVT</Value>
</Value>
</Data>
<DefaultData>SibelmedFtransHeaderDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
