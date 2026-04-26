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

CLASS lsc_ZI_UPLOAD_FILE DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS save_modified REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZI_UPLOAD_FILE IMPLEMENTATION.

  METHOD save_modified.
*****working class to trigger
**create
    DATA: lt_attach TYPE STANDARD TABLE OF zfile_upload,
          lv_id_k   TYPE sysuuid_x16.

    DATA: lt_attach_u TYPE REQUEST FOR CHANGE zi_upload_file.

    IF create-attach IS NOT INITIAL.

      lt_attach = CORRESPONDING #(  create-attach ).

      lt_attach_u = CORRESPONDING #(  create ).

      LOOP AT lt_attach ASSIGNING FIELD-SYMBOL(<lfs_data>).
**genereate the id

        DATA(ls_att) = VALUE #(  lt_attach_u-attach[ 1 ] OPTIONAL ).

        IF  ls_att-%control-Id = cl_abap_behv=>flag_changed.
          TRY.
*            DATA(lv_id) = cl_system_uuid=>create_uuid_x16_static( ).
              lv_id_k = cl_system_uuid=>create_uuid_x16_static( ).
            CATCH cx_uuid_error.
              " Handle exception
          ENDTRY.
          <lfs_data>-id = lv_id_k.
        ENDIF.
      ENDLOOP.

      INSERT zfile_upload FROM TABLE @lt_attach.

    ENDIF.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
