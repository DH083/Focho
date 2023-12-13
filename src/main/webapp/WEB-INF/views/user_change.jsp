<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>

<%@ page session="false" %> <%-- 이 페이지에서는 세션을 새로 생성 안하겠다 라는 뜻 --%>
<c:set var="logInOutLink" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'/login':'/login/logout'}" />
<c:set var="logInOutTxt" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'로그인':'로그아웃'}" />
<c:set var="userName" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'':pageContext.request.getSession(false).getAttribute('name')}" />
<%--    ***************** 이 위에 전체 추가 ****************** --%>


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
    <link rel="stylesheet" href="<c:url value='/css/user_change.css'/>">

    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <%--    ****************** jquery경로 추가 *******************   --%>

    <script>
        $(document).ready(function () {
            let passb = true;
            let passVb = true;
            let emailb = true;
            let phoneb = true;


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

            function formCheck() {
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
        <form action="<c:url value="/userChange" />" class="join_table" method="POST" onsubmit="return formCheck(this)">
            <div class="join_title">
                <h2>회원수정</h2>
                <span>CHANGE</span>
            </div>
            <input type="text" value="${userDto.id}" name="id" id="id" readonly>
            <div class="join_info" id="id_Chk">아이디는 변경이 불가합니다.</div>

            <input type="password" value="${userDto.pw}" name="pw" id="pw" autocomplete="off">
            <div class="join_info pw_Chk" id="pw_Chk"></div>

            <input type="password" value="${userDto.pw}" id="pw_v" autocomplete="off">
            <div class="join_info pw_verify_Chk" id="pw_verify_Chk"></div>

            <input type="text" value="${userDto.tel}" name="tel" id="phone" autocomplete="off">
            <div class="join_info phone_Chk" id="phone_Chk">변경하실 휴대폰 번호를 입력해주세요</div>

            <input type="text" value="${userDto.name}" name="name" id="nick" readonly>
            <div class="join_info" id="nick_Chk">닉네임은 변경이 불가합니다.</div>

            <input type="text" value="${userDto.email}" name="email" id="email" autocomplete="off">
            <div class="join_info email_Chk" id="email_Chk">변경하실 이메일 주소를 입력해주세요</div>

            <input type="submit" value="회원수정">
        </form>
    </div>
</body>
</html>