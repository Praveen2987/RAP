@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption for PO header bill'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity zc_header_po
  as select from ZI_HEAD_PO
  composition [1..*] of zc_item_po as _item

{
  key Pono,
      Pocompany,
      Podate,
      Podesc,
      Postatus,
      _item
}
