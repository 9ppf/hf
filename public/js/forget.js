function forget() {
  var phone = $.md5($("#phone").val());
  var upwd = $.md5($("#upwd").val());
  if (!$("#upwd").val() == "" || !$(".confirm").val() == "") {
    if ($("#upwd").val() == $(".confirm").val()) {
      $.ajax({
        url: "http://127.0.0.1:8080/user/forget",
        type: "post",
        data: { phone, upwd },
        dataType: "json",
        success: function(result) {
          if (result.code == 1) {
            $(".for_result").css("color", "green").html(result.msg)
            setTimeout(function() { window.location.replace("login.html"); }, 1000)
          } else {
            $(".for_result").css("color", "red").html(result.msg)
          }
        }
      })
    } else {
      $(".for_result").css("color", "red").html("输入密码不一致")
    }
  } else {
    $(".for_result").css("color", "red").html("手机号或者密码为空");
    $("#phone,#upwd,.confirm").focus(function() {
      $(".for_result").html("")
    })
  }
}

function back() {
  window.location.replace("login.html")
}