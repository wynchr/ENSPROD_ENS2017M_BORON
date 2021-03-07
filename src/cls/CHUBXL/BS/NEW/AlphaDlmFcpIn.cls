Class CHUBXL.BS.NEW.AlphaDlmFcpIn Extends Ens.BusinessService [ ClassType = "", ProcedureBlock ]
{

/*
--------------------------------------------------------------------------------------------------------------------------------
DESCRIPTION
-----------
BS ALPHA Dlm

VERSION
-------
CWY	24/07/2018	Initial Version

OPTIMISATION
------------


SOURCE
------
CHUBXL.BS.AlphaFcpIn

--------------------------------------------------------------------------------------------------------------------------------
*/
Property FileArchivePath As %String(TRUNCATE = 1) [ InitialExpression = "D:\DATA\ENS\Test\SIBELMED\archive" ];

/// Automatic Metric
Property AddToMetric As %Boolean [ InitialExpression = 1 ];

Parameter ADAPTER = "EnsLib.File.InboundAdapter";

Method OnProcessInput(pInput As %FileCharacterStream, pOutput As %RegisteredObject) As %Status
{

	s tsc=$$$OK
	s tSC=##class(CHUBXL.DATA.RawMessageStream).saveMessage(pInput,"Recup",.MsgOut)
	s tsc=..SendRequestAsync("AlphaAllArcRouting",MsgOut)
	Quit tsc
}

}
