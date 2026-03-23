@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for header bill'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zi_bill_head
  as select from ztb_bill
  composition [0..*] of zi_bill_itm as _item
{
  key bill_id         as BillId,
      bill_type       as BillType,
      bill_date       as BillDate,
      customer_id     as CustomerId,
      customer_name   as CustomerName,
      @Semantics.amount.currencyCode : 'Currency'
      net_amount      as NetAmount,
      currency        as Currency,
      sales_org       as SalesOrg,
      last_changed_at as LastChangedAt,
      createdby       as Createdby,
      changedby       as Changedby,
      _item // Make association public
}
