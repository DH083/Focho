$(document).ready(function(){


    // let init_count = 0;
    // function search_init() {
    //     for(i=init_count; i<init_count + 6; i++) {
    //         let item = '<li class="search_li"></li>'
    //         $(item).appendTo($('.search_ul'))
    //     }
    //
    //     $('.search_li').html(`<a href="./item.html">
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
    // search_init();




  // $(window).scroll(function() {
  //
  //   var position = $(window).scrollTop();
  //   $(".left_sec").stop().animate({"top":position+150+"px"},500);
  //
  //   let s_ul_o_top = $('.search_ul').offset().top;
  //   let s_ul_o_bot = s_ul_o_top + $('.search_ul').height();
  //   if(init_count < 60/*아이템개수*/) {
  //       if($(window).scrollTop() + $(window).height() >= s_ul_o_bot + 10 ) {
  //           search_init();
  //       }
  //   }
  // });
});