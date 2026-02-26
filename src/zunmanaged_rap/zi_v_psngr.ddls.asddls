@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'interface view for passenger details'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_v_psngr
  as select from ZTB_PSNGR as psngr
  association to parent zi_v_booking as _booking on $projection.BookingId = _booking.BookingId
{
  key booking_id    as BookingId,
  key passenger_no  as PassengerNo,
      seat_no       as SeatNo,
      ticket_status as TicketStatus,
      _booking
}
