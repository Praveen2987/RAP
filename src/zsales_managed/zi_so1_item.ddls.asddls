@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'IV for sales order item'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_so1_item
  as select from zso1_item
  association        to parent zi_so1_header as _header on  $projection.Vbeln = _header.Vbeln

  association [1..*] to zi_so1_schd          as _schd   on  $projection.Vbeln  = _schd.Vbeln
                                                        and $projection.itemno = _schd.itemno

{
  key vbeln    as Vbeln,
  key posnr    as itemno,
      matnr    as Matnr,
      @Semantics.amount.currencyCode: 'currency'
      amount   as Amount,
      currency as Currency,
      _header,
      _schd

}
