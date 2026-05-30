@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'IV for sales order schedule line item'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_so1_schd
  as select from zso1_schd
  association to parent zi_so1_item as _item   on  $projection.Vbeln  = _item.Vbeln
                                               and $projection.itemno = _item.itemno

  association [1..*] to zi_so1_header      as _header on  $projection.Vbeln = _header.Vbeln

{
  key vbeln as Vbeln,
  key ponsr as itemno,
      banfn as Banfn,
      _item,
      _header

}
