<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value='/css/reset.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/common.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/header.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/header_join_login.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/join.css'/>">
    <script src="http://code.jquery.com/jquery-latest.js"></script>

    <script>
        $(document).ready(function () {

            let idb = false;
            let passb = false;
            let passVb = false;
            let emailb = false;
            let phoneb = false;
            let nickb = false;

            // id_Chk
            $('#id').keyup(function () {

                var InputId = $(this).val();

                // alert(InputId);

                // 3글자 미만일시
                if (InputId.length < 4) {
                    $('#id_Chk').removeClass("Chk_success");
                    $('#id_Chk').addClass("Chk_fail");
                    $('#id_Chk').text("아이디는 4글자 이상이어야합니다.");
                    $('#id').focus();
                    idb = false;

                    return;
                }
                // 15글자 이상일시
                else if (InputId.length > 15) {
                    $('#id_Chk').removeClass("Chk_success");
                    $('#id_Chk').addClass("Chk_fail");
                    $('#id_Chk').text("아이디는 15글자 이하이어야합니다.");
                    idb = false;

                    return;
                }

                $.ajax({
                    type: 'POST',       // 요청 메서드
                    url: '/app/idChk',
                    headers: {"content-type": "application/json"},
                    async: false,
                    data: JSON.stringify(InputId),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                    success: function (result) {
                        // InputId2 = Json.parse(result);
                        console.log(result);
                        if (result == "2") {
                            $('#id_Chk').removeClass("Chk_success");
                            $('#id_Chk').addClass("Chk_fail");
                            $('#id_Chk').text("이미 사용중인 아이디입니다.");

                            idb = false;

                        } else {
                            $('#id_Chk').addClass("Chk_success");
                            $('#id_Chk').removeClass("Chk_fail");
                            $('#id_Chk').text("사용 가능한 아이디입니다.");

                            idb = true;
                        }
                    },
                    error: function () {
                        alert("error")
                    } // 에러가 발생했을 때, 호출될 함수
                });
            });

            // email_Chk
            $('#email').keyup(function () {
                var InputEmail = $(this).val();

                let email_regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;

                // 이메일 형식이 아닐시
                if (!email_regex.test(InputEmail)) {
                    $('#email_Chk').removeClass("Chk_success");
                    $('#email_Chk').addClass("Chk_fail");
                    $('#email_Chk').text("이메일 형식을 지켜주세요.");
                    emailb = false;
                    return;
                } else if (InputEmail.length > 30) {
                    $('#email_Chk').removeClass("Chk_success");
                    $('#email_Chk').addClass("Chk_fail");
                    $('#email_Chk').text("이메일은 30자 아래로 입력해주세요.");
                    emailb = false;
                    return;
                } else {
                    $('#email_Chk').addClass("Chk_success");
                    $('#email_Chk').removeClass("Chk_fail");
                    $('#email_Chk').text("사용 가능한 이메일입니다.");
                    emailb = true;
                }
            });

            // pw_Chk
            $('#pw').keyup(function () {
                var InputPw = $(this).val();

                if (InputPw.length < 6) {
                    $('#pw_Chk').removeClass("Chk_success");
                    $('#pw_Chk').addClass("Chk_fail");
                    $('#pw_Chk').text("비밀번호는 6글자 이상이어야합니다.");
                    passb=false;
                    return;
                }
                // 30글자 미만일시
                else if (InputPw.length > 30) {
                    $('#pw_Chk').removeClass("Chk_success");
                    $('#pw_Chk').addClass("Chk_fail");
                    $('#pw_Chk').text("비밀번호는 30글자 이하이어야합니다.");
                    passb=false;
                    return;
                } else {
                    $('#pw_Chk').removeClass("Chk_fail");
                    $('#pw_Chk').addClass("Chk_success");
                    $('#pw_Chk').text("사용 가능한 비밀번호입니다.");
                    passb=true;
                }
            });

            // pw_v_Chk
            $('#pw_v').keyup(function () {
                var InputPw_v = $(this).val();
                var InputPw = $('#pw').val();

                if (InputPw_v != InputPw) {
                    $('#pw_verify_Chk').removeClass("Chk_success");
                    $('#pw_verify_Chk').addClass("Chk_fail");
                    $('#pw_verify_Chk').text("비밀번호가 일치하지 않습니다.");
                    passVb=false;
                    return;
                }
                else if (InputPw_v == InputPw) {
                    $('#pw_verify_Chk').removeClass("Chk_fail");
                    $('#pw_verify_Chk').addClass("Chk_success");
                    $('#pw_verify_Chk').text("비밀번호가 일치합니다.");
                    passVb=true;
                }
            });

            // phone_Chk
            $('#phone').keyup(function () {
                var InputPh = $(this).val();

                if (InputPh.length == 0) {
                    $('#phone_Chk').removeClass("Chk_success");
                    $('#phone_Chk').addClass("Chk_fail");
                    $('#phone_Chk').text("전화번호를 입력하여주세요.");
                    phoneb=false;
                    return;
                }
                else {
                    $('#phone_Chk').removeClass("Chk_fail");
                    $('#phone_Chk').addClass("Chk_success");
                    $('#phone_Chk').text("확인되었습니다.");
                    phoneb=true;
                }
            });

            // nick_Chk
            $('#nick').keyup(function () {

                var InputNic = $(this).val();

                // 3글자 미만일시
                if (InputNic.length < 2) {
                    $('#nick_Chk').removeClass("Chk_success");
                    $('#nick_Chk').addClass("Chk_fail");
                    $('#nick_Chk').text("닉네임은 2글자 이상이어야합니다.");
                    $('#nick').focus();
                    nickb = false;

                    return;
                }
                // 15글자 이상일시
                else if (InputNic.length > 10) {
                    $('#nick_Chk').removeClass("Chk_success");
                    $('#nick_Chk').addClass("Chk_fail");
                    $('#nick_Chk').text("아이디는 10글자 이하이어야합니다.");
                    nickb = false;

                    return;
                }

                $.ajax({
                    type: 'POST',       // 요청 메서드
                    url: '/app/nicChk',
                    headers: {"content-type": "application/json"},
                    async: false,
                    data: JSON.stringify(InputNic),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                    success: function (result) {
                        // InputId2 = Json.parse(result);
                        console.log(result);
                        if (result == "2") {
                            $('#nick_Chk').removeClass("Chk_success");
                            $('#nick_Chk').addClass("Chk_fail");
                            $('#nick_Chk').text("이미 사용중인 닉네임입니다.");

                            nickb = false;

                        } else {
                            $('#nick_Chk').addClass("Chk_success");
                            $('#nick_Chk').removeClass("Chk_fail");
                            $('#nick_Chk').text("사용 가능한 닉네임입니다.");

                            nickb = true;
                        }
                    },
                    error: function () {
                        alert("error")
                    } // 에러가 발생했을 때, 호출될 함수
                });
            });

            function formCheck() {
                if (!idb) {
                    $('#id_Chk').removeClass("Chk_success");
                    $('#id_Chk').addClass("Chk_fail");
                    $('#id_Chk').text("유효한 아이디를 입력하세요.");
                    $('#id').focus();
                    return false;
                }
                if (!passb) {
                    $('#pw_Chk').removeClass("Chk_success");
                    $('#pw_Chk').addClass("Chk_fail");
                    $('#pw_Chk').text("유효한 비밀번호를 입력하세요.");
                    $('#pw').focus();
                    return false;
                }
                if (!passVb) {
                    $('#pw_verify_Chk').removeClass("Chk_success");
                    $('#pw_verify_Chk').addClass("Chk_fail");
                    $('#pw_verify_Chk').text("비밀번호를 확인해주세요.");
                    $('#pw_v').focus();
                    return false;
                }
                if (!nickb) {
                    $('#nick_Chk').removeClass("Chk_success");
                    $('#nick_Chk').addClass("Chk_fail");
                    $('#nick_Chk').text("유효한 닉네임을 입력하세요.");
                    $('#nick').focus();
                    return false;
                }
                if (!phoneb) {
                    $('#phone_Chk').removeClass("Chk_success");
                    $('#phone_Chk').addClass("Chk_fail");
                    $('#phone_Chk').text("전화번호를 입력하세요.");
                    $('#phone').focus();
                    return false;
                }
                if (!emailb) {
                    $('#email_Chk').removeClass("Chk_success");
                    $('#email_Chk').addClass("Chk_fail");
                    $('#email_Chk').text("유효한 이메일을 입력하세요.");
                    $('#email').focus();
                    return false;
                }

                return true;
            }

            $('form').submit(function (e) {
                if (!formCheck()) {
                    e.preventDefault();
                }
            });
        });
    </script>
