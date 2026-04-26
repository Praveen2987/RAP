@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'consumption for invoice header'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity zc_invoice
  provider contract transactional_query
  as projection on ZI_INVOICETABLE
{
  key Invoice,
      Comments,
      Attachment,
      MimeType,
      Filename,
      //      LocalCreatedBy,
      //      LocalCreatedAt,
      //      LocalLastChangedBy,
      LocalLastChangedAt
      //      LastChangedAt
}
