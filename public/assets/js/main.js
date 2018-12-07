'use strict';

$(document).ready(function(){
    var src = $('#background').attr( "src" );

    $('#forBack').css({
        "background": "url("+src+")",
        "background-position": "50% 50%",
        "background-repeat": "no-repeat",
        "background-size": "cover"
    });
    console.log(src);
})