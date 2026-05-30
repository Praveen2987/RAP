@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'interface view for the connection'
@Metadata.ignorePropagatedAnnotations: true
define view entity ziv_connection
  as select from /dmo/connection

  association [1..*] to ziv_flight1    as _Flight      on  $projection.CarrierId    = _Flight.CarrierId
                                                       and $projection.ConnectionId = _Flight.ConnectionId

  association [1]    to /DMO/I_Carrier as _Airline     on  $projection.CarrierId = _Airline.AirlineID
  association [1]    to /DMO/I_Airport as _AirportFrom on  $projection.AirportToId = _AirportFrom.AirportID
  association [1]    to /DMO/I_Airport as _AirportTo   on  $projection.AirportToId = _AirportTo.AirportID

{
  key carrier_id      as CarrierId,
  key connection_id   as ConnectionId,
      airport_from_id as AirportFromId,
      airport_to_id   as AirportToId,
      departure_time  as DepartureTime,
      arrival_time    as ArrivalTime,
      distance        as Distance,
      distance_unit   as DistanceUnit,
      _Flight,
      _Airline,
      _AirportFrom,
      _AirportTo
}
