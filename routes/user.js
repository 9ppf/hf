//引入express
const express=require('express');
//引入连接池模块,文件的上一级是  ../
const pool=require('../pool.js');
//创建路由对象
var router=express.Router();
//添加路由
//1.注册接口
router.post('/reg',function(req,res){
   //获取post请求的数据
   //console.log(req.body);
   //验证数据是否为空
  var $uname=req.body.uname;
  var $upwd=req.body.upwd;
  var $email=req.body.email;
  var $phone=req.body.phone;
  var $user_name=req.body.user_name;
  var $gender=req.body.gender;
  var $birthday=req.body.birthday
   if(!$uname){res.send("用户名为空");return;}
   if(!$upwd){res.send("密码为空");return;}
   if(!$email){res.send("邮箱为空");return;}
   if(!$phone){res.send("手机号为空");return;}
   if(!$user_name){res.send("真实姓名为空");return;}
   if(!$gender){res.send("性别为空");return;}
   if(!$birthday){res.send("生日为空");return;}
   //把数据插入到数据库
   pool.query('INSERT INTO hanfu_user SET ?',[req.body],function(err,result){
	   if(err) throw err;
	   if(result.affectedRows>0){
		   var result="注册成功"
		   res.send(result);
	   }
   });
});

//2.登录接口
 router.post("/login",function(req,res){
	 
	 //声明变量接收获取的数据
	 var $uname=req.body.uname;
	 var $upwd=req.body.upwd;
     //验证数据是否获取成功
	 //console.log($uname,$upwd)
	 //判断获取的数据是否为空
	 if(!$uname){
		 res.send("1");//用户名为空
		 return;
	 }if(!$upwd){
		 res.send("2");//密码为空
		 return;
	 }
	 //执行sql语句，验证用户是否存在
	 var sql="select * from hanfu_user where uname=? and upwd=?";
	     pool.query(sql,[$uname,$upwd],function(err,result){
			 if(err) throw err;
			 if (result.length>0){
				 res.send("3");//登陆成功
			 }else{
				 res.send("4");//用户名或者密码错误
			 }
		 });
 });
//3.用户修改
  router.post('/update',function(req,res){
	  //获取请求的数据
	  //console.log(req.body);
	  //验证数据是否为空
	  //批量验证 遍历对象中的属性，如果属性值为空，提示属性名这一项是必须的，
	  var obj=req.body;
	  var num=400;
	  for(var key in obj){
		  num++;
         //console.log(key,obj[key]);
		 if (!obj[key]){
			 res.send({code:num,msg:key+'required'});
			 return;
		 }
	  }
	  //执行sql语句，修改编号对应的数据
	  pool.query('UPDATE hanfu_user SET uname=?,upwd=?,email=?,phone=?,user_name=?,gender=?,birthday=? WHERE uid=?',[obj.uname,obj.upwd,obj.email,obj.phone,obj.user_name,obj.gender,obj.birthday,obj.uid],function(err,result){
		  if(err) throw err;
		  if(result.affectedRows>0){
            res.send({code:200,msg:'update suc'});
		  }else{
			  res.send({code:200,msg:'update err'});
		  }
	  });
  });

//4、用户列表
  router.get('/list',function(req,res){
	  //获取数据
	  //console.log(req.query);
	  //res.send('用户列表');
	  var pno=req.query.pno;//页码
	  var count=req.query.count;//数量
	  //如果页码是空的,设置默认值为1
	  if(!pno) pno=1;
	  //如果数量为空，设置默认值为1
	  if(!count) count=1;
	  //如果不为空，需要把数据转为整型
	  pno=parseInt(pno);
	  count=parseInt(count);
	  //console.log(pno,count);
	  var start=(pno-1)*count;
	  //执行sql语句
	  pool.query('SELECT * FROM hanfu_user LIMIT ?,?',[start,count],function(err,result){
	    if(err) throw err;
		res.send(result);
	  });
  });

//5、用户检索
 router.get('/detail',function(req,res){
	 //获取数据
	 //console.log(req.query);
	 //验证数据是否为空
	 if(!req.query.uid){
		 res.send({code:401,msg:'uid required'});
		 return;
	 }
	 //执行sql语句，查询编号对应的数据
	 pool.query('SELECT * FROM hanfu_user WHERE uid=?',[req.query.uid],function(err,result){
		 if(err) throw err;
		 res.send(result[0]);
	 });
 });

//6、用户删除
router.get('/delete',function(req,res){
	//获取数据
	//console.log(req.query);
	//验证数据是否为空
	if(!req.query.uid){
		res.send({code:401,msg:'uid required'});
		return;
	}
	//执行sql语句
	pool.query('DELETE FROM hanfu_user WHERE uid=?',[req.query.uid],function(err,result){
		if(err) throw err;
		if(result.affectedRows>0){
			res.send({code:200,msg:'delete suc'});
		}else{
			res,send({code:301,msg:'delete err'});
		}
	})
});
//导出路由
module.exports=router;