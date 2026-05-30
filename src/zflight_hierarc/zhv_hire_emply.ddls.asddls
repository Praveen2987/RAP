@AccessControl.authorizationCheck: #NOT_REQUIRED
define hierarchy zhv_hire_emply
  as parent child hierarchy(
    source ziv_employee_hier
    child to parent association _Manager
    start where
      Manager is initial
    siblings order by
      LastName ascending
  )
{
  
 key Employee,
  Manager
  

}
