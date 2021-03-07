/// Paramètres génériques du profil
/// Les valeurs par défaut doivent se mettre dans le paramétrage du profile "défaut"
Class Application.Profile.Parameter Extends (%SerialObject, %XML.Adaptor)
{

/// Actif
/// Le profil est-il actif ?
/// Si non, l'utilisateur ne pourra pas se connecter
Property isActive As %Boolean;

/// Menu administrateur
Property adminMenu As Ciges.TreeMenu;

/// Accès à l'onglet Monitoring
Property canAccessMonitoring As %Boolean;

/// Accès à la partie Production - Monitoring
Property canSeeMonitoringProduction As %Boolean;

/// Accès à la partie Espaces disques - Monitoring
Property canSeeMonitoringDisks As %Boolean;

/// Accès à la partie Files d'attente - Monitoring
Property canSeeMonitoringQueues As %Boolean;

/// Accès à l'onglet Recherche de messages
Property canAccessMessagesBrowser As %Boolean;

/// Accès à l'onglet Logs
Property canAccessLogs As %Boolean;

/// Accès à l'onglet Institution
Property canAccessInstitution As %Boolean;

/// Arrêt/Démarrage de la production ?
Property canChangeProductionStatus As %Boolean;

/// Arrêt/Démarrage d'un connecteur ?
Property canChangeConfigItemStatus As %Boolean;

Storage Default
{
<Data name="ParameterState">
<Value name="1">
<Value>isActive</Value>
</Value>
<Value name="2">
<Value>adminMenu</Value>
</Value>
<Value name="3">
<Value>canAccessMonitoring</Value>
</Value>
<Value name="4">
<Value>canSeeMonitoringProduction</Value>
</Value>
<Value name="5">
<Value>canSeeMonitoringDisks</Value>
</Value>
<Value name="6">
<Value>canSeeMonitoringQueues</Value>
</Value>
<Value name="7">
<Value>canAccessMessagesBrowser</Value>
</Value>
<Value name="8">
<Value>canAccessLogs</Value>
</Value>
<Value name="9">
<Value>canChangeProductionStatus</Value>
</Value>
<Value name="10">
<Value>canChangeConfigItemStatus</Value>
</Value>
<Value name="11">
<Value>canAccessInstitution</Value>
</Value>
</Data>
<State>ParameterState</State>
<StreamLocation>^Application.Profile.ParameterS</StreamLocation>
<Type>%Library.CacheSerialState</Type>
}

}
