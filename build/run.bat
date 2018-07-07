for /f "delims=" %%x in (env) do (set "%%x")

start java -cp prostokvashino-acceptance.jar -Dwebdriver.chrome.driver=chromedriver.exe -Dproject.host=https://prostokvashino-v2.demo.isobar.ru/ com.adwatch.prostokvashino.Application com.adwatch.prostokvashino.scenario.QuizScenario

set "dummy="
set /p DUMMY=Hit ENTER to continue...
if defined dummy (echo not just ENTER was pressed) else (echo just ENTER was pressed)
