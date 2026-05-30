@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for carrier name'
@Metadata.ignorePropagatedAnnotations: true
define view entity ziv_carrier_name
  as select from /dmo/carrier
{

  key carrier_id    as CarrierId,
      @Semantics.text: true
      name          as Name,
      currency_code as CurrencyCode

}
