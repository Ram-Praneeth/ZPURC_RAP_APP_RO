@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Order Item Interface View'
define view entity ZI_PURC_ITM_R
  as select from ekpo
{
  key ebeln,
  key ebelp,
      matnr,
      bukrs,
      werks,
      lgort,
      matkl,
      idnlf,
      ktmng,
      @Semantics.quantity.unitOfMeasure: 'meins'
      menge,
      meins
}
