//@AbapCatalog.viewEnhancementCategory: [#NONE]
//@AccessControl.authorizationCheck: #NOT_REQUIRED
//@EndUserText.label: 'sales scrap report'
//@Metadata.ignorePropagatedAnnotations: true
//define view entity zcds_sales_scarp as select from vbak
//
//{
//
//}


@EndUserText.label: 'Sales Order Report'
@AccessControl.authorizationCheck: #CHECK
@Metadata.ignorePropagatedAnnotations: true

define view entity zcds_sales_scarp
  with parameters
    p_pono : ebeln // Mandatory parameter
  as select from zhead_po as po
{
      /* Keys */
  key po.pono      as SalesOrderId,

      /* ----------- FILTER FIELDS ----------- */

      @UI.selectionField: [{ position: 10 }]
      @EndUserText.label: 'Company Code'
      @Consumption.filter: {
        mandatory: true
      }
      po.pocompany as Pocompany,

      @UI.selectionField: [{ position: 20 }]
      @EndUserText.label: 'Sales Order Date'
      @Consumption.filter: {
        selectionType: #RANGE
      }
      po.podate    as podate,

      //      @UI.selectionField: [{ position: 30 }]
      //      @EndUserText.label: 'Customer'
      //      @Consumption.filter: {
      //        selectionType: #SINGLE,
      //        multipleSelections: false
      //      }
      //      @Consumption.valueHelpDefinition: [{
      //        entity: { name: 'I_Customer', element: 'Customer' }
      //      }]
      po.postatus  as postatus

      //      @UI.selectionField: [{ position: 40 }]
      //      @EndUserText.label: 'Order Status'
      //      @Consumption.filter: {
      //        selectionType: #RANGE,
      //        defaultValue: 'OPEN'
      //      }
      //      so.amt     as Status,

      /* ----------- DISPLAY FIELDS ----------- */

      //      @UI.lineItem: [{ position: 10 }]
      //      po.amt       as NetAmount

      //      so.currency   as Currency

}
where
  po.pono = $parameters.p_pono;
