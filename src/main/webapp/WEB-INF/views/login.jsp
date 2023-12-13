<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>
<c:set var="userName" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'':pageContext.request.getSession(false).getAttribute('name')}" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="<c:url value='/css/reset.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/common.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/header.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/header_join_login.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/login.css'/>">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
<form action="<c:url value='/login'/>" method="post" onsubmit="return formCheck(this);">
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
        <div class="login_box">
            <div class="login_inner_L">
                <div class="login_inner_L_icon_box">
                    <div class="login_inner_L_icon1"></div>
                    <div class="login_inner_L_icon2"></div>
                    <div class="login_inner_L_icon3"></div>
                    <div class="login_inner_L_icon4"></div>
                </div>
            </div>
            <div class="login_inner_R">
                <div class="login_in">
                    <div class="welcome">Login</div>
                    <div class="login_inbox_outer">
                        <div class="login_input_box">
                            <div class="lpi login_page_icon1"></div>
                            <%--   만약 쿠키기록이 남아있다면 아이디 자동 삽입 --%>
                            <input type="text" id="id" name="id" value="${ cookie.id.value }" placeholder="아이디 입력">
                        </div>
                        <div class="login_input_box">
                            <div class="lpi login_page_icon2"></div>
                            <input type="password" id="pw" name="pw" value="asdasd" placeholder="비밀번호 입력">
                        </div>
                    </div>
                    <div class="ch_input">
                        <input type="checkbox" name="ch_save" id="ch_save" ${empty cookie.id.value?"":"checked" }>
                        <label for="ch_save">아이디 저장</label>
                    </div>
                    <div class="login_button">
                        <button class="logbt login_button_L">
                            로그인
                        </button>
                        <button class="logbt login_button_R">
                            <a href="<c:url value='/join'/>">회원가입</a>
                        </button>
                    </div>
                    <%--    로그인 실패 시 사유 메세지 띄우기     --%>
                    <div id="pocho_text">
                        <c:if test="${empty param.pocho_text }">
                            로그인을 통해 FOCHO의 다양한 혜택을 누리세요!
                        </c:if>
                        <c:if test="${not empty param.pocho_text}" >
                            <i class="fa fa-exclamation-circle" style="color: #ff0000;"> ${URLDecoder.decode(param.pocho_text)}</i>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<script>
    function formCheck(frm) {

        if(frm.id.value.length==0) {
            setMessage('id를 입력해주세요.', frm.id);
            return false;
        }

        if(frm.pw.value.length==0) {
            setMessage('password를 입력해주세요.', frm.pw);
            return false;
        }

        return true;
    }

    function setMessage(pocho_text, element){
        document.getElementById("pocho_text").innerHTML = ` ${'${pocho_text}'}`;

        if(element) {
            element.select();
        }
    }
</script>
</body>
</html>