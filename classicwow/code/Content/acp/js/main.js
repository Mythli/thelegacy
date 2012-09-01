$(document).ready(function () {
   startClock("#clock");
   $("#username").Watermark("Benutzername");
   $("#navigation_search").Watermark("Suchbegriff eingeben");
   $("#password").Watermark("12345");

   $("#loginInfo").corner("4px");

   $(function () {
        $("#tree").tree({
            ui : {
                animation : 1
            },
            onsearch : function (n,t) {
               t.container.find('.search').removeClass('search');
               n.addClass('search');
            },
            data : {
                type : "json",
                async : false,
                opts : {
                    method : "GET",
                    url : "acp.php?contentId=acp_navigation"
                }
            },
            selected : "xml_1",
            plugins : {
               hotkeys : {

               }
            },
            callback : {
                onselect : function (node, tree, obj) {
                    href = $(node).attr('href');
                    if (href != '' && href != undefined) {
                        $('#mainContent').attr('src', href);
                    }
                    alert($(node).attr('id'));

                }
            }

            
        });
    });



});

function getClock() {
    var time = new Date()
    var hours = time.getHours()
    var minutes = time.getMinutes()
    minutes=((minutes < 10) ? "0" : "") + minutes
    var seconds = time.getSeconds()
    seconds=((seconds < 10) ? "0" : "") + seconds
    return clock = hours + ":" + minutes + ":" + seconds
}

function startClock(target){
    $(target).html(getClock());
    timer = setTimeout("startClock('"+target+"');",1000);
}

function resizeMe(obj){
    docHeight = mainContent.document.body.scrollHeight;
    obj.style.height = docHeight + 'px';

    newWidth = mainContent.document.body.scrollWidth;


    $(obj).css("width", newWidth);
}


