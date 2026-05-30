@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'consumption to item'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity zc_so1_item
  as projection on zi_so1_item
{
  key Vbeln,
  key itemno,
      Matnr,
      @Semantics.amount.currencyCode: 'currency'
      Amount,
      Currency,
      /* Associations */
      _header : redirected to parent zc_so1_header,
      _schd 
      //
}
