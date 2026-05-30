CLASS zcl_sales_data_update DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_SALES_DATA_UPDATE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: it_header TYPE TABLE OF zso1_header,
          it_item   TYPE TABLE OF zso1_item,
          it_schd   TYPE TABLE OF zso1_schd.


    it_header = VALUE #( ( vbeln = '10001' erdat = '20260605' auart = 'SO'  vkorg = 'ZS1')
                         ( vbeln = '10002' erdat = '20260705'  auart = 'DL' vkorg = 'ZS1')
                         ( vbeln = '10003' erdat = '20260805'  auart = 'INV'  vkorg = 'ZS1')   ).


    it_item = VALUE #( ( vbeln = '10001' posnr = '010' matnr = '90001' amount = '8000' currency = 'INR' )
                       ( vbeln = '10002' posnr = '010' matnr = '90002' amount = '8000' currency = 'INR' )
                       ( vbeln = '10003' posnr = '010' matnr = '90003' amount = '8000' currency = 'INR' ) ).


    it_schd = VALUE #( ( vbeln = '10001' ponsr = '010' banfn = '50001')
                       ( vbeln = '10002' ponsr = '010' banfn = '50002')
                       ( vbeln = '10003' ponsr = '010' banfn = '50003') ).


    INSERT zso1_header FROM TABLE @it_header.
    INSERT zso1_item FROM TABLE @it_item.
    INSERT zso1_schd FROM TABLE @it_schd.




  ENDMETHOD.
ENDCLASS.
