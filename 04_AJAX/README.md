## AJAX(Asynchronous JavaScript and XML)
### 1. AJAX(Asynchronous JavaScript and XML)
* AJAX는 Asynchronous JavaScript and XML의 약자로 JavaScript를 이용하여 비동기식으로 클라이언트와 서버가 데이터(XML)를 주고받는(통신) 방식이다.
* 주고받는 데이터 형식은 XML뿐만 아니라 Text, HTML, JSON, CSV 등 다양한 형식의 데이터를 주고받을 수 있다.
* 동기식 데이터 통신이란 클라이언트가 서버로 데이터를 요청하면 응답이 올 때까지 다른 작업은 대기하는 것을 말한다.
* 비동기식 데이터 통신이란 클라이언트가 서버로 데이터 요청 후 응답을 기다리지 않고 다른 작업의 수행이 가능하고 추후 응답이 오면 응답에 관련된 작업 진행하는 것을 말한다.
### 2. 자바스크립트(JavaScript)에서 AJAX
* 브라우저의 내장 객체인 XMLHttpRequest를 이용하여 비동기식으로 서버와 데이터를 주고받는다.
  ```javascript
  // 1. XMLHttpRequest 객체 생성
  let xhr = new XMLHttpRequest();

  // 2. onreadystatechange에 콜백 함수 지정
  xhr.onreadystatechange = function () {

    // 서버 응답 상태 확인
    if(xhr.readyState === 4) {
      // Http 응답 상태 확인
      if(xhr.status === 200) {
        // 서버 응답에 대한 처리 코드 작성
      }
    }
  };

  // 3. open('요청 방식', 'URL', 비동기 여부) 메소드 호출
  xhr.open('GET', '/ajaxTest', true);

  // 4. send() 메소드 호출
  xhr.send();
  ```
### 3. 제이쿼리(jQuery)에서 AJAX
* jQuery에 내장되어 있는 ajax 함수 이용하여 비동기식으로 서버와 데이터를 주고받는다.
* 자바스크립트를 사용하는 방식보다 직관적이며 코드 길이가 감소하고 별도의 크로스 브라우저 처리를 jQuery가 자동으로 해결해 준다.
  ```javascript
  $.ajax({
    // 요청 방식(GET, POST)
    type: 'GET',
    // URL
    url: '/ajaxTest',
    // AJAX 통신 성공 시 실행될 콜백 함수
    success: function (data) {
        // 서버 응답에 대한 처리 코드 작성
    }
  });
  ```
## JSON(JavaScript Object Notation)
### 1. JSON(JavaScript Object Notation)
* JSON은 자바스크립트 객체를 만들 때 사용하면 표현법으로 구조화된 데이터를 표현하는 표기법이다.
  ```javascript
  "{name: '홍길동', age: 20, hobby: ['축구', '농구', '야구']}"
  ```
* 비동기 통신에서 객체 타입의 데이터 전송 시 XML 대비 용량이 작고 속도가 빠르다.
### 2. GSON(Google JSON)
* Google에서 만든 오픈 라이브러리로 자바 객체와 JSON을 서로 쉽게 변환할 수 있는 메소드들을 제공한다.
  ```java
  // 자바 객체를 JSON 문자열로 변환
  String json = new Gson().toJson(new Member("홍길동", 20));

  // JSON 문자열을 자바 객체로 변환
  Member member = new Gson().fromJson("{\"name\": \"홍길동\", \"age\": 20}", Member.class);
  ```
