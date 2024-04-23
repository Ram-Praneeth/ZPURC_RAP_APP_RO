@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Order Item Consumption View'

@UI.headerInfo : { typeName: 'Purchase Order Item Details',
                   typeNamePlural: 'Purchase Order Items',
                   title: { type: #STANDARD, label: 'PO Number',value: 'ebeln' },  
                   description : { type: #STANDARD,label: 'Po Number',value: 'ebelp' }}

@Search.searchable: true

define view entity ZC_PURC_ITM_R 
as select from ZI_PURC_ITM_R as PoItm
association [1..*] to ZC_PURC_HDR_R as PoHdr on $projection.ebeln = PoHdr.ebeln
{  
      @UI.facet: [
                 { id: 'PoItm',
                   label: 'PO Item details',
                   importance: #HIGH,
                   position: 10,
                   purpose: #STANDARD,
                   type: #IDENTIFICATION_REFERENCE }                   
                  ]

   @UI.hidden: true
    key ebeln,
   @UI:{ lineItem: [{ position: 10,importance: #HIGH }],
         identification: [{ position: 10,importance: #HIGH }] }    
    key ebelp,
   @UI:{ lineItem: [{ position: 20,importance: #HIGH }],
         identification: [{ position: 20,importance: #HIGH }] }     
    matnr,
   @UI:{ lineItem: [{ position: 30,importance: #HIGH }],
         identification: [{ position: 30,importance: #HIGH }] }
    @Search.defaultSearchElement: true              
    bukrs,
   @UI:{ lineItem: [{ position: 40,importance: #HIGH }],
         identification: [{ position: 40,importance: #HIGH }] }
   @Search.defaultSearchElement: true              
    werks,
   @UI:{ lineItem: [{ position: 50,importance: #HIGH }],
         identification: [{ position: 50,importance: #HIGH }] }
    @Search.defaultSearchElement: true     
    lgort,
   @UI:{ lineItem: [{ position: 60,importance: #HIGH }],
         identification: [{ position: 60,importance: #HIGH }] }     
    matkl,
   @UI:{ lineItem: [{ position: 70,importance: #HIGH }],
         identification: [{ position: 70,importance: #HIGH }] }     
    idnlf,
   @UI:{ lineItem: [{ position: 80,importance: #HIGH }],
         identification: [{ position: 80,importance: #HIGH }] }     
    ktmng,
   @UI:{ lineItem: [{ position: 90,importance: #HIGH }],
         identification: [{ position: 90,importance: #HIGH }] }     
    menge,
    @UI.hidden: true
    meins,
    
    PoHdr
}
