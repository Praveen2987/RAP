CLASS zbp_sc_i_booking DEFINITION PUBLIC ABSTRACT FINAL FOR BEHAVIOR OF zsc_i_booking.


  CLASS-DATA: lv_c   TYPE char1,
              lv_u   TYPE char1,
              lv_d   TYPE char1,
              lv_p_c TYPE char1,
              lv_p_U TYPE char1.


  TYPES : pass_ind    TYPE zbooking_pass WITH INDICATORS col_ind,
          booking_ind TYPE zbooking_hdr WITH INDICATORS col_ind.


*          types        abap_bool.

  CLASS-DATA:gt_booking      TYPE TABLE OF booking_ind, " STANDARD TABLE OF zbooking_hdr,
             gt_passenger    TYPE TABLE OF pass_ind,
             gv_booking_id   TYPE zbkid,
             gv_passenger_no TYPE char7,
             gt_buffer       TYPE STANDARD TABLE OF zsc_i_booking,
             gv_id           TYPE sysuuid_x16.

*zbooking_pass,
ENDCLASS.

CLASS zbp_sc_i_booking IMPLEMENTATION.
ENDCLASS.
