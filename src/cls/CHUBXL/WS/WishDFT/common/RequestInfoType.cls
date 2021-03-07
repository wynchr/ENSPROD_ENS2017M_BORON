/// General request parameters.
Class CHUBXL.WS.WishDFT.common.RequestInfoType Extends (%Persistent, %XML.Adaptor) [ ClassType = persistent, Inheritance = right, ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter XMLNAME = "PARAM";

Parameter XMLSEQUENCE = 1;

/// Programme.
Property PGM As %String(MAXLEN = "", XMLNAME = "PGM") [ Required ];

/// Utilisateur.
Property USER As %String(MAXLEN = "", XMLNAME = "USER") [ Required ];

/// N° de séjour.
Property PTNSEJ As %String(MAXLEN = "", XMLNAME = "PTNSEJ") [ Required ];

/// Code transaction.
Property PTTRAN As %String(MAXLEN = "", XMLNAME = "PTTRAN") [ Required ];

/// Nombre de records à traiter.
Property PTNBRC As %String(MAXLEN = "", XMLNAME = "PTNBRC") [ Required ];

/// Code mise-à-jour (A / D).
Property PTMOD As %String(MAXLEN = "", XMLNAME = "PTMOD") [ Required ];

/// Membre à remplir.
Property PTMBR As %String(MAXLEN = "", XMLNAME = "PTMBR") [ Required ];

/// Record prestations, produits pharmaceutiques et frais divers.
Property PTDATA As %String(MAXLEN = "", XMLNAME = "PTDATA") [ Required ];

Storage Default
{
<Data name="RequestInfoTypeSaveDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>PGM</Value>
</Value>
<Value name="3">
<Value>USER</Value>
</Value>
<Value name="4">
<Value>PTNSEJ</Value>
</Value>
<Value name="5">
<Value>PTTRAN</Value>
</Value>
<Value name="6">
<Value>PTNBRC</Value>
</Value>
<Value name="7">
<Value>PTMOD</Value>
</Value>
<Value name="8">
<Value>PTMBR</Value>
</Value>
<Value name="9">
<Value>PTDATA</Value>
</Value>
</Data>
<DataLocation>^CHUBXL.WS7A02.RequestInfoCF82D</DataLocation>
<DefaultData>RequestInfoTypeSaveDefaultData</DefaultData>
<IdLocation>^CHUBXL.WS7A02.RequestInfoCF82D</IdLocation>
<IndexLocation>^CHUBXL.WS7A02.RequestInfoCF82I</IndexLocation>
<StreamLocation>^CHUBXL.WS7A02.RequestInfoCF82S</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
