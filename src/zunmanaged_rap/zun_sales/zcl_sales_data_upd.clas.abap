CLASS zcl_sales_data_upd DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sales_data_upd IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: it_tab TYPE TABLE OF ztb_sales.

    it_tab = VALUE #( ( vbeln ='10001'  erdat = '20260117' vbtyp = 'SLOrd'  posnr = '0010'  menge = '10' unit_field = 'EA' )
                      ( vbeln ='10002'  erdat = '20260117' vbtyp = 'SLOrd'  posnr = '0020'  menge = '20'  unit_field = 'EA' )
    ).

    INSERT ztb_sales FROM TABLE @it_tab.


  ENDMETHOD.


ENDCLASS.
