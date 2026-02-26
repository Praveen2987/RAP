@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS view for PO data'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity zi_po_data
  as select from zpo_tab1
  //composition of target_data_source_name as _association_name
{

      @Consumption.valueHelpDefinition: [{
      //    qualifier: '',
          entity: {
              name: 'ZCDS_PO_NO',
              element: 'Ebeln'
          }
       }]
  key ebeln as Ebeln,
      bukrs as Bukrs,
      aedat as Aedat,
      kunnr as Kunnr

//      @ObjectModel.virtualElement: true
//      @ObjectModel.virtualElementCalculatedBy: 'ZCL_DEMO_CDS_CALC'
//      Phone
      //    _association_name // Make association public
}
