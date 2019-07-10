function reg(){
    //创建异步对象
    var xhr=new XMLHttpRequest();
    //绑定监听，接收响应
    xhr.onreadystatechange=function(){
        if (xhr.readyState==4&&xhr.status==200){
            var result=xhr.responseText;
            var tishi=document.getElementById("tishi")
            if(result==1){
                tishi.style.color="green"
                tishi.innerHTML="注册成功"
                setTimeout(function(){ tishi.innerHTML="3s后跳转到登录页面"},1000)
                setTimeout(function(){ tishi.innerHTML="2s后跳转到登录页面"},2000)
                setTimeout(function(){ tishi.innerHTML="1s后跳转到登录页面"},3000)
                setTimeout(function(){ window.location.replace("login.html");},3000)
            }else if(result==2){
                tishi.style.color="red"
                tishi.innerHTML="该手机号已注册"            
            }else{
                tishi.style.color="red"
                tishi.innerHTML="注册失败"  
                setTimeout(function(){ tishi.innerHTML=""},1000)
            }  
        }
    }
    //打开链接，创建请求
    xhr.open("post","/user/reg",true);
    //发送请求
        //修改请求头信息
    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    var formdata="uname="+uname.value+"&upwd="+$.md5(upwd.value)+"&email="+$.md5(email.value)+"&phone="+$.md5(phone.value)+"&user_name="+$.md5(user_name.value)+"&birthday="+birthday.value;
    console.log(formdata)
    xhr.send(formdata);
    }

function show_eyes(){
    var $eyes=$(".eyes").css("background-image")
        if($eyes=='url("http://127.0.0.1:8080/icon/eye_yes.png")'){
            $(".eyes").css("background-image","url('http://127.0.0.1:8080/icon/eye_no.png')")
            $("#upwd").attr("type","password")
        }
        if($eyes=='url("http://127.0.0.1:8080/icon/eye_no.png")'){
            $(".eyes").css("background-image","url('http://127.0.0.1:8080/icon/eye_yes.png')")
            $("#upwd").attr("type","text")
        }        
}

function back(){
    window.location.replace("login.html")
}