// 导航栏的搜索功能

//轮播图 
$(function() {
  $.ajax({
    url: "http://127.0.0.1:8080/product/carousel",
    type: "get",
    dataType: "json",
    success: function(result) {
      var $carousel = ``;
      for (var $img of result) {
        $carousel += `<li><a href="javascript:;"><img src="${$img.src}"></a></li>`
      }
      $carousel += `<script src="../js/rotate.js"></script>`
      $("#ul-imgs").html($carousel)
    }
  })
})

//楼层
$(function() {
  $.ajax({
    url: "http://127.0.0.1:8080/product/index",
    type: 'get',
    dataType: 'json',
    success: function(result) {
      // 女装上层左侧          
      $(function() {
          var $girl_top1s = `
                        <div class="g1">
                            <img src=${result[0].dSrc} class="rounded">
                            <div class="girl_details1">
                                <div>
                                    <div>${result[0].detail}</div>
                                    <div class="index_price1">
                                        <div>抢购价</div>￥${result[0].price}
                                    </div>
                                </div>
                                <div class="index_botton1">
                                    <div><a href="product_details.html?lid=1">查看详情</a></div>
                                </div>
                            </div>
                        </div>
                        <div class="g1">
                        <img src=${result[1].dSrc} class="rounded">
                        <div class="girl_details1">
                            <div>
                                <div>${result[1].detail}</div>
                                <div class="index_price1">
                                    <div>抢购价</div>￥${result[1].price}
                                </div>
                            </div>
                            <div class="index_botton1">
                                <div><a href="product_details.html?lid=5">查看详情</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="g1">
                    <img src=${result[2].dSrc} class="rounded">
                    <div class="girl_details1">
                        <div>
                            <div>${result[2].detail}</div>
                            <div class="index_price1">
                                <div>抢购价</div>￥${result[2].price}
                            </div>
                        </div>
                        <div class="index_botton1">
                            <div><a href="product_details.html?lid=6">查看详情</a></div>
                        </div>
                    </div>
                </div>
                        `
          $(".lc_left1 .lc_big_photo").html($girl_top1s);
          $(".girl_details1").mouseenter(function() {
            $(this).parent().find(".girl_details1>.index_botton1")
              .css("transform", "translateY(-0px)")
            $(this).parent().find(".girl_details1>div:first-child").css("opacity", " 0")
          }).mouseleave(function() {
            $(".index_botton1").css("transform", "translateY(200px)")
            $(".girl_details1>div:first-child").css("opacity", " 1")
          })
        })
        // 女装上层右侧
      $(function() {
          var $girl_top2s = `
                        <div class="g1">
                            <img src=${result[3].dSrc} class="rounded">
                            <div class="girl_details1">
                                <div>
                                <div class="g_2">${result[3].detail}</div>
                                <div class="index_price2">
                                        <div>抢购价</div>￥${result[3].price}
                                </div>
                                </div>
                                <div class="index_botton1">
                                    <div><a href="product_details.html?lid=8">查看详情</a></div>
                                </div>
                            </div>
                        </div>
                        <div class="g1">
                        <img src=${result[4].dSrc} class="rounded">
                        <div class="girl_details1">
                            <div>
                            <div class="g_2">${result[4].detail}</div>
                            <div class="index_price2">
                                <div>抢购价</div>￥${result[4].price}
                            </div>
                            </div>
                            <div class="index_botton1">
                                <div><a href="product_details.html?lid=10">查看详情</a></div>
                            </div>
                        </div>
                    </div>
                        `
          $(".lc_right1 .lc_big_photo").html($girl_top2s)

          //鼠标进入，移除事件 
          $(".girl_details1").mouseenter(function() {
            $(this).parent().find(".girl_details1>.index_botton1").css("transform", "translateY(-0px)")
            $(this).parent().find(".girl_details1>div:first-child").css("opacity", " 0")
          }).mouseleave(function() {
            $(".index_botton1").css("transform", "translateY(200px)")
            $(".girl_details1>div:first-child").css("opacity", " 1")
          })
        })
        // 女装二楼
      $(function() {
          var $girl_bottom1 = `
                        <div>
                        <div class="g2">
                            <img src=${result[5].dSrc} class="rounded">
                                <div>
                                    <div class="index_g3">
                                        ${result[5].detail}
                                    </div>
                                    <div class="index_price3">
                                        <div>热售中</div>￥${result[5].price}
                                    </div>
                                </div>
                                <div class="index_zhezhao">
                                    <div><a href="product_details.html?lid=12">查看详情</a></div>
                                </div>
                            </div>
                        </div>
                        <div>
                        <div class="g2">
                            <img src=${result[6].dSrc} class="rounded">
                                <div>
                                    <div class="index_g3">
                                        ${result[6].detail}
                                    </div>
                                    <div class="index_price3">
                                        <div>热售中</div>￥${result[6].price}
                                    </div>
                                </div>
                                <div class="index_zhezhao">
                                    <div><a href="product_details.html?lid=13">查看详情</a></div>
                                </div>
                            </div>
                        </div>
                        <div>
                        <div class="g2">
                            <img src=${result[7].dSrc} class="rounded">
                                <div>
                                    <div class="index_g3">
                                        ${result[7].detail}
                                    </div>
                                    <div class="index_price3">
                                        <div>热售中</div>￥${result[7].price}
                                    </div>
                                </div>
                                <div class="index_zhezhao">
                                    <div><a href="product_details.html?lid=14">查看详情</a></div>
                                </div>
                            </div>
                        </div>
                        <div>
                        <div class="g2">
                            <img src=${result[8].dSrc} class="rounded">
                                <div>
                                    <div class="index_g3">
                                        ${result[8].detail}
                                    </div>
                                    <div class="index_price3">
                                        <div>热售中</div>￥${result[8].price}
                                    </div>
                                </div>
                                <div class="index_zhezhao">
                                    <div><a href="product_details.html?lid=16">查看详情</a></div>
                                </div>
                            </div>
                        </div>
                        `
          $(".louceng1_2").html($girl_bottom1);
          $(".index_zhezhao").mouseenter(function() {
            $(this).parent().parent().find(".g2>div:nth-child(2)").css("opacity", " 0")
          }).mouseleave(function() {
            $(this).parent().parent().find(".g2>div:nth-child(2)").css("opacity", " 1")
          })
        })
        //男装上层
      $(function() {
          $boy_top = `
                        <div class="cl_title"></div>
                        <div class="b1">
                            <img src=${result[9].dSrc} class="rounded">
                            <div class="b1_zhezhao">
                                <div><a href="product_details.html?lid=19">查看详情</a></div>
                            </div>
                        </div>
                        <div class="b1">
                            <img src=${result[10].dSrc} class="rounded">
                            <div class="b1_zhezhao">
                                <div><a href="product_details.html?lid=21">查看详情</a></div>
                            </div>
                        </div>
                        <div class="b1">
                            <img src=${result[11].dSrc} class="rounded">
                            <div class="b1_zhezhao">
                                <div><a href="product_details.html?lid=22">查看详情</a></div>
                            </div>
                        </div>
                        `

          $(".louceng2_1").html($boy_top)
        })
        // 男装二楼
      $(function() {
          var $boy_bottom = `
                        <div class="b2">
                            <img src=${result[12].dSrc} class="rounded">
                            <div class="b1_zhezhao b2_zhezhao">
                                <div><a href="product_details.html?lid=24">查看详情</a></div>
                            </div>
                        </div>
                        <div class="b2">
                            <img src=${result[13].dSrc} class="rounded">
                            <div class="b1_zhezhao b2_zhezhao">
                                <div><a href="product_details.html?lid=25">查看详情</a></div>
                            </div>
                        </div>
                        <div class="b2">
                            <img src=${result[14].dSrc} class="rounded">
                            <div class="b1_zhezhao b2_zhezhao">
                                <div><a href="product_details.html?lid=27">查看详情</a></div>
                            </div>
                        </div>
                        <div class="b2">
                            <img src=${result[15].dSrc} class="rounded">
                            <div class="b1_zhezhao b2_zhezhao">
                                <div><a href="product_details.html?lid=29">查看详情</a></div>
                            </div>
                        </div>
                        <div class="b2">
                            <img src=${result[16].dSrc} class="rounded">
                            <div class="b1_zhezhao b2_zhezhao">
                                <div><a href="product_details.html?lid=30">查看详情</a></div>
                            </div>
                        </div>
                   `

          $(".louceng2_2").html($boy_bottom)
        })
        // 女宝
      $(function() {
          var $c_girl = `
                    <div class="c_title1">最萌女宝</div>
                    <div>
                        <div class="c1">
                            <img src=${result[17].dSrc} class="rounded">
                            <div class="index_zhezhao3">
                                <div>
                                    <div class="c3_button"><a href="product_details.html?lid=32">查看详情</a></div>
                                </div>
                                <div>
                                    <div class="c3_button"><a href="product_details.html?lid=32">查看详情</a></div>
                                </div>
                                <div>
                                    <div class="c3_button"><a href="product_details.html?lid=32">查看详情</a></div>
                                </div>
                                <div>
                                    <div class="c3_button"><a href="product_details.html?lid=32">查看详情</a></div>
                                </div>
                            </div>
                        </div>
                        <div class="c1">
                            <img src=${result[18].dSrc} class="rounded">
                            <div class="index_zhezhao3">
                                <div>
                                    <div class="c3_button"><a href="product_details.html?lid=33">查看详情</a></div>
                                </div>
                                <div>
                                    <div class="c3_button"><a href="product_details.html?lid=33">查看详情</a></div>
                                </div>
                                <div>
                                    <div class="c3_button"><a href="product_details.html?lid=33">查看详情</a></div>
                                </div>
                                <div>
                                    <div class="c3_button"><a href="product_details.html?lid=33">查看详情</a></div>
                                </div>
                            </div>
                        </div>
                        <div class="c1">
                            <img src=${result[19].dSrc} class="rounded">
                            <div class="index_zhezhao3">
                                <div>
                                    <div class="c3_button"><a href="product_details.html?lid=35">查看详情</a></div>
                                </div>
                                <div>
                                    <div class="c3_button"><a href="product_details.html?lid=35">查看详情</a></div>
                                </div>
                                <div>
                                    <div class="c3_button"><a href="product_details.html?lid=35">查看详情</a></div>
                                </div>
                                <div>
                                    <div class="c3_button"><a href="product_details.html?lid=35">查看详情</a></div>
                                </div>
                            </div>
                        </div>
                        <div class="c1">
                            <img src=${result[20].dSrc} class="rounded">
                            <div class="index_zhezhao3">
                                <div>
                                    <div class="c3_button"><a href="product_details.html?lid=36">查看详情</a></div>
                                </div>
                                <div>
                                    <div class="c3_button"><a href="product_details.html?lid=36">查看详情</a></div>
                                </div>
                                <div>
                                    <div class="c3_button"><a href="product_details.html?lid=36">查看详情</a></div>
                                </div>
                                <div>
                                    <div class="c3_button"><a href="product_details.html?lid=36">查看详情</a></div>
                                </div>
                            </div>
                        </div>
                    </div>`
          $(".c_girl").html($c_girl)
        })
        // 男宝
      $(function() {
        var $c_boy1 = `
                    <div class="c_title2">最帅男宝</div>
                    <div>            
                        <div class="c1">
                            <img src=${result[21].dSrc} class="rounded">
                                <div class="index_zhezhao3">
                                    <div>
                                        <div class="c3_button cb_button"><a href="product_details.html?lid=39">查看详情</a></div>
                                    </div>
                                    <div>
                                        <div class="c3_button cb_button"><a href="product_details.html?lid=39">查看详情</a></div>
                                    </div>
                                    <div>
                                        <div class="c3_button cb_button"><a href="product_details.html?lid=39">查看详情</a></div>
                                    </div>
                                    <div>
                                        <div class="c3_button cb_button"><a href="product_details.html?lid=39">查看详情</a></div>
                                    </div>
                                </div>
                        </div>
                        <div class="c1">
                            <img src=${result[22].dSrc} class="rounded">
                                <div class="index_zhezhao3">
                                    <div>
                                        <div class="c3_button cb_button"><a href="product_details.html?lid=41">查看详情</a></div>
                                    </div>
                                    <div>
                                        <div class="c3_button cb_button"><a href="product_details.html?lid=41">查看详情</a></div>
                                    </div>
                                    <div>
                                        <div class="c3_button cb_button"><a href="product_details.html?lid=41">查看详情</a></div>
                                    </div>
                                    <div>
                                        <div class="c3_button cb_button"><a href="product_details.html?lid=41">查看详情</a></div>
                                    </div>
                                </div>
                        </div>
                        <div class="c1">
                            <img src=${result[23].dSrc} class="rounded">
                                <div class="index_zhezhao3">
                                    <div>
                                        <div class="c3_button cb_button"><a href="product_details.html?lid=42">查看详情</a></div>
                                    </div>
                                    <div>
                                        <div class="c3_button cb_button"><a href="product_details.html?lid=42">查看详情</a></div>
                                    </div>
                                    <div>
                                        <div class="c3_button cb_button"><a href="product_details.html?lid=42">查看详情</a></div>
                                    </div>
                                    <div>
                                        <div class="c3_button cb_button"><a href="product_details.html?lid=42">查看详情</a></div>
                                    </div>
                                </div>
                        </div>
                        <div class="c1">
                        <img src=${result[24].dSrc} class="rounded">
                            <div class="index_zhezhao3">
                                <div>
                                    <div class="c3_button cb_button"><a href="product_details.html?lid=43">查看详情</a></div>
                                </div>
                                <div>
                                    <div class="c3_button cb_button"><a href="product_details.html?lid=43">查看详情</a></div>
                                </div>
                                <div>
                                    <div class="c3_button cb_button"><a href="product_details.html?lid=43">查看详情</a></div>
                                </div>
                                <div>
                                    <div class="c3_button cb_button"><a href="product_details.html?lid=43">查看详情</a></div>
                                </div>
                            </div>
                    </div>
                    </div>
                  `
        $(".c_boy").html($c_boy1)
      })
    }
  })
})

// 跳转到登录页面
function goLogin() {
  setTimeout(function() {
    alert("即将前往登录")
    window.location.href = "login.html"
  }, 500)
}