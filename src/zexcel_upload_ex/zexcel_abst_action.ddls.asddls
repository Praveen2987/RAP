@EndUserText.label: 'abstract for action'
define root abstract entity zexcel_abst_action
  //  with parameters
  //    parameter_name : parameter_type
{
  // Dummy is a dummy field
  @UI.hidden        : true
  dummy             : abap_boolean;
  _StreamProperties : association [1] to zexcel_upload_abstract on 1 = 1;

}
