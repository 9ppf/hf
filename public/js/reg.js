function reg() {
  var uname = $("#uname").val();
  var upwd = $.md5($("#upwd").val());
  var email = $.md5($("#email").val());
  var phone = $.md5($("#phone").val());
  var user_name = $.md5($("#user_name").val());
  var birthday = $.md5($("#birthday").val());
  $.ajax({
    url: "http://127.0.0.1:8080/user/reg",
    type: "post",
    data: { uname, upwd, email, phone, user_name, birthday },
    dataType: "json",
    success: function(result) {
      var ts = $("#tishi")
      if (result == 1) {
        ts.css("color", "green")
        ts.html("注册成功")
        ts.html("即将前往登录")
        setTimeout(function() { window.location.replace("login.html"); }, 500)
      } else if (result == 2) {
        ts.css("color", "red")
        ts.html("该手机号已注册")
      } else {
        ts.css("color", "red")
        ts.html("注册失败")
      }
      $("#uname,#upwd,#email,#phone,#user_name,#birthday").focus(function() {
        ts.html("");
      })
    }
  })
}

function show_eyes() {
  var $eyes = $(".eyes").css("background-image");
  console.log($eyes)
  if ($eyes == 'url("http://127.0.0.1:5502/public/icon/eye_yes.png")') {
    $(".eyes").css("background-image", 'url("http://127.0.0.1:5502/public/icon/eye_no.png")')
    $("#upwd").attr("type", "password")
    console.log(1)
  }
  if ($eyes == 'url("http://127.0.0.1:5502/public/icon/eye_no.png")') {
    $(".eyes").css("background-image", 'url("http://127.0.0.1:5502/public/icon/eye_yes.png")')
    $("#upwd").attr("type", "text")
    console.log(0)
  }
}

function back() {
  window.location.replace("login.html")
}