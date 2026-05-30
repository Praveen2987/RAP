CLASS zcl_sc_order_header DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_SC_ORDER_HEADER IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: it_head TYPE TABLE OF zsc_order_header,
          it_item TYPE TABLE OF zsc_order_item.


    it_head = VALUE #(  ( vbeln = '1000001' doc_type = 'F2'  erdat = '20250401' )
                        ( vbeln = '1000002' doc_type = 'F2'  erdat = '20250301' ) ).


    IT_item = VALUE #( ( Vbeln = '1000001' posnr = '000001' matnr = 'MAT001' quantity = '2.000' amount = '500.00'  currency = 'INR' uom = 'EA' )
                       ( Vbeln = '1000001' posnr = '000002' matnr = 'MAT002' quantity = '3.000' amount = '1000.00'  currency = 'INR' uom = 'EA' )
                       ( Vbeln = '1000002' posnr = '000001' matnr = 'MAT001' quantity = '5.000' amount = '600.00'  currency = 'USD' uom = 'PCK' )
                       ( Vbeln = '1000002' posnr = '000002' matnr = 'MAT002' quantity = '6.000' amount = '700.00'  currency = 'USD' uom = 'PCK' ) ).



    INSERT zsc_order_header FROM TABLE @it_head.
    INSERT zsc_order_item FROM TABLE @it_item.


  ENDMETHOD.
ENDCLASS.
