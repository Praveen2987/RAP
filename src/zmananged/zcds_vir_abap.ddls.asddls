@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'virtual element data'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zcds_vir_abap
  as select from zcds_abap
  //composition of target_data_source_name as _association_name
{


      @UI.lineItem: [{
           position: 10 ,
           type: #STANDARD,
           importance :#HIGH,
           label: 'Purchase doc'
            }]

  key ebeln as Purchasedoc,

      @UI.lineItem: [{
               position: 20 ,
               type: #STANDARD,
               importance :#HIGH,
               label: 'Company Code'
                }]

      bukrs as CompanyCode,

      @UI.lineItem: [{
           position: 30 ,
           type: #STANDARD,
           importance :#HIGH,
           label: 'Po Date'
            }]

      aedat as PODate,

      @UI.lineItem: [{
           position: 40 ,
           type: #STANDARD,
           importance :#HIGH,
           label: 'Customer'
            }]

      kunnr as Customer,
      @UI.lineItem: [{
           position: 50 ,
           type: #STANDARD,
           importance :#HIGH,
           label: 'Phone'
            }]

      phone as Phone
      //    _association_name // Make association public
}
