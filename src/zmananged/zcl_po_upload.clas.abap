CLASS zcl_po_upload DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PO_UPLOAD IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: it_tab TYPE TABLE OF zpo_tab1.


    it_Tab = VALUE #( ( ebeln = '2200393935'  bukrs = 'US8S'  aedat = '20251204'  kunnr = 'Ravi'  )
                      ( ebeln = '2200393936'  bukrs = 'US9S'  aedat = '20251104'  kunnr = 'Kiran' )
                      ( ebeln = '2200393937'  bukrs = 'US7S'  aedat = '20251004'  kunnr = 'Mohan' )

     ).

    INSERT zpo_tab1 FROM TABLE @it_tab.

  ENDMETHOD.
ENDCLASS.
