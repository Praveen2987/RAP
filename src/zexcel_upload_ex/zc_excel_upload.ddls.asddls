@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'excel upload'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@AbapCatalog.extensibility.extensible: true
define root view entity zc_excel_upload
  provider contract transactional_query
  as projection on zi_excel_upload
{
  key Vbeln,
      Posnr,
      MatNum,
      MatDesc,
      @Semantics.quantity.unitOfMeasure: 'MatQuan'
      Quantity,
      MatQuan,
      @Semantics.amount.currencyCode: 'Currency'
      Amount,
      Currency

}
