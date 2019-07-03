//动态导航栏
function nav() {
    // 获取上半部分的高度
    var $h1 = $(".shang").outerHeight();
    // console.log($h1)
    // 出现包装及其参数的下边框获取的高度
    var $h2=parseFloat($(".x_photos").css('height').slice(0,-2));
    // console.log($h2)
    var $h3=$h1+$h2;
    // console.log($h3)
    // 评价下边框的样式
    var $h4=parseFloat($(".pack").css('height').slice(0,-2));
    var $h5=$h4+$h3
    // console.log($h4);
    // 获取售后下边框样式
    var $h6=parseFloat($(".evaluate").css('height').slice(0,-2));
    // console.log($h6)
    var $h7=$h5+$h6
    $(window).scroll(function () {
        if ($(window).scrollTop() > $h1) {
            $(".x_title").addClass("flex");
        }else{
            $(".x_title").removeClass("flex");
        }
        if ($(window).scrollTop() > $h3) {
            $(".x_bc").siblings().removeClass("x_active");
            $(".x_bc").addClass("x_active")
        }else {
            $(".x_bc").prev().addClass("x_active");
            $(".x_bc").removeClass("x_active")
        }
        if ($(window).scrollTop() > $h5) {
            $(".x_pj").siblings().removeClass("x_active");
            $(".x_pj").addClass("x_active")
        } else if($(window).scrollTop() < $h5 && $(window).scrollTop() > $h3){
            $(".x_pj").prev().addClass("x_active");
            $(".x_pj").removeClass("x_active")
        }
        if ($(window).scrollTop() > $h7) {
            $(".x_bz").siblings().removeClass("x_active");
            $(".x_bz").addClass("x_active")
        } else if($(window).scrollTop() < $h7 && $(window).scrollTop() > $h5){
            $(".x_bz").prev().addClass("x_active");
            $(".x_bz").removeClass("x_active")
        }					
    }).trigger("scroll")
}
nav()