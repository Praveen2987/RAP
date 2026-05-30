@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'consumption to header'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity zc_so1_header
  provider contract transactional_query
  as projection on zi_so1_header
{
  key Vbeln,
      Erdat,
      Auart,
      Vkorg,
      Createddate,
      Changedate,
      /* Associations */
      _item : redirected to composition child zc_so1_item,
      _schd : redirected to zc_so1_schd
}
