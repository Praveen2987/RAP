CLASS zcl_bill_head_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_BILL_HEAD_DATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA : it_tab     TYPE TABLE OF ztb_bill,
           it_tab_itm TYPE TABLE OF ztb_bill_itm.

*    it_Tab = VALUE #( ( bill_id = '1001'  bill_type = 'F1' bill_date  = '20260315' customer_id = '90001' customer_name  = 'Siva' net_amount = '1000' currency = 'USD' sales_org = '2000' createdby = 'Ram' )
*                      ( bill_id = '1002'  bill_type = 'F1' bill_date  = '20260316' customer_id = '90002' customer_name  = 'Rakesh' net_amount = '3000' currency = 'USD' sales_org = '3000' createdby = 'Kiran' ) ).


    it_tab_itm = VALUE #( ( bill_id = '1001'
                             item_no = '0010'
                            material_id = 'MAT001'
                            description = 'USB Cable'
                            quantity  = '2'
                            item_amount = '500'
                            currency  = 'USD'
                            uom       = 'EA'
                            createdby = 'Ram'
)

( bill_id = '1002'
                             item_no = '0010'
                            material_id = 'MAT002'
                            description = 'Charger'
                            quantity  = '3'
                            item_amount = '1000'
                            currency  = 'USD'
                            uom       = 'EA'
                            createdby = 'Kiran' )
).


*    INSERT ztb_bill FROM TABLE @it_Tab.



    INSERT ztb_bill_itm FROM TABLE @it_Tab_itm.



  ENDMETHOD.
ENDCLASS.
