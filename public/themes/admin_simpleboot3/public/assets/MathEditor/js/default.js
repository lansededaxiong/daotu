var EDITOR_OBJ = document.getElementById("MathEditor");

$(function () {

    window.onresize=resizeWindow;
    resizeWindow();

    //文字颜色
    var flag=1;
   $("#MathEditorTools ul li a.color").click(function () {
       if(flag==1){
           EDITOR_OBJ.focus();
           document.execCommand('styleWithCSS', false, true);
           document.execCommand('ForeColor',false,'red');
           flag=0;
       }else {
           EDITOR_OBJ.focus();
           document.execCommand('styleWithCSS', false, true);
           document.execCommand('ForeColor', false, 'black');
           flag=1;
       }
   });
});

function resizeWindow(){
    $("#MathEditor").height(parseInt($(window).height())-parseInt($("#MathEditorTools").height())-30+"px");
}

function editorInsert(command){
    EDITOR_OBJ.focus();
    if('|...|' == command) command = '$  $';
    document.execCommand('insertText',false, command);
    moveCaret(window, -1);
    //reMath();
}
function Black(){                   // 加粗
    EDITOR_OBJ.focus();
    document.execCommand('Bold', false, '');
}
function Italic(){                  // 斜体
    EDITOR_OBJ.focus();
    document.execCommand('Italic', false, '');
}
function UnderLine(){               // 下划线
    EDITOR_OBJ.focus();
    document.execCommand('Underline', false, '');
}
function Image(){                   // 插入图片
    EDITOR_OBJ.focus();
    ImagePath = window.prompt('请输入图片地址：', 'http://');
    //console.log(ImagePath);
    document.execCommand('InsertImage', false, ImagePath);
}
function Link(){                   // 插入图片
    EDITOR_OBJ.focus();
    link = window.prompt('请输入链接地址：', 'http://');
    document.execCommand('CreateLink', false, link);
}


function moveCaret(win, charCount) {
    var sel, range;
    if (win.getSelection) {
        sel = win.getSelection();
        if (sel.rangeCount > 0) {
            var textNode = sel.focusNode;
            var newOffset = sel.focusOffset + charCount;
            sel.collapse(textNode, Math.min(textNode.length, newOffset));
        }
    } else if ( (sel = win.document.selection) ) {
        if (sel.type != "Control") {
            range = sel.createRange();
            range.move("character", charCount);
            range.select();
        }
    }
}

function reMath() {
    var math = document.getElementById("MathEditor");
    MathJax.Hub.Queue(["Typeset", MathJax.Hub, math]);
}

$(document).keypress(function(e){
    if(e.ctrlKey && e.which == 13 || e.which == 10) {
        reMath();
    }
});

