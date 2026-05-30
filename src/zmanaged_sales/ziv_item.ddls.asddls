@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'interface view for item'
@Metadata.ignorePropagatedAnnotations: true
define view entity ziv_item
  as select from zso1_item

//  association [0..*] to ziv_schd_item as _Schd on  $projection.Vbeln = _Schd.Vbeln
//                                               and $projection.Posnr = _Schd.Ponsr
{

     @UI.facet: [{
          qualifier: '',
          feature: '',
          id: 'Item_Det',
          purpose: #STANDARD,
          position: 10,
          importance: #HIGH,
          label: 'Sale Items',
          type: #LINEITEM_REFERENCE
      }]
      @UI.lineItem: [{ position: 10, label: 'Sales Doc' }]
  key vbeln    as Vbeln,
      @UI.lineItem: [{ position: 20, label: 'Sales Item' }]
  key posnr    as Posnr,
      @UI.lineItem: [{ position: 30, label: 'Material' }]
      matnr    as Matnr,
      @UI.lineItem: [{ position: 40, label: 'Price' }]
      @Semantics.amount.currencyCode: 'currency'
      amount   as Amount,
      @UI.lineItem: [{ position: 50, label: 'Currency' }]
      currency as Currency
//      _Schd
}
