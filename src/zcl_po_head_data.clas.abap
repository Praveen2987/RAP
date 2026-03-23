CLASS zcl_po_head_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_po_head_data IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: it_tab TYPE TABLE OF zhead_po.


    it_tab = VALUE #( ( pono = '1001' pocompany = '001'  podate = '20260310'  podesc = 'Car Parts'  postatus = 'D'  )
                      ( pono = '1002' pocompany = '002'  podate = '20260312'  podesc = 'Bike Parts'  postatus = 'D'  ) ).

    INSERT zhead_po FROM TABLE @it_tab.

  ENDMETHOD.
ENDCLASS.
