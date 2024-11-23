package com.kgly;

import javax.jws.WebService;
import javax.jws.WebMethod;

@WebService
public interface KilometerLightYearI {
    @WebMethod
    double convert(String fromUnit, String toUnit, double value);
}