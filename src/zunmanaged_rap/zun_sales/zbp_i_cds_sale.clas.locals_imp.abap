CLASS lhc_ZI_CDS_SALE DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_cds_sale RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR zi_cds_sale RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zi_cds_sale.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zi_cds_sale.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zi_cds_sale.

    METHODS read FOR READ
      IMPORTING keys FOR READ zi_cds_sale RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zi_cds_sale.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR sale RESULT result.

    METHODS setclosed FOR MODIFY
      IMPORTING keys FOR ACTION sale~setclosed RESULT result.

ENDCLASS.

CLASS lhc_ZI_CDS_SALE IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD create.

    DATA: ls_sale TYPE ztb_sales.

    zbp_i_cds_sale=>gv_cre = 'C'.

    SELECT SINGLE MAX(  vbeln )  FROM ztb_sales INTO @DATA(lv_id).
    IF lv_id IS NOT INITIAL.
      lv_id = lv_id + 1.
    ENDIF.


    LOOP AT entities ASSIGNING FIELD-SYMBOL(<lfs_sale>).

      ls_sale-vbeln = lv_id.
      ls_sale-erdat = <lfS_sale>-Erdat.
      ls_sale-vbtyp = <lfS_sale>-Vbtyp.
      ls_sale-posnr = <lfS_sale>-Posnr.
      ls_sale-unit_field = <lfS_sale>-UnitField.
      ls_sale-menge = <lfS_sale>-Menge.
*      ls_sale-closed = <lfS_sale>-soclosed.
      APPEND ls_sale TO  zbp_i_cds_sale=>gt_sale.
    ENDLOOP.



  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.

    zbp_i_cds_sale=>gv_del = 'D'.

    DATA(lv_key) = keys[ 1 ]-vbeln.

    DATA(lv_vbeln) = |{ lv_key ALPHA = OUT }|.

    zbp_i_cds_sale=>gv_vbeln = lv_vbeln.


  ENDMETHOD.

  METHOD read.

    DATA(lv_key) = VALUE #(  keys[ 1 ]-Vbeln OPTIONAL ).

    SELECT * FROM ztb_sales WHERE vbeln = @lv_key INTO TABLE @DATA(lt_sales) .

    result = CORRESPONDING #(  lt_sales ).


  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD SetClosed.

    DATA: lt_sale TYPE TABLE FOR UPDATE zi_cds_sale.

    READ ENTITIES OF zi_cds_sale IN LOCAL MODE ENTITY sale
    ALL FIELDS WITH CORRESPONDING #(  keys )
    RESULT DATA(lt_data).


    LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<lfs_data>).

      IF <LfS_data>-Menge = 10.
        <Lfs_data>-soclosed = abap_true.

        APPEND VALUE #(  %tky = <Lfs_data>-%tky
                         soclosed = <Lfs_data>-soclosed ) TO lt_sale.

        MODIFY ENTITIES OF zi_cds_sale IN LOCAL MODE ENTITY sale
        UPDATE FIELDS (  soclosed ) WITH lt_sale.

      ENDIF.

    ENDLOOP.

    READ ENTITIES OF zi_cds_sale IN LOCAL MODE ENTITY sale
    ALL FIELDS WITH CORRESPONDING #(  lt_DATA  )
    RESULT DATA(lt_upd).

    result = VALUE #(  FOR upd IN lt_upd (  %tky = upd-%tky
                                            %param = upd ) ).


  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZI_CDS_SALE DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZI_CDS_SALE IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.

**to save data

    IF  zbp_i_cds_sale=>gv_cre = 'C'.

      INSERT ztb_sales FROM TABLE @zbp_i_cds_sale=>gt_sale.

    ELSEIF zbp_i_cds_sale=>gv_upd = 'U'.


    ELSEIF zbp_i_cds_sale=>gv_del = 'D'.


      DATA(lv_vblen) = zbp_i_cds_sale=>gv_vbeln.
      DELETE FROM ztb_sales WHERE vbeln = @lv_vblen.
      IF sy-subrc = 0.

        reported-sale =  VALUE #(  (  %msg = new_message_with_text(
                                      severity = if_abap_behv_message=>severity-success
                                      text = 'Record deleted' ) ) ).

      ELSE.

        reported-sale =  VALUE #(  (  %msg = new_message_with_text(
                                      severity = if_abap_behv_message=>severity-information
                                      text = 'Record not deleted' ) ) ).


      ENDIF.

    ENDIF.


  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
