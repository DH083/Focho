# Focho
식당 소개 사이트
# 🍳 프로젝트 소개
강남의 식당을 소개하는 프로젝트입니다.
# 📅 개발 기간
2023.11. ~ 2023.11.29
# 🧑‍🤝‍🧑 팀원
팀원1: 성준혁 - 프론트, 팀장, 헤더&푸터, 검색페이지, 로그인페이지, 마이페이지, 데이터 수집, ppt제작<br>
팀원2: 송해성 - 프론트, 메인페이지, 회원가입페이지, 회원정보수정페이지, 데이터 수집<br>
팀원3: 김민기 - 프론트, 상세페이지, 분류페이지, 데이터 수집, 일정 정리 및 기록<br>
팀원4: <b>이도희(본인)</b> - 백엔드, DB 설계, ERD 제작, 유스케이스 제작, JSP 변환, 전페이지 DB
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

- 아이디, 닉네임 중복을 막기 위하여 ajax를 사용하여 사용자가 글자 입력시 사용 가능한 아이디, 닉네임인지 메세지 띄워줌<br>
- 비밀번호, 이메일 형식 확인<br>
- 회원가입 버튼을 눌렀을 때 공란이 있거나 유효성검사가 완료되지 않은 칸이 있다면 해당 칸으로 이동. 회원가입 취소<br>
- 공란이 없거나, 모든 유효성검사가 완료되었다면 DB에 회원 추가<br>
<br>

