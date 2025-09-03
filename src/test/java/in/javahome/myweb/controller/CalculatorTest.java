package in.javahome.myweb.controller;

import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class CalculatorTest {
    Calculator cal = new Calculator();

    @Test
    public void testAdd() {
        assertEquals(30, cal.add(10, 20));
    }

    @Test
    public void testMultiply() {
        assertEquals(200, cal.multiply(10, 20));
    }
}
