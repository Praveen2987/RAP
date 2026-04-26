CLASS lhc_booking DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR booking RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR booking RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE booking.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE booking.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE booking.

    METHODS read FOR READ
      IMPORTING keys FOR READ booking RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK booking.

    METHODS rba_Passenger FOR READ
      IMPORTING keys_rba FOR READ booking\_Passenger FULL result_requested RESULT result LINK association_links.

    METHODS cba_Passenger FOR MODIFY
      IMPORTING entities_cba FOR CREATE booking\_Passenger.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR booking RESULT result.

    METHODS Change_Status FOR MODIFY
      IMPORTING keys FOR ACTION booking~Change_Status RESULT result.
    METHODS precheck_delete FOR PRECHECK
      IMPORTING keys FOR DELETE booking.

ENDCLASS.

CLASS lhc_booking IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD create.

    DATA: lt_booking TYPE TABLE OF zbooking_hdr,
          ls_booking TYPE zbooking_hdr,
          rv_id      TYPE sysuuid_x16.

    zbp_sc_i_booking=>lv_c = 'C'.

**get the booking id

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<lfs_data>).

      APPEND VALUE #(
                      customer_id = <lfs_data>-CustomerId
                      flight_no = <lfs_data>-FlightNo
                      status = <lfs_data>-Status
                      booking_date = <lfs_data>-BookingDate ) TO zbp_sc_i_booking=>gt_booking.


      TRY.
          rv_id = cl_system_uuid=>create_uuid_x16_static( ).
        CATCH cx_uuid_error.
          ASSERT 1 = 0.
      ENDTRY.
***MAP TO ENTITY
      zbp_sc_i_booking=>gv_id = rv_id.
      APPEND VALUE #(  %cid = <LFS_data>-%cid
                       %pid = rv_id ) TO mapped-booking.
    ENDLOOP.
  ENDMETHOD.

  METHOD update.

    zbp_sc_i_booking=>lv_u = 'U'.
    DATA: ls_tab_u    TYPE zbooking_hdr,
          lv_timestmp TYPE timestampl.

**    DATA(ls_entity) = VALUE #(  entities[ 1  ] OPTIONAL ).


    GET TIME STAMP FIELD lv_timestmp.

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<lfs_data>).

*      ls_tab_u-booking_id = <lfs_data>-BookingId.
*      ls_tab_u-customer_id = <lfs_data>-CustomerId.
*      ls_tab_u-flight_no = <lfs_data>-FlightNo.
*      ls_tab_u-booking_date = <lfs_data>-BookingDate.

      IF <lfs_data>-%control-Status = if_abap_behv=>mk-on.
        ls_tab_u-Status = 'C'.
      ENDIF.


      APPEND VALUE #(  booking_id = <lfs_data>-BookingId
                       customer_id = <lfs_data>-CustomerId
                       flight_no = <lfs_data>-FlightNo
                       booking_date = <Lfs_data>-BookingDate
                       status = 'C' col_ind-status = '01'
                       last_changed_at = lV_timestmp col_ind-last_changed_at = '01' ) TO zbp_sc_i_booking=>gt_booking.



    ENDLOOP.

*    APPEND  ls_tab_u TO zbp_sc_i_booking=>gt_booking.
*
*    APPEND VALUE #(  booking_id = <lfs_data>-BookingId
*
*                      seat_no = ls_passenger-seat_no col_ind-seat_no = abap_true
*                      ticket_status = ls_passenger-Ticket_Status col_ind-Ticket_Status = abap_true
*                             last_changed_at = lV_timestmp ) TO zbp_sc_i_booking=>gt_passenger.

    INSERT VALUE #( %cid = <Lfs_Data>-%cid_ref
                    bookingid = <Lfs_Data>-BookingId ) INTO TABLE mapped-booking.


***%tky = <lfs_data>-%tky
  ENDMETHOD.

  METHOD delete.

    zbp_sc_i_booking=>lv_d = 'D'.

    DATA(lv_key) = VALUE #(  keys[ 1 ]-BookingId ).

    zbp_sc_i_booking=>gv_booking_id = lv_key.


  ENDMETHOD.

  METHOD read.
