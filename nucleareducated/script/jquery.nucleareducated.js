function NuclearEducated()
{
    this.SetShadowHeight = function()
    {
        
        var contentHeight = $('#page').height();
        $('#pageShadowMidLeft').height(contentHeight);
        $('#pageShadowMidRight').height(contentHeight);
    }

    this.LinkGotoTop = function()
    {
        $('.gotoTop').attr('href', '');
        $('.gotoTop').click(function() {
            $('html, body').animate({scrollTop:0}, 'slow');
            return false;
        });
    }

    this.DoUpdates = function()
    {
        this.SetShadowHeight();
    }
}

var SiteScript = new NuclearEducated();

$(document).ready(function(){
    // Logo SlideIn
    $('.fadeIn').css('display', 'none');
    $('.fadeIn').fadeIn(1500);

    $('#searchQuery').watermark($('#searchQuery').attr('title'));
    $('#searchContainer').corner('bl 5px');

    SiteScript.DoUpdates();
    window.setInterval(function() {
        SiteScript.DoUpdates();
    }, 50);
});