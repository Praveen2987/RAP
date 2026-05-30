@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'consumption to flight'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity zc_connection_flight
  as select from ziv_connection

  association [1..*] to zc_flight_connect as _Flight on  $projection.CarrierId    = _Flight.CarrierId
                                                     and $projection.ConnectionId = _Flight.ConnectionId

{

      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_Carrier_StdVH', element: 'AirlineID' }}]
      @ObjectModel.text.element: ['CarrierId']
  key CarrierId,
  key ConnectionId,
      AirportFromId,
      AirportToId,
      DepartureTime,
      ArrivalTime,
      Distance,
      DistanceUnit,
      /* Associations */
      _Airline,
      _AirportFrom,
      _AirportTo,
      @Search.defaultSearchElement: true
      _Flight
}
