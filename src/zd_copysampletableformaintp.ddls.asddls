@EndUserText.label: 'Copy sample table for maintainence object'
define abstract entity ZD_CopySampleTableForMaintP
{
  @EndUserText.label: 'New Vehicle No'
  @UI.defaultValue: #( 'ELEMENT_OF_REFERENCED_ENTITY: VechNo' )
  VechNo : ZVECH_NO;
  @EndUserText.label: 'New Truth Value'
  @UI.defaultValue: #( 'ELEMENT_OF_REFERENCED_ENTITY: VechPass' )
  VechPass : ABAP_BOOLEAN;
}
