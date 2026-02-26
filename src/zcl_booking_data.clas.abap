CLASS zcl_booking_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_BOOKING_DATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA : it_tab TYPE TABLE OF ztb_booking.

    it_tab = VALUE #(  ( booking_id = '1001' customer_id = '20001'  flight_no = '901'  status = 'Open' )
                       ( booking_id = '1002' customer_id = '20002'  flight_no = '902'  status = 'Closed' )
                       ( booking_id = '1003' customer_id = '20003'  flight_no = '903'  status = 'Open' )
           ).


    INSERT ztb_booking FROM TABLE @it_tab.




  ENDMETHOD.
ENDCLASS.
