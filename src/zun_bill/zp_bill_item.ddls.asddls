@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection view for item bill'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity zp_bill_item
  as projection on zi_bill_itm
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
      LastChangedAt,
      Createdby,
      Changedby,
      /* Associations */
      _head : redirected to parent zp_bill_header

}
