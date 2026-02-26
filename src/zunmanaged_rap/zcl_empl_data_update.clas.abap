CLASS zcl_empl_data_update DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES: tty_create TYPE TABLE OF zi_cds_empl,
           tty_mapped TYPE RESPONSE FOR MAPPED EARLY zi_cds_empl,
           tty_failed TYPE RESPONSE FOR FAILED EARLY zi_cds_empl,
           tty_report TYPE RESPONSE FOR REPORTED EARLY zi_cds_empl.


    CLASS-METHODS : get_inst RETURNING VALUE(ro_inst) TYPE REF TO zcl_empl_data_update,
      get_create  IMPORTING entities TYPE tty_create
                  CHANGING  mapped   TYPE tty_mapped
                            failed   TYPE  tty_failed
                            reported TYPE  tty_report.

  PROTECTED SECTION.
  PRIVATE SECTION.

    CLASS-DATA : mo_inst TYPE REF TO zcl_empl_data_update,
                 gt_emp  TYPE STANDARD TABLE OF ztab_empl.

ENDCLASS.



CLASS ZCL_EMPL_DATA_UPDATE IMPLEMENTATION.


  METHOD get_inst.

    mo_inst = ro_inst = COND #( WHEN ro_inst IS BOUND
                                 THEN mo_inst
                                 ELSE NEW #( )  ).

  ENDMETHOD.


  METHOD get_create.

    DATA: lv_id   TYPE int4.

    SELECT SINGLE MAX(  emp_id ) FROM ztab_empl INTO @DATA(lv_emp).
    IF sy-subrc = 0.
      lv_id = lv_emp + 1.
    ENDIF.

    gt_emp = CORRESPONDING #(  entities MAPPING FROM ENTITY ).

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<lfs_create>).



    ENDLOOP.


  ENDMETHOD.
ENDCLASS.
