@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'interface view for booking details'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zi_v_booking
  as select from ZTB_BOOKING
  composition [1..*] of zi_v_psngr as _passenger
{
  key booking_id  as BookingId,
      customer_id as CustomerId,
      flight_no   as FlightNo,
      status      as Status,
      _passenger // Make association public
}
