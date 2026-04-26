@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'booking information'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zsc_i_booking
  as select from ZBOOKING_HDR
  composition [1..*] of zsc_i_passenger as _passenger

{
  key booking_id      as BookingId,
      customer_id     as CustomerId,
      flight_no       as FlightNo,
      booking_date    as BookingDate,
      status          as Status,
      last_changed_at as LastChangedAt,
      _passenger // Make association public
}
