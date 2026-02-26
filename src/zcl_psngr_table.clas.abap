CLASS zcl_psngr_table DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES : if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PSNGR_TABLE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA : it_tab TYPE TABLE OF ztb_psngr.

    it_tab = VALUE #( ( booking_id = '1001'  passenger_no = '20001'  seat_no = 'A1'  ticket_status = 'Booked' )
                    ( booking_id = '1002'  passenger_no = '20002'  seat_no = 'A2'  ticket_status = 'Cancelled' )
                    ( booking_id = '1003'  passenger_no = '20003'  seat_no = 'A3'  ticket_status = 'Booked' ) ).


    INSERT ztb_psngr FROM TABLE @it_tab.


  ENDMETHOD.
ENDCLASS.
