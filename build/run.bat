

powershell -Command "(New-Object Net.WebClient).DownloadFile('https://chromedriver.storage.googleapis.com/2.38/chromedriver_win32.zip', 'chromedriver_win32.zip')"
:: powershell -Command "Invoke-WebRequest http://www.example.com/package.zip -OutFile package.zip"

powershell -nologo -noprofile -command "& { $shell = New-Object -COM Shell.Application; $target = $shell.NameSpace('C:\extractToThisDirectory'); $zip = $shell.NameSpace('C:\extractThis.zip'); $target.CopyHere($zip.Items(), 16); }"

:: for /f "delims=" %%x in (.env) do (set "%%x")
for /f "delims=" %%x in (.env) do (echo "%%x")

start java -cp prostokvashino-acceptance.jar \
    -Dwebdriver.chrome.driver=/usr/local/bin/chromedriver \
    -Dproject.host=https://prostokvashino-v2.demo.isobar.ru/ \
    com.adwatch.prostokvashino.Application \
    com.adwatch.prostokvashino.scenario.QuizScenario