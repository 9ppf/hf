//复选框
$(".buy_details").mouseenter(function() {
  $(".buy_count .right_check").css("opacity", "1");
  $(".buy_clear").css("opacity", "1")
}).mouseleave(function() {
  $(".buy_count .right_check").css("opacity", "0");
  $(".buy_clear").css("opacity", "0")
})
$(".buy_count .right_check").mouseenter(function() {
  $(this).css({
    "background-color": "#bfbfbf",
    "color": "#fff"
  })
}).mouseleave(function() {
  $(this).css({
    "background-color": "#f5f5f5",
    "color": "#333"
  })
})

// 小计价钱
$(function() {
  $(".cun_add").click(function() {
    // 查找到输入框
    var $input = $(this).parent().find('.input_v');
    var n = parseInt($input.val());
    // 获取数量相加减
    n++
    //给输入框重赋值  
    $input.val(n);
    // 单个商品的价钱
    var price = parseFloat($(this).parent().next().next().text().slice(1))
      // 小计
    total = price * n;
    $(this).parent().next().text("￥" + total)
      // console.log(total)
    totl()
  })

  $(".cun_min").click(function() {
    var $input = $(this).parent().find('.input_v');
    var n = parseInt($input.val());
    if (parseInt($input.val()) > 0) {
      n--
    } else {
      $input.val(0);
      $(this).attr('disabled', true);
    }
    $input.val(n)
    var price = parseFloat($(this).parent().next().next().text().slice(1))
      // 小计
    total = price * n;
    $(this).parent().next().text("￥" + total)
      // console.log(total)
    totl()
  })
})

// 复选框
$(function() {
    var $all_choose = $(".all_choose");
    var $chbs = $(".buy_details>input:first-child");
    // 全选复选框的点击事件,将全选按钮的checked属性赋值给所有复选框
    $all_choose.click(function() {
      $chbs.each(function() {
        $(this).prop("checked", $all_choose.prop("checked"))
      });
    })

    // 所有商品复选框的点击事件
    $(function() {
      $(".only_check").click(function() {
        $checked = $(this).prop("checked");
        if ($checked == false) {
          $all_choose.prop("checked", false)
        } else {
          //商品前的复选框个数
          var $num_chbs = $(".buy_details>input:first-child").length
            //选中复选框个数  
          var $num_chbd = $(".buy_details>input[type='checkbox']:checked").length
          if ($num_chbs > $num_chbd) {
            $all_choose.prop("checked", false)
          } else {
            $all_choose.prop("checked", true)
          }
          totl()
        }
      })
    })
  })
  // 总计
function totl() {
  var sum = 0;
  var $choose_buy = $("input[type='checkbox']:checked").parent().find(".one_price")
  console.log($choose_buy.text())
  $choose_buy.each(function() {
    sum += parseFloat($(this).text().slice(1));
    $("#susum").text(sum)
  })
}

window.onload = function() {
  var uname = sessionStorage.getItem("uname");
  console.log(uname)
}