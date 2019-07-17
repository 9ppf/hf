$(".select").click(function(){
//    var msg= $(".nav1_1").val()
//    var reg1=/(hanfu)|(汉服)/ //搜索所有汉服
//    var reg2=/(nv)|(女)/  //女装
//    var reg3=/(tong)|(童)/  //童装
//    var reg4=/(nan)|男/
//    if(reg1.test(msg)){
//        console.log("汉服");
//        return
//    }else if(reg2.test(msg)){
//       console.log("女汉服");
//       return
//    }else if(reg3.test(msg)){
//       console.log("童汉服");
//       return
//    }else if(reg4.test(msg)){
//        console.log("男装");
//        return
//    }
//    else{
//     console.log("没有匹配");
//    }
  var msg="女装"
   $.ajax({
    url:"http://127.0.0.1:8080/product/select?title",
    type:"get",
    dataType:"json",
    success:function(result){
         console.log(result)
    }
});
})