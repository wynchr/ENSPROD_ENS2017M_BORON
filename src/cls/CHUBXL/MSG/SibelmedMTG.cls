Class CHUBXL.MSG.SibelmedMTG Extends CHUBXL.MSG.SibelmedFtransHeader [ ClassType = persistent, ProcedureBlock ]
{

/// Date de création du record
Property DGDATE As %TimeStamp [ InitialExpression = {$zdatetime($h,3)} ];

/// Dummy
Property ENVIRONNEMENT As %String(TRUNCATE = 1);

Property CODEMVT2 As %String(TRUNCATE = 1);

/// Nom, Prenom du patient
Property NOM As %String(TRUNCATE = 1);

/// ADR
Property ADR1 As %String(TRUNCATE = 1);

/// ADR2
Property ADR2 As %String(TRUNCATE = 1);

/// CP Localite
Property LOC As %String(TRUNCATE = 1);

/// Date de naissance AAAAMMJJ
Property DNAIS As %String(TRUNCATE = 1);

/// Sexe 
/// 0 féminin
/// 1 masculin
/// 2 inconnu
Property SEXE As %String(TRUNCATE = 1);

/// langue
/// F / N
Property LANG As %String(TRUNCATE = 1);

/// Nom du  conjoint
Property NOMPC As %String(TRUNCATE = 1);

/// Décédé ( "+" )
Property DECEDE As %String(TRUNCATE = 1);

/// Date décès AAAAMMJJ
Property DDECES As %String(TRUNCATE = 1);

/// Etat civil
Property ETCIV As %String(TRUNCATE = 1);

/// Nationalité
Property NAT As %String(TRUNCATE = 1);

/// Téléphone
Property TEL As %String(TRUNCATE = 1);

/// N° Médecin traitant ( 6 premières positions )
Property NMED As %String(TRUNCATE = 1);

/// Parenté avec personne complémentaire
Property PARPC As %String(TRUNCATE = 1);

/// Membre du personnel
Property PERS As %String(TRUNCATE = 1);

/// N° carte identité
Property NIDENT As %String(TRUNCATE = 1);

/// N° National
Property NNAT As %String(TRUNCATE = 1);

/// n° hôpital 01/02/08
Property NHOP As %String(TRUNCATE = 1);

/// Type Dossier
/// A 	dossier annulé ( doublon )
/// T	dossier temporaire
Property TDOSM2 As %String(TRUNCATE = 1);

/// N° de dossier actif si TDOSM = A
Property NDOSM2 As %String(TRUNCATE = 1);

/// N° Archive
Property NARC As %String(TRUNCATE = 1);

Property PAYS As %String(TRUNCATE = 1);

/// Lieu de naissance
Property LNAIS As %String(TRUNCATE = 1);

/// Profession
Property PROF As %String(TRUNCATE = 1);

/// Dummy
Property DCREATION As %String(TRUNCATE = 1);

Storage Default
{
<Data name="SibelmedMTGDefaultData">
<Subscript>"SibelmedMTG"</Subscript>
<Value name="1">
<Value>DGDATE</Value>
</Value>
<Value name="2">
<Value>ENVIRONNEMENT</Value>
</Value>
<Value name="3">
<Value>CODEMVT2</Value>
</Value>
<Value name="4">
<Value>NOM</Value>
</Value>
<Value name="5">
<Value>ADR1</Value>
</Value>
<Value name="6">
<Value>ADR2</Value>
</Value>
<Value name="7">
<Value>LOC</Value>
</Value>
<Value name="8">
<Value>DNAIS</Value>
</Value>
<Value name="9">
<Value>SEXE</Value>
</Value>
<Value name="10">
<Value>LANG</Value>
</Value>
<Value name="11">
<Value>NOMPC</Value>
</Value>
<Value name="12">
<Value>DECEDE</Value>
</Value>
<Value name="13">
<Value>DDECES</Value>
</Value>
<Value name="14">
<Value>ETCIV</Value>
</Value>
<Value name="15">
<Value>NAT</Value>
</Value>
<Value name="16">
<Value>TEL</Value>
</Value>
<Value name="17">
<Value>NMED</Value>
</Value>
<Value name="18">
<Value>PARPC</Value>
</Value>
<Value name="19">
<Value>PERS</Value>
</Value>
<Value name="20">
<Value>NIDENT</Value>
</Value>
<Value name="21">
<Value>NNAT</Value>
</Value>
<Value name="22">
<Value>NHOP</Value>
</Value>
<Value name="23">
<Value>TDOSM2</Value>
</Value>
<Value name="24">
<Value>NDOSM2</Value>
</Value>
<Value name="25">
<Value>NARC</Value>
</Value>
<Value name="26">
<Value>PAYS</Value>
</Value>
<Value name="27">
<Value>LNAIS</Value>
</Value>
<Value name="28">
<Value>PROF</Value>
</Value>
<Value name="29">
<Value>DCREATION</Value>
</Value>
</Data>
<DefaultData>SibelmedMTGDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
