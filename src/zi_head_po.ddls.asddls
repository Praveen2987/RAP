@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root view for PO'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_HEAD_PO
  as select from zhead_po
  //composition of target_data_source_name as _association_name
{
  key pono      as Pono,
      pocompany as Pocompany,
      podate    as Podate,
      podesc    as Podesc,
      postatus  as Postatus
      //    _association_name // Make association public
}
