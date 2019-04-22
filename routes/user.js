//引入express
const express=require('express');
//引入连接池模块,文件的上一级是  ../
const pool=require('../pool.js');
//创建路由对象
var router=express.Router();
//添加路由
//1.登录接口
 router.post('/login',function(req,res){
  //获取post请求的数据
  console.log(req.body);
  //验证数据是否为空
//  if(!req.body.uname){
//    res.send({ code:401,msg:'uname required' });
//	return;
//  }
//  if(!req.body.upwd){
//    res.send({ code:402,msg:'upwd required' });
//	return;
//  }
//  //执行sql语句
//  //查询数据中是否含有用户名和密码相匹配的数据
//  pool.query('SELECT * FROM xz_user WHERE uname=? AND upwd=?',[req.body.uname,req.body.upwd],function(err,result){
//    if(err) throw err;
//	//如果数组中有元素，说明成功，否则就是失败
//	if(result.length>0){
//	  res.send({ code:200,msg:'login suc' });
//	}else{
//	  res.send({ code:301,msg:'login err' });
//	}
//  });
});
//导出路由
module.exports=router;