//����express
const express=require('express');
//�������ӳ�ģ��,�ļ�����һ����  ../
const pool=require('../pool.js');
//����·�ɶ���
var router=express.Router();
//���·��
//1.��¼�ӿ�
 router.post('/login',function(req,res){
  //��ȡpost���������
  console.log(req.body);
  //��֤�����Ƿ�Ϊ��
//  if(!req.body.uname){
//    res.send({ code:401,msg:'uname required' });
//	return;
//  }
//  if(!req.body.upwd){
//    res.send({ code:402,msg:'upwd required' });
//	return;
//  }
//  //ִ��sql���
//  //��ѯ�������Ƿ����û�����������ƥ�������
//  pool.query('SELECT * FROM xz_user WHERE uname=? AND upwd=?',[req.body.uname,req.body.upwd],function(err,result){
//    if(err) throw err;
//	//�����������Ԫ�أ�˵���ɹ����������ʧ��
//	if(result.length>0){
//	  res.send({ code:200,msg:'login suc' });
//	}else{
//	  res.send({ code:301,msg:'login err' });
//	}
//  });
});
//����·��
module.exports=router;