@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'file upload'
//@Metadata.ignorePropagatedAnnotations: true
define root view entity zi_file_upload
  as select from zfile_upload
  //composition of target_data_source_name as _association_name
{

      @UI.facet: [{ id : 'upload',
                        position : 10,
                        purpose: #STANDARD,
                        type: #IDENTIFICATION_REFERENCE,
                        label : 'Upload Data'
                         }]

      @UI:{ lineItem: [{  position : 10 }],
          identification: [{ position : 10 }]
        }
      @EndUserText.label: 'Id'

  key id         as Id,



      @UI:{ lineItem: [{  position : 20,label: 'Attachement' }],
      identification: [{ position : 20,label: 'Attachement' } ]
      }

      @Semantics.largeObject: {
          mimeType: 'Mimetype',
          fileName: 'Filename',
      //    acceptableMimeTypes: [ '' ],
          contentDispositionPreference: #INLINE
      //    cacheControl: {
      //        maxAge:
      //    }
      }

      attachment as Attachment,


      //      @UI:{ lineItem: [{  position : 30 }]  }
      //      @EndUserText.label: 'File Type'
      @Semantics.mimeType: true
      mimetype   as Mimetype,


      @UI:{ lineItem: [{  position : 40 }],
      selectionField: [{ position : 10 }],
      identification: [{ position : 30 } ]
      }
      @EndUserText.label: 'File Name'


      filename   as Filename,
      //    _association_name // Make association public


      changed_at as locllastchanged


}
