@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'root view for item data'
@Metadata.ignorePropagatedAnnotations: true
define view entity zsac_i_item
  as select from ztb_sac_item
  association to parent zsac_i_header as _header on $projection.BillId = _header.BillId
{
  key bill_id               as BillId,
  key item_no               as ItemNo,
      material_id           as MaterialId,
      description           as Description,
      @Semantics.quantity.unitOfMeasure: 'UOM'
      quantity              as Quantity,
      @Semantics.amount.currencyCode: 'Currency'
      item_amount           as ItemAmount,
      currency              as Currency,
      uom                   as Uom,
      createdby             as Createdby,
      createdat             as Createdat,
      lastchangedby         as Lastchangedby,
      last_changed_at       as LastChangedAt,
      local_last_changed_at as LocalLastChangedAt,
      _header
}
