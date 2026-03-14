@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption for PO item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define  view entity zc_item_po
  as select from ZI_item_po
  association to parent zc_header_po as _header on $projection.Pono = _header.Pono
{
  key Pono,
  key Poitem,
      @Semantics.quantity.unitOfMeasure: 'Unit'
      Quantity,
      Unit,
      _header
}
