CLASS zcl_bill_header_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_bill_header_data IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA: it_data TYPE TABLE OF zbill_header.

    it_data = VALUE #( (  bill_id = '1000001'  bill_type = 'F1' cust_id = '1001' sales_org = '9001'  net_amount = '1000'
                          currency = 'INR' created_dt = '20261001' )

                        ( bill_id = '1000002'  bill_type = 'F2' cust_id = '1002' sales_org = '9002'  net_amount = '2000'
                          currency = 'INR' created_dt = '20261002' )  ).

    INSERT zbill_header FROM TABLE @it_data.

  ENDMETHOD.
ENDCLASS.
