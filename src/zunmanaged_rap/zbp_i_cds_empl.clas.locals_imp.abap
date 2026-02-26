CLASS lhc_empl DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR empl RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR empl RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE empl.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE empl.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE empl.

    METHODS read FOR READ
      IMPORTING keys FOR READ empl RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK empl.

    METHODS setresigned FOR MODIFY
      IMPORTING keys FOR ACTION empl~setresigned RESULT result.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR empl RESULT result.

    METHODS undoresigned FOR MODIFY
      IMPORTING keys FOR ACTION empl~undoresigned RESULT result.
    METHODS setdate FOR DETERMINE ON MODIFY
      IMPORTING keys FOR empl~setdate.

*    METHODS get_create IMPORTING VALUE(lv_c) TYPE char1.

ENDCLASS.

CLASS lhc_empl IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD get_instance_features.


    READ ENTITIES OF zi_cds_empl IN LOCAL MODE
    ENTITY empl
    FIELDS (  EmpResg )
    WITH CORRESPONDING #(  keys )
    RESULT DATA(lt_empd)
    FAILED failed.

***FOR RESIGNED
    result = VALUE #( FOR data IN lt_empd (  %key = data-%key
                                             %features-%action-SetResigned = COND #( WHEN data-EmpResg = 'R'
                                                                                     THEN if_abap_behv=>fc-o-disabled
                                                                                     ELSE
                                                                                     if_abap_behv=>fc-o-enabled ) ) ).
**fc-o-enabled

**for undoresigned
*    result =    result = VALUE #( FOR data IN lt_empd (  %key = data-%key
*                                              %features-%action-UndoResigned = COND #( WHEN data-EmpResg = ' '
*                                                                                      THEN if_abap_behv=>fc-o-disabled
*                                                                                      ELSE
*                                                                                      if_abap_behv=>fc-o-enabled ) ) ).


  ENDMETHOD.


  METHOD create.

    zbp_i_cds_empl=>gv_cre = 'C'.

**   GET TIME STAMP FIELD DATA(lv_tmstp).
*
*  zcl_empl_data_update=>get_inst( )->get_create(
*    EXPORTING
*      entities =  entities
*    CHANGING
*      mapped   =  mapped
*      failed   = failed
*      reported = reported
*  ).

    DATA:
      lv_id    TYPE int4,
      lt_data  TYPE TABLE OF ztab_empl,
      ls_data  TYPE ztab_empl,
      lt_data1 TYPE ztab_empl,
      ls_emp1  TYPE zi_cds_empl,
*lv_cr1  TYPE char1
      ls_emp   TYPE ztab_empl.

****    lt_data = CORRESPONDING #( entities ).
**Get teh data from table to increaese the count

    SELECT SINGLE MAX(  emp_id ) FROM ztab_empl INTO @DATA(lv_emp).
    IF sy-subrc = 0.
      lv_id = lv_emp + 1.
    ENDIF.


    LOOP AT entities ASSIGNING FIELD-SYMBOL(<lfs_ent>).

      IF NOT lv_id IS NOT INITIAL.
        lt_data1-emp_id = lv_id.
      ENDIF.

*     mapped-empl = VALUE #(   )
      INSERT VALUE #(  %cid = <lfs_ent>-%cid
                       empid = lv_id ) INTO TABLE mapped-empl.

      ls_data-emp_id = lv_id.
      IF <lfs_ent>-EmpName IS NOT INITIAL.
        ls_data-emp_name = <lfs_ent>-EmpName.
      ELSE.
        reported-empl = VALUE #( (  %msg = new_message_with_text(  severity = if_abap_behv_message=>severity-error
                                    text = 'Please enter Name' ) ) ).
      ENDIF.
      ls_data-emp_phne = <lfs_ent>-EmpPhne.
      ls_data-emp_desg =  <lfs_ent>-EmpDesg.
**      ls_data-created_date_time = lv_tmstp.
      APPEND ls_data TO zbp_i_cds_empl=>gt_tab.
    ENDLOOP.

****get the message for the input record
    IF sy-subrc = 0.
      APPEND VALUE #( %msg = new_message_with_text( severity = if_abap_behv_message=>severity-success
                       text = 'Successfully Created' ) ) TO reported-empl.
    ENDIF.

  ENDMETHOD.


  METHOD update.

    DATA: lt_data TYPE TABLE OF ztab_empl,
          ls_data TYPE ztab_empl.


    zbp_i_cds_empl=>gv_upd = 'U'.

*    GET TIME STAMP FIELD DATA(lv_tmstp).

     DATA(lv_tmstp) = cl_abap_context_info=>get_system_date( ).

    DATA(lv_id) = VALUE #(  entities[ 1 ]-EmpId OPTIONAL ).

    SELECT SINGLE * FROM ztab_empl WHERE emp_id = @lv_id INTO @DATA(ls_emp).


    LOOP AT entities ASSIGNING FIELD-SYMBOL(<lfs_upd>).

      ls_data-emp_id = <Lfs_upd>-EmpId.

