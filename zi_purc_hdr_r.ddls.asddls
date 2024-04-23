@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Order Header Interface View'
define view entity ZI_PURC_HDR_R
  as select from ekko as PoHdr
{
  key ebeln,
      bukrs,
      bstyp,
      bsart,
      statu,
      lifnr,
      zterm,
      ekorg,
      ekgrp
}
