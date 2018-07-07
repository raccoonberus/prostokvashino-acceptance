package com.adwatch.prostokvashino;

import org.junit.runner.JUnitCore;
import org.junit.runner.notification.Failure;

import java.util.List;

public class Application {

    public static void main(String[] args) throws ClassNotFoundException {
        JUnitCore junit = new JUnitCore();
        for (String className : args) {
            List<Failure> failures = junit.run(Class.forName(className)).getFailures();
            for (Failure failure : failures) {
                System.err.println(failure.getTrace());
            }
        }
    }

}
