var swiper = new Swiper(".mySwiper", {
    slidesPerView: 4,
    spaceBetween: 0,
    loop: true,
    
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
    navigation: { // 버튼 사용자 지정
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
  },
  breakpoints: { //반응형
  // 화면의 넓이가 320px 이상일 때
    
    1: {
      slidesPerView: 1,
      spaceBetween: 0
    },
    327: {
      slidesPerView: 2,
      spaceBetween: 0
    },
    589: {
      slidesPerView: 3,
      spaceBetween: 0
    },
    775: {
      slidesPerView: 4,
      spaceBetween: 0
    }
  // 화면의 넓이가 640px 이상일 때
  //   640: {
  //     slidesPerView: 4,
  //     spaceBetween: 40
  // }
  }
})
$(window).resize(function(){ 
  if(window.innerWidth < 788) {
    $('.swiper-button-next, .swiper-rtl').css({
      right: 'var(--swiper-navigation-sides-offset,0%)',
    });
    $('.swiper-button-prev, .swiper-rtl').css({
      left: 'var(--swiper-navigation-sides-offset,0%)',
    });
      
    
  }
  if(window.innerWidth >= 788) {
    $('.swiper-button-next, .swiper-rtl').css({
      right: 'var(--swiper-navigation-sides-offset,20%)',
    });
    $('.swiper-button-prev, .swiper-rtl').css({
      left: 'var(--swiper-navigation-sides-offset,20%)',
    });
      
    
  }
  
}).resize(); 
  $(document).ready(function(){

    $(".item_info_plus").click(function(){
      $(".item_info_open_time").fadeToggle(500);
    });
    $(".open_time_minus").click(function(){
      $(".item_info_open_time").fadeToggle(500);
    });

    $(document).on('click', '.detail_btn', function() {
      $(this).next('.detail_pan').slideToggle(500);
    });

    $(".item_info_menu_plus").click(function(){
      $(".item_menu_plus").css({
        display: "block"
      });
    });
    
    $(".item_menu_list > p").click(function(){
      $(".item_menu_plus").css({
        display: "none"
      });
    });

    $('#button1').click(function(){
      $('.review_txt_new').slideUp(500);
    })
  });
  const drawStar = (target) => {
    document.querySelector(`.star span`).style.width = `${target.value * 20}%`;
  };
 

  $(document).on('click', 'label', function() {
    console.log(+$(this).prev().val());
  });
  

