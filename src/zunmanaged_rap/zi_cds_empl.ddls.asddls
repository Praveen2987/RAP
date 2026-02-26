@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'employee cds view'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity zi_cds_empl
  as select from ztab_empl
  //composition of target_data_source_name as _association_name
{
  key emp_id                as EmpId,
      emp_name              as EmpName,
      emp_desg              as EmpDesg,
      emp_phne              as EmpPhne,
      emp_resigned          as EmpResg,
      created_date_time     as CreatedDateTime,
      changed_date_time     as ChangedDateTime,
      local_last_changed_by as LocalLastChangedBy
      //    _association_name // Make association public
}
