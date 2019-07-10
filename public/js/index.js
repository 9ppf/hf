// 一楼女装
$(function(){
    $(".girl_details1").mouseenter(function(){
       $(this).parent().find(".girl_details1>.index_botton1")
       .css("transform","translateY(-0px)")
       $(this).parent().find(".girl_details1>div:first-child").css("opacity"," 0")
    }).mouseleave(function(){
        $(".index_botton1").css("transform","translateY(200px)")
        $(".girl_details1>div:first-child").css("opacity"," 1") 
    })
})
$(function(){
   $(".index_zhezhao").mouseenter(function(){
       $(this).parent().parent().find(".g2>div:nth-child(2)").css("opacity"," 0")
   }).mouseleave(function(){
    $(this).parent().parent().find(".g2>div:nth-child(2)").css("opacity"," 1") 
   })
})

function jump(){
    window.location.replace("girl1_details.html")
}

function goLogin(){
    setTimeout(function(){
        alert("即将前往登录")
        window.location.replace("login.html")
    },500)
}