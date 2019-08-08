// 中间
$(function() {
  if (location.search !== "") {
    var lid = location.search.split("=")[1];
    // 尺码选择
    $(function() {
      $("#size_f").on("click", "p", function(event) {
        var target = $(event.target);
        target.addClass("active");
        target.siblings().removeClass("active")
      })
    })

    // 颜色选择
    $(function() {
      $(".color").on("click", "img", function(event) {
        var target = $(event.target);
        target.addClass("active");
        target.siblings().removeClass("active")
      })
    })

    // 向后台请求数据
    $.ajax({
      url: "http://127.0.0.1:8080/product/details",
      type: "get",
      data: { lid: lid }, //冒号前是参数名，冒号后是参数值，
      dataType: "json",
      success: function(result) {
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
        $(function() {
          //1. 查找触发事件的元素
          var $imgs = $(".small_img");
          //先查找要修改的大图片备用
          var $big_img = $(".big_img");
          // 获取初始化大图片的src
          var src = `url("${pics[0].big}")`;
          $(".big").css({ "background-image": src });
          //2. 绑定事件处理函数
          $imgs.click(function() {
            //4. 修改元素
            //先获得小图片身上的data-target属性值
            var src = $(this).attr("data-target");
            //属性src的值来自于外部变量src{src:src}
            $big_img.attr({ src })
              //再获得大图片路径
            var src = $(this).attr("data-lg");
            console.log(src)
            $(".big").css("background-image", `url("${src}")`);

            console.log($(".big").css("background"))
          })
        })


        // 放大镜
        $(function() {
          //  原理鼠标进入“玻璃板”出现遮罩层，放大div的背景图片显示
          //先查找中图，大图，遮罩层
          var $big_img = $(".big_img"); //中图
          var $zhezhao = $(".zhezhao"); //遮罩层
          var $big = $(".big"); //大图片背景图

          //获得上层充当保护层的玻璃板div
          var $super_div = $(".super_div");
          //获取遮罩层的大小
          var size = $(".super_div").width();
          // 放大镜的背景图的大小
          var big_size = 2 * size;
          var size = size / 2;
          //事件绑定在上层玻璃板上，不会影响下层元素
          $super_div.mouseenter(function() {
            $zhezhao.css("display", "block");
            $big.css("display", "block");
          }).mouseleave(function() {
            $zhezhao.css("display", "none");
            $big.css("display", "none")
          }).mousemove(function(e) {
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
            $big.css({
              "background-size": `${big_size}px ${big_size}px`,
              "background-position": `${-left*2}px ${-top*2}px`
            })
          })
        })

        // 填充右上角基本信息
        $(".details").html(product.title);
        $(".mumber2").html("￥" + product.mumber_price)
        $(".notMunmbr_p").html("￥" + product.notmumber_price)

        //商品大小，将获得的对象转为数组，再截取出相应的商品大小
        $(function() {
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
        $(function() {
          var color_img = ""
          for (var j = 0; j < color.length; j++) {
            color_img += `<img src=${color[j].color} alt="">`
          }
          $(".color_d").html(color_img)
        })

        // 详情页图片,将获得的对象转化为数组
        $(function() {
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


// 图片加载完后获取高度
$(window).load(function() {
  //详情图片的上部分的高度

  $(function() {
    var topHeight = $(".shang").outerHeight()
    var photos = $(".x_photos").outerHeight() + topHeight
    var x_bc = $(".pack").outerHeight() + photos
    var x_pj = $(".evaluate").outerHeight() + x_bc
    $(window).scroll(function() {
      // 如果大于上半部分，添加固定
      if ($(window).scrollTop() > topHeight) {
        $(".x_title").addClass("flex")
      }
      // 如果小于上半部分，移除固定
      if ($(window).scrollTop() < topHeight) {
        $(".x_title").removeClass("flex")
      }
      // 如果大于详情照片小于包装及评价,给包装添加选中,其余兄弟移除
      if ($(window).scrollTop() > photos && $(window).scrollTop() < x_bc) {
        $(".x_bc").addClass("x_active").siblings().removeClass("x_active")
      }
      // 如果大于包装小于评价,给评价添加选中
      if ($(window).scrollTop() > x_bc && $(window).scrollTop() < x_pj) {
        $(".x_pj").addClass("x_active").siblings().removeClass("x_active")
      }
      // 如果大于评价，给售后添加选中
      if ($(window).scrollTop() > x_pj) {
        $(".x_bz").addClass("x_active").siblings().removeClass("x_active")
      }
    })

  })

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
  $(".buy_mgs").css("height", "45vh");
  $(".ok").css("display", "none");
  $(".d_buy").css("display", "none");
  if (uname == null) {
    alert("请先登录");
    return;
  } else {
    $(".d_buy").css("display", "block");
    if ($(".size_d>.active").length > 0) {
      if ($(".color_d>.active").length > 0) {
        //获取输入框的值
        var $ip_value = $(".buy_count>input").val();
        // 获取选中的尺寸
        var $size = $(".size_d>.active").html();
        // 获取选中的颜色
        var $color = $(".color_d>.active").attr("src");
        // 提示的颜色
        $(".buy_detil>div>img").attr("src", $color);
        // 提示的尺寸
        $(".buy_w .b_value").html($size);
        //提示购买的数量
        $(".buy_w .b_count").html($ip_value);
        $(".d_buy").css("display", "block");
        $(".ok").css("display", "block")
      } else {
        $(".buy_detil").html("").append('<div class="no_choose">请选择喜欢的颜色</div>').addClass("ch_buy");
      }
    } else {
      $(".buy_detil").html("").append('<div class="no_choose">请选择合适的尺寸</div>').addClass("ch_buy");
    }
  }
}

// 取消购物
function b_close() {
  $(".d_buy").css("display", "none");
}

// 确定购物
function yes() {
    var color_img=$(".buy_detil img").attr("src");
    var size_d=$(".b_value").html();
    var b_count=$(".b_count").html();
    sessionStorage.setItem("color_img",color_img)
    sessionStorage.setItem("size_d",size_d)
    sessionStorage.setItem("b_count",b_count)
    console.log(color_img,size_d,b_count)
}

// 添加购物车
function addCart() {
  var uname = sessionStorage.getItem("uname");
  $(".buy_mgs").css("height", "45vh");
  $(".ok").css("display", "none");
  $(".d_buy").css("display", "none");
  if (uname == null) {
    alert("请先登录")
    setInterval(function() {
      window.location.replace("login.html")
    }, 500)
    return;
  } else {
    $(".d_buy").css("display", "block");
    if ($(".size_d>.active").length > 0) {
      if ($(".color_d>.active").length > 0) {
        //获取输入框的值
        var $ip_value = $(".buy_count>input").val();
        // 获取选中的尺寸
        var $size = $(".size_d>.active").html();
        // 获取选中的颜色
        var $color = $(".color_d>.active").attr("src");
        // 提示的颜色
        $(".buy_detil>div>img").attr("src", $color);
        // 提示的尺寸
        $(".buy_w .b_value").html($size);
        //提示购买的数量
        $(".buy_w .b_count").html($ip_value);
        $(".d_buy").css("display", "block");
        $(".ok").css("display", "block");
        $(".ok>a").attr("href", "javascript:;")
      } else {
        $(".buy_detil").html("").append('<div class="no_choose">请选择喜欢的颜色</div>').addClass("ch_buy");
      }
    } else {
      $(".buy_detil").html("").append('<div class="no_choose">请选择合适的尺寸</div>').addClass("ch_buy");
    }
  }
}