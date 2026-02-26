CLASS zcl_po_num_upload DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES : if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PO_NUM_UPLOAD IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: it_tab TYPE TABLE OF zpo_no_data.


    it_tab = VALUE #(  ( ebeln = '2200393935' )
                        ( ebeln = '2200393936' )
                        ( ebeln = '2200393937' )   ).


    INSERT zpo_no_data FROM TABLE @it_tab.

  ENDMETHOD.
ENDCLASS.
