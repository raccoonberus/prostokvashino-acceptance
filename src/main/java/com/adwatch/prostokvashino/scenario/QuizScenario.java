package com.adwatch.prostokvashino.scenario;

import com.adwatch.prostokvashino.BaseScenario;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.ElementNotVisibleException;

import java.util.concurrent.ThreadLocalRandom;

public class QuizScenario extends BaseScenario {

    @Test
    public void test__login_and_finishQuiz() throws InterruptedException {
        driver.getUri("/");
        authorize();
        driver.getUri("/quiz/");

        driver.findElement(By.cssSelector(".popup.popup_stage.is-open .popup__close")).click();
        Thread.sleep(2 * 1000);

        driver.findElement(By.cssSelector(".cookies-warning__close-btn")).click();
        Thread.sleep(2 * 1000);

        driver.findElement(By.cssSelector(".js-quiz-start")).click();
        Thread.sleep(2 * 1000);

        driver.findElement(By.cssSelector(".js-start-milk-test")).click();
        Thread.sleep(2 * 1000);

        try {
            while (null != driver.findElement(By.cssSelector(".js-timer"))) {
                int randomNum = ThreadLocalRandom.current().nextInt(1, 1000) % 2 + 1;
                driver.findElement(By.cssSelector(
                        String.format(".js-answer:nth-child(%d)", randomNum)
                )).click();

                Thread.sleep(2 * 1000);
            }
        } catch (ElementNotVisibleException e) {
            System.out.println("Test finished");
        }

        driver.getUri("/quiz/");
    }

}
