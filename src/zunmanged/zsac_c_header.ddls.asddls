@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection for header'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity zsac_c_header
  provider contract transactional_query
  as projection on zsac_i_header
{
  key BillId,
      BillType,
      BillDate,
      CustomerId,
      @Semantics.amount.currencyCode: 'Currency'
      NetAmount,
      Currency,
      SalesOrg,
      Createdby,
      Createdat,
      Lastchangedby,
      LastChangedAt,
      LocalLastChangedAt,
      /* Associations */
      _item : redirected to composition child zsac_c_item
}
