// 记住密码
function rember(){
    var $check=document.querySelector(".check");
    var $uname=document.getElementById("uname").value;
    var $upwd=document.getElementById("upwd").value;
    var $checked=document.querySelector(".check").checked;
    if($check.checked==true){
        if(!$uname==""&&!upwd==""){
            localStorage.setItem("$uname", $uname);
            localStorage.setItem("$upwd", $upwd);
            localStorage.setItem("$checked", $checked);             
        }
    }
    if($check.checked==false){
        localStorage.removeItem("$uname");
        localStorage.removeItem("$upwd");
        localStorage.removeItem("$checked");
    }
}

// 新用户注册
function reg(){
    window.location.replace("reg.html")
}

// 忘记密码
function forget(){
    window.location.replace("forget.html")
}

// 登录验证
function login(){
    //创建xhr
    var xhr=new XMLHttpRequest(); 
    //绑定监听，接受响应
    //console.log(xhr);
    xhr.onreadystatechange=function(){
        if (xhr.readyState==4&&xhr.status==200){
            var result=xhr.responseText;
            var uname=document.getElementById("uname").value;
            var ts=document.getElementById("tishi");
            console.log(ts)
            console.log(uname);
            if(result==3){
                sessionStorage.setItem("uname",uname)//"uname"类似形参，uname类似实参
                ts.style.color="green"
                ts.innerHTML="3s后跳转到首页"
                setTimeout(function(){
                ts.innerHTML="2s后跳转到首页"
                },1000)
                setTimeout(function(){
                ts.innerHTML="1s后跳转到首页"
                },2000)
                setTimeout(function(){
                    window.location.replace("index.html");
                },3000)                         
            }else{
                ts.innerHTML="用户名或密码不正确"
                setTimeout(function(){
                   ts.innerHTML=""
                },2000) 
            }
        }
    }
    //打开链接，创建请求
    xhr.open("post","/user/login",true);
        //发送请求
        //post方法需要修改请求头
        xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
        var formdata="uname="+uname.value+"&upwd="+$.md5(upwd.value);
        xhr.send(formdata);
    }