*get the data from the booking id

    DATA(ls_id) = VALUE #(  keys[ 1 ] OPTIONAL ).

    SELECT * FROM zsc_i_booking
     FOR ALL ENTRIES IN @keys
       WHERE BookingId = @keys-BookingId INTO CORRESPONDING FIELDS OF TABLE @result.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD rba_Passenger.

    SELECT * FROM zsc_i_passenger
          FOR ALL ENTRIES IN @keys_rba
          WHERE bookingid = @keys_rba-bookingid INTO
           CORRESPONDING FIELDS OF TABLE @result.


  ENDMETHOD.

  METHOD cba_Passenger.

    zbp_sc_i_booking=>lv_p_c = 'C'.

    DATA: rv_id      TYPE sysuuid_x16.

    LOOP AT entities_cba ASSIGNING FIELD-SYMBOL(<lfs_cba>).

      DATA(lv_book_id) = <lfs_cba>-BookingId.

      zbp_sc_i_booking=>gv_booking_id = lv_book_id.

      LOOP AT <lfS_cba>-%target ASSIGNING FIELD-SYMBOL(<Lfs_data>).


        APPEND VALUE #( booking_id = lv_book_id
                        name = <Lfs_data>-Name
                        seat_no = <lfs_data>-SeatNo
                        ticket_status = <lfs_Data>-TicketStatus ) TO zbp_sc_i_booking=>gt_passenger.

**map the data to th passenger
        TRY.
            rv_id = cl_system_uuid=>create_uuid_x16_static( ).
          CATCH cx_uuid_error.
            ASSERT 1 = 0.
        ENDTRY.
***MAP TO ENTITY
        zbp_sc_i_booking=>gv_id = rv_id.
        APPEND VALUE #(  %cid = <LFS_data>-%cid
                         %pid = rv_id
                         bookingid   = lv_book_id ) TO mapped-passenger.

      ENDLOOP.
    ENDLOOP.

  ENDMETHOD.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD Change_Status.

    DATA: lt_data_u TYPE TABLE FOR UPDATE zsc_i_booking.

    READ ENTITIES OF zsc_i_booking IN LOCAL MODE
    ENTITY booking
    FIELDS (  status  )
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_data).


    LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<lfS_data>).
      <lfs_data>-Status = 'C'.
*      APPEND VALUE #( %tky   = <lfs_data>-%tky
*                       bookingid = <Lfs_data>-BookingId ) TO lt_booking_u.

*      lt_data_u =  CORRESPONDING #(  DEEP lt_data ).

      APPEND VALUE #(  %tky = <lfs_data>-%tky
                       status = 'C' ) TO lt_data_u.


    ENDLOOP.


    MODIFY ENTITIES OF zsc_i_booking IN LOCAL MODE
    ENTITY booking UPDATE FIELDS (  Status )
    WITH lt_data_u.


    READ ENTITIES OF zsc_i_booking IN
    LOCAL MODE ENTITY booking
    ALL FIELDS WITH CORRESPONDING #( lt_data )
    RESULT DATA(lt_booking_upd) .


    result = VALUE #(  FOR ls_upd IN lt_data (  %tky = ls_upd-%tky
                                                       %param = ls_upd ) ).


  ENDMETHOD.

  METHOD precheck_delete.


    READ ENTITIES OF zsc_i_booking IN LOCAL MODE
    ENTITY booking
    ALL FIELDS WITH CORRESPONDING #(  keys )
    RESULT DATA(lt_booking)
    ENTITY booking BY \_passenger
    ALL FIELDS WITH CORRESPONDING #(  keys )
    RESULT DATA(lt_passenger).

    IF lt_passenger[] IS NOT INITIAL.
      LOOP AT lt_booking ASSIGNING FIELD-SYMBOL(<lfs_root>).

*        APPEND VALUE #(  %tky = <lfs_root>-%tky ) TO failed-booking.

        APPEND VALUE #(  %tky = keys[ 1 ]-%tky
                          %msg = new_message_with_text(
                                 severity = if_abap_behv_message=>severity-error
                                 text     = 'Can not delete the Booking,as seats are booked'
                               ) ) TO reported-booking.


      ENDLOOP.
    ENDIF.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_passenger DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE passenger.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE passenger.

    METHODS read FOR READ
      IMPORTING keys FOR READ passenger RESULT result.

    METHODS rba_Booking FOR READ
      IMPORTING keys_rba FOR READ passenger\_Booking FULL result_requested RESULT result LINK association_links.
    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE passenger.

