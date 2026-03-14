@EndUserText.label: 'sample table for maintainence object'
@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
define view entity ZI_SampleTableForMaint
  as select from ZTABLE_MAINT
  association to parent ZI_SampleTableForMaint_S as _SampleTableForMaAll on $projection.SingletonID = _SampleTableForMaAll.SingletonID
{
  key VECH_NO as VechNo,
  key VECH_PASS as VechPass,
  @Consumption.hidden: true
  1 as SingletonID,
  _SampleTableForMaAll
}