*check what field is updated.
      IF <lfS_upd>-%control-EmpName = if_abap_behv=>mk-on.
        ls_data-emp_name = <lfs_upd>-EmpName.
        ls_data-emp_desg = ls_emp-emp_desg.
        ls_data-emp_phne = ls_emp-emp_phne.
        ls_data-emp_resigned = ls_emp-emp_resigned.
        ls_data-changed_date_time = lv_tmstp.
        APPEND ls_data TO zbp_i_cds_empl=>gt_tab.
      ENDIF.

      IF <lfS_upd>-%control-EmpPhne = if_abap_behv=>mk-on.
        ls_data-emp_phne = <lfs_upd>-EmpPhne.
        ls_data-emp_name = ls_emp-emp_name.
        ls_data-emp_desg = ls_emp-emp_desg.
        ls_data-emp_resigned = ls_emp-emp_resigned.
        ls_data-changed_date_time = lv_tmstp.
        APPEND ls_data TO zbp_i_cds_empl=>gt_tab.
      ENDIF.

      IF <lfS_upd>-%control-EmpDesg = if_abap_behv=>mk-on.
        ls_data-emp_desg = <lfs_upd>-EmpDesg.
        ls_data-emp_resigned = lS_emp-emp_resigned.
        ls_data-emp_name = ls_emp-emp_name.
        ls_data-emp_phne = ls_emp-emp_phne.
        ls_data-changed_date_time = lv_tmstp.
        APPEND ls_data TO zbp_i_cds_empl=>gt_tab.
      ENDIF.

      IF <lfS_upd>-%control-EmpResg = if_abap_behv=>mk-on.
        ls_data-emp_resigned = <lfs_upd>-EmpResg.
        ls_data-emp_name = ls_emp-emp_name.
        ls_data-emp_phne = ls_emp-emp_phne.
        ls_data-emp_desg = ls_emp-emp_desg.
        ls_data-changed_date_time = lv_tmstp.
        APPEND ls_data TO zbp_i_cds_empl=>gt_tab.
      ENDIF.
    ENDLOOP.


    IF sy-subrc = 0.
      reported-empl = VALUE #(  (  %msg = new_message_with_text(
                                    severity = if_abap_behv_message=>severity-success
                                    text = 'Successfully update' ) ) ).
    ENDIF.

*    mapped-empl = CORRESPONDING #(  entities  ).
*    reported-empl = CORRESPONDING #(  entities ).
  ENDMETHOD.



  METHOD delete.

    zbp_i_cds_empl=>gv_del = 'D'.

    DATA(lv_key) = keys[ 1 ]-EmpId.

    zbp_i_cds_empl=>gv_empid = lv_key.

  ENDMETHOD.

  METHOD read.

    DATA(lv_key) = VALUE #(  keys[ 1 ]-EmpId ).

    SELECT * FROM zi_cds_empl WHERE EmpId = @lv_key INTO TABLE @DATA(lt_emp).

    result = CORRESPONDING #(  lt_emp ).
  ENDMETHOD.

  METHOD lock.

*    DATA(lv_key) = VALUE #(  keys[ 1 ]-EmpId ).
*
*    SET LOCKS ENTITY zi_cds_empl
*     FROM VALUE #(  ( EmpId = lv_key ) )
*     FAILED DATA(lt_fail)
*     REPORTED DATA(lt_rep).
  ENDMETHOD.

  METHOD SetResigned.

    DATA lt_empl_u TYPE TABLE FOR UPDATE  zi_cds_empl.


    READ ENTITIES OF zi_cds_empl IN LOCAL MODE
    ENTITY empl
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_data).

*    LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<lfs_data>).
*      <lfS_data>-EmpResg = 'R'.
***      lS_data-EmpResg = 'R'.
*      MODIFY ENTITIES OF zi_cds_empl IN LOCAL MODE
*      ENTITY empl
*      UPDATE FIELDS ( EmpResg )
*      WITH CORRESPONDING #( lt_data ).
**      MAPPED lt_data.
*    ENDLOOP.
    LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<lfs_data>).
      <lfS_data>-EmpResg = 'R'.
      APPEND VALUE #( %tky = <Lfs_data>-%tky
                       EmpResg = 'R' ) TO lt_empl_u.
    ENDLOOP.


    " update data with reduced fee
    MODIFY ENTITIES OF zi_cds_empl IN LOCAL MODE
        ENTITY empl
        UPDATE FIELDS ( EmpResg )
        WITH lt_empl_u.


    " read changed data for action result
    READ ENTITIES OF zi_cds_empl IN LOCAL MODE
        ENTITY empl
        ALL FIELDS WITH
        CORRESPONDING #( lt_data )
        RESULT DATA(lt_data_upd).

    result = VALUE #( FOR travel IN lt_data_upd ( %tky   = travel-%tky
                                                  %param = travel ) ).
