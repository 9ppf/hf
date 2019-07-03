//  原理鼠标进入“玻璃板”出现遮罩层，放大div的背景图片显示
//先查找中图，大图，遮罩层
var $big_img=$(".big_img");//大图
var $zhezhao=$(".zhezhao");//遮罩层
var $big=$(".big");//大图片背景图
                                    
//获得上层充当保护层的玻璃板div
 var $super_div=$(".super_div");
//获取遮罩层的大小
var size=$(".super_div").width();
var size=size/2;
//事件绑定在上层玻璃板上，不会影响下层元素
$super_div.mouseenter(function(){
    // 获取中图片的src
    var src=`url("${$big_img[0].src}")`;
    $zhezhao.css("display","block");
    $big.css("display","block");
    $big.css("background",src);
}).mouseleave(function(){
    $zhezhao.css("display","none");
     $big.css("display","none")
 }).mousemove(function(e){
     //当鼠标在super_div上移动时，修改zhezhao的位置,
     //如果left<0，就固定在0，如果left>size，就固定在size
     //top的规则同left
    var left=e.offsetX-size/2;
    var top=e.offsetY-size/2;
 if(left<0){
     left=0
 }else if(left>size){
     left=size
 }
 if(top<0){
    top=0;
 }else if(top>size){
    top=size
 }
  $zhezhao.css({left,top})
 //同时根据mask的left和top，修改$divLg的背景图片位置
 })