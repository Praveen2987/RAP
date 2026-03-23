@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'root view for header data'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zsac_i_header
  as select from ztb_sac_header
  composition [0..*] of zsac_i_item as _item
{
  key bill_id               as BillId,
      bill_type             as BillType,
      bill_date             as BillDate,
      customer_id           as CustomerId,
      @Semantics.amount.currencyCode : 'Currency'
      net_amount            as NetAmount,
      currency              as Currency,
      sales_org             as SalesOrg,
      createdby             as Createdby,
      createdat             as Createdat,
      lastchangedby         as Lastchangedby,
      last_changed_at       as LastChangedAt,
      local_last_changed_at as LocalLastChangedAt,
      _item // Make association public
}
