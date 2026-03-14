@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection view for item po'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity zp_item_po
  as projection on zc_item_po
{
  key Pono,
  key Poitem,
      @Semantics.quantity.unitOfMeasure : 'Unit'
      Quantity,
      Unit,
      /* Associations */
      _header : redirected to parent zp_header_po
}
