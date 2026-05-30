@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for connection'
@Metadata.ignorePropagatedAnnotations: true


@UI.headerInfo: {
    typeName: 'Flight Detail',
    typeNamePlural: 'Connnection Detail',
//    typeImageUrl: '',
    title: {
        type: #STANDARD,
        label: 'Connnection Details'
//        value: 'CarrierId'
    }

}


define view entity ziv_connect
  as select from /dmo/connection
  association [1..*] to ziv_flight       as _Flight  on  $projection.CarrierId    = _Flight.CarrierId
                                                     and $projection.ConnectionId = _Flight.ConnectionId

  association [1..1] to ziv_carrier_name as _carrier on  $projection.CarrierId = _carrier.CarrierId

{

      @UI.facet: [
      {
          id: 'Connect_Det',
          purpose: #STANDARD,
          position: 10,
          importance: #HIGH,
          label: 'Connection Details',
          type: #IDENTIFICATION_REFERENCE
      },

      {
          id: 'Flight_Det',
          purpose: #STANDARD,
          position: 20,
          importance: #HIGH,
          label: 'Flight Details',
          type: #LINEITEM_REFERENCE,
          targetElement: '_Flight'
      }
      ]


      @UI.lineItem: [{ position: 10, label: ' Carrier Id' ,importance: #HIGH }]
      @UI.identification: [{ position: 10 , label: 'Carrier Id' }]
      @ObjectModel.text: {
          association: '_carrier'
      }
  key carrier_id      as CarrierId,
      @UI.lineItem: [{ position: 20, label: 'Connection Id' ,importance: #HIGH }]
      @UI.identification: [{ position: 20 , label: 'Connection Id ' }]
  key connection_id   as ConnectionId,

      @UI.lineItem: [{ position: 30, label: 'AirportFromId' ,importance: #HIGH }]
      @UI.identification: [{ position: 30 , label: 'AirportFromId' }]

      airport_from_id as AirportFromId,

      @UI.lineItem: [{ position: 40, label: ' AirportToId' ,importance: #HIGH }]
      @UI.identification: [{ position: 40 , label: ' AirportToId' }]
      airport_to_id   as AirportToId,

      @UI.lineItem: [{ position: 50, label: 'DepartureTime' ,importance: #HIGH }]
      @UI.identification: [{ position: 50 , label: 'DepartureTime' }]
      departure_time  as DepartureTime,

      @UI.lineItem: [{ position: 60, label: 'ArrivalTime' ,importance: #HIGH }]
      @UI.identification: [{ position: 60 , label: 'ArrivalTime' }]
      arrival_time    as ArrivalTime,
      @UI.lineItem: [{ position: 70, label: 'Distance' ,importance: #HIGH }]
      @UI.identification: [{ position: 70 , label: 'Distance' }]
      distance        as Distance,
      @UI.lineItem: [{ position: 80, label: 'DistanceUnit' ,importance: #HIGH }]
      @UI.identification: [{ position: 80 , label: 'DistanceUnit' }]
      distance_unit   as DistanceUnit,
      _Flight,
      _carrier
}
