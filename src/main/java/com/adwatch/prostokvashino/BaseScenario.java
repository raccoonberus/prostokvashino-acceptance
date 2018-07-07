package com.adwatch.prostokvashino;

import com.goforbroke1006.testing.BoostedWebDriver;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.openqa.selenium.By;
import org.openqa.selenium.chrome.ChromeDriver;

public class BaseScenario {

    protected static BoostedWebDriver driver;

    protected static String accUsername;
    protected static String accPassword;

    @BeforeClass
    public static void setUpClass() {
        String projectHost = System.getProperty("project.host");

        if (null == projectHost) {
            System.err.println("You should define property \"project.host\"");
            System.exit(1);
        }

        driver = new BoostedWebDriver(
                new ChromeDriver(),
                projectHost);

        accUsername = System.getenv("PROSTOKVASHINO_USERNAME");
        accPassword = System.getenv("PROSTOKVASHINO_PASSWORD");

        if (null == accUsername || null == accPassword) {
            System.err.println("You should define env vars " +
                    "\"PROSTOKVASHINO_USERNAME\" and \"PROSTOKVASHINO_PASSWORD\"");
            System.exit(1);
            driver.quit();
        }
    }

    @AfterClass
    public static void tearDownClass() {
        driver.quit();
    }

    protected static void authorize() throws InterruptedException {
        driver.findElement(By.cssSelector("a.js_call_login")).click();
        Thread.sleep(2000);

        driver.findElement(By.id("credential")).sendKeys(accUsername);
        driver.findElement(By.id("password")).sendKeys(accPassword);
        driver.findElement(By.id("logonSubmitBtn")).click();

        Thread.sleep(6000);

        assert null != driver.findElement(By.partialLinkText("Моя страница"));
    }
}
