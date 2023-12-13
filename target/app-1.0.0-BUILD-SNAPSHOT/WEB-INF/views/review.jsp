<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>

<%--<form action="" id="reg_comment" onsubmit="return false">--%>
<div class="review_content_txt review_txt_new display_none">
    <div class="review_score" id="review_score">
        <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
        <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
        <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
        <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
    </div>
    <textarea class="review_user_write" id="review_user_write"></textarea>
<%--    <div class="review_user_img">--%>
<%--        <input type="file" id="file1" multiple placeholder="이미지 선택">--%>
<%--    </div>--%>
    <div class="sub_but">
        <input type="submit" id="submit1" value="작성">
        <input type="button" id="button1" value="취소" class="review_write_del">
    </div>
</div>
<div id="list_review">

</div>

    <%--  ajax로 댓글 가져와서 넣는 부분 --%>
<script>

    let num = ${param.num};
    let user_name = $('#userName').val();

    /* 리뷰 다 불러오기 */
    let showList = function(num) {
        $.ajax({
            type: 'GET',       // 요청 메서드
            url: 'review?num='+num,  // 요청 URI
            async: false,
            /*dataType : 'json',*/   //생력하면 기본값(json) 이 들어간다.// 전송받을 데이터의 타입
            /*data : JSON.stringify(person),*/ // 위에꺼 생략하면 변환이 필요 없다.  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
            success: function (result) {
                // Tag 테이블의 row 수
                // console.log("Tag의 row: " + result);

                if (result[0] == null) {
                    $("#list_review").html(toHtml2());
                }
                // console.log("received="+result);       // result는 서버가 전송한 데이터
                // console.log("toHtml: " + toHtml(result));
                else {
                    $("#list_review").html(toHtml(result));
                }

            },
            error: function () {
                alert("error 리뷰 다 불러오기");
            } // 에러가 발생했을 때, 호출될 함수

        });
    }

    /* 댓글 다 불러오기 할때 쓰는 포멧 */
    let toHtml = function(comments) {
        let tmp2 ="";
        comments.forEach(function(reviewDto) {

            tmp2 +='<div class="review_content_txt">';
            tmp2 +='  <div class="nick_date">';
            tmp2 +='    <div class="review_nickname">'+reviewDto.user_name+'</div>';
            tmp2 +='      <div class="creation_date">'+reviewDto.date+'</div>';
            tmp2 +='      <div class="review_delete_change">';
            tmp2 +='<div data-cno='+reviewDto.num+'>';
            // 만약 로그인한 유저의 닉네임과 리뷰를 쓴 유저의 닉네임이 같다면 삭제 버튼 보여주기
            if (reviewDto.user_name == user_name) {
                tmp2 +='      <div class="review_delete">삭제</div>';
            }
            tmp2 +='  </div>';
            tmp2 +='    </div>';
            tmp2 +='  </div>';
            tmp2 +='  <div class="review_star">';
                for (let i=0; i<reviewDto.score;i++) {
            tmp2 +='      <img src="./img/icon/star.png" alt="">';
                }
                for (let i=0; i<5-reviewDto.score;i++){
            tmp2 +='      <img src="./img/icon/star_off.png" alt="">';
                }
            tmp2 +='  </div>';
            tmp2 +='  <div class="review_num1">';
            tmp2 +='    <div class="review_create">'+reviewDto.txt+'</div>';
            tmp2 +='    <div class="review_create_img">';
                if (reviewDto.img!=null) {
            tmp2 +='        <img src="./img/res_main/'+reviewDto.img+'.jpg" alt="">';
                }
            tmp2 +='    </div>';
            tmp2 +='  </div>';
            tmp2 +='</div>';
        })
        return tmp2;

    }

    let toHtml2 = function(comments) {
        let tmp2 ="";

        tmp2 +='<div class="review_content_none">';
        tmp2 +='  <div class="review_none">';
        tmp2 +='    <h3>아직 작성된 리뷰가 없어요!</h3>';
        tmp2 +='    <div class="review_icon"></div>';
        tmp2 +='  </div>';
        tmp2 +='</div>';

        return tmp2;

    }

    $(document).ready(function(){
        showList(num); // 일단 리스트 다 불러오기

        let score = 0;

        $(document).on('click', 'label', function() {
            console.log($(this).prev().val());
            score = $(this).prev().val();
        });

        /* 새 댓글 쓰기 */
        $(document).on('click','#submit1',function(){
            console.log("새 댓글 쓰기");


            // score = $('#review_score > input').click($(this).prev().val());
            // $(this).prev().val()
            console.log("score:" +score);

            let comment = $('#review_user_write').val().trim(); // 입력한 댓글을 가지고 와서 ajax의 data에 보냄.

            if(comment=="") {
                alert("리뷰 내용을 작성해주세요");
                // $('input[name="comment"]').focus();
                $('#review_user_write').focus();
                return;
            }

            // alert("="+'/board/comments?bno='+bno+"=");
            $.ajax({
                type:'POST',       // 요청 메서드
                url: '/app/add/review?num='+num,  // 요청 URI - Ex17_CommentController 의 맵핑 "/comments"가 받음
                headers : { "content-type": "application/json" }, // 요청 헤더
                //dataType : 'json', // 전송받을 데이터의 타입
                data : JSON.stringify({res_num:num, score:score, txt:comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success : function(result){
// console.log(result);
// alert("received="+result);       // result는 서버가 전송한 데이터

                    $('#review_user_write').val(""); // 댓글 쓴 부분 빈칸으로 초기화 하기
                    $('input:radio[name="rating"]').prop('checked', false); // 별점 초기화
                    showList(num); /* 컨트롤러에 보면 댓글 가져오는거랑 등록하는거랑 분리되어 있기 때문에 저 위에 만든 댓글 불러오는 showList() 를 한번 더 실행 시켜야함 */
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            });
        });

        /* '삭제'버튼 - 댓글 하나 삭제 */
        $(document).on('click','.review_delete',function(){
            let cno = $(this).parent().attr("data-cno"); // document.getElementById().dataset.cno
            let bno = num;

            console.log('리뷰 삭제');
            console.log("="+cno+","+bno+"=");
            // console.log('/app/comments/'+cno+'?bno='+bno);

            $.ajax({
                type:'DELETE',
                url: '/app/delete/'+cno+'?bno='+bno,
                success : function(result){
                    showList(bno)
                },
                error   : function(){ alert("리뷰 삭제 에러") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        });

    });

</script>
</body>
</html>

