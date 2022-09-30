Class ZMSP.MFT.FHIRProcess Extends Ens.BusinessProcess [ ClassType = persistent ]
{

Method OnRequest(pRequest As Ens.MFT.StreamContainer, Output pResponse As Ens.Response) As %Status
{
	set tSC=$$$OK
    set tLoader=##class(HS.FHIRServer.Tools.DataLoader).%New("FHIRServer","/csp/healthshare/fhirserver/fhir/r4")
    set tSC=tLoader.SubmitResourceStream(pRequest.Stream,"JSON",.size,.entryCount,.elapsed)
    Set pResponse = tSC
	Quit tSC
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
