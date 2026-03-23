CLASS zcl_po_item_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_po_item_data IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: it_tab TYPE TABLE OF zitem_po.

    it_tab = VALUE #( ( pono = '1001'  poitem = '10' quantity = '2'  unit = 'EA' )
                      ( pono = '1001'  poitem = '20' quantity = '4'  unit = 'EA' )
                      ( pono = '1002'  poitem = '10' quantity = '1'  unit = 'EA' )
                      ( pono = '1002'  poitem = '20' quantity = '3'  unit = 'EA' ) ).

    INSERT zitem_po FROM TABLE @it_tab.


  ENDMETHOD.
ENDCLASS.
