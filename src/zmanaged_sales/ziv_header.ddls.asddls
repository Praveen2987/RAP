@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'interface view for header'
@Metadata.ignorePropagatedAnnotations: true

@UI.headerInfo: {
    typeName: 'Sale Data',
    typeNamePlural: 'Sales Data',
    title: {
        type: #STANDARD,
        label: 'Sales Data'
    }
}

define view entity ziv_header
  as select from zso1_header

    association [1..*] to ziv_item as _Item on $projection.Vbeln = _Item.Vbeln
    association [0..*] to ziv_schd_item as _Schd on $projection.Vbeln = _Schd.Vbeln


{

      @UI.facet: [

      {
          id: 'Header',
          purpose: #STANDARD,
          position: 10,
          importance: #HIGH,
          label: 'Sales Header',
          type: #IDENTIFICATION_REFERENCE
      },

      {
          id: 'Item',
          purpose: #STANDARD,
          position: 20,
          importance: #HIGH,
          label: 'Sales Item',
          type: #LINEITEM_REFERENCE,
          targetElement: '_Item'

      },

      {
          id: 'Schditem',
          purpose: #STANDARD,
          position: 30,
//          importance: ,
          label: 'Schedule Item',
          type: #LINEITEM_REFERENCE,
          targetElement: '_Schd'
      }

      ]


      @UI.lineItem: [{ position: 10, label: 'Sales Doc' }]
      @UI.identification: [{ position: 10 , label: 'Sales Doc' }]
  key vbeln       as Vbeln,

      @UI.lineItem: [{ position: 20, label: 'Date' }]
      @UI.identification: [{ position: 20 , label: 'Date' }]

      erdat       as Erdat,

      @UI.lineItem: [{ position: 30, label: 'Date' }]
      @UI.identification: [{ position: 30 , label: 'Date' }]

      auart       as Auart,

      @UI.lineItem: [{ position: 40, label: 'Sales Org' }]
      @UI.identification: [{ position: 40 , label: 'Sales Org' }]
      vkorg       as Vkorg,
//      createddate as Createddate,
//      changedate  as Changedate,
      _Item,
      _Schd
}
