# 지식인 질문 댓글란 자동 홍보프로그램

## 1. Qt Designer
<img src="image\auto_PR_1.png" width="300" height="200">
<img src="image\auto_PR_2.png" width="300" height="200">
- Qt Designer로 프로그램 UI를 만든 후 버튼 함수기능 추가

## 2. ui -> py 파일로 변환

- 위에서 생성된 ui 파일을 py파일로 변환

## 3. starter.py 생성
- cmd 실행 : 시작키를 누르고 CMD를 입력하여 명령 프롬프트를 실행합니다.
- ui파일이 있는 곳으로 경로 재설정
    - cd ui파일이 저장된 경로 입력
    - 예시 : cd C:/python/_uiFiles
- 입력 : python -m PyQt5.uic.pyuic -x main.ui -o main_cmd.py
    - ui 파일 이름과 변환할 파일 이름을 확인하세요.


## 4. start() 함수에 프로그램 알고리즘 작성
<img src="image\auto_PR_3.png" width="300" height="200">

```
def start(self):
    def set_chrome_driver():
        chrome_options = webdriver.ChromeOptions()
        driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=chrome_options)
        # 크롤링 방지 설정을 undefinded로 변경
        driver.execute_cdp_cmd("Page.addScriptToEvaluateOnNewDocument", {
            "source": """ Object.defineProperty(navigator, 'webdriver', { get: () => undefined }) """})
        return driver

    try:
        shutil.rmtree(r"c:\chrometemp")  # 쿠키 / 캐쉬파일 삭제
    except FileNotFoundError:
        pass

    subprocess.Popen(
        r'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe --remote-debugging-port=9222 --user-data-dir="C:\chrometemp"')  # 디버거 크롬 구동
    option = Options()
    option.add_experimental_option("debuggerAddress", "127.0.0.1:9222")

    chrome_ver = chromedriver_autoinstaller.get_chrome_version().split('.')[0]
    try:
        driver = webdriver.Chrome(f'./{chrome_ver}/chromedriver.exe', options=option)
    except:
        chromedriver_autoinstaller.install(True)
        driver = webdriver.Chrome(f'./{chrome_ver}/chromedriver.exe', options=option)
    driver.implicitly_wait(10)

    get_id = self.lineEdit.text()
    get_pw = self.lineEdit_2.text()
    search = self.lineEdit_3.text()
    user_input_text = self.textEdit.toPlainText()
    start_page = self.lineEdit_4.text()
    end_page = self.lineEdit_5.text()

    driver = set_chrome_driver()
    driver.get('https://www.naver.com')
    driver.find_element(By.XPATH, '//*[@id="account"]/a').click()
    driver.find_element(By.ID, 'id').click()
    pyperclip.copy(get_id)
    pyautogui.hotkey('ctrl','v')
    time.sleep(2)

    driver.find_element(By.ID, 'pw').click()
    pyperclip.copy(get_pw)
    pyautogui.hotkey('ctrl', 'v')
    time.sleep(2)

    driver.find_element(By.XPATH, '//*[@id="log.login"]').click()

    driver.get("https://kin.naver.com/")
    driver.find_element(By.XPATH, '//*[@id="nx_query"]').send_keys(search)
    driver.find_element(By.XPATH, '//*[@id="topSearch"]/fieldset/div/a[2]').click()
    time.sleep(2)

    start_page = int(start_page)
    end_page = int(end_page)

    number = 0
    for i in range(start_page, end_page+1):
        time.sleep(2)
        driver.get("https://kin.naver.com/search/list.naver?query=%EB%B6%80%EC%97%85&page={}".format(i))

        html = driver.page_source
        soup = BeautifulSoup(html, 'html.parser')
        time.sleep(2)
        link = soup.find_all('a','_nclicks:kin.txt _searchListTitleAnchor')

        url_list = []
        for i in link :
            driver.get(i.get('href'))
            time.sleep(2)
            driver.find_element(By.XPATH, '//*[@id="cmtstr_0"]/i').click()
            time.sleep(2)
            driver.find_element(By.XPATH, '//*[@title="댓글 입력"]').click()
            time.sleep(2)
            pyperclip.copy(user_input_text)
            pyautogui.hotkey('ctrl', 'v')
            time.sleep(2)
            driver.find_element(By.XPATH, '//*[@id="questionCommentListArea"]/div[1]/fieldset/div[2]/button').click()
            time.sleep(2)
            number += 1
            self.textBrowser.append(f"댓글홍보작업중 : {number}")

    driver.quit()
```

### 1. 네이버 로그인
### 2. 지식인 키워드 검색
### 3. 질문 link 접속 후 댓글란 작성  

# 
- 댓글은 지식인 등급에 따라 하루에 작성가능한 횟수가 정해져있었음 (평민, 50개)
- 댓글이 아닌 질문 답변하기로 새로 만들어볼 것.
