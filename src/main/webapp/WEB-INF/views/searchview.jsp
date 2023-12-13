<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>

<%@ page session="false" %> <%-- 이 페이지에서는 세션을 새로 생성 안하겠다 라는 뜻 --%>
<c:set var="logInOutLink" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'/login':'/login/logout'}" />
<c:set var="logInOutTxt" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'로그인':'로그아웃'}" />
<c:set var="userName" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'':pageContext.request.getSession(false).getAttribute('name')}" />
<%--    ***************** 이 위에 전체 추가 ****************** --%>

<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>

</head>
<body>

    <div class="right_sec">
        <div class="teg_box"></div>
        <div class="restaurant_list">
            <ul class="search_ul" id="search_ul">
<%--        tohtml 들어갈 부분   --%>
            </ul>
        </div>
    </div>

</body>
</html>

<script>
    // 현재 URL에서 쿼리 문자열 가져오기
    const queryString = window.location.search;

    // URLSearchParams 객체를 사용하여 쿼리 문자열 파싱
    const urlParams = new URLSearchParams(queryString);

    // keyword 변수 값 저장
    const keyword = urlParams.get('keyword');

    console.log(keyword);

    /* 검색 다 불러오기 */
    let showList = function(keyword) {
        $.ajax({
            type: 'GET',       // 요청 메서드
            url: 'searchView?keyword='+keyword,  // 요청 URI
            async: false,
            /*dataType : 'json',*/   //생력하면 기본값(json) 이 들어간다.// 전송받을 데이터의 타입
            /*data : JSON.stringify(person),*/ // 위에꺼 생략하면 변환이 필요 없다.  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
            success: function (result) {
                if (result[0] == null) {
                    $("#search_ul").html(toHtml2());
                }
                else {
                    $("#search_ul").html(toHtml(result));
                }

            },
            error: function () {
                alert("error 검색 다 불러오기");
            } // 에러가 발생했을 때, 호출될 함수

        });
    }

    /* 댓글 다 불러오기 할때 쓰는 포멧 */
    let toHtml = function(restaurant) {
        let tmp2 ="";
        restaurant.forEach(function(restaurantDto) {

            tmp2 +='<li class="search_li">';
            tmp2 +=`<a href="/app/item?num=${'${restaurantDto.num}'}">`;
            tmp2 +='    <img src="./img/res_main/'+restaurantDto.img+'.jpg" alt="">';
            tmp2 +='      <p>'+restaurantDto.name+'</p>';
            tmp2 +='      <div class="restaurant_list_heart">';
            tmp2 +=`        <label for="jjim${'${restaurantDto.num}'}">`;

            <c:if test="${empty userName}">
                tmp2 +='        <input type="checkbox" class="jjim" id="jjim'+restaurantDto.num+'" value="'+restaurantDto.num+'">';
            </c:if>

            <c:if test="${not empty userName}">
                // if로 유저가 찜한건지 확인해야함
                <c:if test="${restaurantDto.user_num == 0}">
                    tmp2 +='        <input type="checkbox" class="jjim" id="jjim'+restaurantDto.num+'" value="'+restaurantDto.num+'">';
                </c:if>
                <c:if test="${restaurantDto.user_num != 0}">
                    tmp2 +='        <input type="checkbox" class="jjim" id="jjim'+restaurantDto.num+'" value="'+restaurantDto.num+'" checked>';
                </c:if>
            </c:if>

            tmp2 +='        <img class="jjim_img jjim_img1" src="./img/icon/like_off.png" alt="">';
            tmp2 +='        <img class="jjim_img jjim_img2" src="./img/icon/like_on.png" alt="">';
            tmp2 +='        </label>';

            tmp2 +='      </div>';
            tmp2 +='      <div class="name_border"></div>';
            tmp2 +='      <div class="restaurant_list_num">';
            tmp2 +='        <img src="./img/icon/icon_num.jpg" alt="">';
            tmp2 +='        <span>'+restaurantDto.tel+'</span>';
            tmp2 +='      </div>';
            tmp2 +='      <div class="restaurant_list_place">';
            tmp2 +='        <img src="./img/icon/icon_place.png" alt="">';
            tmp2 +='        <span>'+restaurantDto.address+'</span>';
            tmp2 +='      </div>';
            tmp2 +='      <div class="restaurant_list_hash">';
            tmp2 +='        <span>#'+restaurantDto.type_num+' #'+restaurantDto.tag_num+' #'+restaurantDto.city+'</span>';
            tmp2 +='      </div>';
            tmp2 +='    </a>';
        })
        return tmp2;

    }

    let toHtml2 = function(comments) {
        let tmp2 ="";


        tmp2 +='<div class="review_content_none">';
        tmp2 +='  <div class="review_none">';
        tmp2 +='    <h3>검색된 가게가 없어요!</h3>';
        tmp2 +='    <div class="review_icon"></div>';
        tmp2 +='  </div>';
        tmp2 +='</div>';

        return tmp2;

    }


    $(document).ready(function(){

        showList(keyword); // 일단 리스트 다 불러오기



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

            let s_ul_o_top = $('.search_ul').offset().top;
            let s_ul_o_bot = s_ul_o_top + $('.search_ul').height();
            if(init_count < 60/*아이템개수*/) {
                if($(window).scrollTop() + $(window).height() >= s_ul_o_bot + 10 ) {
                    search_init();
                }
            }
        });

    });
</script>