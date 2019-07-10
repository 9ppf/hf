// 点击按钮让数量变化

    // 找到触发事件的元素
    // var data = document.getElementsByClassName("data");
    var btns = document.getElementsByClassName("check");
    // 绑定触发事件
    //遍历btns
    for (var btn of btns) {
        //  console.dir(btn);
        btn.onclick = function () {
            var btn = this;
            var input = btn.parentNode.children[1];
            console.log(input)
            var n = parseInt(input.value);// 找到要修改的元素
            console.log(n)
            // 修改元素
            if (btn.innerHTML == "+") {
                n++;
            } else if (n > 1) {
                n--;
            }
            input.value = n;
        }
    }
