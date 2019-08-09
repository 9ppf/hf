// 记住密码
function rember() {
  var $check = document.querySelector(".check");
  var $uname = document.getElementById("uname").value;
  var $upwd = document.getElementById("upwd").value;
  var $checked = document.querySelector(".check").checked;
  if ($check.checked == true) {
    if (!$uname == "" && !upwd == "") {
      localStorage.setItem("$uname", $uname);
      localStorage.setItem("$upwd", $upwd);
      localStorage.setItem("$checked", $checked);
    }
  }
  if ($check.checked == false) {
    localStorage.removeItem("$uname");
    localStorage.removeItem("$upwd");
    localStorage.removeItem("$checked");
  }
}

// 新用户注册
function reg() {
  window.location.replace("reg.html")
}

// 忘记密码
function forget() {
  window.location.replace("forget.html")
}

// 登录验证
function login() {
  var uname = $("#uname").val();
  var upwd = $.md5($("#upwd").val());
  $.ajax({
    url: "http://127.0.0.1:8080/user/login",
    type: "post",
    data: { uname, upwd },
    dataType: "json",
    success: function(result) {
      var uid = result.uid;
      var ts = $("#tishi")
      if (result.code == 3) {
        sessionStorage.setItem("uname", uname) //"uname"类似形参，uname类似实参
        sessionStorage.setItem("uid", uid)
        ts.css("color", "green")
        ts.html(result.msg);
        ts.html("即将跳转到首页")
        setTimeout(function() { window.location.replace("index.html"); }, 500)
      } else {
        ts.html(result.msg)
        $("#uname,#upwd").focus(function() {
          ts.html("")
        })
      }
    }
  })
}

// 保存用户信息
function get() {
  var $uname = localStorage.getItem("$uname");
  var $upwd = localStorage.getItem("$upwd");
  var $checked = localStorage.getItem("$checked");
  var uname = document.getElementById("uname");
  var upwd = document.getElementById("upwd");
  var check = document.querySelector(".check")
  uname.value = $uname;
  upwd.value = $upwd;
  check.checked = $checked
}