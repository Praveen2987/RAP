@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'root view for invoice table'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_INVOICETABLE
  as select from zinvoicetable
  //composition of target_data_source_name as _association_name
{

  key invoice               as Invoice,
      comments              as Comments,
      @Semantics.largeObject:
      { mimeType: 'MimeType',
      fileName: 'Filename',
      contentDispositionPreference: #INLINE }
      attachment            as Attachment,
      @Semantics.mimeType: true
      mimetype              as MimeType,
      filename              as Filename,
      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,
      @Semantics.user.lastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      //local ETag field --> OData ETag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      //total ETag field
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt

      //    _association_name // Make association public
}
