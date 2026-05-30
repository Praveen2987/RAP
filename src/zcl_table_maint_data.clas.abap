CLASS zcl_table_maint_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TABLE_MAINT_DATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA: it_tab TYPE TABLE OF ztable_maint.

    it_tab = VALUE #( ( vech_no = 'TSAE0001'  vech_pass = 'X' )
                     ( vech_no = 'TSAE0002'  vech_pass = ' ' ) ).


    INSERT ztable_maint FROM TABLE @it_tab.



  ENDMETHOD.
ENDCLASS.
