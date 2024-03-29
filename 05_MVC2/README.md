## MVC(Model-View-Controller) 패턴
### 1. MVC(Model-View-Controller) 패턴
* MVC 패턴은 디자인 패턴 중 하나로 데이터 처리(Model), 클라이언트가 보는 페이지(View), 그리고 중간에서 이들을 제어하는 컨트롤러(Controller)로 역할을 분담해 설계하는 디자인 패턴을 말한다.
* MVC 패턴을 활용하게 되면 각각 정해진 역할에만 집중하기 때문에 유지 보수 및 확장성이 용이한 장점이 있지만 설계하는 시간과 개발 시간이 증가하는 단점이 있다.
### 2. Model
* 비즈니스 영역의 로직 처리와 데이터 처리 부분을 담당한다.
  * VO(Value Object), DTO(Data Transfer Object)는 계층 간 데이터 교환을 위한 용도의 객체이다.
  * DAO(Data Access Object)는 Data에 접근하기 위한 용도의 객체이다.
  * Service는 전달할 데이터들을 가공하고 비즈니스 로직을 처리하기 위한 용도의 객체이다.
### 3. View
* 사용자 인터페이스 부분을 담당한다.
* 주로 모델(Model)로부터 전달받은 데이터들을 사용자에게 보여주는 역할을 한다.
### 4. Controller
* 뷰(View)와 모델(Model), 모델(Model)과 뷰(View)를 제어하는 부분을 담당한다.
* 뷰(View)를 통해 사용자가 입력한 값을 전달받거나 모델(Model)로부터 처리된 데이터를 뷰(View)로 전달하는 역할을 한다.
