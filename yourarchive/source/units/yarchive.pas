unit yarchive;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvExControls, JvNavigationPane, ComCtrls, XPMan,
  ExtCtrls, ImgList, JvButton, JvExExtCtrls, OleCtrls, SHDocVw,IdHTTP,XMLDoc, XMLIntf,math,
  JvProgressBar, VirtualTrees;
type
  TMain = class(TForm)
    NavControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    JvNavPanelHeader1: TJvNavPanelHeader;
    JvNavPanelHeader2: TJvNavPanelHeader;
    quickSearch: TEdit;
    Label1: TLabel;
    XPManifest1: TXPManifest;
    TreeView1: TTreeView;
    SearchTypeSelect: TComboBox;
    Label2: TLabel;
    ArchivSearchPanel: TPanel;
    ImageList1: TImageList;
    JvNavPanelButton3: TJvNavPanelButton;
    playBtn: TJvNavPanelButton;
    JvNavPanelButton5: TJvNavPanelButton;
    ImageList2: TImageList;
    BarTitleFront: TLabel;
    BarTitle: TLabel;
    BarArtistFront: TLabel;
    Barartist: TLabel;
    BarAlbumfront: TLabel;
    BarAlbum: TLabel;
    JvOutlookSplitter1: TJvOutlookSplitter;
    Label9: TLabel;
    Edit2: TEdit;
    Label10: TLabel;
    Edit3: TEdit;
    Label11: TLabel;
    Edit4: TEdit;
    Label12: TLabel;
    ComboBox2: TComboBox;
    YtSearchPanel: TPanel;
    Label13: TLabel;
    Edit5: TEdit;
    MainControl: TPageControl;
    PlaylistControl: TTabSheet;
    VideoControl: TTabSheet;
    VideoBrowser: TWebBrowser;
    PlayTimer: TTimer;
    Image1: TImage;
    songProgress: TJvGradientProgressBar;
    secondTimer: TTimer;
    Playlist: TVirtualStringTree;
    procedure playBtnClick(Sender: TObject);
    procedure SearchTypeSelectSelect(Sender: TObject);
    procedure quickSearchKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure PlaylistDblClick(Sender: TObject);
    procedure PlayTimerTimer(Sender: TObject);
    procedure JvNavPanelButton3Click(Sender: TObject);
    procedure secondTimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Main: TMain;
  RXML,VXML: IXMLDocument;
  lastsong:integer;

implementation

function downloadfile(URL:string; Path:string):Boolean;
var lStream: TFileStream;
    Downloader:Tidhttp;
begin
  Downloader:= Tidhttp.Create(nil);
  lStream:=TFileStream.Create(Path, fmCreate or fmShareDenyNone);
  try
    Downloader.Get(URL, lStream);
  finally
    lStream.Free;
  end;
  Downloader.free;
end;

function RoundToPointPosition(Number : Extended; PointPos : Byte): Extended;
var
  Multi:Integer;
begin
  Multi:=Trunc(IntPower(10,PointPos));
  Result := Round(Number * Multi)/Multi;
end;

function roundseconds(seconds:integer):string;
var SecondsF:extended;
begin
  secondsF:=seconds/60;
  secondsF:=RoundToPointPosition(secondsF,2);
  result:=stringreplace(floattostr(secondsF),',',':',[rfReplaceAll]);
end;


function searchYT(Keyword:string):TStrings;
var i:integer;
    item:TListitem;
