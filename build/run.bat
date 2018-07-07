:: for /f "delims=" %%x in (.env) do (set "%%x")
for /f "delims=" %%x in (.env) do (echo "%%x")


start java -cp prostokvashino-acceptance.jar \
    -Dwebdriver.chrome.driver=/usr/local/bin/chromedriver \
    -Dproject.host=https://prostokvashino-v2.demo.isobar.ru/ \
    com.adwatch.prostokvashino.Application com.adwatch.prostokvashino.scenario.QuizScenario