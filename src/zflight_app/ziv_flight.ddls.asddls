@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for flight'
@Metadata.ignorePropagatedAnnotations: true

@UI.headerInfo: {
    typeName: 'Flight Detail',
    typeNamePlural: 'Flight Detail',
    title: {
        type: #STANDARD,
        label: 'Flight Details',
        value: 'CarrierId'
//        valueQualifier: '',
//        targetElement: '',
//        url: ''
    }

}

define view entity ziv_flight
  as select from /dmo/flight

  association [1..1] to ziv_carrier_name as _carrier on $projection.CarrierId = _carrier.CarrierId

{

      @UI.facet: [{
          qualifier: '',
          feature: '',
          id: 'Flight_Det',
          purpose: #STANDARD,
          position: 10,
          importance: #HIGH,
          label: 'Connection Details',
          type: #LINEITEM_REFERENCE
      }]

      @UI.lineItem: [{ position: 10, label: ' Carrier Id' ,importance: #HIGH }]
      //      @UI.identification: [{ position: 10 , label: 'Carrier Id' }]

      @ObjectModel.text.association: '_carrier'
  key carrier_id     as CarrierId,

      @UI.lineItem: [{ position: 20, label: 'Connection Id' ,importance: #HIGH }]
      //      @UI.identification: [{ position: 20 , label: 'Connection Id ' }]
  key connection_id  as ConnectionId,

      @UI.lineItem: [{ position: 30, label: 'FlightDate' ,importance: #HIGH }]
      //      @UI.identification: [{ position: 30 , label: 'FlightDate' }]
  key flight_date    as FlightDate,

      @UI.lineItem: [{ position: 40, label: 'Price' ,importance: #HIGH }]
      //      @UI.identification: [{ position: 40 , label: 'Price' }]

      @Semantics.amount.currencyCode: 'Currencycode'
      price          as Price,

      @UI.lineItem: [{ position: 50, label: 'Currency' ,importance: #HIGH }]
      //      @UI.identification: [{ position: 50 , label: 'Currency' }]
      currency_code  as CurrencyCode,

      @UI.lineItem: [{ position: 60, label: 'PlaneType' ,importance: #HIGH }]
      //      @UI.identification: [{ position: 60 , label: 'PlaneType' }]
      plane_type_id  as PlaneTypeId,

      @UI.lineItem: [{ position: 70, label: 'SeatsMax' ,importance: #HIGH }]
      //      @UI.identification: [{ position: 70 , label: 'SeatsMax' }]
      seats_max      as SeatsMax,

      @UI.lineItem: [{ position: 80, label: 'SeatsOccupied' ,importance: #HIGH }]
      //      @UI.identification: [{ position: 80 , label: 'SeatsOccupied' }]
      seats_occupied as SeatsOccupied,

     _carrier
}