begin
  keyword:=stringreplace(keyword,' ','/',[rfReplaceAll]);
  downloadfile('http://gdata.youtube.com/feeds/api/videos/-/'+Keyword+'',''+ExtractFilePath(Application.Exename)+'sres.xml');
  RXML.LoadFromFile(''+ExtractFilePath(Application.Exename)+'sres.xml');
  RXML.XML.Text:=stringreplace(RXML.XML.Text,':','_',[rfReplaceAll]);
  RXML.XML.Text:=stringreplace(RXML.XML.Text,'http_//','http://',[rfReplaceAll]);
  RXML.active:=true;
  Main.Playlist.Clear;
  for i:=0 to RXML.ChildNodes['feed'].ChildNodes.Count-1 do begin
    if RXML.ChildNodes['feed'].ChildNodes[i].LocalName='entry' then begin
      {item:=Main.Playlist.Items.Add;
      item.Caption:=RXML.ChildNodes['feed'].ChildNodes[i].ChildNodes['title'].text;
      item.SubItems.Add(RXML.ChildNodes['feed'].ChildNodes[i].ChildNodes['author'].ChildNodes['name'].text);

      item.subitems.add('');
      item.subitems.add('');
      item.SubItems.Add(roundseconds(RXML.ChildNodes['feed'].ChildNodes[i].ChildNodes['media_group'].ChildNodes['yt_duration'].Attributes['seconds']));
      item.SubItems.Add(RXML.ChildNodes['feed'].ChildNodes[i].ChildNodes['link'].Attributes['href']);  }
    end;
  end;
end;

function playsong(url,title,artist,album:string; duration:extended):Boolean;
var durationI:integer;
begin
  with main do begin
    playBtn.imageindex:=3;
    if pos('http',url)  <> 0 then begin
      VideoBrowser.Navigate(url);
      bartitle.Caption:=title;
      barartist.Caption:=artist;
      baralbum.caption:=album;
      VideoControl.TabVisible:=true;
      if MainControl.ActivePage=VideoControl then else begin
        MainControl.ActivePage:=VideoControl;
        MainControl.ActivePage:=PlaylistControl;
      end;
      secondtimer.Enabled:=true;
      songProgress.Position:=0;
      PlayTimer.Interval:=strtoint(floattostr(round(duration*60*1000)));
      songProgress.Max:=strtoint(floattostr(round(duration*60)));
      PlayTimer.Enabled:=true;
    end else begin
    end;
  end;
end;

procedure playbynumber(number:integer);
var url,title,artist,album:string;
    duration:extended;
begin
 { with Main do begin
    with Playlist.Items.item[number] do begin
      url:=SubItems.Strings[4];
      title:=caption;
      duration:=strtofloat(stringreplace(SubItems.Strings[3],':',',',[rfReplaceAll]));
      artist:=SubItems.Strings[1];
      playsong(url,title,artist,album,duration);
      lastsong:=number;
    end;
    Playlist.Items.item[number-1].Selected:=false;
    playlist.Selected:=Playlist.Items.item[number];
  end;   }
end;

function playnextsong(lastsong:integer):integer;
begin
 { with main do begin
    if Playlist.Items.Count>=lastsong then begin
      playbynumber(lastsong+1);
    end else begin
      playbynumber(0);
    end;
  end;  }
end;


procedure stopplaying;
begin
  with main do begin
      VideoBrowser.navigate('about:blank');
      PlayBtn.imageindex:=0;
      VideoControl.TabVisible:=false;
      MainControl.ActivePage:=PlayListControl;
  end;
end;

{$R *.dfm}

procedure TMain.playBtnClick(Sender: TObject);
begin
  with PlayBtn do begin
    if imageindex=0 then begin
    end else begin
      stopplaying;
     end;
  end;
end;

procedure TMain.SearchTypeSelectSelect(Sender: TObject);
begin
  with SearchTypeSelect do begin
    if ItemIndex=0 then begin
      ArchivSearchPanel.Visible:=true;
      YtSearchPanel.Visible:=false;
    end else begin
      YtSearchPanel.visible:=true;
      ArchivSearchPanel.Visible:=false;
    end;
  end;
end;

procedure TMain.quickSearchKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13 then
      searchYT(quicksearch.Text);
end;

procedure TMain.FormCreate(Sender: TObject);
begin
  RXML := newXMLDocument;
  VXML := newXMLDocument;
end;

procedure TMain.PlaylistDblClick(Sender: TObject);
var url,title,artist,album:string;
    duration:extended;
begin
end;

procedure TMain.PlayTimerTimer(Sender: TObject);
begin
  playnextsong(lastsong);
  secondtimer.Enabled:=false;
end;

procedure TMain.JvNavPanelButton3Click(Sender: TObject);
begin
  playnextsong(lastsong);
end;

procedure TMain.secondTimerTimer(Sender: TObject);
begin
  songProgress.Position:=songProgress.Position+1;
end;

end.
