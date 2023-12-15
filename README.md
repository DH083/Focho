# Focho
강남구 식당 사이트
# 🍳 프로젝트 소개
프로젝트입니다.
# 📅 개발 기간
2023.11. ~ 2023.11.29
# 🧑‍🤝‍🧑 팀원
팀원1: <br>
팀원2: <br>
팀원3: <br>
팀원4: 이도희(본인) - 백엔드, DB 설계, ERD 제작, 유스케이스 제작, JSP 변환, 전페이지 DB
# ⚙️ 개발 환경
![IntelliJ IDEA](https://img.shields.io/badge/IntelliJIDEA-000000.svg?style=for-the-badge&logo=intellij-idea&logoColor=white)
![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)
![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)
![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)
![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=openjdk&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)

# 📋 기능 소개
<h3>✔️ 회원가입</h3>
- 아이디, 닉네임 중복을 막기 위하여 ajax를 사용하여 사용자가 글자 입력시 사용 가능한 아이디, 닉네임인지 메세지 띄워줌.
- 비밀번호, 이메일 형식 확인
- 회원가입 버튼을 눌렀을 때 공란이 있거나 유효성검사가 완료되지 않은 칸이 있다면 해당 칸으로 이동. 회원가입 취소.

![Join](https://github.com/DH083/Focho/assets/147012079/9a3dc2c8-4790-4eb9-a307-e0769a737a75)

❗ 공란이 있을시<br>
<img width="500" alt="Join_null" src="https://github.com/DH083/Focho/assets/147012079/8d22d95b-677c-4df8-a525-64c178180ba5">

❗ 아이디, 닉네임 중복시<br>
<img width="500" alt="Join_overlap" src="https://github.com/DH083/Focho/assets/147012079/b8f9db96-f9da-43fb-95da-f5ab06e2b7a5">

❗ 올바른 양식<br>
<img width="500" alt="Join_ok" src="https://github.com/DH083/Focho/assets/147012079/cfd8924a-8ee4-4070-aab9-ce1a46564af3">
<hr>
<h3>✔️ 로그인</h3>
- DB값 검증<br>
- 아이디 저장을 체크할시 쿠키(cookie)에 유저 아이디 저장<br>
- 로그인 버튼을 눌렀을 때 공란이 있거나 유저 정보가 일치하지 않을시 경고메세지 띄워줌. 해당칸으로 이동.<br>
- 로그인 성공시 session 생성 및 메인페이지 이동<br>

![Login](https://github.com/DH083/Focho/assets/147012079/21de8b1e-ece8-46da-8cb6-b4ef2519a292)

❗ 공란이 있을시<br>
<img width="150" alt="Login_idNull" src="https://github.com/DH083/Focho/assets/147012079/c47eb424-1fe5-4306-ad23-206b651e0980"><br>
<img width="250" alt="Login_pwNull" src="https://github.com/DH083/Focho/assets/147012079/2c7d94ab-64ad-4a3e-b1f3-5290c38f54c0">

❗ DB값이 일치하지 않을시<br>
<img width="300" alt="Login_userNull" src="https://github.com/DH083/Focho/assets/147012079/12c65581-f1e3-48db-904c-b6b15ca761b4">
<hr>
<h3>✔️ 메인페이지</h3>
- 유저 로그인 상태 확인. 비로그인 유저라면 header 우측에 로그인과 회원가입, 로그인 유저라면 header 우측에 로그아웃, 마이페이지.<br>
- 비로그인 유저라면 찜 기능 사용 불가, 로그인 유저라면 사용 가능. 찜목록에 추가된 가게라면 붉은 하트, 목록에 없다면 빈 하트.<br>
- DB에서 tag 테이블 중 랜덤으로 들고와서 태그에 해당하는 가게 리스트 띄워줌<br>
- 페이지 우측하단에 룰렛과 페이지 상단 이동 버튼<br>

![Main](https://github.com/DH083/Focho/assets/147012079/86144701-525c-47ff-8ad5-764a24a453d5)

❗ 가게에 마우스 호버시<br>
❗ 하트 클릭시 찜 목록에 추가 및 삭제<br>
<img width="300" alt="Main_hover" src="https://github.com/DH083/Focho/assets/147012079/0d26d445-d39b-41c8-8b00-5a3c92a95b54">

❗ 룰렛<br>
<img width="300" alt="Main_룰렛" src="https://github.com/DH083/Focho/assets/147012079/5a4ed814-5d21-43c4-a959-5b7ea0b49d30">
<hr>
<h3>분류페이지</h3>
- nav에 메뉴 분류 선택시 선택한 분류의 가게 리스트.<br>
- 비로그인 유저라면 찜 기능 사용 불가, 로그인 유저라면 사용 가능. 찜목록에 추가된 가게라면 붉은 하트, 목록에 없다면 빈 하트.<br>

![Product](https://github.com/DH083/Focho/assets/147012079/cb8fcbbe-5eb4-44e7-bc4c-91d8ffac70a8)
<hr>
<h3>검색페이지</h3>
- 검색창에 작성한 키워드에 해당하는 가게 리스트.<br>
- 가게 분류 기준은 가게명, 메뉴명, 분류명, 태그명 중 키워드가 포함되어 있는 가게<br>
- 왼쪽 빠른 검색을 이용해 빠른 키워드 검색. 스크롤시 페이지 왼쪽에서 따라다님<br>
- 비로그인 유저라면 찜 기능 사용 불가, 로그인 유저라면 사용 가능. 찜목록에 추가된 가게라면 붉은 하트, 목록에 없다면 빈 하트.<br>

![Search](https://github.com/DH083/Focho/assets/147012079/3032066d-035d-4233-b148-83c26a24b384)

❗ 키워드에 해당하는 가게가 없을시<br>
<img width="500" alt="keyword_no" src="https://github.com/DH083/Focho/assets/147012079/1d2aa4e9-8da6-4671-acb2-fc8006a82b26">
<hr>
<h3>상세페이지</h3>

<hr>
<h3>마이페이지</h3>
<hr>
<h3>회원정보수정페이지</h3>
