// 导航栏的搜索功能

//轮播图 
$(function () {
    // 从后台动态获取
    var $car_imgs=[
        "../img_lunbo/top_lunbo1_4.jpg",
        "../img_lunbo/top_lunbo1_1.jpg",
        "../img_lunbo/top_lunbo1_2.jpg",
        "../img_lunbo/top_lunbo1_3.jpg",
        "../img_lunbo/top_lunbo1_4.jpg"]
    var $carousel;
    // 遍历数组，动态创建li
    for(var $car_img of $car_imgs){
        //每遍历一次，动态向$carousel中创建li
        $carousel+=`<li><a href="javascript:;"><img src=${$car_img}></a></li>`
    }
    $carousel+=`<script src="../js/rotate.js"></script>`
    $("#ul-imgs").html($carousel)
})

//女装上层
$(function(){
    // 左侧
    var $girl_top1 = `						
        <div class="g1">
            <img src="../img/girl1_2.jpg" class="rounded">
            <div class="girl_details1">
                <div>
                    <div>染锦阁汉服杜若改良魏晋风古装广袖襦裙中国风刺绣古装留仙裙日常</div>
                    <div class="index_price1">
                        <div>抢购价</div>￥299
                    </div>
                </div>
                <div class="index_botton1">
                    <div onclick="javascript:jump()">查看详情</div>
                </div>
            </div>
        </div>
        <div class="g1">
            <img src="../img/girl2_14.jpg" class="rounded">
            <div class="girl_details1">
                <div>
                    <div>梨花渡原创汉服女 六米大摆仙气日常春夏齐胸对襟襦裙</div>
                    <div class="index_price1">
                        <div>抢购价</div>￥288
                    </div>
                </div>
                <div class="index_botton1">
                    <div>查看详情</div>
                </div>
            </div>
        </div>
        <div class="g1">
            <img src="../img/girl3_1.jpg" class="rounded">
            <div class="girl_details1">
                <div>
                    <div>鹿韵记原创改良汉服女汉元素立夏齐胸连衣裙春季新品日常中国风</div>
                    <div class="index_price1">
                        <div>抢购价</div>￥288
                    </div>
                </div>
                <div class="index_botton1">
                    <div>查看详情</div>
                </div>
            </div>
        </div>`
    $(".lc_left1 .lc_big_photo").html($girl_top1);
 
   // 右侧
   var $girl_top2=`
        <div class="g1">
        <img src="../img/girl5_1.jpg" class="rounded">
        <div class="girl_details1">
            <div>
                <div class="g_2">鹿韵记原创改良汉服女汉元素立夏齐胸连衣裙春季新品日常中国风</div>
                <div class="index_price2">
                    <div>抢购价</div>￥288
                </div>
            </div>
            <div class="index_botton1">
                <div>查看详情</div>
            </div>
        </div>
        </div>
        <div class="g1">
        <img src="../img/girl8_5.jpg" class="rounded">
        <div class="girl_details1">
            <div>
                <div class="g_2">鹿韵记原创改良汉服女汉元素立夏齐胸连衣裙春季新品日常中国风</div>
                <div class="index_price2">
                    <div>抢购价</div>￥288
                </div>
            </div>
            <div class="index_botton1 index_button">
                <div>查看详情</div>
            </div>
        </div>
        </div>`
    $(".lc_right1 .lc_big_photo").html($girl_top2)

   //鼠标进入，移除事件 
    $(".girl_details1").mouseenter(function () {
        $(this).parent().find(".girl_details1>.index_botton1")
            .css("transform", "translateY(-0px)")
        $(this).parent().find(".girl_details1>div:first-child").css("opacity", " 0")
    }).mouseleave(function () {
        $(".index_botton1").css("transform", "translateY(200px)")
        $(".girl_details1>div:first-child").css("opacity", " 1")
    })
})

