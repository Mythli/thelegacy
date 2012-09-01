//------Globale Variablen

//Aktuelle Hintergrund-ID
var gTopbgId=Math.floor(Math.random() * gTopBgs.length);

//Variable für letzte URl des Overlays
var gLastUrl ="";


function Message (type, messageHead, Text) {

    return '<center><div class="message '+type+'"><p class="MessageHead">'+messageHead+'</p><p class="MessageText">'+Text+'</div></center>';
    
   
}

function SetStateImage(state, target) {
    switch (state) {
        case "error":
            $(target).css("display", "block");
            $(target+"_ico").attr("src", "img/error.png");
        break;
        case "success":
            $(target).css("display", "block");
            $(target+"_ico").attr("src", "img/success.png");
        break;
        case "load":
            $(target).css("display", "block");
            $(target+"_ico").attr("src", "img/ajaxLoad.gif");
        break;
        default:
            SetStateImage("error", target);
        break;
    }
}

function StandardMessage(type) {
   switch (type) {

        //--------Unkategoriesierte Meldungen
        case "overlayLoad":
            return Message("loadMessage", "Wird geladen...", "Seite wird geladen bitte haben Sie einen moment Geduld.");
        break;

        //--------Standard Errors
        case "unknownError":
            return Message("errorMessage", "Ein Unbekannter Fehler ist aufgetreten!", 'Es tut uns leid aber ein Unbekannter Fehler ist aufgetreten.<br /> <ul><li><a href="mailto:'+gGlobalJs['supportEmail']+'">Support kontaktieren</a></li></ul>.');
        break;

        case "siteError":
            return Message("errorMessage", "Seite konnte nicht geladen Werden!", 'Es tut uns leid aber ein Fehler ist aufgetreten deswegen konnte diese Seite nicht geladen werden. <br /> <ul><li><a href="javascript:RefreshOverlay()">Seite neu Laden</a></li><li><a href="mailto:'+gGlobalJs['supportEmail']+'">Support kontaktieren</a></li></ul>')
        break;

        default:
            return StandardMessage("siteError");
        break;
    }
}

function SetOverlayCaption(caption) {
    $("#captionText").html(caption);
}

function LoadDynamicly(url, target) {
       $(target).load(url,
       function (responseText, textStatus, req) {
            if (textStatus == "error") {
              $("#overlayContent").html(StandardMessage("siteError"));

            }
            sUpdate();
       });
        
}

function LoadOvlerlay(url) {

    $("#overlayContent").html(StandardMessage("overlayLoad"));
    sUpdate();

    //Ajax load
    LoadDynamicly(url, "#overlayContent");

    //Globale URL-Variable updaten (mit aufrufgadresse für refresh)
    gLastUrl=url;

    if ($("#overlay").css("display")=="none") {

        /*Overlay-visivility auf sichtbar setzen
        $("#overlay").css("display","block");
        $("#overlayRight").css("display","block");*/

        $("#overlay").fadeIn("slow");
        $("#overlayRight").fadeIn("slow");

        window.location.href="#"+url;
    }
   
    
}


function RefreshOverlay() {
    LoadOverlay(gLastUrl);
}

function CloseOverlay() {

   /*Overlay-visivility auf unsichtbar setzen
   $("#overlay").css("display","none");
   $("#overlayRight").css("display","none");*/

    $("#overlay").fadeOut("slow");
    $("#overlayRight").fadeOut("slow");

   //Url-Hash löschen
   window.location.hash="";
}

function gSetContainerHead() {
    $(".containerHead").css("backgroundImage","url("+$("#headIMG").attr("src")+")");
}
function sUpdate() {
    gSetContainerHead();

    $(".message").corner("round 4px");
    
}

//Bei Seitenaufruf wird ausgeführt
$(document).ready(function(){

    $("#TopPanoramaImage").css("background-image","url(img/screenshots/panorama/"+gTopBgs[gTopbgId]+")");
   
    
    $("#headIMG").load(function(event){
           $("#headIMG").fadeIn(600);  
    });

    sUpdate();

    //------URL-Hash Parsing

    // führendes # entfernen
    cleanHash=window.location.hash.substr(1,window.location.hash.length);

    if (cleanHash!="") {
        LoadOvlerlay(cleanHash);
    }
 
});






