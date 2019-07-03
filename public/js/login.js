function rember(){
    console.log("rember")
}
function reg(){
    window.location.replace("reg.html")
}
function forget(){
    window.location.replace("forget.html")
}
function login(){
    //创建xhr
    var xhr=new XMLHttpRequest(); 
    //绑定监听，接受响应
    //console.log(xhr);
    xhr.onreadystatechange=function(){
        if (xhr.readyState==4&&xhr.status==200){
            var result=xhr.responseText;
            var uname=document.getElementById("uname").value
            console.log(uname);
            if(result==3){
                sessionStorage.setItem("uname",uname)//"uname"类似形参，uname类似实参
                setTimeout(function(){
                    window.location.replace("index.html");
                },3000)
                setInterval(function(){
                    console.log("登陆成功")   
                },1000)                          
            }else{
                console.log("用户名或密码不正确")
            }
        }
    }
    //打开链接，创建请求
    xhr.open("post","/user/login",true);
        //发送请求
        //post方法需要修改请求头
        xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
        var formdata="uname="+uname.value+"&upwd="+upwd.value;
        xhr.send(formdata);
    }