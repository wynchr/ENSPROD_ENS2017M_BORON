Class CHUBXL.DT.DIAHL7 Extends %RegisteredObject
{

ClassMethod ReadFile(FileIn As %String) As %Status
{
	Set $ZTrap = "ErrorTrap"
	
	if FileIn = "" {
		;Set FileIn = "D:\DATA\ENS\DATA\GLIMS\_samples\DIAHL7_01.HL7"
		;Set FileIn = "D:\DATA\ENS\DATA\GLIMS\_samples\glimsDIA.hl7"
		Set FileIn = "G:\PROD\Glims\in\GlimsBruLabHl7TcpIn_6383481.HL7"
	}
	
	Set exists = ##class(%File).Exists(FileIn)
	if 'exists {
		Quit "Input File don't exist" 
	}
	
	Set stream=##class(%FileCharacterStream).%New()
	Set stream.Filename=FileIn
	
	Set line=""
	While 'stream.AtEnd {
		Set line=line_stream.ReadLine()
   	}
   	W !,"- Original message : -----------",!
   	
   	Write line,!
   	   	
   	W !,"- Start convert : -----------",!
   	
   	d ##class(CHUBXL.DT.DIAHL7).Convert(line)

	W !,"- line2 : -----------",!
	
	S ptr="" F  S ptr=$O(^CHUBXL.TMPDIA(ptr)) Q:ptr=""  D
	. w !,ptr,"=",^CHUBXL.TMPDIA(ptr),!
	
	W "------------",!
	
	Quit $$$OK
	
ErrorTrap
 
 	Set $ZTrap = ""
 	Write $ZError,!
	Quit "Error"
}

ClassMethod Convert(RECORD As %String) As %Status
{
	Set $ZTrap = "ErrorTrap"
	
	;N (RECORD,SEP,W,%TC,%TA,PTRX,LIGNE)
	k ^CHUBXL.TMPDIA
	s PTRX=0
	S SEP="|"
 	S MSH=$P(RECORD,"PID",1)
 	;D INI^%MDH,TRMSH
 	D TRMSH
 	S PID="PID"_$P($P(RECORD,"PV1",1),"PID",2)
 	w !!,"$$$$$$"_PID_"$$$$$"
 	w !!,"*****"_$l(PID,"NTE|")_"********",!!
 	I PID["NTE|" S PID=$P(PID,"NTE|",1,$l(PID,"NTE|")-1)
 	w !!,"$$$$$$"_PID_"$$$$$"
 	w !!,"*****"_$l(PID,"PD1|")_"********",!!
 	I PID["PD1|" S PID=$P(PID,"PD1|",1)
 	D TRPID
 	S NBOBR=$L(RECORD,"OBR")-1
 	F NBR=1:1:NBOBR D OBR
 	Q
OBR ;
	;w "OBR",!
 	S RECOBR=$P(RECORD,"OBR",NBR+1)
 	S OBR="OBR"_$P(RECOBR,"OBX",1)
 	S POST="" D TROBR
 	S LIGNE(1)=MSH,LIGNE(2)=PID,LGN=3
 	S LIGNE(LGN)=OBR,LGN=LGN+1
 	S NBOBX=$L(RECOBR,"OBX")-1
 	F NBX=1:1:NBOBX D OBX
 	D WRITE
 	K LIGNE,LGN
 	Q 
OBX ;
	;w "OBX",!
	S RECOBX=$P(RECOBR,"OBX",NBX+1)
 	S OBX="OBX"_$P(RECOBX,"NTE",1)
 	D TROBX
 	S LIGNE(LGN)=OBX,LGN=LGN+1
 	S NBNTE=$L(RECOBX,"NTE")-1
 	F NBN=1:1:NBNTE D NTE
 	Q
NTE ;
	;w "NTE",!
 	S RECNTE=$P(RECOBX,"NTE",NBN+1)
 	S NTE="NTE"_$P(RECNTE,"ORC",1)
 	D TRNTE
 	S LIGNE(LGN)=NTE,LGN=LGN+1
 	Q
WRITE ;
	;w "WRITE",!
	S PTRX=PTRX+1
	S ^CHUBXL.TMPDIA(PTRX)=""
	F II=1:1:LGN-1 W PTRX_":"_LIGNE(II),! S ^CHUBXL.TMPDIA(PTRX)=^CHUBXL.TMPDIA(PTRX)_LIGNE(II)
 	Q 

TRMSH ;
	;w "TRMSH",!
 	S RECMSH="MSH|^~\&|ALPHA|Resultats|DIALYSE|GAMBRO|||ORU^R01||P|2.2|1||AL|NE|\r"
 	S $P(RECMSH,SEP,7)=$P(MSH,SEP,7)
 	S $P(RECMSH,SEP,10)=$P(MSH,SEP,10)
 	S MSH=RECMSH
 	Q
TRPID ;
	;w "TRPID",!
 	S PID=$P(PID,SEP,1,15)_SEP_"\r"
	S $P(PID,SEP,2)=""
 	S $P(PID,SEP,4)=$P($P(PID,SEP,4),"^",1)
 	Q
TROBR ;
	;w "TROBR",!
 	S NOPR=$P($P(OBR,SEP,4),"^",1) S:$E(NOPR,1,2)=29 POST="P-"
 	S $P(OBR,SEP,2)=1
 	S $P(OBR,SEP,3)=NOPR
 	S $P(OBR,SEP,4)=NOPR
 	S $P(OBR,SEP,5)="RESULTATS^LABORATOIRE"
 	S $P(OBR,SEP,6)=""
 	S $P(OBR,SEP,7)=$P(OBR,SEP,8)
 	S $P(OBR,SEP,8)=$P(OBR,SEP,8)
 	S $P(OBR,SEP,9)=""
 	S $P(OBR,SEP,10)=""
 	S $P(OBR,SEP,11)=""
 	S $P(OBR,SEP,12)=""
 	S $P(OBR,SEP,13)=""
 	S $P(OBR,SEP,14)=""
 	S $P(OBR,SEP,15)=""
 	S $P(OBR,SEP,16)=""
 	S $P(OBR,SEP,17)=$P($P(OBR,SEP,17),"^",1,3)
 	S OBR=$P(OBR,SEP,1,17)_"|||||||||F||^^^^^R|||\r"
 	Q
TROBX ;
	;w "TROBX",!
 	S OBX=$P(OBX,SEP,1,9)_"|||F||||\r"
 	S $P(OBX,SEP,3)="ST"
 	S ANA=$P(OBX,SEP,4)
 	S CD=$P(ANA,"^",1),$P(ANA,"^",3)="L",ANA=ANA_"^",FLOW=""
 	S FL="" F  S FL=$O(^CHUBXL.ALPHA("ALFA",FL)) Q:FL=""  D
 	. I $P(^CHUBXL.ALPHA("ALFA",FL),"~",3)=CD S FLOW=$G(POST)_FL
 	I FLOW'="" S $P(ANA,"^",1)=FLOW
 	S $P(OBX,SEP,4)=ANA
 	Q
TRNTE ;
	;w "TRNTS",!
 	S NTE=$P(NTE,SEP,1,4)_SEP_"\r"
 	Q

	//------------------------
	
	Quit $$$OK
	
ErrorTrap
 
 	Set $ZTrap = ""
 	Write $ZError,!
	Quit "Error"
}

}
