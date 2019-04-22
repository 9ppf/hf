//引入模块
const express=require('express');
const bodyParser=require('body-parser');
//引入路由器
const userRouter=require('./routes/user.js');
//创建服务器
var server=express();
server.listen(8080);
//托管静态资源到public目录下
server.use(express.static('public'));
//使用body-parser中间件：中间件必须在服务器里使用
server.use(bodyParser.urlencoded({
	extended:false
}));
//挂载路由器，挂载到/user   路由访问  /user/reg
server.use('/user',userRouter);