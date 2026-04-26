@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'interface view for header'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zsc_i_header
  as select from zsc_order_header
  composition [1..*] of zsc_i_item as _item
{
  key vbeln        as Vbeln,
      doc_type     as DocType,
      erdat        as Erdat,
      changed_date as ChangedDate,
      _item // Make association public
}
