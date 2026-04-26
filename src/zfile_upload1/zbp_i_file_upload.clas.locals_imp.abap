CLASS lhc_attach DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR attach RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR attach RESULT result.



ENDCLASS.

CLASS lhc_attach IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_saver  DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.
    METHODS : save_modified REDEFINITION,
      cleanup_finalize REDEFINITION.

ENDCLASS.


CLASS lsc_saver IMPLEMENTATION.


  METHOD save_modified.


    DATA: lR_id TYPE RANGE OF zi_file_upload-Id.

    DATA: lt_data TYPE STANDARD TABLE OF zfile_upload,
          lv_id_k TYPE sysuuid_x16.
    DATA lt_attch_u TYPE TABLE FOR UPDATE  zi_file_upload.

    DATA: cr_tab  TYPE TABLE FOR CREATE zi_file_upload.


    IF create-attach IS NOT INITIAL.

      lt_data = CORRESPONDING #(  create-attach ).

      LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<lfs_data>).

**Create id
***        SELECT * FROM zfile_upload INTO @DATA(lv_ex_id).
        TRY.
*            DATA(lv_id) = cl_system_uuid=>create_uuid_x16_static( ).
            lv_id_k = cl_system_uuid=>create_uuid_x16_static( ).
          CATCH cx_uuid_error.
            " Handle exception
        ENDTRY.
        <lfs_data>-id = lv_id_k.
      ENDLOOP.
    ENDIF.

    cr_tab = VALUE #( (   %key-id = lv_id_k ) ).


*
*    MODIFY ENTITIES OF zi_file_upload
*      IN LOCAL MODE ENTITY attach
*      CREATE FIELDS (  Id ) WITH cr_tab
*      REPORTED DATA(report)
*      FAILED DATA(failed).


    APPEND VALUE #(
*             %key-id = lv_id_k
             %tky-id = lv_id_k
            %msg = new_message_with_text( severity = if_abap_behv_message=>severity-success
                                          text = 'Proceed to file Upload' )
          ) TO reported-attach.


    INSERT zfile_upload FROM TABLE @lt_data.

****for delete
    IF delete IS NOT INITIAL.

      lr_id = VALUE #( FOR ls_id IN delete-attach
                       (  sign = 'I'
                         option = 'EQ'
                         low = ls_id-Id ) ).

      DELETE FROM zfile_upload WHERE id IN @lr_id.

      IF sy-subrc = 0.

        reported-attach = VALUE #(  (  %msg = new_message_with_text( severity = if_abap_behv_message=>severity-success
                                                                     text = 'Record Deleted'  ) ) ).

      ELSE.

        reported-attach = VALUE #(  (  %msg = new_message_with_text( severity = if_abap_behv_message=>severity-success
                                                                       text = 'Record Not Deleted'  ) ) ).
      ENDIF.
    ENDIF.

  ENDMETHOD.


  METHOD cleanup_finalize.

  ENDMETHOD.



ENDCLASS.
