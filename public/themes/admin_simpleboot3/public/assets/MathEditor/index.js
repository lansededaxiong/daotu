function loadMathEditor(id) {
    //return $("#"+id).contents().find("#MathEditor").html()
    var contents = $("#"+id).contents().find("#MathEditor").html();
    var lis = contents.split("</script>");
    var retlis ="";
    for(var k=0,len = lis.length;k<len;k++){
        retlis += clearSpan(lis[k])
    }
    console.log(retlis);
    return retlis;
}
function clearSpan (str){
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

