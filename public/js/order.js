$(function() {
  var uname = sessionStorage.getItem("uname");
  var color_img = sessionStorage.getItem("color_img");
  var size_d = sessionStorage.getItem("size_d");
  var b_count = sessionStorage.getItem("b_count")
  console.log(uname, color_img, size_d, b_count)
  $.ajax({
    url: "http://127.0.0.1:8080/user/buy",
    type: "get",
    data: { uname: uname },
    dataType: "json",
    success: function(result) {
      var add = ""
      for (var i = 0; i < result.length; i++) {
        add += `<div>${result[i].receiver}</div>`
      }
      $("#add").html(add)
      var product_datil = `<div>
         <img src="${color_img}">
      ${size_d}${b_count}
      </div>`
      $("#product_detail").html(product_datil)
    }
  })
})