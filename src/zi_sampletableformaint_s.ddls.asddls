@EndUserText.label: 'sample table for maintainence object Sin'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.semanticKey: [ 'SingletonID' ]
@UI: {
  headerInfo: {
    typeName: 'SampleTableForMaAll'
  }
}
define root view entity ZI_SampleTableForMaint_S
  as select from I_Language
    left outer join I_CstmBizConfignLastChgd on I_CstmBizConfignLastChgd.ViewEntityName = 'ZI_SAMPLETABLEFORMAINT'
  composition [0..*] of ZI_SampleTableForMaint as _SampleTableForMaint
{
  @UI.facet: [ {
    id: 'ZI_SampleTableForMaint', 
    purpose: #STANDARD, 
    type: #LINEITEM_REFERENCE, 
    label: 'sample table for maintainence object', 
    position: 1 , 
    targetElement: '_SampleTableForMaint'
  } ]
  @UI.lineItem: [ {
    position: 1 
  } ]
  key 1 as SingletonID,
  _SampleTableForMaint,
  @UI.hidden: true
  I_CstmBizConfignLastChgd.LastChangedDateTime as LastChangedAtMax
}
where I_Language.Language = $session.system_language
