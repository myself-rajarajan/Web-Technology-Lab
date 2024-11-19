package com.rajarajan2;

import javax.jws.WebService;

@WebService(endpointInterface = "com.rajarajan2.CCI")  // Link to the interface CCI
public class CC1 implements CCI {

    @Override
    public double convertCurrency(String fromCurrency, String toCurrency, double amount) {
        // Simple conversion logic (mocked with a static conversion rate)
        double conversionRate = 1.2; // Mock conversion rate for demonstration
        if (fromCurrency.equals("USD") && toCurrency.equals("EUR")) {
            return amount * conversionRate;
        } else if (fromCurrency.equals("EUR") && toCurrency.equals("USD")) {
            return amount / conversionRate;
        } else {
            return amount;  // If currencies are the same
        }
    }
}
