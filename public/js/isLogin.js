function isLogin(){
var uname=sessionStorage.getItem("uname");
var welcome=document.querySelector("#index_nav2>a:last-child")
var login=document.createElement("p")
var nav2=document.getElementById("index_nav2")
if(uname==null){
    alert("请先登录")
   setInterval(function(){
    window.location.replace("login.html")
   },3000) 
}else{
    console.log(1)
    // welcome.innerHTML=""
    // login.innerHTML=uname
    // nav2.appendChild(login)
    // console.log(uname)
 }
}