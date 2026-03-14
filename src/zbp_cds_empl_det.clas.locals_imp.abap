CLASS lhc_zcds_empl_det DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR emp RESULT result. "zcds_empl_det

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR emp RESULT result. "zcds_empl_det

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE emp. "zcds_empl_det.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE emp. "zcds_empl_det.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE emp. "zcds_empl_det.

    METHODS read FOR READ
      IMPORTING keys FOR READ emp RESULT result. "zcds_empl_det

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK emp. "zcds_empl_det.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR emp RESULT result.

    METHODS sal_cal FOR DETERMINE ON MODIFY
      IMPORTING keys FOR emp~sal_cal.
    METHODS emp_val FOR VALIDATE ON SAVE
      IMPORTING keys FOR emp~emp_val.



ENDCLASS.

CLASS lhc_zcds_empl_det IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD create.

    zbp_cds_empl_det=>gv_c = 'C'.


    DATA: ls_tab TYPE ztb_emp_d.


*    READ ENTITIES OF zcds_empl_det IN LOCAL MODE
*    ENTITY emp
*    FIELDS ( Empsal )
*    WITH CORRESPONDING #(  keys )
*    RESULT DATA( lt_data ).


**get the creation date
    DATA: lv_id1 TYPE string.
    DATA(lv_date) = cl_abap_context_info=>get_system_date( ).

    SELECT MAX( empid ) FROM ztb_emp_d INTO @DATA(lv_id).
    lv_id1 = lv_id + 1.


    DATA(lv_desg) = VALUE #(  entities[ 1 ]-Empdesg OPTIONAL ).
    DATA(lv_sal) = VALUE #(  entities[ 1 ]-Empsal OPTIONAL ).

    DATA(ls_entity) = VALUE #(  entities[ 1 ] OPTIONAL ).

    CONDENSE lv_id1.
    ls_tab-empid = lv_id1.
    ls_tab-empdesg = lv_desg.
    ls_tab-created = lv_date.
    ls_tab-empsal = lv_sal.
    APPEND ls_tab TO zbp_cds_empl_det=>gt_tab.


    APPEND VALUE #(  %cid = ls_entity-%cid
                     empid = lv_id1 ) TO mapped-emp.

  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.

    zbp_cds_empl_det=>gv_del = 'D'.

    DATA(lv_key) = keys[ 1 ]-Empid.

    zbp_cds_empl_det=>gv_empid = lv_key.

  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD sal_cal.

    READ ENTITIES OF zcds_empl_det IN LOCAL MODE
    ENTITY emp
    FIELDS (  Empsal )
    WITH CORRESPONDING #(  keys )
    RESULT DATA(lt_data)
    FAILED DATA(lt_failed).

    CHECK lt_data IS NOT INITIAL.

*    LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<lfs_data>).
*
***check the desg.
*      IF <Lfs_data>-Empdesg = 'BTA'.
*        <lFS_DATA>-Empsal = '10000'.
*
*      ELSEIF <Lfs_data>-Empdesg = 'Manager'.
*        <lFS_DATA>-Empsal = '20000'.
*      ENDIF.
*
*      MODIFY ENTITIES OF zcds_empl_det IN LOCAL MODE
*      ENTITY emp
*      UPDATE SET FIELDS
*      WITH VALUE #(  ( %tky = <Lfs_data>-%tky
*                       Empsal = <lFS_DATA>-Empsal ) )
*      REPORTED DATA(update_reported).
*
*
*    ENDLOOP.


    MODIFY ENTITIES OF zcds_empl_det IN LOCAL MODE
    ENTITY emp
    UPDATE FIELDS (  Empsal )
    WITH VALUE #( FOR data IN lt_data ( %tky = data-%tky
                                       Empsal = '10000'  ) )
    REPORTED DATA(update_reported).

    reported = CORRESPONDING #( DEEP update_reported ).

  ENDMETHOD.

  METHOD emp_val.

    READ ENTITIES OF zcds_empl_det IN LOCAL MODE
    ENTITY emp
    FIELDS (  Empdesg )
    WITH CORRESPONDING #(  keys )
    RESULT DATA(lt_data).

    CHECK lt_data IS NOT INITIAL.

    LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<lf_data>).

      IF <lf_data>-empdesg IS INITIAL.

        failed-emp = VALUE #(  (  %tky = <lf_data>-%tky ) ).

        reported-emp = VALUE #( ( %tky = <lf_data>-%tky
                                  %state_area = 'EMP_VAL'
                                  %msg = new_message_with_text(
                                  severity = if_abap_behv_message=>severity-error
                                  text     = 'Please enter Emp Desgination' ) ) ).


      ENDIF.

    ENDLOOP.


  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZCDS_EMPL_DET DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZCDS_EMPL_DET IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.

    IF zbp_cds_empl_det=>gv_c = 'C'.

      INSERT ztb_emp_d FROM TABLE @zbp_cds_empl_det=>gt_tab.
      IF sy-subrc = 0.

        reported-emp = VALUE #( (  %msg = new_message_with_text( severity = if_abap_behv_message=>severity-success
                                                                 text = 'Employee Created'  ) ) ).


      ENDIF.

    ENDIF.


    IF zbp_cds_empl_det=>gv_del = 'D'.

      DELETE FROM ztb_emp_d WHERE  empid = @zbp_cds_empl_det=>gv_empid.

      IF sy-subrc = 0.
        reported-emp = VALUE #( (  %msg = new_message_with_text(  severity = if_abap_behv_message=>severity-success
                                                                text = 'Record Deleted') ) ).
      ENDIF.

    ENDIF.



  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
