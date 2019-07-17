// 是否登陆
(function isLogin() {
  var uname = sessionStorage.getItem("uname");
  var welcome = document.querySelector("#index_nav2>a:last-child")
  var login = document.createElement("p")
  var nav2 = document.getElementById("index_nav2")
  if (uname == null) {
    alert("请先登录")
    setInterval(function () {
      window.location.replace("login.html")
    }, 3000)
  } else {
    console.log(1)
  }
})


//图片切换
function photo_change() {
  // //1. 查找触发事件的元素
  // var $imgs = $(".small_img");
  // //先查找要修改的大图片备用
  // var $big_img = $(".big_img");
  // // 获取初始化大图片的src
  // var src = `url("${pics[0].big}")`;
  // $(".big").css("background", src);
  // //2. 绑定事件处理函数
  // $imgs.click(function () {
  //   //4. 修改元素
  //   //先获得小图片身上的data-target属性值
  //   var src = $(this).attr("data-target");
  //   //属性src的值来自于外部变量src{src:src}
  //   $big_img.attr({ src })
  //   //再获得大图片路径
  //   var src = $(this).attr("data-lg");
  //   console.log(src)
  //   $(".big").css("background", `"url('${src}')"`);
  // })
}

// 中间
$(function () {
  if (location.search !== "") {
    var lid = location.search.split("=")[1];
    // 尺码选择
    $(function () {
      $("#size_f").on("click", "p", function (event) {
        var target = $(event.target);
        target.css("border", "2px solid red");
        target.siblings().css("border", "2px solid #493f3f5e")
      })
    })

    // 颜色选择
    $(function () {
      $(".color").on("click", "img", function (event) {
        var target = $(event.target);
        target.css("border", "2px solid red");
        target.siblings().css("border", "2px solid #493f3f5e")
      })
    })

    // 向后台请求数据
    $.ajax({
      url: "http://127.0.0.1:8080/product/details",
      type: "get",
      data: { lid: lid }, //冒号前是参数名，冒号后是参数值，
      dataType: "json",
      success: function (result) {
        // 先将数据结构出来
        var { product, color, pics, photos } = result;

        // 左边图片填充
        // 小图
        var little_p = ""
        for (var i = 0; i < pics.length; i++) {
          little_p += `<img src=${pics[i].small} alt="" class="l_photo small_img" data-target=${pics[i].small} data-lg="${pics[i].big}">`
        }
        $(".little_photos").html(little_p)
        //中图
        $(".big_img").attr("src", pics[0].small)

        //点击换图
        $(function(){
           //1. 查找触发事件的元素
          var $imgs = $(".small_img");
          //先查找要修改的大图片备用
          var $big_img = $(".big_img");
          // 获取初始化大图片的src
          var src = `url("${pics[0].big}")`;
          $(".big").css("background", src);
          //2. 绑定事件处理函数
          $imgs.click(function () {
            //4. 修改元素
            //先获得小图片身上的data-target属性值
            var src = $(this).attr("data-target");
            //属性src的值来自于外部变量src{src:src}
            $big_img.attr({ src })
            //再获得大图片路径
            var src = $(this).attr("data-lg");
            console.log(src)
            $(".big").css("background", `url("${src}")`);
          })
        })
        
        
        // 放大镜
        $(function () {
          //  原理鼠标进入“玻璃板”出现遮罩层，放大div的背景图片显示
          //先查找中图，大图，遮罩层
          var $big_img = $(".big_img"); //中图
          var $zhezhao = $(".zhezhao"); //遮罩层
          var $big = $(".big"); //大图片背景图

          //获得上层充当保护层的玻璃板div
          var $super_div = $(".super_div");
          //获取遮罩层的大小
          var size = $(".super_div").width();
          var size = size / 2;
          //事件绑定在上层玻璃板上，不会影响下层元素
          $super_div.mouseenter(function () {
            $zhezhao.css("display", "block");
            $big.css("display", "block");
          }).mouseleave(function () {
            $zhezhao.css("display", "none");
            $big.css("display", "none")
          }).mousemove(function (e) {
            //当鼠标在super_div上移动时，修改zhezhao的位置,
            //如果left<0，就固定在0，如果left>size，就固定在size
            //top的规则同left
            var left = e.offsetX - size / 2;
            var top = e.offsetY - size / 2;
            if (left < 0) {
              left = 0
            } else if (left > size) {
              left = size
            }
            if (top < 0) {
              top = 0;
            } else if (top > size) {
              top = size
            }
            $zhezhao.css({ left, top })
            //同时根据mask的left和top，修改$divLg的背景图片位置
            $big.css("background-position",`${-left*2}px ${-top*2}px`)
          })
        })

        // 填充右上角基本信息
        $(".details").html(product.title);
        $(".mumber2").html("￥" + product.mumber_price)
        $(".notMunmbr_p").html("￥" + product.notmumber_price)

        //商品大小，将获得的对象转为数组，再截取出相应的商品大小
        $(function () {
          var products = []
          for (var p in product) {
            products.push(product[p])
          }
          var size = products.splice(7, 5)
          var html = ""
          for (var i = 0; i < size.length; i++) {
            if (!size[i] == "") {
              html += `<p class="size_fenlei">${size[i]}</p>`
            }
          }
          $(".size_d").html(html)
        })

        // 填充颜色
        $(function () {
          var color_img = ""
          for (var j = 0; j < color.length; j++) {
            color_img += `<img src=${color[j].color} alt="">`
          }
          $(".color_d").html(color_img)
        })



        // 详情页图片,将获得的对象转化为数组
        $(function () {
          var photo = [];
          for (var ph in photos[0]) {
            photo.push(photos[0][ph])
          }
          var photo = photo.slice(1);
          var img = ""
          for (var p = 0; p < photo.length; p++) {
            if (!photo[p] == "") {
              img += `<img src=${photo[p]} alt="">`
            }
          }
          $(".x_php").html(img)
        })

      }
    })
  }
})





