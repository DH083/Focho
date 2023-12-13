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
    <link rel="stylesheet" href="<c:url value='/css/common.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/header.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/product.css'/>">
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


    let init_count = 0;

    $(window).scroll(function(){
        let res_R_total_o_top = $('.restaurant_R_total').offset().top;
        let res_R_total_o_bot = res_R_total_o_top + $('.restaurant_R_total').height();
        if(init_count < ${restaurantDto.size()}/*아이템개수*/) {
            console.log(${restaurantDto.size()})
            if($(window).scrollTop() + $(window).height() >= res_R_total_o_bot + 10 ) {
                product_init();
            }
        }
    });


    res_l_init();
    let interval;
    let curr_idx=0;
    function auto_slide() {
        let res_count = $('.restaurant_L').length;
        let timer = 1000;
        interval = setInterval(function(){
            $('.restaurant_L').eq(curr_idx % res_count).animate({
                top: '-100%',
            }, timer, "linear")
            $('.restaurant_L').eq((curr_idx+1) % res_count).css({
                top: '100%'
            }, 0).animate({
                top:'0'
            }, timer, "linear")

            curr_idx+=1;
        }, timer + 1000)
    }
    auto_slide();
    $('.restaurant_L').hover(function(){
        clearInterval(interval)
    }, function(){
        auto_slide();
    });


    function res_l_init() {

        for(i=1; i<6; i++) {
            $(`<div class="restaurant_L restaurant_list_L${'${i}'}"><img src='./img/product_Left_img/product_${typeDto[param.num-1].img}/product_${typeDto[param.num-1].img}${'${i}'}.PNG' alt=''></div>`).appendTo($('.restaurant_L_count'));
        }
    }

    <%--function product_init() {--%>
    <%--    <c:forEach var="restaurantDto" begin="init_count" end="${init_count + 5}" items="${restaurantDto}">--%>
    <%--        let i = ${restaurantDto.index}; // 현재 반복 인덱스 가져오기--%>
    <%--        let restaurantDto = ${restaurantDto};--%>
    <%--        let item = `<div class="restaurant_R restaurant_R${i}">--%>
    <%--                            &lt;%&ndash;<a href="<c:url value='/item?num=${restaurantDto.num}'/>">&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;    <img src="./img/res_main/${restaurantDto.img}.jpg" alt="">&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;    <p>${restaurantDto.name}</p>&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;    <div class="restaurant_list_heart">&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;        <label for="jjim${restaurantDto.num}">&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;            <c:if test="${empty userName}">&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;                <input type="checkbox" class="jjim" id="jjim${restaurantDto.num}" value="${restaurantDto.num}">&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;            </c:if>&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;            <c:if test="${not empty userName}">&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;                <c:if test="${restaurantDto.user_num == 0}">&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;                    <input type="checkbox" class="jjim" id="jjim${restaurantDto.num}" value="${restaurantDto.num}">&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;                </c:if>&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;                <c:if test="${restaurantDto.user_num != 0}">&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;                    <input type="checkbox" class="jjim" id="jjim${restaurantDto.num}" value="${restaurantDto.num}" checked>&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;                </c:if>&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;            </c:if>&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;            <img class="jjim_img jjim_img1" src="./img/icon/like_off.png" alt="">&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;            <img class="jjim_img jjim_img2" src="./img/icon/like_on.png" alt="">&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;        </label>&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;    </div>&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;    <div class="name_border"></div>&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;    <div class="restaurant_list_num">&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;        <img src="./img/icon/icon_num.jpg" alt="">&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;        <span>${restaurantDto.tel}</span>&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;    </div>&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;    <div class="restaurant_list_place">&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;        <img src="./img/icon/icon_place.png" alt="">&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;        <span>${restaurantDto.address}</span>&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;    </div>&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;    <div class="restaurant_list_hash">&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;        <span>#${typeDto[restaurantDto.type_num-1].txt} #${tagDto[restaurantDto.tag_num-1].txt}</span>&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;    </div>&ndash;%&gt;--%>
    <%--                            &lt;%&ndash;</a>&ndash;%&gt;--%>
    <%--                            </div>`--%>

    <%--        $(item).appendTo($('.restaurant_R_total'));--%>
    <%--    </c:forEach>--%>

        // for(let i=init_count; i<init_count + 6; i++) {
        //
        // }
        // $('.restaurant_R').html(`<a href="./item.html">
        //         <img src="" alt="">
        //         <p>가게명</p>
        //         <div class="restaurant_list_heart">
        //             <img src="./img/icon/icon_heart.jpg" alt="">
        //             <span>개수</span>
        //         </div>
        //         <div class="name_border"></div>
        //         <div class="restaurant_list_num">
        //             <img src="./img/icon/icon_num.jpg" alt="">
        //             <span>전화번호</span>
        //         </div>
        //         <div class="restaurant_list_place">
        //             <img src="./img/icon/icon_place.png" alt="">
        //             <span>강남구 식당 상세주소</span>
        //         </div>
        //         <div class="restaurant_list_hash">
        //             <span>#분류 #해시태그 #목적</span>
        //         </div>
        //     </a>`);
    //     init_count += 6;
    // }
    // product_init();

    <%--console.log("restaurantDto.size(): "+${restaurantDto.size()});--%>

    <%--$(window).scroll(function(){--%>
    <%--    let res_R_total_o_top = $('.restaurant_R_total').offset().top;--%>
    <%--    let res_R_total_o_bot = res_R_total_o_top + $('.restaurant_R_total').height();--%>
    <%--    if(init_count < ${restaurantDto.size()}/*아이템개수*/) {--%>
    <%--        if($(window).scrollTop() + $(window).height() >= res_R_total_o_bot + 10 ) {--%>
    <%--            product_init();--%>
    <%--        }--%>
    <%--    }--%>
    <%--});--%>
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
        <div class="con_area">
            <div class="nav">
                <h2>Menu</h2>
                <div class="h2_border_bottom"></div>
                <ul>
                    <c:forEach var="typeDto" items="${typeDto}">
                        <li>
                            <a href="<c:url value='/product?num=${typeDto.num}'/>">
                                <img src="<c:url value='./img/product_list/product_${typeDto.img}.png'/>" alt="">
                                <p>${typeDto.txt}</p>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="restaurant_list">

                <div class="restaurant_list_L_total">
                    <div class="restaurant_L_count"></div>
                </div>
                <div class="restaurant_R_total">
                    <div class="restaurant_R_title">
                        <span>${typeDto[param.num-1].txt}</span>
                    </div>
                    <c:forEach var="restaurantDto" items="${restaurantDto}">
                        <div class="restaurant_R restaurant_R1">
                            <a href="<c:url value='/item?num=${restaurantDto.num}'/>">
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
                                    <span>#${typeDto[restaurantDto.type_num-1].txt} #${tagDto[restaurantDto.tag_num-1].txt}</span>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
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
    <script src="./js/common.js"></script>
    <script src="./js/product.js"></script>
<script>

</script>
</body>
</html>