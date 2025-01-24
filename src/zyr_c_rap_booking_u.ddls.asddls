@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Booking BO projection view'
@Search.searchable: true
@Metadata.allowExtensions: true
define view entity ZYR_C_RAP_BOOKING_U
  as projection on ZYR_I_RAP_BOOKING_U
{
      @Search.defaultSearchElement: true
  key TravelId,
      @Search.defaultSearchElement: true
  key BookingId,
      BookingDate,
      @Consumption.valueHelpDefinition: [ { entity: { name:     '/DMO/I_Customer',
                                                        element:     'CustomerID' } } ]
      CustomerId,
      @Consumption.valueHelpDefinition: [ { entity: { name:     '/DMO/I_Carrier',
                                                   element:     'AirlineID' } } ]
      CarrierId,
      @Consumption.valueHelpDefinition: [ { entity: { name:    '/DMO/I_Flight',
                                                     element: 'ConnectionID' },
                                           additionalBinding: [ { localElement: 'FlightDate',
                                                                  element:      'FlightDate',
                                                                  usage: #RESULT },
                                                                { localElement: 'CarrierID',
                                                                       element: 'AirlineID',
                                                                         usage: #RESULT },
                                                                { localElement: 'FlightPrice',
                                                                       element: 'Price',
                                                                         usage: #RESULT },
                                                                { localElement: 'CurrencyCode',
                                                                       element: 'CurrencyCode',
                                                                         usage: #RESULT } ]
                                           } ]
      ConnectionId,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      @Consumption.valueHelpDefinition: [ {entity: { name:    'I_Currency',
                                                      element: 'Currency' } } ]
      CurrencyCode,
      /* Associations */
      _Carrier,
      _Connection,
      _Customer,
      _Flight,
      _Travel : redirected to parent ZYR_C_RAP_TRAVEL_U
}
