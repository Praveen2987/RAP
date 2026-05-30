CLASS lhc_excel DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR excel RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE excel.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE excel.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE excel.

    METHODS read FOR READ
      IMPORTING keys FOR READ excel RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK excel.

    METHODS excel_upload FOR MODIFY
      IMPORTING keys FOR ACTION excel~excel_upload.

ENDCLASS.

CLASS lhc_excel IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD create.
  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD excel_upload.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZI_EXCEL_UPLOAD DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZI_EXCEL_UPLOAD IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
