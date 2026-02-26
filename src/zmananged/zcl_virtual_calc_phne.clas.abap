CLASS zcl_virtual_calc_phne DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES : if_sadl_exit_calc_element_read.
*    INTERFACES : if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_VIRTUAL_CALC_PHNE IMPLEMENTATION.


  METHOD if_sadl_exit_calc_element_read~calculate.

    DATA : it_data TYPE TABLE OF zvir_table WITH DEFAULT KEY.

    CHECK it_original_data IS NOT INITIAL.

    it_data = CORRESPONDING #(  it_original_data ).

    SELECT * FROM zphne_tab
     FOR ALL ENTRIES IN @it_data
     WHERE ebeln = @it_data-ebeln INTO TABLE @DATA(lt_phne).
    IF sy-subrc = 0.
      SORT lt_phne BY ebeln.
    ENDIF.

    LOOP AT it_data ASSIGNING FIELD-SYMBOL(<ls_data>).
      DATA(lv_phne) = VALUE #( it_data[ ebeln = <ls_data>-ebeln ]-phone OPTIONAL ).
      <ls_data>-phone = lv_phne.
    ENDLOOP.

    ct_calculated_data = CORRESPONDING #( it_data ).

  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.

*    et_requested_orig_elements = VALUE #( BASE et_requested_orig_elements ( CONV #( 'SEATSOCC' ) ) ).

  ENDMETHOD.
ENDCLASS.
