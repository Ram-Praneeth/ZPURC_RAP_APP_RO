@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Order Header Consumption View'

@UI.headerInfo : { typeName: 'Purchase Order Details',
                   typeNamePlural: 'Purchase Orders',
                   title: { type: #STANDARD, label: 'PO Number',value: 'ebeln' },  
                   description : { type: #STANDARD,label: 'Po Number',value: 'ebeln' }}
                                   
@UI.presentationVariant: [{ sortOrder: [{ by: 'ebeln', direction: #DESC }] }]

@Search.searchable: true


define view entity ZC_PURC_HDR_R
  as select from ZI_PURC_HDR_R as PoHdr
  association [1..*] to ZC_PURC_ITM_R as PoItm on $projection.ebeln = PoItm.ebeln
  association to C_PurchasingDocCategoryVH on $projection.bstyp = C_PurchasingDocCategoryVH.PurchasingDocumentCategory
{
      @UI.facet: [
                 { id: 'PoHdr',
                   label: 'PO Header details',
                   importance: #HIGH,
                   position: 10,
                   purpose: #STANDARD,
                   type: #IDENTIFICATION_REFERENCE },
                 { id: 'PoItm',
                   label: 'PO Item list',
                   importance: #HIGH,
                   position: 20,
                   purpose: #STANDARD,
                   type: #LINEITEM_REFERENCE,
                   targetElement: 'PoItm'
                  }                    
                  ]

      @UI:{ lineItem: [{ position: 10,importance: #HIGH }],
            identification: [{ position: 10,importance: #HIGH }] }
      @Search.defaultSearchElement: true        
  key ebeln,
      @UI:{ lineItem: [{ position: 20,importance: #HIGH }],
            identification: [{ position: 20,importance: #HIGH }],
            selectionField: [{ position: 20 }] }
      @Consumption.valueHelpDefinition: [{ entity : { name: 'I_CompanyCode', element: 'CompanyCode' }}]
      @Search.defaultSearchElement: true
      bukrs,
      @UI:{ lineItem: [{ position: 30,importance: #HIGH }],
            identification: [{ position: 30,importance: #HIGH }],
            selectionField: [{ position: 30 }] }
      @UI.textArrangement: #TEXT_FIRST
      @Consumption.valueHelpDefinition: [{ entity : { name: 'C_PurchasingDocCategoryVH', element: 'PurchasingDocumentCategory' }}]
      @Search.defaultSearchElement: true      
      bstyp,
      @UI:{ lineItem: [{ position: 40,importance: #HIGH }],
            identification: [{ position: 40,importance: #HIGH }]}
      @Consumption.valueHelpDefinition: [{ entity : { name: 'C_PurchasingDocTypeVH', element: 'PurchasingDocumentType' }}]      
      bsart,
      @UI:{ lineItem: [{ position: 50,importance: #HIGH }],
            identification: [{ position: 50,importance: #HIGH }],
            selectionField: [{ position: 50 }] }
      @UI.textArrangement: #TEXT_FIRST
      @Consumption.valueHelpDefinition: [{ entity : { name: 'C_PurchasingDocStatusVH', element: 'PurchasingDocumentStatus' }}]
      @Search.defaultSearchElement: true       
      statu,
      @UI:{ lineItem: [{ position: 60,importance: #HIGH }],
            identification: [{ position: 60,importance: #HIGH }],
            selectionField: [{ position: 60 }] }
      @Consumption.valueHelpDefinition: [{ entity : { name: 'I_TripVendorVH', element: 'SoldToParty' }}]
      @Search.defaultSearchElement: true       
      lifnr,
      @UI:{ lineItem: [{ position: 70,importance: #HIGH,label:'Payment Terms' }],
            identification: [{ position: 70,importance: #HIGH,label:'Payment Terms' }]}    
      zterm,
      @UI:{ lineItem: [{ position: 80,importance: #HIGH }],
            identification: [{ position: 80,importance: #HIGH }],
            selectionField: [{ position: 80 }] }
      @Consumption.valueHelpDefinition: [{ entity : { name: 'C_PurchasingOrgValueHelp', element: 'PurchasingOrganization' }}]
      @Search.defaultSearchElement: true       
      ekorg,
      @UI:{ lineItem: [{ position: 90,importance: #HIGH }],
            identification: [{ position: 90,importance: #HIGH }],
            selectionField: [{ position: 90 }] }
      @Consumption.valueHelpDefinition: [{ entity : { name: 'C_PurchasingGroupValueHelp', element: 'PurchasingGroup' }}]
      @Search.defaultSearchElement: true       
      ekgrp,

      PoItm // Make association public

}
