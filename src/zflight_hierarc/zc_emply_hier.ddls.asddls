@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'consumption for employee hier'
@Metadata.ignorePropagatedAnnotations: true

@OData.hierarchy.recursiveHierarchy: [{ entity.name: 'zhv_hire_emply' }]



@UI: { headerInfo: {
                     typeName: 'Employee',
                     typeNamePlural: 'Employees',
                     title: { type: #STANDARD, value: 'Employee' }
                   },
       presentationVariant: [{
           sortOrder: [{ by: 'Employee', direction: #ASC }],
           visualizations: [{type: #AS_LINEITEM}]
         }]
     }

define view entity zc_emply_hier
  as select from ziv_employee_hier
  association of many to one zc_emply_hier as _Manager on $projection.Manager = _Manager.Employee
{

      @UI: {
            facet:          [
                             { id:            'Employee',
                               purpose:       #STANDARD,
                               type:          #IDENTIFICATION_REFERENCE,
                               label:         'Employee',
                               position:      10
                             }
                            ]
          }

      @UI.lineItem: [{ position: 20  ,cssDefault.width: '200px' }]
      @UI.identification: [{ position: 20 }]


  key Employee,
      @UI.lineItem: [{ position: 30 }]
      @UI.identification: [{ position: 30 }]

      FirstName,

      @UI.lineItem: [{ position: 40 }]
      @UI.identification: [{ position: 40 }]

      LastName,

      @UI.lineItem: [{ position: 50 }]
      @UI.identification: [{ position: 50 }]

      @Semantics. amount.currencyCode: 'SalaryCurrency'

      Salary,
      @UI.lineItem: [{ position: 60 }]
      @UI.identification: [{ position: 60 }]

      SalaryCurrency,
      @UI.lineItem: [{ position: 70 }]
      @UI.identification: [{ position: 70 }]

      Manager,
      /* Associations */
      _Manager
}
