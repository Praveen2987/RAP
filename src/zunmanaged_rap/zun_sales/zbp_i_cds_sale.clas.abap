CLASS zbp_i_cds_sale DEFINITION PUBLIC ABSTRACT FINAL FOR BEHAVIOR OF zi_cds_sale.


  PUBLIC SECTION.

    CLASS-DATA: gv_cre   TYPE char1,
                gv_upd   TYPE char1,
                gv_del   TYPE char1,
                gt_sale  TYPE TABLE OF ztb_sales,
                gv_vbeln TYPE vbeln_va.
ENDCLASS.

CLASS zbp_i_cds_sale IMPLEMENTATION.
ENDCLASS.
