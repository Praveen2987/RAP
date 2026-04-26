@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection view for header'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity zsc_c_header
  provider contract transactional_query
  as projection on zsc_i_header
{
  key Vbeln,
      DocType,
      Erdat,
      ChangedDate,
      /* Associations */
      _item : redirected to composition child zsc_c_item
}