![Join](https://github.com/DH083/Focho/assets/147012079/9a3dc2c8-4790-4eb9-a307-e0769a737a75)

<h5>❗ 공란이 있을시</h5><br>
<img width="500" alt="Join_null" src="https://github.com/DH083/Focho/assets/147012079/8d22d95b-677c-4df8-a525-64c178180ba5">

<h5>❗ 아이디, 닉네임 중복시</h5><br>
<img width="500" alt="Join_overlap" src="https://github.com/DH083/Focho/assets/147012079/b8f9db96-f9da-43fb-95da-f5ab06e2b7a5">

<h5>❗ 올바른 양식</h5><br>
<img width="500" alt="Join_ok" src="https://github.com/DH083/Focho/assets/147012079/cfd8924a-8ee4-4070-aab9-ce1a46564af3">
<hr>
<h3>✔️ 로그인</h3>

- DB값 검증<br>
- 아이디 저장을 체크할시 쿠키(cookie)에 유저 아이디 저장<br>
- 로그인 버튼을 눌렀을 때 공란이 있거나 유저 정보가 일치하지 않을시 경고메세지 띄워줌. 해당칸으로 이동.<br>
- 로그인 성공시 session 생성 및 메인페이지 이동<br>
<br>

![Login](https://github.com/DH083/Focho/assets/147012079/21de8b1e-ece8-46da-8cb6-b4ef2519a292)

<h5>❗ 공란이 있을시</h5><br>
<img width="150" alt="Login_idNull" src="https://github.com/DH083/Focho/assets/147012079/c47eb424-1fe5-4306-ad23-206b651e0980"><br>
<img width="250" alt="Login_pwNull" src="https://github.com/DH083/Focho/assets/147012079/2c7d94ab-64ad-4a3e-b1f3-5290c38f54c0">

<h5>❗ DB값이 일치하지 않을시</h5><br>
<img width="300" alt="Login_userNull" src="https://github.com/DH083/Focho/assets/147012079/12c65581-f1e3-48db-904c-b6b15ca761b4">
<hr>
<h3>✔️ 메인페이지</h3>

- 유저 로그인 상태 확인. 비로그인 유저라면 header 우측에 로그인과 회원가입, 로그인 유저라면 header 우측에 로그아웃, 마이페이지<br>
- 비로그인 유저라면 찜 기능 사용 불가, 로그인 유저라면 사용 가능. 찜목록에 추가된 가게라면 붉은 하트, 목록에 없다면 빈 하트<br>
- DB에서 tag 테이블 중 랜덤으로 들고와서 태그에 해당하는 가게 리스트 띄워줌<br>
- 페이지 우측하단에 룰렛과 페이지 상단 이동 버튼<br>
<br>

![Main](https://github.com/DH083/Focho/assets/147012079/86144701-525c-47ff-8ad5-764a24a453d5)

<h5>❗ 가게에 마우스 호버시</h5><br>
<h5>❗ 하트 클릭시 찜 목록에 추가 및 삭제</h5><br>
<img width="300" alt="Main_hover" src="https://github.com/DH083/Focho/assets/147012079/0d26d445-d39b-41c8-8b00-5a3c92a95b54">

<h5>❗ 룰렛</h5><br>
<img width="300" alt="Main_룰렛" src="https://github.com/DH083/Focho/assets/147012079/5a4ed814-5d21-43c4-a959-5b7ea0b49d30">
<hr>
<h3>✔️ 분류페이지</h3>

- nav에 메뉴 분류 선택시 선택한 분류의 가게 리스트<br>
- 왼쪽 분류에 맞는 배너 불러옴. 자동 슬라이드. 마우스 hover시 슬라이드 멈춤<br>
- 비로그인 유저라면 찜 기능 사용 불가, 로그인 유저라면 사용 가능. 찜목록에 추가된 가게라면 붉은 하트, 목록에 없다면 빈 하트<br>
<br>

![Product](https://github.com/DH083/Focho/assets/147012079/cb8fcbbe-5eb4-44e7-bc4c-91d8ffac70a8)
<hr>
<h3>✔️ 검색페이지</h3>

- 검색창에 작성한 키워드에 해당하는 가게 리스트.<br>
- 가게 분류 기준은 가게명, 메뉴명, 분류명, 태그명 중 키워드가 포함되어 있는 가게<br>
- 왼쪽 빠른 검색을 이용해 빠른 키워드 검색. 스크롤시 페이지 왼쪽에서 따라다님<br>
- 비로그인 유저라면 찜 기능 사용 불가, 로그인 유저라면 사용 가능. 찜목록에 추가된 가게라면 붉은 하트, 목록에 없다면 빈 하트.<br>
<br>

![Search](https://github.com/DH083/Focho/assets/147012079/3032066d-035d-4233-b148-83c26a24b384)

<h5>❗ 키워드에 해당하는 가게가 없을시</h5><br>
<img width="500" alt="keyword_no" src="https://github.com/DH083/Focho/assets/147012079/1d2aa4e9-8da6-4671-acb2-fc8006a82b26">
<hr>
<h3>✔️ 상세페이지</h3>

- 가게 번호를 이용해서 DB에서 가게 정보를 불러옴
- 상단에 가게 사진. 오른쪽 화살표 버튼 클릭시 이미지 오른쪽으로 한칸 슬라이드. 왼쪽 화살표 클릭시 이미지 왼쪽으로 한칸 슬라이드<br>
- 가게 상세정보. 가게명, 영업시간, 주차여부, 해시태그, 주소, 전화번호, 메뉴, 지도
- '+' 버튼 클릭시 더 상세한 영업시간, 주소 나옴<br>
- 메뉴 더보기 버튼 클릭시 전체 메뉴 나옴<br>
<br>

![Item_top](https://github.com/DH083/Focho/assets/147012079/01d617be-2f19-4262-a5e0-c43d8f495187)

<h5>❗ 영업시간 +</h5><br>
<img width="400" alt="Item_timeMore" src="https://github.com/DH083/Focho/assets/147012079/769550e3-b2ca-4651-b2d1-c8d1622a8316"><br>
<br>
<h5>❗ 상세주소 +</h5><br>
<img width="500" alt="Item_addMore" src="https://github.com/DH083/Focho/assets/147012079/9e7cbe10-76b7-4c62-98b0-0c2ded1f3518"><br>
<br>
<h5>❗ 메뉴 더보기</h5><br>
<img width="500" alt="Item_menuMore" src="https://github.com/DH083/Focho/assets/147012079/78294f1b-84b6-4af2-b16f-2f922c58e2a3"><br>
<br>

- 가게에 작성된 리뷰 리스트<br>
- 왼쪽에 현재 리뷰 수, 오른쪽에 현재 리뷰 점수<br>
- 비로그인 유저라면 찜 기능 사용 불가, 로그인 유저라면 사용 가능. 찜목록에 추가된 가게라면 붉은 하트, 목록에 없다면 빈 하트<br>
- 비로그인 유저라면 리뷰작성 기능 사용 불가, 로그인 유저라면 사용 가능. 리뷰작성 버튼 클릭시 리뷰 작성 칸 나옴<br>
- 현재 로그인중인 유저가 작성한 리뷰라면 삭제 버튼 보임. 삭제 버튼 클릭시 리뷰 삭제<br>
<br>

![Item_btm](https://github.com/DH083/Focho/assets/147012079/ecef3518-dd2c-4f3e-b9d3-87682ead87db)

<h5>❗ 리뷰작성칸</h5><br>
<img width="621" alt="Item_reviewWrite" src="https://github.com/DH083/Focho/assets/147012079/149ee7cd-98ad-4848-8330-5354c6822a78"><br>
<br>
<h5>❗ 작성된 리뷰가 없을시</h5><br>
<img width="623" alt="Item_reviewNull" src="https://github.com/DH083/Focho/assets/147012079/73a0dbb3-45d1-4937-a84a-f3c693e13833"><br>
<br>

<hr>
<h3>✔️ 마이페이지</h3>

- 로그인 시 생성되는 Session 정보를 이용해 회원 정보를 가져옴<br>
- 유저가 작성한 리뷰 가져옴. 가게로 가기 버튼 클릭시 해당 가게로 이동<br>
- 유저가 찜 목록에 추가한 가게 정보 가져옴<br>
- 회원 수정 클릭시 회원정보수정페이지로 이동<br>
<br>

<h5>❗ 리뷰 목록</h5><br>
![Mypage_review](https://github.com/DH083/Focho/assets/147012079/f1bf6609-53ea-44a4-b808-88f70215877d)

<br>

<h5>❗ 아직 작성한 리뷰가 없을시</h5><br>
<img width="618" alt="Mypage_noReview" src="https://github.com/DH083/Focho/assets/147012079/f270a302-e658-4831-b7a5-2afcbf7d6eb8">
<br>

<h5>❗ 찜 목록</h5><br>
![Mypage_jjim](https://github.com/DH083/Focho/assets/147012079/1aafc7b3-db3b-4f2b-ac31-cee3fc511f52)

<br>
<h5>❗ 아직 찜한 가게가 없을시</h5><br>

<hr>
<h3>✔️ 회원정보수정페이지</h3>

- 로그인시에만 수정이 가능, 로그인 시 생성되는 Session 정보를 이용해 회원 정보를 가져옴<br>
- 각 칸에 기존 회원정보 미리 삽입<br>
- 아이디, 닉네임은 변경 불가, 그 외는 변경 가능<br>
- 비밀번호, 이메일 형식 확인<br>
- 정보수정 버튼을 눌렀을 때 공란이 있거나 유효성검사가 완료되지 않은 칸이 있다면 해당 칸으로 이동. 수정 취소<br>
- 공란이 없거나, 모든 유효성검사가 완료되었다면 DB에 회원 정보 업데이트<br>

![UserChange](https://github.com/DH083/Focho/assets/147012079/3c3ae691-61fd-415a-8748-48709f2c9a67)