// 女装二楼
$(function () {
    var $girl_bottom=`				
        <div>
            <div class="g2">
                <img src="../img/girl9_4.jpg" class="rounded">
                <div>
                    <div class="index_g3">
                        鹿韵记原创改良汉服女汉元素立夏齐胸连衣裙春季新品日常中国风
                    </div>
                    <div class="index_price3">
                        <div>热售中</div>
                        ￥299
                    </div>
                </div>
                <div class="index_zhezhao">
                    <div>查看详情</div>
                </div>
            </div>

        </div>
        <div>
            <div class="g2">
                <img src="../img/girl10_4.jpg" class="rounded">
                <div>
                    <div class="index_g3">
                        鹿韵记原创改良汉服女汉元素立夏齐胸连衣裙春季新品日常中国风
                    </div>
                    <div class="index_price3">
                        <div>热售中</div>
                        ￥299
                    </div>
                </div>
                <div class="index_zhezhao">
                    <div>查看详情</div>
                </div>
            </div>
        </div>
        <div>
            <div class="g2">
                <img src="../img/girl11_1.jpg" class="rounded">
                <div>
                    <div class="index_g3">
                        鹿韵记原创改良汉服女汉元素立夏齐胸连衣裙春季新品日常中国风
                    </div>
                    <div class="index_price3">
                        <div>热售中</div>
                        ￥299
                    </div>
                </div>
                <div class="index_zhezhao">
                    <div>查看详情</div>
                </div>
            </div>
        </div>
        <div>
            <div class="g2">
                <img src="../img/girl12_2.jpg" class="rounded">
                <div>
                    <div class="index_g3">
                        鹿韵记原创改良汉服女汉元素立夏齐胸连衣裙春季新品日常中国风
                    </div>
                    <div class="index_price3">
                        <div>热售中</div>
                        ￥299
                    </div>
                </div>
                <div class="index_zhezhao">
                    <div>查看详情</div>
                </div>
            </div>
        </div>
    `
    $(".louceng1_2").html($girl_bottom)

    $(".index_zhezhao").mouseenter(function () {
        $(this).parent().parent().find(".g2>div:nth-child(2)").css("opacity", " 0")
    }).mouseleave(function () {
        $(this).parent().parent().find(".g2>div:nth-child(2)").css("opacity", " 1")
    })
})

// 男装上层
$(function(){
    var $boy_top=`
        <div class="cl_title"></div>
        <div class="b1">
            <img src="../img/boy1_2.jpg" class="rounded">
            <div class="b1_zhezhao">
                <div>查看详情</div>
            </div>
        </div>
        <div class="b1">
            <img src="../img/boy2_1.jpg">
            <div class="b1_zhezhao">
                <div>查看详情</div>
            </div>
        </div>
        <div class="b1">
            <img src="../img/boy3_3.jpg" class="rounded">
            <div class="b1_zhezhao">
                <div>查看详情</div>
            </div>
        </div>
    `
    $(".louceng2_1").html($boy_top)
})

// 男装下层
$(function(){
     var $boy_bottom=`
     			<div class="b2">
					<img src="../img/boy7_1.jpg" class="rounded">
					<div class="b1_zhezhao b2_zhezhao">
						<div>查看详情</div>
					</div>
				</div>
				<div class="b2">
					<img src="../img/boy8_1.jpg" class="rounded">
					<div class="b1_zhezhao b2_zhezhao">
						<div>查看详情</div>
					</div>
				</div>
				<div class="b2">
					<img src="../img/boy9_1.jpg" class="rounded">
					<div class="b1_zhezhao b2_zhezhao">
						<div>查看详情</div>
					</div>
				</div>
				<div class="b2">
					<img src="../img/boy6_1.jpg" class="rounded">
					<div class="b1_zhezhao b2_zhezhao">
						<div>查看详情</div>
					</div>
				</div>
				<div class="b2">
					<img src="../img/boy10_1.jpg" class="rounded">
					<div class="b1_zhezhao b2_zhezhao">
						<div>查看详情</div>
					</div>
				</div>
     `
    $(".louceng2_2").html($boy_bottom)
})

