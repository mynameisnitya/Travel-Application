/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package randomjson;

/**
 *
 * @author Nitya Puspaceno
 */
public class Random {
    public String status;
    public long min;
    public long max;
    public long random;

    public String getStatus() { return status; }
    public void setStatus(String value) { this.status = value; }

    public long getMin() { return min; }
    public void setMin(long value) { this.min = value; }

    public long getMax() { return max; }
    public void setMax(long value) { this.max = value; }

    public long getRandom() { return random; }
    public void setRandom(long value) { this.random = value; }
}