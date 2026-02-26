@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'virtual element in cds'
}
@Objectmodel: {
  Usagetype.Dataclass: #MIXED, 
  Usagetype.Servicequality: #X, 
  Usagetype.Sizecategory: #S
}
define view entity ZC_CDS_ABAP
  as select from ZCDS_ABAP
  association [1..1] to ZCDS_ABAP as _BaseEntity on $projection.EBELN = _BaseEntity.EBELN
{
  @Endusertext: {
    Label: 'Purchasing Document', 
    Quickinfo: 'Purchasing Document Number'
  }
  key ebeln,
  @Endusertext: {
    Label: 'Company Code', 
    Quickinfo: 'Company Code'
  }
  bukrs,
  @Endusertext: {
    Label: 'Created On', 
    Quickinfo: 'Record Created On'
  }
  aedat,
  @Endusertext: {
    Label: 'Created by', 
    Quickinfo: 'Name of Person who Created the Object'
  }
  kunnr,
  phone,
  _BaseEntity
}