// 女宝
$(function(){
    var $c_girl=`
        <div class="c_title1">最萌女宝</div>
        <div>
            <div class="c1">
                <img src="../img/cg1_1.jpg" class="rounded">
                <div class="index_zhezhao3">
                    <div>
                        <div class="c3_button">查看详情</div>
                    </div>
                    <div>
                        <div class="c3_button">查看详情</div>
                    </div>
                    <div>
                        <div class="c3_button">查看详情</div>
                    </div>
                    <div>
                        <div class="c3_button">查看详情</div>
                    </div>
                </div>
            </div>
            <div class="c1">
                <img src="../img/cg2_1.jpg" class="rounded">
                <div class="index_zhezhao3">
                    <div>
                        <div class="c3_button">查看详情</div>
                    </div>
                    <div>
                        <div class="c3_button">查看详情</div>
                    </div>
                    <div>
                        <div class="c3_button">查看详情</div>
                    </div>
                    <div>
                        <div class="c3_button">查看详情</div>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <div class="c1">
                <img src="../img/cg3_1.jpg" class="rounded">
                <div class="index_zhezhao3">
                    <div>
                        <div class="c3_button">查看详情</div>
                    </div>
                    <div>
                        <div class="c3_button">查看详情</div>
                    </div>
                    <div>
                        <div class="c3_button">查看详情</div>
                    </div>
                    <div>
                        <div class="c3_button">查看详情</div>
                    </div>
                </div>
            </div>
            <div class="c1">
                <img src="../img/cg4_1.jpg" class="rounded">
                <div class="index_zhezhao3">
                    <div>
                        <div class="c3_button">查看详情</div>
                    </div>
                    <div>
                        <div class="c3_button">查看详情</div>
                    </div>
                    <div>
                        <div class="c3_button">查看详情</div>
                    </div>
                    <div>
                        <div class="c3_button">查看详情</div>
                    </div>
                </div>
            </div>
        </div>
    `
   $(".c_girl").html($c_girl)
})

//男宝
$(function(){
    var $c_boy=`
        <div class="c_title2">最帅男宝</div>
        <div>
            <div class="c1">
                <img src="../img/cb1_1.jpg" class="rounded">
                <div class="index_zhezhao3">
                    <div>
                        <div class="c3_button cb_button">查看详情</div>
                    </div>
                    <div>
                        <div class="c3_button cb_button">查看详情</div>
                    </div>
                    <div>
                        <div class="c3_button cb_button">查看详情</div>
                    </div>
                    <div>
                        <div class="c3_button cb_button">查看详情</div>
                    </div>
                </div>
            </div>
            <div class="c1">
                <img src="../img/cb2_1.jpg" class="rounded">
                <div class="index_zhezhao3">
                    <div>
                        <div class="c3_button cb_button">查看详情</div>
                    </div>
                    <div>
                        <div class="c3_button cb_button">查看详情</div>
                    </div>
                    <div>
                        <div class="c3_button cb_button">查看详情</div>
                    </div>
                    <div>
                        <div class="c3_button cb_button">查看详情</div>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <div class="c1">
                <img src="../img/cb3_1.jpg" class="rounded">
                <div class="index_zhezhao3">
                    <div>
                        <div class="c3_button cb_button">查看详情</div>
                    </div>
                    <div>
                        <div class="c3_button cb_button">查看详情</div>
                    </div>
                    <div>
                        <div class="c3_button cb_button">查看详情</div>
                    </div>
                    <div>
                        <div class="c3_button cb_button">查看详情</div>
                    </div>
                </div>
            </div>
            <div class="c1">
                <img src="../img/cb4_1.jpg" class="rounded">
                <div class="index_zhezhao3">
                    <div>
                        <div class="c3_button cb_button">查看详情</div>
                    </div>
                    <div>
                        <div class="c3_button cb_button">查看详情</div>
                    </div>
                    <div>
                        <div class="c3_button cb_button">查看详情</div>
                    </div>
                    <div>
                        <div class="c3_button cb_button">查看详情</div>
                    </div>
                </div>
            </div>
        </div>
    `
  $(".c_boy").html($c_boy)
}) 

// 跳转到详情页
function jump() {
    window.location.replace("girl1_details.html")
}

// 跳转到登录页面
function goLogin() {
    setTimeout(function () {
        alert("即将前往登录")
        window.location.replace("login.html")
    }, 500)
}

