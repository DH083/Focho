<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>

<%@ page session="false" %> <%-- 이 페이지에서는 세션을 새로 생성 안하겠다 라는 뜻 --%>
<c:set var="logInOutLink" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'/login':'/login/logout'}" />
<c:set var="logInOutTxt" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'로그인':'로그아웃'}" />
<c:set var="userName" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'':pageContext.request.getSession(false).getAttribute('name')}" />
<%--    ***************** 이 위에 전체 추가 ****************** --%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value='/css/header.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/common.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/mypage.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/reset.css'/>">
    <script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
$(document).ready(function() {

    // 돋보기 아이콘 누르면 input의 value값 가져와서 검색페이지로 이동하기
    $('.search_icon').on('click', function (e) {
        var keyword = $('#keywordInput').val(); // 입력된 키워드 가져오기
        var url = '/app/search?keyword=' + encodeURIComponent(keyword); // URL 생성
        window.location.href = url; // 페이지 이동
    });

    $(document).on('click', '.jjim', function() {
        console.log("찜 클릭");
        let num = $(this).parent().children(1).val();
        console.log("num: "+num);

        const jjimChk = $('#jjim'+num).prop("checked");  // 체크 상태 확인

        if (jjimChk === true){
            // 만약 체크해제되어 있으면 찜에 추가
            console.log("체크")

            $.ajax({
                type: 'GET',       // 요청 메서드
                url: 'jjim/add',  // 요청 URI
                async: false,
                /*dataType : 'json',*/   //생력하면 기본값(json) 이 들어간다.// 전송받을 데이터의 타입
                data : {res_num: num}, // 위에꺼 생략하면 변환이 필요 없다.  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success: function (result) {

                    console.log(result);

                },
                error: function () {
                    alert("error 찜하기");
                } // 에러가 발생했을 때, 호출될 함수

            });
        }
        else if (jjimChk === false){
            // 안되어 있으면 찜 해제
            console.log("체크해제")
            let res_num=num;
            $.ajax({
                type: 'DELETE',       // 요청 메서드
                // url: '/jjim/remove?res_num='+num,  // 요청 URI
                url: '/app/jjim/remove/'+res_num,  // 요청 URI
                headers : { "content-type": "application/json" }, // 요청 헤더
                async: false,
                /*dataType : 'json',*/   //생력하면 기본값(json) 이 들어간다.// 전송받을 데이터의 타입
                //data : {res_num:num}, // 위에꺼 생략하면 변환이 필요 없다.  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success: function (result) {

                    console.log(result);

                },
                error: function () {
                    alert("error 찜 삭제하기");
                } // 에러가 발생했을 때, 호출될 함수

            });

        }
        else console.log("체크실패")

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
        <div class="main main_w">
            <div class="user_page">
                <div class="user_page_name">${userDto.name} 회원님</div>
                <div class="user_page_email">${userDto.email}</div>
                <a href="<c:url value='/userChange'/>">
                    <div class="user_page_change"></div>
                    <span>회원수정</span>
                </a>
            </div>
            <div class="user_section" >
                <section>
                    <div class="user_review_btn us_sec">
                        <span class="usp">맛 리뷰</span>
                    </div>
                    <div class="stic"></div>
                    <div class="user_save_btn us_sec">
                        <span class="usp">맛 찜</span>
                    </div>
                </section>
                <div class="UserInfo_list">
                   
                    <div class="Uslist1 user_review_list display_block">
                        <form action="">
                            <div class="reveiw">
                                <c:if test="${reviewDto[0] != null}">
                                    <div class="review_content">
                                        <c:forEach var="reviewDto" items="${reviewDto}">
                                        <div class="review_content_txt">
                                            <div class="nick_date">
                                                <div class="review_nickname">${userDto.name}</div>
                                                <div class="creation_date">${reviewDto.date}</div>
                                                <div class="review_delete_change">
                                                    <div class="show_more">
                                                        <a href='<c:url value='/item?num=${reviewDto.res_num}'/>'>가게로 이동</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="review_star">
                                                <c:forEach begin="1" end="${reviewDto.score}">
                                                    <img src="./img/icon/star.png" alt="">
                                                </c:forEach>
                                                <c:forEach begin="1" end="${5-reviewDto.score}">
                                                    <img src="./img/icon/star_off.png" alt="">
                                                </c:forEach>
                                            </div>
                                            <div class="review_num1">
                                                <div class="review_create">${reviewDto.txt}</div>
                                                <div class="review_create_img">
                                                    <c:if test="${reviewDto.img == null}">
                                                    </c:if>
                                                    <c:if test="${reviewDto.img != null}">
                                                        <img src="<c:url value="./img/res_main/${reviewDto.img}.jpg"/>" alt="">
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                        </c:forEach>
                                    </div>
                                </c:if>

                                <c:if test="${reviewDto[0] == null}">
                                    <div class="review_content_none">
                                        <div class="review_none">
                                            <h3>아직 작성한 리뷰가 없어요!</h3>
                                            <div class="review_icon"></div>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </form>
                    </div>
                    <div class="Uslist user_save_list  display_none ">
                        <form action="">
                            <div class="ggim_list">
                                <ul class="ggim_ul">
<%--                                    만약 가져온 찜 수가 0이면    --%>
                                    <c:if test="${restaurantDto[0] == null}">
                                        <div class="review_content_none">
                                            <div class="review_none">
                                                <h3>아직 찜한 가게가 없어요!</h3>
                                                <div class="review_icon"></div>
                                            </div>
                                        </div>
                                    </c:if>

<%--                                    만약 가져온 찜 수가 0이 아니면    --%>
                                    <c:if test="${restaurantDto[0] != null}">
                                    <c:forEach var="restaurantDto" items="${restaurantDto}">
                                        <li class="ggim_li">
                                            <a href="<c:url value="/item?num=${restaurantDto.num}"/>">
                                                <img src="./img/res_main/${restaurantDto.img}.jpg" alt="">
                                                <p>${restaurantDto.name}</p>
                                                <div class="ggim_list_heart">
                                                    <label for="jjim${restaurantDto.num}">
                                                        <input type="checkbox" class="jjim" id="jjim${restaurantDto.num}" value="${restaurantDto.num}" checked>
                                                        <img class="jjim_img jjim_img1" src="./img/icon/like_off.png" alt="">
                                                        <img class="jjim_img jjim_img2" src="./img/icon/like_on.png" alt="">
                                                    </label>
                                                </div>
                                                <div class="ggim_name_border"></div>
                                                <div class="ggim_list_num">
                                                    <img src="./img/icon/icon_num.jpg" alt="">
                                                    <span>${restaurantDto.tel}</span>
                                                </div>
                                                <div class="ggim_list_place">
                                                    <img src="./img/icon/icon_place.png" alt="">
                                                    <span>${restaurantDto.address}</span>
                                                </div>
                                                <div class="ggim_list_hash">
                                                    <span>#${typeDto[restaurantDto.type_num - 1].txt} #${tagDto[restaurantDto.tag_num - 1].txt}</span>
                                                </div>
                                            </a>
                                        </li>
                                    </c:forEach>
                                    </c:if>
                                </ul>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="footer">
            <div class="footer_outer">
                <div class="footer_left">
                    <h5>(주)FOCHO</h5> 
                    <h5>소재지 : 서울특별시 강남구 테헤란로 14길 6</h5>
                    <h5>이메일 문의 : aassdf12@naver.com</h5>
                    <h5>전화 문의 : 02-1234-5678</h5>
                </div>
                <div class="footer_right">
                    <h5>팀 명 : 99즈</h5>
                    <h5>팀 장 : 성준혁</h5>
                    <h5>팀 원 : 김민기 , 송해성 , 이도희</h5>
                </div>
            </div>
        </div>
    </div>
   
    <script src="./js/mypage.js"></script>
</body>
</html>