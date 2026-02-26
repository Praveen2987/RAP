@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'virtual element in cds'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

define view entity zcds_abap
  as select from zvir_table
{
  key ebeln,
      bukrs,
      aedat,
      kunnr,

      @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VIRTUAL_CALC_PHNE'

      phone,

      @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VIRTUAL_CALC_PHNE'

      addr



}
