@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee Hier'

define view entity ziv_employee_hier
  as select from /dmo/employee_hr
  association of many to one ziv_employee_hier as _Manager on $projection.Manager = _Manager.Employee
{
  key employee        as Employee,
      first_name      as FirstName,
      last_name       as LastName,
      @Semantics. amount.currencyCode: 'SalaryCurrency'
      salary          as Salary,
      salary_currency as SalaryCurrency,
      @EndUserText.label: 'Manager'
      manager         as Manager,
      _Manager
}
