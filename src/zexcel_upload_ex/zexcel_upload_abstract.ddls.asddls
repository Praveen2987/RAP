@EndUserText.label: 'excel upload abstract'
define root abstract entity zexcel_upload_abstract
  //  with parameters parameter_name : parameter_type
{
  @Semantics.largeObject.mimeType: 'MimeType'
  @Semantics.largeObject.fileName: 'FileName'
  @Semantics.largeObject.contentDispositionPreference: #INLINE
  @EndUserText.label: 'Select Excel file'
  StreamProperty : abap.rawstring(0);

  @UI.hidden     : true
  MimeType       : abap.char(128);

  @UI.hidden     : true
  FileName       : abap.char(128);

}
