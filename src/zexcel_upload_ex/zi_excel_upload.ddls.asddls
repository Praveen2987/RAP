@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'interface view for excel upload'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zi_excel_upload
  as select from zexcel_file
  //composition of target_data_source_name as _association_name
{
  key vbeln         as Vbeln,
      posnr         as Posnr,
      mat_num       as MatNum,
      mat_desc      as MatDesc,
      @Semantics.quantity.unitOfMeasure: 'matquan'
      quantity      as Quantity,
      mat_quan      as MatQuan,
      @Semantics.amount.currencyCode: 'currency'
      amount        as Amount,
      currency      as Currency,
      created_dt    as created,
      changed_dt_tm as changed
      //    _association_name // Make association public
}
