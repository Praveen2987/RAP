@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds for empl for determination'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity zcds_empl_det
  as select from ztb_emp_d
  //composition of target_data_source_name as _association_name
{

//      @UI.facet: [{
//          id: 'Empid',
//          purpose: #STANDARD,
//          position: 10,
//          importance: #HIGH,
//           type: #IDENTIFICATION_REFERENCE
      //#IDENTIFICATION_REFERENCE,
      //            targetQualifier: 'Empid'
  //    }
      //      {
      //
      //      label : 'Emp Data',
      //      type: #COLLECTION,
      //      id : 'General Info',
      //      position:  10

      //      }
 //     ]



//
//      @UI.lineItem: [{ position: 10,
//                       label : 'EmpId'  }]
//
//      @UI.identification: [{ position: 10,
//                             label: 'EmpId' }]

      //      @UI.dataPoint: {
      //          qualifier: 'EmpId',
      //      //          hidden: true,
      //          title: 'Employee Id '}
  key empid   as Empid,


//      @UI.lineItem: [{ position: 20,
//                       label : 'Empdesg'  }]
//
//      @UI.identification: [{ position: 20,
//                               label: 'Empdesg' }]

      empdesg as Empdesg,


//      @UI.lineItem: [{ position: 30,
//                       label : 'EmpSal'  }]
//
//
//      @UI.identification: [{ position: 30,
//                                   label: 'EmpSal' }]
      empsal  as Empsal,
      //    _association_name // Make association public


      created as creattsp
}
