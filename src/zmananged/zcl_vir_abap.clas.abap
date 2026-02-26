CLASS zcl_vir_abap DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES : if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_VIR_ABAP IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: it_tab TYPE TABLE OF zvir_table.


    it_tab = VALUE #(  ( ebeln = '2200393931'  bukrs = 'US5S'  aedat = '20251004'  kunnr = 'Ravi'  )
                       ( ebeln = '2200393932'  bukrs = 'US5S'  aedat = '20250904'  kunnr = 'Rajesh'  )
                       ( ebeln = '2200393933'  bukrs = 'US5S'  aedat = '20250804'  kunnr = 'Siddu'  ) ).

    INSERT zvir_table FROM TABLE @it_tab.


  ENDMETHOD.
ENDCLASS.
