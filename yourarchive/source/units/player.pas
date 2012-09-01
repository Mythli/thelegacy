unit player;

interface

uses  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
      Dialogs, StdCtrls, JvExControls, JvNavigationPane, ComCtrls, XPMan,
      ExtCtrls, ImgList, JvButton, JvExExtCtrls, OleCtrls, SHDocVw,IdHTTP,XMLDoc, XMLIntf,math,
      JvProgressBar;



type
  Tplayeritem = record
    case ptype: boolean of
      true: (url,title,album,artist,genre,uploader:pchar; viewed,duration,raters:integer; average:extended);
      false: (path,filename:pchar);
  end;
  Tplayerstatus = record
    playing:boolean;
    second,percent:integer;
  end;


  TyPlayer = class
    private
    public
      progressbar:Tjvgradientprogressbar;
      titlelLbl,artistLbl,albumLbl:Tlabel;

      lastSong,playerItem,nextSong:Tplayeritem;
      function play:Tplayerstatus;
      function  pause:Tplayerstatus;
      procedure stop;
      procedure forward;
      procedure back;
      function showsonginformations:Tplayeritem;

    protected
  end;



implementation

function TyPlayer.play:Tplayerstatus;
begin
end;

function TyPlayer.Pause:Tplayerstatus;
begin
end;

procedure TyPlayer.stop;
begin
end;

procedure TyPlayer.forward;
begin
end;

procedure TyPlayer.back;
begin
end;

function TyPlayer.showsonginformations:Tplayeritem;
begin
end;


end.
