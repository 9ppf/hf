function reg() {
  var ts = $("#tishi");
  ts.css("color", "red");
  var uname = $("#uname").val();
  var upwd = $.md5($("#upwd").val());
  var email = $.md5($("#email").val());
  var phone = $.md5($("#phone").val());
  var user_name = $.md5($("#user_name").val());
  var birthday = $.md5($("#birthday").val());
  var $uname = /^[A-Za-z]{3,10}$/;
  var $upwd = /^[0-9a-zA-z]{6,10}$/;
  var $email = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
  var $mobilereg1 = /^1[3-8][0-9]{9}$/;
  var $user_name = /^[\u4e00-\u9fa5]{2,6}$/
  var $birthday = /^(1[0-2]|0?[1-9])-(0?[1-9]|[1-2][0-9]|3[0-1])$/
  if ($uname.test($("#uname").val()) && $upwd.test($("#upwd").val()) && $email.test($("#email").val()) && $mobilereg1.test($("#phone").val()) && $user_name.test($("#user_name").val()) && $birthday.test($("#birthday").val())) {
    $.ajax({
      url: "http://127.0.0.1:8080/user/reg",
      type: "post",
      data: { uname, upwd, email, phone, user_name, birthday },
      dataType: "json",
      success: function(result) {
        if (result.code == 1) {
          ts.css("color", "green")
          ts.html(result.msg)
          ts.html("即将前往登录")
          setTimeout(function() { window.location.replace("login.html"); }, 500)
        } else {
          ts.html(result.msg)
        }
      }
    })
  } else {
    console.log(1)
    ts.html("注册失败");
  }
  $("#uname,#upwd,#email,#phone,#user_name,#birthday").focus(function() {
    ts.html("");
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