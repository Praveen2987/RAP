@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'consumption to schedule item'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity zc_so1_schd
  as projection on zi_so1_schd
//  association to zi_so1_header as _header on $projection.Vbeln = _header.Vbeln
{
  key Vbeln,
  key itemno,
      Banfn,
      /* Associations */
      _header,
      _item // : redirected to parent zc_so1_item

}
