/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package weatherjson;

/**
 *
 * @author Nitya Puspaceno
 */
import java.io.IOException;

public enum Source {
    COMB, FCST;

    public String toValue() {
        switch (this) {
            case COMB: return "comb";
            case FCST: return "fcst";
        }
        return null;
    }

    public static Source forValue(String value) throws IOException {
        if (value.equals("comb")) return COMB;
        if (value.equals("fcst")) return FCST;
        throw new IOException("Cannot deserialize Source");
    }
}