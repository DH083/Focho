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
<b>회원가입</b>
- 아이디, 닉네임 중복을 막기 위하여 ajax를 사용하여 사용자가 글자 입력시 사용 가능한 아이디, 닉네임인지 메세지 띄워줌.
- 비밀번호, 이메일 형식 확인
- 회원가입 버튼을 눌렀을 때 공란이 있거나 유효성검사가 완료되지 않은 칸이 있다면 해당 칸으로 이동. 회원가입 취소.

![Join](https://github.com/DH083/Focho/assets/147012079/9a3dc2c8-4790-4eb9-a307-e0769a737a75)

! 공란이 있을시<br>
<img width="500" alt="Join_null" src="https://github.com/DH083/Focho/assets/147012079/8d22d95b-677c-4df8-a525-64c178180ba5">

! 아이디, 닉네임 중복시<br>
<img width="500" alt="Join_overlap" src="https://github.com/DH083/Focho/assets/147012079/b8f9db96-f9da-43fb-95da-f5ab06e2b7a5">

! 올바른 양식<br>
<img width="500" alt="Join_ok" src="https://github.com/DH083/Focho/assets/147012079/cfd8924a-8ee4-4070-aab9-ce1a46564af3">

<b>로그인</b>
- DB값 검증
- 아이디 저장을 체크할시 쿠키(cookie)에 유저 아이디 저장
- 로그인 버튼을 눌렀을 때 공란이 있거나 유저 정보가 일치하지 않을시 경고메세지 띄워줌. 해당칸으로 이동.
- 로그인 성공시 session 생성 및 메인페이지 이동
![Login](https://github.com/DH083/Focho/assets/147012079/21de8b1e-ece8-46da-8cb6-b4ef2519a292)

! 공란이 있을시<br>
<img width="150" alt="Login_idNull" src="https://github.com/DH083/Focho/assets/147012079/c47eb424-1fe5-4306-ad23-206b651e0980"><br>
<img width="250" alt="Login_pwNull" src="https://github.com/DH083/Focho/assets/147012079/2c7d94ab-64ad-4a3e-b1f3-5290c38f54c0">

! DB값이 일치하지 않을시<br>
<img width="300" alt="Login_userNull" src="https://github.com/DH083/Focho/assets/147012079/12c65581-f1e3-48db-904c-b6b15ca761b4">

<b>메인페이지</b>
- 유저 로그인 확인
- 랜덤 태그
- 룰렛
![Main](https://github.com/DH083/Focho/assets/147012079/c28a07bd-4559-45e7-8d51-01da008fbd47)

! 가게에 마우스 호버시<br>
<img width="146" alt="Main_hover" src="https://github.com/DH083/Focho/assets/147012079/0d26d445-d39b-41c8-8b00-5a3c92a95b54">

! 룰렛<br>
<img width="283" alt="Main_룰렛" src="https://github.com/DH083/Focho/assets/147012079/5a4ed814-5d21-43c4-a959-5b7ea0b49d30">

<b>분류페이지</b>

<b>검색페이지</b>

<b>상세페이지</b>

<b>마이페이지</b>

<b>회원정보수정페이지</b>