</head>
<body>
    <div id="wrap">
        <div class="header">
            <div class="header_w">
                <div class="header_logo">
                    <a href="<c:url value='/'/>"></a>
                </div>
                <div class="search_box">
                    <form action="<c:url value='/search'/>" name="search" id="searchForm">
                        <input class="search" type="text" name="keyword" id="keywordInput" placeholder="검색어를 입력하시오" autocomplete="off">
                        <div class="search_icon"></div>
                    </form>
                </div>
                <ul class="user_box">
                    <li>
                        <a href="<c:url value='${ logInOutLink }' />">
                            <div class="user_icon_img1"></div>
                            <div class="user_icon_p1">${ logInOutTxt }</div>
                        </a>
                        <%--    *************************** 로그인 상태따라 로그인, 로그아웃으로 바뀜 추가 ***********************************    --%>
                    </li>
                    <li>
                        <c:if test="${empty userName }">
                            <a href="<c:url value='/join'/>">
                                <div class="user_icon_img3"></div>
                                <div class="user_icon_p2">회원가입</div>
                            </a>
                        </c:if>
                        <%--    ******************* 로그인이 되어있다면 로그인 유저의 닉네임 띄워줌 링크x 추가 *****************    --%>
                        <c:if test="${not empty userName }">
                            <a href="<c:url value='/mypage'/>">
                                <div class="user_icon_img4"></div>
                                <div class="user_icon_p2">${userName}</div>
                            </a>
                        </c:if>
                    </li>
                </ul>
            </div>
        </div>
        <form action="<c:url value="/join" />" class="join_table" method="POST" onsubmit="return formCheck(this)">
            <div class="join_title">
                <h2>회원가입</h2>
                <span>JOIN</span>
            </div>
            <input type="text" placeholder="아이디는 추후 변경이 불가합니다." name="id" id="id" autocomplete="off">
            <div class="join_info id_Chk" id="id_Chk">사용하실 아이디를 입력해주세요</div>

            <input type="password" placeholder="비밀번호" name="pw" id="pw" autocomplete="off">
            <div class="join_info pw_Chk" id="pw_Chk"></div>

            <input type="password" placeholder="비밀번호 확인" id="pw_v" autocomplete="off">
            <div class="join_info pw_verify_Chk" id="pw_verify_Chk"></div>

            <input type="text" placeholder="닉네임은 추후 변경이 불가합니다." name="name" id="nick" autocomplete="off">
            <div class="join_info nick_Chk" id="nick_Chk">사용하실 닉네임을 입력하여 주세요.</div>

            <input type="text" placeholder="휴대폰 번호 ('-' 제외)" name="tel" id="phone" autocomplete="off">
            <div class="join_info phone_Chk" id="phone_Chk">휴대폰 번호를 입력해주세요</div>

            <input type="text" placeholder="이메일" name="email" id="email" autocomplete="off">
            <div class="join_info email_Chk" id="email_Chk"></div>

            <input type="submit" value="회원가입">
            <div class="move_login">
                <a href="<c:url value='/login'/>">
                    로그인으로 이동
                </a>
            </div>

        </form>
    </div>
</body>
</html>