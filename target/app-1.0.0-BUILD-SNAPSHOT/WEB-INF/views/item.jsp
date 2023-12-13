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
    <link rel="stylesheet" href="<c:url value='/css/reset.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/common.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/header.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/item.css'/>">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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

                if (${pageContext.request.getSession(false).getAttribute('id')==null}) {
                    alert("로그인 후 이용해주세요");
                    return false;
                }

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


            // 로그인 유무 따라 리뷰 작성 막기
            $('.review_write_btn').click(function(){
                if (${pageContext.request.getSession(false).getAttribute('id')==null}) {
                    alert("로그인 후 이용해주세요");
                } else {
                    $('.review_txt_new').slideToggle(500);
                }
            });
            $('#delete').click(function(){
                $('.review_txt_new').slideUp(500);
            });
        });

    </script>
</head>
<body>
<input type="text" value="${userName}" id="userName">
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
        <div class="container">
            <div class="main_banner">
                <div class="main_banner_black1"></div>
                <div class="main_banner_black2"></div>
                <div class="swiper mySwiper">
                    <div class="swiper-wrapper">
                        <c:forEach var="i" begin="1" end="8">
                            <div class="swiper-slide">
                                <img src="./img/res_main/${typeDto[restaurantDto.type_num-1].img}${i}.jpg" alt="">
                            </div>
                        </c:forEach>
                    </div>
                    <div class="swiper-button-prev" style="left: var(--swiper-navigation-sides-offset,20%);"></div>
                    <div class="swiper-button-next" style="right: var(--swiper-navigation-sides-offset,20%);"></div>
                </div>
            </div>
            <div class="item_info">
                <h1>${restaurantDto.name}</h1>
                <ul>
                    <li class="item_info_li">
                        <div class="item_info_open_time">
                            <h1>영업시간</h1>
                            <h2>브레이크 타임</h2>
                            <div class="open_time_minus">-</div>
                            <div class="open_time">
                                <c:forEach var="businessDto" items="${businessDto}">
                                    <div class='today_open_time'>
                                        <span>${dayList[businessDto.day-1]}요일</span>
                                        <c:if test="${businessDto.open != '00:00'}">
                                            <p>${businessDto.open} ~ ${businessDto.close}</p>
                                        </c:if>
                                        <c:if test="${businessDto.break_start != '00:00'}">
                                            <p>${businessDto.break_start} ~ ${businessDto.break_end}</p>
                                        </c:if>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="item_info_inf">
                            <span>영업시간</span>
                            <p>${businessDtoToday.open} ~ ${businessDtoToday.close}</p>
                            <div class="item_info_plus">+</div>
                        </div>
                        <div class="item_info_inf">
                            <span>주차여부</span>
                            <p>가능</p>
                        </div>
                        <div class="item_info_inf">
                            <span>해시태그</span>
                            <p><a href="<c:url value='/product?num=${restaurantDto.type_num}'/>">#${typeDto[restaurantDto.type_num-1].txt}</a> <a href="/app/search?keyword=${tagDto[restaurantDto.tag_num-1].txt}">#${tagDto[restaurantDto.tag_num-1].txt}</a></p>
                        </div>
                        <div class="item_info_inf">
                            <span>상세주소</span>
                            <p>${restaurantDto.address}</p>
                            <div class="detail_btn">+</div>
                            <div class="detail_pan">${restaurantDto.address}</div>
                        </div>
                        <div class="item_info_inf">
                            <span>전화번호</span>
                            <p>${restaurantDto.tel}</p>
                        </div>
                    </li>
                    <li class="item_menu_li item_info_li2">
                        <div class="item_box">
                            <c:forEach var="menuDto" items="${menuDto}">
                                <div class='item_info_menu'>
                                    <span>${menuDto.name}</span>
                                        <%--    eq 는 같으면, ne 는 다르면 --%>
                                    <c:if test="${menuDto.price ne 0}">
                                        <p>${menuDto.price}원</p>
                                    </c:if>
                                    <c:if test="${menuDto.price eq 0}">
                                        <p>가격변동</p>
                                    </c:if>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="item_info_menu_plus">자세히보기</div>

                    </li>
                    <li class="item_map_li">
                        <div class="item_place">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25321.790315954357!2d127.02563834808345!3d37.502639657643456!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca4637d1e1829%3A0x6673bde10d951fe7!2z7IOI67K97KeRIOyyreuLtOuPmeygkA!5e0!3m2!1sko!2skr!4v1699941868368!5m2!1sko!2skr" width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>
                    </li>
                </ul>
                <div class="reveiw">
                    <div class="star_mark_num">
                        <h2>REVIEW</h2>
                        <div class="star_mark">(${restaurantDto.rev_count})</div>
<%--                        리뷰 작성 버튼 위치 --%>
                        <div class="review_write_btn">
                            <span>리뷰 작성</span>
                            <div class="review_write_icon"></div>

                        </div>
                        <div class="star_heart_icon">
                            <label for="jjim${restaurantDto.num}">
                                <c:if test="${empty userName}">
                                    <input type="checkbox" class="jjim" id="jjim${restaurantDto.num}" value="${restaurantDto.num}">
                                </c:if>
                                <c:if test="${not empty userName}">
                                    <c:if test="${restaurantDto.user_num == 0}">
                                        <input type="checkbox" class="jjim" id="jjim${restaurantDto.num}" value="${restaurantDto.num}">
                                    </c:if>
                                    <c:if test="${restaurantDto.user_num != 0}">
                                        <input type="checkbox" class="jjim" id="jjim${restaurantDto.num}" value="${restaurantDto.num}" checked>
                                    </c:if>
                                </c:if>
                                <img class="jjim_img jjim_img1" src="./img/icon/like_off.png" alt="">
                                <img class="jjim_img jjim_img2" src="./img/icon/like_on.png" alt="">
                            </label>
                            <img src="./img/icon/star.png" alt="">
                            <p>${restaurantDto.rev_score}</p>
                        </div>
                    </div>
                </div>
                <div class="reveiw_bottom_border"></div>
                <div class="review_content">
                    <jsp:include page="review.jsp" flush="false"/>
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
        <div class="top_btn">
            <a href="#"></a>
        </div>
        <div class="item_menu_plus">
            <div class="item_menu_list">
                <img src="./img/item_menu.png" alt="메뉴판">
                <p>-</p>
                <div class="item_info_all_menu">
                    <c:forEach var="menuDto" items="${menuDto}">
                        <div class='item_info_menu_detail'>
                            <span>${menuDto.name}</span>
                            <c:if test="${menuDto.price ne 0}">
                                <p>${menuDto.price}원</p>
                            </c:if>
                            <c:if test="${menuDto.price eq 0}">
                                <p>가격변동</p>
                            </c:if>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script>

</script>

<script src="./js/common.js"></script>
<script src="./js/item.js"></script>

</body>
</html>