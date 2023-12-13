$('.user_info_btn').click(function(){
    $('.user_info_list').removeClass('display_none').addClass('display_block');
    $('.user_save_list').removeClass('display_block').addClass('display_none');
    $('.user_review_list').removeClass('display_block').addClass('display_none');
});

$('.user_review_btn').click(function(){
    $('.user_info_list').removeClass('display_block').addClass('display_none');
    $('.user_save_list').removeClass('display_block').addClass('display_none');
    $('.user_review_list').removeClass('display_none').addClass('display_block');
   
});
$('.user_save_btn').click(function(){
    $('.user_info_list').removeClass('display_block').addClass('display_none');
    $('.user_save_list').removeClass('display_none').addClass('display_block');
    $('.user_review_list').removeClass('display_block').addClass('display_none');
   
});

// 수정 사용안함
// $(document).ready(function(){
//     function ggim_init() {
//       // for(i=init_count; i<init_count + 6; i++) {
//       for(i=0; i<10; i++) {
//           let item = '<li class="ggim_li"></li>'
//           $(item).appendTo($('.ggim_ul'))
//       }
//       $('.ggim_li').html(`<a href="./item.html">
//           <img src="" alt="">
//           <p>가게명</p>
//           <div class="ggim_list_heart">
//               <img src="./img/icon/icon_heart.jpg" alt="">
//               <span>개수</span>
//           </div>
//           <div class="ggim_name_border"></div>
//           <div class="ggim_list_num">
//               <img src="./img/icon/icon_num.jpg" alt="">
//               <span>전화번호</span>
//           </div>
//           <div class="ggim_list_place">
//               <img src="./img/icon/icon_place.png" alt="">
//               <span>강남구 식당 상세주소</span>
//           </div>
//           <div class="ggim_list_hash">
//               <span>#분류 #해시태그 #목적</span>
//           </div>
//       </a>`);
//       // init_count += 6;
//     }
//     ggim_init();
//     });
  