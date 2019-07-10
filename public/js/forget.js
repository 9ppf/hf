function forget(){
    //创建异步对象
    var xhr=new XMLHttpRequest();
    //绑定监听，接收响应
    xhr.onreadystatechange=function(){
        if (xhr.readyState==4&&xhr.status==200){
            var result=xhr.responseText;
            var newP=document.querySelector("#upwd")
            var confirm=document.querySelector(".confirm");
            var for_result=document.querySelector(".for_result")
            // 用户存在时
            if(result==1){
                if(newP.value==""){
                    for_result.style.color="red"
                    for_result.innerHTML="请输入新密码"
                    setInterval(function(){for_result.innerHTML=""},1000) 
                }else if(confirm.value==""){
                    for_result.style.color="red"
                    for_result.innerHTML="请确定密码"
                    setInterval(function(){for_result.innerHTML=""},1000) 
                }else if(newP.value==confirm.value){
                    for_result.style.color="green" 
                    for_result.innerHTML="修改成功"              
                    // alert("修改成功")
                    setTimeout(function(){for_result.innerHTML="3秒后跳转到登录界面"},1000)
                    setTimeout(function(){for_result.innerHTML="2秒后跳转到登录界面"},2000)
                    setTimeout(function(){for_result.innerHTML="1秒后跳转到登录界面"},3000)
                    setTimeout(function(){window.location.replace("login.html");},3000)
                }else{
                    for_result.style.color="red"
                    for_result.innerHTML="输入密码不一致"
                    setInterval(function(){for_result.innerHTML=""},1000)            // alert("输入密码不一致")
                }
            }else if(result==0){//输入手机号为空
                for_result.style.color="red"
                for_result.innerHTML="手机号为空"
                setInterval(function(){for_result.innerHTML=""},1000) 
            }else{//输入手机号未注册
                for_result.style.color="red"
                for_result.innerHTML="不存在" 
                setInterval(function(){for_result.innerHTML=""},1000)  
            }
        }
    }
    //打开链接，创建请求
    xhr.open("post","/user/forget",true);
    //发送请求
        //修改请求头信息
    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    var formdata="phone="+$.md5(phone.value)+"&upwd="+$.md5(upwd.value);
    console.log(formdata)
    xhr.send(formdata);
    }  

    function back(){
        window.location.replace("login.html")
    }
