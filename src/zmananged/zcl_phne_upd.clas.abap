CLASS zcl_phne_upd DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES : if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PHNE_UPD IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: it_tab TYPE TABLE OF zphne_tab.

    it_tab = VALUE #(  (  ebeln = '2200393931'   phone = '7373773737' )
                       ( ebeln = '2200393932'   phone = '7373773738' )
                       (  ebeln = '2200393933' phone = '7373773730' ) ).

    INSERT zphne_tab FROM TABLE @it_tab.

  ENDMETHOD.
ENDCLASS.
