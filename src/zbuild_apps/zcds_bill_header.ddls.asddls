@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds for Bill header'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZCDS_BILL_HEADER
  as select from zbill_header
  //composition of target_data_source_name as _association_name
{
  key bill_id       as BillId,
      bill_type     as BillType,
      cust_id       as CustId,
      sales_org     as SalesOrg,
      @Semantics.amount.currencyCode: 'Currency'
      net_amount    as NetAmount,
      currency      as Currency,
      created_dt    as CreatedDt,
      changed_dt_tm as ChangedDtTm
      //    _association_name // Make association public
}
