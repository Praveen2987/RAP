@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection view for passenger'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity zsc_c_passenger
  as projection on zsc_i_passenger
{
  key BookingId,
  key PassengerNo,
      Name,
      SeatNo,
      TicketStatus,
      LastChangedAt,
      /* Associations */
      _booking : redirected to parent zsc_c_booking
}
