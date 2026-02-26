@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for sales data'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZI_CDS_SALE
  as select from ztb_sales
  //composition of target_data_source_name as _association_name
{
  key vbeln             as Vbeln,
      erdat             as Erdat,
      vbtyp             as Vbtyp,
      posnr             as Posnr,
      @Semantics.quantity.unitOfMeasure: 'UnitField'
      menge             as Menge,
      unit_field        as UnitField,
      closed            as soclosed,
      changed_date_time as ChangedDate
      //    _association_name // Make association public
}
