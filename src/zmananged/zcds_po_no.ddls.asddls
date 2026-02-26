@AbapCatalog.sqlViewName: 'ZPO_NUM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds for po no'
@Metadata.ignorePropagatedAnnotations: true
define view zcds_po_no
  as select from zpo_no_data
{
  key ebeln as Ebeln
}
