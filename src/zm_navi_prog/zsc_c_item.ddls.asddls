@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection view for item'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity zsc_c_item
  as projection on zsc_i_item
{
  key Vbeln,
  key Posnr,
      Matnr,
      @Semantics.quantity.unitOfMeasure: 'UOM'
      Quantity,
      @Semantics.amount.currencyCode: 'Currency'
      Amount,
      Currency,
      Uom,
      ChangedDate,
      /* Associations */
      _head : redirected to parent zsc_c_header

}
