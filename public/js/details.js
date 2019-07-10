//图片切换
function photo_change(){
   //1. 查找触发事件的元素
    var $imgs=$(".small_img");
    //先查找要修改的大图片备用
    var $big_img=$(".big_img");
    //2. 绑定事件处理函数
    $imgs.click(function(){
            //4. 修改元素
            //先获得小图片身上的data-target属性值
            var src=$(this).attr("data-target");
            //属性src的值来自于外部变量src{src:src}
                $big_img.attr({src}) 
    })
}

// 点击购物车出现购物中心
function car_click(){
    if($('#right_aside_fu.car_click').length==0){
        $("#right_aside_fu").addClass("car_click");
    }else{
        $("#right_aside_fu").removeClass("car_click");
    }
}

//购物提示
function buy(){
    var uname=sessionStorage.getItem("uname");
    if(uname==null){
        alert("请先登录")
       setInterval(function(){
        window.location.replace("login.html")
       },3000) 
    }else{
    // 判断页面是否存在选中元素
    if($("#size_f>.a_border").length>0 && $(".color>.a_border").length>0){
        //获取输入框的值
         var $ip_value=$(".buy_count>input").val();
         // 获取选中的尺寸
         var $size=$("#size_f>.a_border").html();
         // 获取选中的颜色
         var $color=$(".color>.a_border").attr("src");
         // 提示的颜色
         $(".buy_detil>div>img").attr("src",$color);
         // 提示的尺寸
         $(".buy_w .b_value").html($size);
         //提示购买的数量
         $(".buy_w .b_count").html($ip_value);
         $(".d_buy").css("display","block");          
      }else{
         $(".buy_detil").html("").append('<div class="no_choose">没有选中您需要的商品呦</div>').addClass("ch_buy");
         $(".buy_mgs").css("height","38vh");
         $(".ok").css("display","none");
         $(".d_buy").css("display","block");   
      }
     }
}

// 取消购物
function b_close(){
    $(".d_buy").css("display","none");
}

// 确定购物
function yes(){
    $(".d_buy").css("display","none");
}