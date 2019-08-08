function ne_update() {
  var uname_o = sessionStorage.getItem("uname")
  if (!uname_o) {
    $("#tishi").html("请先登录")
    setTimeout(function() { window.location.replace("login.html"); }, 1000)
    return
  } else {
    var uname = $("#uname").val();
    var upwd = $.md5($("#upwd").val());
    var email = $.md5($("#email").val());
    var phone = $.md5($("#phone").val());
    var user_name = $.md5($("#user_name").val());
    var birthday = $.md5($("#birthday").val());
    var uid = 1
    if (!uname == "" && !upwd == "" && !email == "" && !phone == "" && !user_name == "" && !birthday == "") {
      $.ajax({
        url: "http://127.0.0.1:8080/user/update",
        type: "post",
        data: { uname, upwd, email, phone, user_name, birthday, uname_o },
        dataType: "json",
        success: function(result) {
          $("#tishi").html(result.msg)
          if (result.msg == "修改成功") {
            window.location.replace("index.html");
            sessionStorage.setItem("uname", uname)
          }
        }
      })
    }
  }
}

// 昵称验证