CLASS lhc_head DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR head RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR head RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE head.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE head.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE head.

    METHODS read FOR READ
      IMPORTING keys FOR READ head RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK head.

    METHODS rba_Item FOR READ
      IMPORTING keys_rba FOR READ head\_Item FULL result_requested RESULT result LINK association_links.

    METHODS cba_Item FOR MODIFY
      IMPORTING entities_cba FOR CREATE head\_Item.

ENDCLASS.

CLASS lhc_head IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

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

  METHOD rba_Item.
  ENDMETHOD.

  METHOD cba_Item.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_item DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE item.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE item.

    METHODS read FOR READ
      IMPORTING keys FOR READ item RESULT result.

    METHODS rba_Head FOR READ
      IMPORTING keys_rba FOR READ item\_Head FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_item IMPLEMENTATION.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Head.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZSC_I_HEADER DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZSC_I_HEADER IMPLEMENTATION.

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
