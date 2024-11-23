package com.kgly;

import javax.jws.WebService;

@WebService(endpointInterface = "com.kgly.KilometerLightYearI") // Link to the interface
public class KilometerLightYear implements KilometerLightYearI {

    private static final double LIGHT_YEAR_TO_KM_FACTOR = 9.4607e12; // 1 LightYear = ~9.4607 trillion kilometers

    @Override
    public double convert(String fromUnit, String toUnit, double value) {
        if (fromUnit.equals("Kilometer") && toUnit.equals("LightYear")) {
            return value / LIGHT_YEAR_TO_KM_FACTOR; // Convert KM to Light Year
        } else if (fromUnit.equals("LightYear") && toUnit.equals("Kilometer")) {
            return value * LIGHT_YEAR_TO_KM_FACTOR; // Convert Light Year to KM
        } else {
            return value; // If units are the same
        }
    }
}