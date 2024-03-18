window.onload = function() {
   let btn1 = document.getElementById("btn1");

    btn1.addEventListener('click', () => {
       // 1. XMLHttpRequest 객체 생성
       let xhr = new XMLHttpRequest();
       
       // 2. onreadystatechange에 콜백 함수 지정
       //   - 비동기 통신에 대한 응답 상태에 변경이 있을 경우 실행된다.
       /* onreadystatechange : 상태값이 바뀔때마다 실행됨. 대부분 총 4번 실행.(1,2,3,4) */
       xhr.onreadystatechange = function() {
         console.log(`readyState : ${xhr.readyState}`);
         /*
             readyState - 서버 응답 상태 확인
            1: 서버와의 연결이 된 상태
            2: 서버가 요청을 받은 상태 
            3: 서버가 요청을 처리하는 상태
            4: 서버가 요청에 대한 처리를 끝나고 응답을 준비하는 상태 
          
          */
               
         if (xhr.readyState === 4) {
            /*         
              status
               200 : 정상 작동
               404 : Not Found
               500 : Internal Server Error            
            (https://developer.mozilla.org/ko/docs/Web/HTTP/Status)
            */
            
            if(xhr.status === 200) {
               console.log(xhr.responseText);
              //responseText: 서버에서 응답한 데이터를 담고있는 속성
              
              document.getElementById('p1').innerHTML = xhr.responseText;
            }
         } 
      };
   
      // 3. open('요청 방식', 'URL', 비동기 여부) 메소드 호출 (비동기 통신여부 : 기본값 true)
      //   - 서버와 통신에 필요한 정보를 입력한다.
      xhr.open('GET', '/04_AJAX/jsAjax.do?name=홍길동&age=30')
      
      // 4. send() 메소드 호출
      //   - 위 정보를 참조해서 서버에 요청을 한다.
      xhr.send();
    });
    
    let btn2 = document.getElementById('btn2');
    
    btn2.addEventListener('click', () => {
      let xhr = new XMLHttpRequest();
      
      xhr.onreadystatechange = () => {
         if (xhr.readyState === 4 && xhr.status === 200) {
            console.log(xhr.responseText);
            
            document.getElementById('p2').innerHTML = xhr.responseText;
         }
      };
      
      xhr.open('POST', '/04_AJAX/jsAjax.do');
      //GET 방식과 다르게 필요한 정보들은 send 메소드에 적어줘야한다. (차이점 적기!)
      
      // POST 요청의 경우 send() 호출 전에 아래와 같이 요청 헤더를 추가해야 한다.
      xhr.setRequestHeader(
//         'Content-Type', 'application/x-www-form-urlencoded'

         'Content-Type', 'application/x-www-form-urlencoded;charset=UTF-8'
         // 여기서 charset=UTF-8 해주면 POST 하기 전 인코딩을 안해도 된다! 
         
         );
      
      xhr.send('name=홍길동&age=30');
      
   });
};

// 제이쿼리 시작
$(document).ready(function () {
   $('#btn3').on('click', function () {
      let input = $('#input').val();
      
      $.ajax({
         // 전송 방식
         type: 'GET',
         // 요청 URL
         url : '/04_AJAX/jqAjax.do',
         // 요청 시 전달할 파라미터 설정
         data: {   // 데이터들도 객체시켜서 전달...? 
            input   // input: intput 
         },
         // AJAX 통신 성공 시 실행될 콜백 함수 
         success: function(data) {
            console.log(data);
            
            $('#output1').val(data);
         },
         // AJAX 통신 실패 시 실행될 콜백 함수
         error: function(error) {
            console.log(error);
         }
         
      });
   });
   
   $('#btn4').on('click', function () {
	   let userName = $('#userName').val();
	   let userAge = $('#userAge').val();
	   
	   $.ajax({
		   type: 'POST',
		   url : '/04_AJAX/jqAjax.do',
		   data:{
			   userName, //userName : userName,
			   userAge //userAge : userAge
		   },
		   success: (data) => {
			   console.log(data);
			   
			   $('#output2').val(data);
		   },
		   error: (error) => {
			   console.log(`status: ${error.status}`);
		   }
	   });
	});
	
	$('#btn5').on('click', () =>{
		let userNo = $('#userNo').val();
		
		$.ajax({
			type:'GET',
			url: '/04_AJAX/jsonAjax.do',
			data:{
				userNo //userNo: userNo
			},
			success: (obj) =>{
	            let result = '';
	            
	            console.log(obj);
	            
	            if (obj !== null) {
	               result = `회원 번호 : ${obj.no}<br>
	               			 회원 이름 : ${obj.name}<br>
	               			 회원 나이 : ${obj.age}<br>
	               			 회원 성별 : ${obj.gender}`;
	            } else {
	               result = '사용자 정보가 없습니다.';
	            }
	            
	            $('#p3').html(result);
			},
			error: (error) =>{
				console.log(`status: ${error.status}`);
			}
		});
	});
	
	$('#btn6').on('click', () =>{
		let gender = $('input[name=gender]:checked').val();
		
		$.ajax({
			type: 'GET',
			url: '/04_AJAX/jsonArrayAjax.do',
			dataType: 'json', //응답 데이터 형식(생략해도 상관없다)
			data: {
				gender // gender: gender
			},
			success: (list) =>{
				let result = '';
				/*let{no, name, age,gender} = element;*/
				
	            console.log(list);
	            
	            list.forEach((element) => {
					result += `회원 번호 : ${element.no}<br>
	               			 회원 이름 : ${element.name}<br>
	               			 회원 나이 : ${element.age}<br>
	               			 회원 성별 : ${element.gender}
	               			 <br><br>`;
				});
				$('#p4').html(result);
			},
			error: (error) =>{
				console.log(error);
			}
			
		});
	});
});