@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'header for sales header'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zi_so1_header
  as select from zso1_header
  composition [1..*] of zi_so1_item as _item
  association [1..*] to zi_so1_schd as _schd on $projection.Vbeln = _schd.Vbeln
{
  key vbeln       as Vbeln,
      erdat       as Erdat,
      auart       as Auart,
      vkorg       as Vkorg,
      createddate as Createddate,
      changedate  as Changedate,
      _item,
      _schd
}
