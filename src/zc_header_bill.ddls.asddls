@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'consumption view bill header'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity zc_header_bill
  provider contract transactional_query
  as projection on zi_header_bill
{
  key BillId,
      BillType,
      CustId,
      SalesOrg,
      @Semantics.amount.currencyCode: 'Currency'
      NetAmount,
      Currency,
      CreatedDt,
      ChangedDtTm
}