// 点击购物车出现购物中心
function car_click() {
  if ($('#right_aside_fu.car_click').length == 0) {
    $("#right_aside_fu").addClass("car_click");
  } else {
    $("#right_aside_fu").removeClass("car_click");
  }
}

//购物提示
function buy() {
  var uname = sessionStorage.getItem("uname");
  if (uname == null) {
    alert("请先登录")
    setInterval(function () {
      window.location.replace("login.html")
    }, 3000)
  } else {
    // 判断页面是否存在选中元素
    if ($("#size_f>.a_border").length > 0 && $(".color>.a_border").length > 0) {
      //获取输入框的值
      var $ip_value = $(".buy_count>input").val();
      // 获取选中的尺寸
      var $size = $("#size_f>.a_border").html();
      // 获取选中的颜色
      var $color = $(".color>.a_border").attr("src");
      // 提示的颜色
      $(".buy_detil>div>img").attr("src", $color);
      // 提示的尺寸
      $(".buy_w .b_value").html($size);
      //提示购买的数量
      $(".buy_w .b_count").html($ip_value);
      $(".d_buy").css("display", "block");
    } else {
      $(".buy_detil").html("").append('<div class="no_choose">没有选中您需要的商品呦</div>').addClass("ch_buy");
      $(".buy_mgs").css("height", "38vh");
      $(".ok").css("display", "none");
      $(".d_buy").css("display", "block");
    }
  }
}

// 取消购物
function b_close() {
  $(".d_buy").css("display", "none");
}

// 确定购物
function yes() {
  $(".d_buy").css("display", "none");
}


// // 详情图片
// $(function() {
//   $.ajax({
//     url: "http://127.0.0.1:8080/product/detailsImg",
//     type: "get",
//     dataType: "json",
//     success: function(result) {
//       var Imgs = result[0]
//       var imgs = []
//       for (var i in Imgs) {
//         imgs.push(Imgs[i])
//       }
//       imgs = imgs.slice(1, 23)
//       var img = ``
//       for (var src of imgs) {
//         img += `<img src=${src} alt="">`
//       }
//       $(".x_php").html(img)
//     }
//   })
// })