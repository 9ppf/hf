//引入模块
const express=require('express');
const bodyParser=require('body-parser');
const cors=require('cors');
//引入路由器
const userRouter=require('./routes/user.js');
const productRouter=require('./routes/product.js');
// const indexRouter=require('./routes/index.js')
//创建服务器
var server=express();
server.listen(8080);
// 解决跨域
server.use(cors({
  origin:"http://127.0.0.1:5502"
}))
//托管静态资源到public目录下
server.use(express.static('public'));
//使用body-parser中间件：中间件必须在服务器里使用
server.use(bodyParser.urlencoded({
	extended:false
}));
//挂载路由器，挂载到/user   路由访问  /user/reg
server.use('/user',userRouter);
// 挂载路由器，挂载到/product
server.use('/product',productRouter);
// 挂载路由，挂载到/index
// server.use('/index',indexRouter);
