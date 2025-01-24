@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel BO projection view'
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZYR_C_RAP_TRAVEL_U
  as projection on ZYR_I_RAP_TRAVEL_U
{
  key TravelId,
      @Consumption.valueHelpDefinition: [ { entity: { name: '/DMO/I_Agency', element: 'AgencyID' } } ]
      @Search.defaultSearchElement: true
      AgencyId,
      @Consumption.valueHelpDefinition: [ { entity: { name: '/DMO/I_Customer', element: 'CustomerID' } } ]
      @Search.defaultSearchElement: true
      CustomerId,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_Currency', element: 'Currency' } } ]
      CurrencyCode,
      Description,
      Status,
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat,

      /* Associations */
      _Agency,
      _Booking : redirected to composition child ZYR_C_RAP_BOOKING_U,
      _Currency,
      _Customer
}
