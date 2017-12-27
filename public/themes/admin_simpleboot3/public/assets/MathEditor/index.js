$(function () {
    closeProcessLink();
    processSuggest();
});
function loadAdminMathEditor(id) {
    //return $("#"+id).contents().find("#MathEditor").html()
    var contents = $("#"+id).contents().find("#MathEditor").html();
    var lis = contents.split("</script>");
    var retlis ="";
    for(var k=0,len = lis.length;k<len;k++){
        retlis += clearScript(lis[k])
    }

    console.log(retlis);
    return retlis;
}
function clearScript (str){
    return str &&  str.replace(/<script.*>.*/g,"");
}
MathJax.Hub.Config({asciimath2jax: {delimiters: [['$','$'], ['`','`']]}});
MathJax.Hub.Register.StartupHook("End Jax",function () {
    var BROWSER = MathJax.Hub.Browser;
    var canUseMML = (BROWSER.isFirefox && BROWSER.versionAtLeast("1.5")) || (BROWSER.isMSIE    && BROWSER.hasMathPlayer) ||(BROWSER.isSafari  && BROWSER.versionAtLeast("5.0")) ||(BROWSER.isOpera   && BROWSER.versionAtLeast("9.52") && !BROWSER.versionAtLeast("14.0"));
    var CONFIG = MathJax.Hub.CombineConfig("MMLorHTML",{prefer: { MSIE:"MML", Firefox:"HTML", Opera:"HTML", Chrome:"HTML", Safari:"HTML", other:"HTML"}});
    var jax = CONFIG.prefer[BROWSER] || CONFIG.prefer.other;
    if (jax === "HTML") jax = "HTML-CSS"; else if (jax === "MML")  jax = "NativeMML";
    if (jax === "NativeMML" && !canUseMML) jax = CONFIG.prefer.other;
    return MathJax.Hub.setRenderer(jax);
});
MathJax.Hub.Config({
    CommonHTML: { linebreaks: { automatic: true } },
    "HTML-CSS": { linebreaks: { automatic: true }, extensions: ["handle-floats.js"] },
    SVG: { linebreaks: { automatic: true } },
    "showMathMenu": false,
    preview: ["[math]"]
});

function processLink() {
    $("#processLink").show();
}

function closeProcessLink() {
    $("#processLink .close").click(function () {
        $("#processLink").hide();
    });
}

function setProcessLinkId() {
    $("#processLink .content li a.knowledge-list").click(function () {
        var knowledge_id = $(this).attr("data-value");
        var link = "javascript:getProcessLink("+knowledge_id+")";
        $("#mathEditorFrame")[0].contentWindow.setProcessLink(link);
        $("#processLink").hide();
    });
}

function processSuggest() {
    $("#processLink .tag").keyup(function () {
        var val = $(this).val();
        if(val.length < 2){
            $("#processLink .content").html('');
            return false;
        }
        $.ajax({
            url:'/portal/Addon/ajaxGetKnowledges',
            type:'post',
            data: {keyword:val},
            dataType: 'json',
            beforeSend: function () {$("loading").show();},
            success:function (data) {
                if(data.status == 1){
                    var json = data.data;
                    console.log(data.data);
                    $("loading").hide();
                    var html = '<ul>';

                    for(var i=0; i<json.length; i++){
                        html += '<li><a href="##" class="knowledge-list" data-value="'+ json[i].id +'">'+ json[i].name +'</a></li>';
                    }
                    html += '</ul>';
                    $("#processLink .content").html(html);

                    setProcessLinkId();
                }

            }
        })
    });
}