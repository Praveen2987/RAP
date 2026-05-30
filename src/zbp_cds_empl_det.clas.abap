CLASS zbp_cds_empl_det DEFINITION PUBLIC ABSTRACT FINAL FOR BEHAVIOR OF zcds_empl_det.


  CLASS-DATA : gv_c    TYPE char1,
               gtt_tab TYPE TABLE FOR UPDATE zcds_empl_det,
               gt_tab  TYPE TABLE OF ztb_emp_d,
               gv_del   TYPE char1,
               gv_empid type char10.


ENDCLASS.



CLASS ZBP_CDS_EMPL_DET IMPLEMENTATION.
ENDCLASS.
