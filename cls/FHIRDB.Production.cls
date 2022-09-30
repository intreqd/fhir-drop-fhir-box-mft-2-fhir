Class FHIRDB.Production Extends Ens.Production [ Not ProcedureBlock ]
{

XData ProductionDefinition
{
<Production Name="FHIRDBPKG.FoundationProduction" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>1</ActorPoolSize>
  <Item Name="FromDropbox" Category="Dropbox,MFT" ClassName="EnsLib.MFT.Service.Passthrough" PoolSize="1" Enabled="true" Foreground="false" Comment="Ingest FHIR from Dropbox" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">MFT.FHIRProcess,ToBox</Setting>
    <Setting Target="Adapter" Name="DeleteFromServer">1</Setting>
    <Setting Target="Adapter" Name="MFTConnectionName">FHIRDrop</Setting>
    <Setting Target="Adapter" Name="MFTSourceFolders">/InFHIR</Setting>
  </Item>
  <Item Name="FromBox" Category="Box,MFT" ClassName="EnsLib.MFT.Service.Passthrough" PoolSize="1" Enabled="true" Foreground="false" Comment="Ingest FHIR from Dropbox" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">MFT.FHIRProcess,ToDropbox</Setting>
    <Setting Target="Adapter" Name="DeleteFromServer">2</Setting>
    <Setting Target="Adapter" Name="FilesToRetrieve"></Setting>
    <Setting Target="Adapter" Name="MFTConnectionName">FHIRBox</Setting>
    <Setting Target="Adapter" Name="MFTSourceFolders">/FHIRBox</Setting>
    <Setting Target="Adapter" Name="IncludeSubFolders">1</Setting>
  </Item>
  <Item Name="MFT.FHIRProcess" Category="MFT,Box,Dropbox" ClassName="ZMSP.MFT.FHIRProcess" PoolSize="1" Enabled="true" Foreground="false" Comment="Process FHIR" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="ToBox" Category="Dropbox,Box,MFT" ClassName="EnsLib.MFT.Operation.Passthrough" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="MFTConnectionName">FHIRBox</Setting>
    <Setting Target="Host" Name="DefaultMFTFolder">/FromDropbox</Setting>
  </Item>
  <Item Name="ToDropbox" Category="Box,Dropbox,MFT" ClassName="EnsLib.MFT.Operation.Passthrough" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="DefaultMFTFolder">/FromBox</Setting>
    <Setting Target="Adapter" Name="MFTConnectionName">FHIRDrop</Setting>
  </Item>
</Production>
}

}
