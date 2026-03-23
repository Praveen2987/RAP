@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for header item'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_bill_itm
  as select from ztb_bill_itm
  association to parent zi_bill_head as _head on $projection.BillId = _head.BillId
{
  key bill_id         as BillId,
  key item_no         as ItemNo,
      material_id     as MaterialId,
      description     as Description,
      @Semantics.quantity.unitOfMeasure: 'Uom'
      quantity        as Quantity,
      @Semantics.amount.currencyCode : 'Currency'
      item_amount     as ItemAmount,
      currency        as Currency,
      uom             as Uom,
      last_changed_at as LastChangedAt,
      createdby       as Createdby,
      changedby       as Changedby,
      _head
}
