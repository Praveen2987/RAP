CLASS zcl_empl_tab_update DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES : if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EMPL_TAB_UPDATE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA : it_tab TYPE TABLE OF ztab_empl.

    it_tab = VALUE #(  ( emp_id = '1001' emp_name = 'Ravi'  emp_desg  = 'Clerk' emp_phne  = '4434343'    created_date_time = '2021050' )
                       ( emp_id = '1002' emp_name = 'Kiran' emp_desg  = 'Sr Clerk' emp_phne  = '5454343' created_date_time = '20220506' )
                       ( emp_id = '1003' emp_name = 'Shanar' emp_desg  = 'Manager' emp_phne  = '6454343' created_date_time = '20230506' ) ).


    insert ztab_empl FROM TABLE @it_tab.

  ENDMETHOD.
ENDCLASS.
