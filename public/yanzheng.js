//   昵称验证,小于等于10个汉字
   function nicheng(){
    // 昵称正则
    var $uname=/^[\u4e00-\u9fa5]{3,10}$/
    // 找到触发事件的元素
     var uname=document.getElementById("uname");
    // 找到要修改的元素
    var js1=document.getElementById("jingshi1");
    // 绑定触发事件的处理函数
    uname.onblur=function(){
     // 修改元素
    if(uname.value==""){
        js1.setAttribute("class","jingshi1");
        js1.innerHTML="您输入的昵称为空";
        setTimeout(function(){jingshi1.innerHTML=""},1000);
    }else if(!$uname.test(uname.value)){
        js1.setAttribute("class","jingshi1");
        js1.innerHTML="昵称格式不正确";
        setTimeout(function(){jingshi1.innerHTML=""},1000);
     }
    }
    uname.onfocus=function(){
     if (!uname.value==""){js1.innerHTML="";}
          }
    }

// 密码验证,8-10位
    function mima(){
     //  密码正则
     var $upwd=/^[0-9a-zA-z]{8,10}$/; 
     //  查找触发事件的元素
     var upwd=document.getElementById("upwd");
    // 查找要修改的元素
     var js2=document.getElementById("jingshi2");	
    //  绑定处理触发事件的函数
     upwd.onblur=function(){ 	
        // 修改元素 
        if(upwd.value==""){
            js2.setAttribute("class","jingshi1");
            js2.innerHTML="您输入的密码为空";
            setTimeout(function(){jingshi2.innerHTML=""},1000);
        }else if(!$upwd.test(upwd.value)){
            js2.setAttribute("class","jingshi1");
            js2.innerHTML="密码格式不正确";
            setTimeout(function(){jingshi2.innerHTML=""},1000);
        }
     }
     upwd.onfocus=function(){
        if (!upwd.value==""){js2.innerHTML="";}
     }	
    }

// 邮箱验证,
function youxiang(){
    // 邮箱验证
    var $email=/^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/
    // 查找触发元素
    var email=document.getElementById("email");
    // 查找修改元素
    var js3=document.getElementById("jingshi3");
    // 绑定处理触发事件函数
    email.onblur=function(){
        // 修改元素
      if(email.value==""){
         js3.setAttribute("class","jingshi1");
         js3.innerHTML="您输入的密码为空";
         setTimeout(function(){jingshi3.innerHTML=""},1000);
      }else if(!$email.test(email.value)){
        js3.setAttribute("class","jingshi1");
        js3.innerHTML="邮箱格式不正确";
        setTimeout(function(){jingshi3.innerHTML=""},1000);
     }
    }
    email.onfocus=function(){
    setTimeout(function(){jingshi3.innerHTML=""},0.001);
    if (!email.value==""){js3.innerHTML="";}
    }
  }	

// 手机号验证,11位数字
function phone(){
    // 手机正则
    var $mobilereg1 = /^1[3-8][0-9]{9}$/;
    // 查找触发事件的元素
    var phone=document.getElementById("phone");
    // 查找要修改的元素
   var js4=document.getElementById("jingshi4");
    // 绑定处理触发事件的函数
      phone.onblur=function(){
        if(phone.value==""){
            js4.setAttribute("class","jingshi1"); 
            js4.innerHTML="您输入的手机号为空";
            setTimeout(function(){jingshi4.innerHTML=""},1000);
        }else if(!$mobilereg1.test(phone.value)){
            console.log(phone.value)
            js4.setAttribute("class","jingshi1");
            js4.innerHTML="请输入正确的手机号";
            setTimeout(function(){jingshi4.innerHTML=""},1000);
        }									
      }
      phone.onfocus=function(){
        setTimeout(function(){jingshi4.innerHTML=""},0.001);
        if (!phone.value==""){js4.innerHTML="";}
        }
    }

// 真实姓名验证，2~3个汉字
function user_name(){ 
    var $user_name=/^[\u4e00-\u9fa5]{2,6}$/
    // 查找触发事件的元素
    var user_name=document.getElementById("user_name");
    // 查找要修改的元素
    var js5=document.getElementById("jingshi5");
    // 绑定处理触发事件的函数
    user_name.onblur=function(){
     if(user_name.value==""){
        js5.setAttribute("class","jingshi1"); 
        js5.innerHTML="您输入的姓名为空";
        setTimeout(function(){jingshi5.innerHTML=""},1000);
        }else if(!$user_name.test(user_name.value)){
        js5.setAttribute("class","jingshi1");
        js5.innerHTML="该姓名不合法";
        setTimeout(function(){jingshi5.innerHTML=""},1000)
        }								
    } 
    user_name.onfocus=function(){
        setTimeout(function(){jingshi5.innerHTML=""},0.001);
        if (!user_name.value==""){js5.innerHTML="";}								
     }
    }
    
// 生日验证，月份加日期
function birthday(){
    var birthday=document.getElementById("birthday");
        var js6=document.getElementById("jingshi6");
        birthday.onblur=function(){
            if(birthday.value==""){
                    js6.innerHTML="您输入的密码为空";
                    setTimeout(function(){jingshi6.innerHTML=""},1000);
                }else{
                  js6.innerHTML="正确";
                }
        }
        birthday.onfocus=function(){
            setTimeout(function(){jingshi6.innerHTML=""},0.001);
                if (!birthday.value==""){
                    js6.innerHTML="";
                }
        }   
    }