ENDCLASS.

CLASS lhc_passenger IMPLEMENTATION.

  METHOD update.

*    zbp_sc_i_booking=>lv_u = 'U'.
*
*      MODIFY zbooking_hdr FROM TABLE @zbp_sc_i_booking=>gt_booking.
*
    zbp_sc_i_booking=>lv_p_u = 'U'.

    DATA:
      ls_passenger TYPE zbooking_pass,
      lv_timestmp  TYPE timestampl.

    DATA(ls_id) = VALUE #(  entities[ 1 ] ).

    SELECT SINGLE seat_no,
                  ticket_status  FROM zbooking_pass WHERE booking_id = @ls_id-BookingId
                                AND passenger_no = @lS_id-PassengerNo INTO @DATA(ls_data).

    GET TIME STAMP FIELD lv_timestmp.

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<lfs_data>).

      DATA(ls_control) = <lfs_data>-%control.

      IF ls_control-SeatNo = if_abap_behv=>mk-on.
        ls_passenger-seat_no = <lfs_data>-SeatNo.
      ELSE.
        ls_passenger-seat_no = ls_data-seat_no.
      ENDIF.
      IF ls_control-TicketStatus = if_abap_behv=>mk-on.
        ls_passenger-ticket_status = <lfs_data>-TicketStatus.
      ELSE.
        ls_passenger-ticket_status = ls_Data-Ticket_Status.
      ENDIF.


      APPEND VALUE #(  booking_id = <lfs_data>-BookingId
                       passenger_no = <lfs_data>-PassengerNo
                       seat_no = ls_passenger-seat_no col_ind-seat_no = '01'
                       ticket_status = ls_passenger-Ticket_Status col_ind-Ticket_Status = '01'
                       last_changed_at = lV_timestmp col_ind-last_changed_at = '01' ) TO zbp_sc_i_booking=>gt_passenger.


    ENDLOOP.

    INSERT VALUE #( %cid = <Lfs_Data>-%cid_ref
                     BookingId = <lfs_data>-BookingId
                     passengerno = <lfs_Data>-PassengerNo ) INTO TABLE mapped-passenger.

*  ENDIF.
  ENDMETHOD.

  METHOD delete.

    zbp_sc_i_booking=>lv_c = 'D'.

    DATA(ls_key) = VALUE #(  keys[ 1 ] OPTIONAL ).

    DATA(lv_b_id) = ls_key-BookingId.
    DATA(lV_p_id) = lS_key-PassengerNo.

    zbp_sc_i_booking=>gv_passenger_no = lv_p_id.


  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Booking.
  ENDMETHOD.

  METHOD create.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZSC_I_BOOKING DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS adjust_numbers REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZSC_I_BOOKING IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD adjust_numbers.

    DATA: lv_id_b TYPE zbkid,
          lv_id_p TYPE char7.

    IF zbp_sc_i_booking=>gt_booking IS NOT INITIAL AND zbp_sc_i_booking=>lv_c = 'C'.

*Get the booking id
      SELECT FROM zbooking_hdr FIELDS MAX( booking_id ) INTO @DATA(lv_booking_id).
      IF lv_booking_id IS NOT INITIAL.
        lv_booking_id = lv_booking_id + 1.
        CONDENSE lv_booking_id.
      ENDIF.

      DATA(lt_data) = zbp_sc_i_booking=>gt_booking.

      LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<Lfs_data>).
        CONDENSE lv_booking_id.
        <lfs_data>-booking_id = lV_booking_id.
      ENDLOOP.

      zbp_sc_i_booking=>gt_booking = CORRESPONDING #( lt_data ).

***map the genereated pid to the mapped value
      mapped-booking = VALUE #( ( %pid =  zbp_sc_i_booking=>gv_id
                                  BookingId = lv_booking_id  ) ).

    ELSEIF zbp_sc_i_booking=>gt_passenger IS NOT INITIAL.
