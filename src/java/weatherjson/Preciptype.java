/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package weatherjson;

import java.io.IOException;

/**
 *
 * @author Nitya Puspaceno
 */
public enum Preciptype {
    RAIN, SNOW;

    public String toValue() {
        switch (this) {
            case RAIN: return "rain";
            case SNOW: return "snow";
        }
        return null;
    }

    public static Preciptype forValue(String value) throws IOException {
        if (value.equals("rain")) return RAIN;
        if (value.equals("snow")) return SNOW;
        throw new IOException("Cannot deserialize Preciptype");
    }
}