*    MODIFY ENTITIES OF zi_cds_empl IN LOCAL MODE
*      ENTITY empl
*      UPDATE FIELDS ( EmpResg )
*      WITH VALUE #(
*        FOR row IN lt_data
*        ( %tky     = row-%tky
*          EmpResg  = 'R' )
*      )
*
*      FAILED   DATA(lt_failed)
*      REPORTED DATA(lt_reported)
*      MAPPED DATA(lt_empl).

*    APPEND ls_empl TO lt_empl.

*    result = CORRESPONDING #(  lt_empl ).
*
*    READ ENTITIES OF zi_cds_empl IN LOCAL MODE
*        ENTITY empl
*        ALL FIELDS WITH
*        CORRESPONDING #( travels )
*        RESULT DATA(travels_with_discount).

  ENDMETHOD.


  METHOD UndoResigned.

    DATA lt_empl_u TYPE TABLE FOR UPDATE  zi_cds_empl.

***read to get the selected data
    READ ENTITIES OF zi_cds_empl IN LOCAL MODE
    ENTITY empl
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_data).

***loop to change the data
    LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<lfs_un>).
      IF <lfs_un>-EmpResg IS ASSIGNED.
        CLEAR <lfs_un>-EmpResg.
      ENDIF.
      APPEND VALUE #(  %tky = <lfS_un>-%tky
                       EmpResg = ' ' ) TO lt_empl_u.
    ENDLOOP.

***then modify the entity with new data
    MODIFY ENTITIES OF zi_cds_empl IN LOCAL MODE
    ENTITY empl
    UPDATE FIELDS ( EmpResg )
    WITH lt_empl_u.

**read the data new data
    READ ENTITIES OF zi_cds_empl IN LOCAL MODE
    ENTITY empl
    ALL FIELDS WITH
    CORRESPONDING #( lt_empl_u )
    RESULT DATA(lt_empl_upd).

**for ui refresh and data to reflect pass the new data to result
    result = VALUE #(  FOR update IN lt_empl_upd (  %tky = update-%tky
                                                %param = update ) ).


*    READ ENTITIES OF zi_cds_empl IN LOCAL MODE
*    ENTITY empl
*    ALL FIELDS WITH CORRESPONDING #(  keys )
*    RESULT DATA(lt_data).
*
*    LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<lfs_data>).
*      IF <lfs_data>-EmpResg IS ASSIGNED.
*        CLEAR <lfs_data>-EmpResg.
*
*        MODIFY ENTITIES OF zi_cds_empl IN LOCAL MODE
*        ENTITY empl
*        UPDATE FIELDS ( EmpResg )
*        WITH CORRESPONDING #( lt_data ).
*      ENDIF.
*    ENDLOOP.
  ENDMETHOD.

  METHOD setdate.

*    READ ENTITIES OF zi_cds_empl IN LOCAL MODE
*    ENTITY empl
*    FIELDS (  CreatedDateTime )
*    WITH CORRESPONDING #(  keys )
*    RESULT DATA(lt_data)
*    FAILED DATA(lt_f_data).
*
*    CHECK lt_data IS NOT INITIAL.
*
*    DATA(lv_date) = cl_abap_context_info=>get_system_date( ).
*
*    MODIFY ENTITIES OF zi_cds_empl IN LOCAL MODE
*    ENTITY empl
*    UPDATE SET FIELDS WITH VALUE #( FOR ls_d IN lt_data ( %key = ls_d-%key
*                                                           CreatedDateTime = lv_date ) )
*    REPORTED DATA(lt_data_r).
*
*    reported = CORRESPONDING #( DEEP lt_data_r ).

  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZI_CDS_EMPL DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

**    METHODS save_modified REDEFINITION.

ENDCLASS.

CLASS lsc_ZI_CDS_EMPL IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

*  METHOD save_modified.
**
*  ENDMETHOD.

  METHOD save.

***create
    IF  zbp_i_cds_empl=>gv_cre IS NOT INITIAL.
      DATA(lv_cre) = zbp_i_cds_empl=>gv_cre.
      IF lv_cre = 'C'.
        INSERT ztab_empl FROM TABLE @zbp_i_cds_empl=>gt_tab.
      ENDIF.
    ENDIF.


**FOR DELETE

    IF zbp_i_cds_empl=>gv_del IS NOT INITIAL.

      DATA(lv_del) = zbp_i_cds_empl=>gv_del.
      IF lv_del ='D'.
        DELETE FROM ztab_empl WHERE emp_id = @zbp_i_cds_empl=>gv_empid .
      ENDIF.
    ENDIF.


***update

    IF zbp_i_cds_empl=>gv_upd IS NOT INITIAL.

      DATA(lv_upd) = zbp_i_cds_empl=>gv_upd.
      IF lv_upd ='U'.
        MODIFY ztab_empl FROM TABLE @zbp_i_cds_empl=>gt_tab.
      ENDIF.
    ENDIF.


  ENDMETHOD.

  METHOD cleanup.

    CLEAR : zbp_i_cds_empl=>gv_upd,
            zbp_i_cds_empl=>gv_cre,
            zbp_i_cds_empl=>gv_del.

  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
