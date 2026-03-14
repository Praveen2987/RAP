@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'root view for item po'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_item_po
  as select from zitem_po
  //composition of target_data_source_name as _association_name
{
  key pono     as Pono,
  key poitem   as Poitem,
      @Semantics.quantity.unitOfMeasure: 'Unit'
      quantity as Quantity,
      unit     as Unit
      //    _association_name // Make association public
}
