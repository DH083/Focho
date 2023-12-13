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
    <link rel="stylesheet" href="<c:url value='/css/search.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/reset.css'/>">
    <%--    ****************** CSS경로 추가 *******************   --%>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <%--    ****************** jquery경로 추가 *******************   --%>

    <script>
        $(document).ready(function(){

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

            $(window).scroll(function() {

                var position = $(window).scrollTop();
                $(".left_sec").stop().animate({"top":position+150+"px"},500);

                // let s_ul_o_top = $('.search_ul').offset().top;
                // let s_ul_o_bot = s_ul_o_top + $('.search_ul').height();
                // if(init_count < 60/*아이템개수*/) {
                //     if($(window).scrollTop() + $(window).height() >= s_ul_o_bot + 10 ) {
                //         search_init();
                //     }
                // }


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


        <div class="main_w">
            <div class="top_box">
                <div class="top_box_inner">
                    <select name="city" id="" class="select">
                        <option value="신사동">신사동</option>
                        <option value="압구정동">압구정동</option>
                        <option value="청담동">청담동</option>
                        <option value="논현동">논현동</option>
                        <option value="역삼동">역삼동</option>
                        <option value="대치동">대치동</option>
                        <option value="도곡동">도곡동</option>
                        <option value="개포동">개포동</option>
                        <option value="일원동">일원동</option>
                    </select>

                    <div class="stic"></div>
                    <select name="" id="" class="select">
                        <option value="">한식</option>
                        <option value="">중식</option>
                        <option value="">일식</option>
                        <option value="">양식</option>
                        <option value="">분식</option>
                        <option value="">아시안</option>
                        <option value="">중남미</option>
                        <option value="">패스트</option>
                        <option value="">샐러드</option>
                    </select>

                    <div class="stic"></div>
                    <select name="" id="" class="select">
                        <option value="">혼밥</option>
                        <option value="">데이트</option>
                        <option value="">분위기좋은</option>
                        <option value="">분위기좋은</option>
                        <option value="">면요리</option>
                        <option value="">고기</option>
                        <option value="">해장국</option>
                        <option value="">술안주</option>
                        <option value="">다이어트</option>
                    </select>
                </div>
            </div>
            <div class="left_sec">
                <div class="left_sec_w">
                    <div class="left_sec_detail">
                        빠른검색
                    </div>
                    <div class="left_sec_hr"></div>
                    <div class="left_sec_box">
                        <span class="left_sec_box_p">지역</span>
                        <div class="left_sec_box_input">
                            <a href="<c:url value='/search?keyword=신사동'/>">#신사동</a>
                            <a href="<c:url value='/search?keyword=청담동'/>">#청담동</a>
                            <a href="<c:url value='/search?keyword=압구정동'/>">#압구정동</a>
                            <a href="<c:url value='/search?keyword=논현동'/>">#논현동</a>
                            <a href="<c:url value='/search?keyword=역삼동'/>">#역삼동</a>
                            <a href="<c:url value='/search?keyword=대치동'/>">#대치동</a>
                            <a href="<c:url value='/search?keyword=도곡동'/>">#도곡동</a>
                            <a href="<c:url value='/search?keyword=개포동'/>">#개포동</a>
                            <a href="<c:url value='/search?keyword=일원동'/>">#일원동</a>
                        </div>
                    </div>
                    <div class="left_sec_hr"></div>
                    <div class="left_sec_box">
                        <span class="left_sec_box_p">종류</span>
                        <div class="left_sec_box_input">
                            <c:forEach var="typeDto" items="${typeDto}">
                                <a href="<c:url value='/search?keyword=${typeDto.txt}'/>">#${typeDto.txt}</a>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="left_sec_hr"></div>
                    <div class="left_sec_box">
                        <span class="left_sec_box_p">태그</span>
                        <div class="left_sec_box_input">
                            <c:forEach var="tagDto" items="${tagDto}">
                                <a href="<c:url value='/search?keyword=${tagDto.txt}'/>">#${tagDto.txt}</a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <div class="right_sec">
                <div class="teg_box"></div>
                <div class="restaurant_list">
                    <ul class="search_ul" id="search_ul">
                        <c:if test="${restaurantDto.size() == 0}">
                            <div class="review_content_none">
                                <div class="review_none">
                                    <h3>검색된 가게가 없어요!</h3>
                                    <div class="review_icon"></div>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${restaurantDto.size() != 0}">
                            <c:forEach var="restaurantDto" items="${restaurantDto}">
                                <li class="search_li">
                                    <a href="/app/item?num=${restaurantDto.num}">
                                        <img src="./img/res_main/${restaurantDto.img}.jpg" alt="">
                                        <p>${restaurantDto.name}</p>
                                        <div class="restaurant_list_heart">
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
                                        </div>
                                        <div class="name_border"></div>
                                        <div class="restaurant_list_num">
                                            <img src="./img/icon/icon_num.jpg" alt="">
                                            <span>${restaurantDto.tel}</span>
                                        </div>
                                        <div class="restaurant_list_place">
                                            <img src="./img/icon/icon_place.png" alt="">
                                            <span>${restaurantDto.address}</span>
                                        </div>
                                        <div class="restaurant_list_hash">
                                            <span>#${typeDto[restaurantDto.type_num-1].txt} #${tagDto[restaurantDto.tag_num-1].txt} #${restaurantDto.city}</span>
                                        </div>
                                    </a>
                                </li>
                            </c:forEach>
                        </c:if>
                        <%--        tohtml 들어갈 부분   --%>
                    </ul>
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
    </div>
    
    <script src="./js/search.js"></script>
    <script src="./js/common.js"></script>
</body>

</html>