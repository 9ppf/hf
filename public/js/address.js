// 二级菜单
$(function() {
  $.ajax({
    url: "http://127.0.0.1:8080/user/city",
    type: "get",
    dataType: "json",
    success(result) {
      var cities = [];
      for (var i = 0; i < result.length; i++) {
        cities.push(result[i])
      }
      $("#province").change(function() {
        // 获取当前选项的下标位置
        var i = $(this)[0].selectedIndex
          // console.log(i)
        if (i > 0) {
          // 将下标修正为和数据库一致的下标并或取对应城市表数组
          var cts = cities[i - 1];
        }
        var ct = []
        $.each(cts, function(i, val) {
          ct.push({ name: val });
        });
        // 创建option
        var frag = `<option>—请选择—</option>`
        for (var c of ct) {
          if (!c.name == "" && typeof c.name != "number") {
            frag += `<option>${c.name}</option>`
            $("#city").html(frag)
          }
        }
      })
    }
  })
})


function add_address() {
  var uname = sessionStorage.getItem("uname");
  var receiver = $("#receiver").val();
  var cellphone = $("#cellphone").val();
  var province = $("#province option:selected").val();
  var city = $("#city option:selected").val();
  var address = $("#address").val();
  var fixedphone = $("#fixedphone").val();
  var is_default = $("#is_default input:checked").next().html();
  is_default == "是" ? is_default = 1 : is_default = 0;
  var a =
    console.log(province, city)
  $.ajax({
    url: "http://127.0.0.1:8080/user/address",
    type: "post",
    data: { uname, receiver, cellphone, province, city, address, fixedphone, is_default },
    dataType: "json",
    success: function(result) {
      $("#res").html(result.msg)
    }
  })
}

$(function() {
  $(".add_form").on("blur", "input", function(event) {
    var target = $(event.target);
    var cla = target.context.className;
    var reg = ""
    if (cla == "rec") {
      reg = /^[\u4e00-\u9fa5]{2,6}$/
      if (!target.val()) {
        target.next().css("color", "red").html("请输入收件人姓名")
      } else {
        if (!reg.test(target.val())) {
          target.next().css("color", "red").html(" 姓名不合法")
        } else {
          target.next().css("color", "green").html("格式正确")
        }
      }
    }
    if (cla == "cell") {
      reg = /^1[3-8][0-9]{9}$/
      if (!target.val()) {
        target.next().css("color", "red").html("请输入收件手机号")
      } else {
        if (!reg.test(target.val())) {
          target.next().css("color", "red").html(" 请输入正确手机号")
        } else {
          target.next().css("color", "green").html("格式正确")
        }
      }
    }
    if (cla == "dre") {
      console.log(1)
      reg = /^[\u4e00-\u9fa5]{3,60}$/
      if (!target.val()) {
        target.next().css("color", "red").html("请输入详细地址")
      } else {
        if (!reg.test(target.val())) {
          target.next().css("color", "red").html(" 地址不合法")
        } else {
          target.next().css("color", "green").html("格式正确")
        }
      }
    }
  })
})


$(function() {
  $(".add_form").on("focus", "input", function(event) {
    var target = $(event.target);
    target.val("")
    target.next().html("")
    target.parent().prev().html("")

  })
});