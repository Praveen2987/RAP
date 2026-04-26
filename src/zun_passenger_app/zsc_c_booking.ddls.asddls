@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection view for booking'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity zsc_c_booking
  provider contract transactional_query
  as projection on zsc_i_booking
{
  key BookingId,
      CustomerId,
      FlightNo,
      BookingDate,
      Status,
      LastChangedAt,
      /* Associations */
      _passenger : redirected to composition child zsc_c_passenger
}
