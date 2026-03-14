@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection view for header po'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity zp_header_po
  provider contract transactional_query
  as projection on zc_header_po

{
  key Pono,
      Pocompany,
      Podate,
      Podesc,
      Postatus,
      /* Associations */
      _item : redirected to composition child zp_item_po
}
