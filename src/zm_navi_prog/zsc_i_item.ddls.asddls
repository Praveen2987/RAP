@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'interface view for item'
@Metadata.ignorePropagatedAnnotations: true
define view entity zsc_i_item
  as select from zsc_order_item
  association to parent zsc_i_header as _head on $projection.Vbeln = _head.Vbeln
{
  key vbeln        as Vbeln,
  key posnr        as Posnr,
      matnr        as Matnr,
      @Semantics.quantity.unitOfMeasure: 'UOM'
      quantity     as Quantity,
      @Semantics.amount.currencyCode: 'currency'
      amount       as Amount,
      currency     as Currency,
      uom          as Uom,
      changed_date as ChangedDate,
      _head
}
