@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection for item data'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity zsac_c_item
  as projection on zsac_i_item
{
  key BillId,
  key ItemNo,
      MaterialId,
      Description,
      @Semantics.quantity.unitOfMeasure: 'Uom'
      Quantity,
      @Semantics.amount.currencyCode: 'Currency'
      ItemAmount,
      Currency,
      Uom,
      Createdby,
      Createdat,
      Lastchangedby,
      LastChangedAt,
      LocalLastChangedAt,
      /* Associations */
      _header : redirected to parent zsac_c_header
}
