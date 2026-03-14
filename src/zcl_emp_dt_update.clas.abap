CLASS zcl_emp_dt_update DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES: if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_emp_dt_update IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: it_tab TYPE TABLE OF ztb_emp_d.


    it_tab = VALUE #( (  empid = '1001' empdesg = 'BTA' empsal = '20000'
     ) ).


    INSERT ztb_emp_d FROM TABLE @it_tab.




  ENDMETHOD.



ENDCLASS.