**get the customer id

      SELECT FROM zbooking_pass FIELDS MAX( passenger_no )
            WHERE booking_id = @zbp_sc_i_booking=>gv_booking_id INTO @DATA(lv_passenger_no).
      IF lv_passenger_no IS NOT INITIAL.
        lv_Passenger_no = lv_passenger_no + 1.
      ELSE.
        lv_passenger_no = 1.
      ENDIF.

      DATA(lt_data_p) = zbp_sc_i_booking=>gt_passenger.

      LOOP AT lt_data_p ASSIGNING FIELD-SYMBOL(<Lfs_passenger>).
        CONDENSE lv_passenger_no.
        <lfs_passenger>-passenger_no = lv_passenger_no.
      ENDLOOP.


      zbp_sc_i_booking=>gt_passenger = CORRESPONDING #( lt_data_p ).

**mpa the pid and passenger id
      DATA(lV_b_id) = VALUE #(  lt_data_p[ 1 ]-booking_id OPTIONAL ).

*      mapped-passenger = VALUE #( (  %pid = zbp_sc_i_booking=>gv_id
**                                     %tmp-BookingId = lv_b_id
**                                     %tmp-PassengerNo = lv_passenger_no
**                                     %key-BookingId = lv_b_id
**                                     %key-PassengerNo = lv_passenger_no ) ).
*                                      bookingid   = lv_b_id
*                                      PassengerNo = lv_passenger_no ) ) .


      INSERT VALUE #(   %pid = zbp_sc_i_booking=>gv_id
                        bookingid   = lv_b_id
                        PassengerNo = lv_passenger_no ) INTO TABLE mapped-passenger.
    ENDIF.

  ENDMETHOD.

  METHOD save.

    IF  zbp_sc_i_booking=>lv_c = 'C'. " OR zbp_sc_i_booking=>lv_p_c = 'C'.

      INSERT zbooking_hdr FROM TABLE @zbp_sc_i_booking=>gt_booking.
      IF sy-subrc = 0.
        DATA(lv_booking_id) = VALUE #( zbp_sc_i_booking=>gt_booking[  1 ]-booking_id OPTIONAL  ).
*
*        reported-booking = VALUE #(  (  %msg = new_message(  id = 'Z_RAP_MES'
*                                                          number = '001'
*                                                          severity = if_abap_behv_message=>severity-success
*                                                          v1 = lv_booking_id ) ).

        reported-booking = VALUE #(
          ( %msg = new_message(
              id       = 'Z_RAP_MES'
              number   = '002'
              severity = if_abap_behv_message=>severity-success
              v1       = lv_booking_id ) )
        ).



*        APPEND VALUE #(  %tky = keys[ 1 ]-%tky
*                     %msg = new_message_with_text(
*                            severity = if_abap_behv_message=>severity-error
*                            text     = 'Can not delete the Booking,as seats are booked'
*                          ) ) TO reported-booking.



      ENDIF.

    ELSEIF zbp_sc_i_booking=>lv_p_c = 'C'.

      INSERT zbooking_pass FROM TABLE @zbp_sc_i_booking=>gt_passenger.

    ELSEIF zbp_sc_i_booking=>lv_D = 'D'. " OR zbp_sc_i_booking=>lv_p_c = 'D'.

      DELETE FROM zbooking_hdr WHERE booking_id = @zbp_sc_i_booking=>gv_booking_id.

    ELSEIF zbp_sc_i_booking=>lv_p_c = 'D'.

      DELETE FROM zbooking_pass WHERE passenger_no = @zbp_sc_i_booking=>gv_passenger_no.

    ELSEIF zbp_sc_i_booking=>lv_u = 'U' OR zbp_sc_i_booking=>lv_P_u = 'U'.

*      MODIFY zbooking_pass FROM TABLE @zbp_sc_i_booking=>gt_passenger.
      IF zbp_sc_i_booking=>lv_u = 'U'.
        UPDATE zbooking_hdr FROM TABLE @zbp_sc_i_booking=>gt_booking INDICATORS SET STRUCTURE col_ind.
        IF sy-subrc = 0.
        ENDIF.
      ELSE.
        UPDATE zbooking_pass FROM TABLE @zbp_sc_i_booking=>gt_passenger INDICATORS SET STRUCTURE col_ind.

      ENDIF.
    ENDIF.


  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.

    CLEAR : zbp_sc_i_booking=>gv_booking_id,
            zbp_sc_i_booking=>gv_passenger_no.

  ENDMETHOD.

ENDCLASS.
