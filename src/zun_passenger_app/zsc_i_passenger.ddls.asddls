@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for passenger'
@Metadata.ignorePropagatedAnnotations: true
define view entity zsc_i_passenger
  as select from zbooking_pass
  association to parent zsc_i_booking as _booking on $projection.BookingId = _booking.BookingId
{
  key booking_id      as BookingId,
  key passenger_no    as PassengerNo,
      name            as Name,
      seat_no         as SeatNo,
      ticket_status   as TicketStatus,
      last_changed_at as LastChangedAt,
      _booking
}
