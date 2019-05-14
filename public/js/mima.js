            // 密码验证
            (function(){
			//  查找触发事件的元素
			var upwd=document.getElementById("upwd");
			// 查找要修改的元素
			var js2=document.getElementById("jingshi2");	
			//  绑定处理触发事件的函数
			upwd.onblur=function(){ 	
			   	// 修改元素 
				if(upwd.value==""){
					js2.innerHTML="您输入的密码为空";
					setTimeout(function(){jingshi2.innerHTML=""},1000);
				}else{
					js2.innerHTML="正确";
				}
			}
			upwd.onfocus=function(){
				if (!upwd.value==""){
						js2.innerHTML="";
					}
			}	
			})()