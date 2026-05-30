@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'interface view for scheduled item'
@Metadata.ignorePropagatedAnnotations: true
define view entity ziv_schd_item
  as select from zso1_schd
{

      @UI.lineItem: [{ position: 10, label: 'Sales Doc' }]
  key vbeln as Vbeln,
      @UI.lineItem: [{ position: 10, label: 'Sales Item' }]
  key ponsr as Ponsr,
      @UI.lineItem: [{ position: 10, label: 'Purchase Doc' }]
      banfn as Banfn
}
