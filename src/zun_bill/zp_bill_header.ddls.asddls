@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'consumption view bill header'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity zp_bill_header
  provider contract transactional_query
  as projection on zi_bill_head
  // as select from ZI_BILL_HEAD
  //composition of target_data_source_name as _association_name
{
  key BillId,
      BillType,
      BillDate,
      CustomerId,
      CustomerName,
      @Semantics.amount.currencyCode: 'Currency'
      NetAmount,
      Currency,
      SalesOrg,
      LastChangedAt,
      Createdby,
      Changedby,
      /* Associations */
      _item : redirected to composition child zp_bill_item
      //      _association_name // Make association public
}


//@AccessControl.authorizationCheck: #NOT_REQUIRED
//@EndUserText.label: 'projection view for header bill'
//@Metadata.ignorePropagatedAnnotations: true
//define root view entity zp_bill_header as select from ZI_BILL_HEAD
//composition of target_data_source_name as _association_name
//{
//    key BillId,
//    BillType,
//    BillDate,
//    CustomerId,
//    CustomerName,
//    NetAmount,
//    Currency,
//    SalesOrg,
//    LastChangedAt,
//    Createdby,
//    Changedby,
//    /* Associations */
//    _item,
//    _association_name // Make association public
//}
