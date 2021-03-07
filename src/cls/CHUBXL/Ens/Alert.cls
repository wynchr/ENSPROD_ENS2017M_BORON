/// 
Class CHUBXL.Ens.Alert Extends Ens.Rule.Definition [ ProcedureBlock ]
{

Parameter RuleAssistClass = "EnsLib.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.MsgRouter.RoutingEngine" production="">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="" disabled="false">
<constraint name="source" value="ActivityChecker"></constraint>
<when condition="1">
<send transform="" target="ActivityCheckerAlertRegulator"></send>
<return></return>
</when>
</rule>
<rule name="" disabled="false">
<constraint name="msgClass" value="Ens.AlertRequest"></constraint>
<when condition="1">
<send transform="" target="AlertEmail"></send>
<return></return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
