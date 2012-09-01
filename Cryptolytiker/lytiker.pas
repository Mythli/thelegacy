unit lytiker;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, XPMan, ComCtrls, OleCtrls, SHDocVw, StdCtrls,
  Grids, ValEdit,inifiles, ExtCtrls,psvHTML,shellapi, Buttons;

type
  TMain = class(TForm)
    XPManifest1: TXPManifest;
    ImageList1: TImageList;
    MainMenu: TMainMenu;
    Datei1: TMenuItem;
    Credits1: TMenuItem;
    LeftMenu: TTreeView;
    MainControl: TPageControl;
    XorPage: TTabSheet;
    InstalliertePluginsanzeigen1: TMenuItem;
    WebTab: TTabSheet;
    WebBrowser: TWebBrowser;
    Ccrypt1: TTabSheet;
    Cinput: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    COutput: TMemo;
    Button1: TButton;
    Cchoosebox: TComboBox;
    CAlphaList: TValueListEditor;
    Webbrowser1: TMenuItem;
    Editieren1: TMenuItem;
    N1: TMenuItem;
    Lschen1: TMenuItem;
    WebEdit: TRichEdit;
    WeEditSave: TButton;
    WeEditRev: TButton;
    XorOutput: TMemo;
    XorInput: TMemo;
    Label3: TLabel;
    Label4: TLabel;
    Button2: TButton;
    XorOperationKey: TEdit;
    Zahl: TLabel;
    TabSheet1: TTabSheet;
    CCInput2: TMemo;
    Label5: TLabel;
    CCOutput2: TMemo;
    Button3: TButton;
    CChossebox2: TComboBox;
    CCKey: TComboBox;
    TabSheet2: TTabSheet;
    CCOutput3: TMemo;
    CCInput3: TMemo;
    Button4: TButton;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    TabSheet3: TTabSheet;
    Label10: TLabel;
    Label11: TLabel;
    VInput: TMemo;
    Label12: TLabel;
    VOutput: TMemo;
    VChoosebox: TComboBox;
    Vkey: TEdit;
    Button5: TButton;
    TabSheet4: TTabSheet;
    Start: TSpeedButton;
    Label13: TLabel;
    Label14: TLabel;
    Reset: TSpeedButton;
    Coden: TSpeedButton;
    Walzenlage: TLabeledEdit;
    Ringe: TLabeledEdit;
    Stecker: TLabeledEdit;
    Grund: TLabeledEdit;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Button27: TButton;
    Button28: TButton;
    Button29: TButton;
    Button30: TButton;
    Button31: TButton;
    Ende: TBitBtn;
    ReflektorWahl: TRadioGroup;
    Eingabe: TMemo;
    Ausgabe: TMemo;
    RotorAnzeige: TRichEdit;
    RotorenAnzeige: TCheckBox;
    Block: TCheckBox;
    ERO: TCheckBox;
    Einstellung: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure Credits1Click(Sender: TObject);
    procedure LeftMenuClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure WebTabShow(Sender: TObject);
    procedure WebTabHide(Sender: TObject);
    procedure Editieren1Click(Sender: TObject);
    procedure WeEditRevClick(Sender: TObject);
    procedure WeEditSaveClick(Sender: TObject);
    procedure Lschen1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure WalzenlageKeyPress(Sender: TObject; var Key: Char);
    procedure RingeKeyPress(Sender: TObject; var Key: Char);
    procedure GrundKeyPress(Sender: TObject; var Key: Char);
    procedure SteckerKeyPress(Sender: TObject; var Key: Char);
    procedure RotorenAnzeigeClick(Sender: TObject);
    procedure BlockClick(Sender: TObject);
    procedure StartClick(Sender: TObject);
    procedure EndeClick(Sender: TObject);
    procedure EinstellungClick(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button31Click(Sender: TObject);
    procedure Button30Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure ResetClick(Sender: TObject);
    procedure CodenClick(Sender: TObject);
    procedure EROClick(Sender: TObject);
  private
   AlfaR,AlfaM,AlfaL,RotorR,RotorM,RotorL,Reflektor,Brett:String;
   KerbeL,KerbeM,KerbeR,WalzeL,WalzeM,WalzeR,RingL,RingM,RingR,
   ZaehlerL,ZaehlerM,ZaehlerR,StartR,StartM,StartL,TLEin:Integer;
   RotorL_Liste,RotorM_Liste,RotorR_Liste,
   RotorL_Invers,RotorM_Invers,RotorR_Invers,
   SteckBrett,UmkehrWalze:Array[0..25]of Integer;
   procedure Markieren(Von,Anzahl:Integer;Farbe:TColor;Stil:TFontStyles);
   procedure ButtonEinAus(Zustand:Boolean);
   procedure Codieren(Zeichen:Char);
   procedure Anzeige;
  public
    { Public declarations }
  end;

var
  Main: TMain;
  HTMLSyn : TpsvHTMLRTF;
  EnteredEdit:Boolean;

implementation

 const                        Alfa='ABCDEFGHIJKLMNOPQRSTUVWXYZ';
       AlfaLang=Alfa+Alfa;
       Rotor:Array[1..5]of String=('EKMFLGDQVZNTOWYHXUSPAIBRCJ',  // Rotor I
                                   'AJDKSIRUXBLHWTMCQGZNPYFVOE',  // Rotor II
                                   'BDFHJLCPRTXVZNYEIWGAKMUSQO',  // Rotor III
                                   'ESOVPZJAYQUIRHXLNFTGKDCMWB',  // Rotor IV
                                   'VZBRGITYUPSDNHLXAWMJQOFECK'); // Rotor V
       Kerbe='QEVJZ';                                             // Übertragskerbe der Rotoren
       ReflektorB='YRUHQSLDPXNGOKMIEBFZCWVJAT';                   // Reflektor B
//     Umkehrwalze B: AY BR CU DH EQ FS GL IP JX KN MO TZ VW

       ReflektorC='FVPJIAOYEDRZXWGCTKUQSBNMHL';                   // Reflektor C
//     Umkehrwalze C: AF BV CP DJ EI GO HY KR LZ MX NW QT SU

procedure TMain.Markieren(Von,Anzahl:Integer;Farbe:TColor;Stil:TFontStyles);
  begin
   RotorAnzeige.SelStart:=Von;
   RotorAnzeige.SelLength:=Anzahl;
   RotorAnzeige.SelAttributes.Color:=Farbe;
   RotorAnzeige.SelAttributes.Style:=Stil;
end;

 procedure TMain.ButtonEinAus(Zustand:Boolean);
  var K:Integer;
      Button:TButton;
  begin
   for K:=1 to Length(Alfa) do
    begin
     Button:=TButton(FindComponent('Button'+IntToStr(K)));
     Button.Enabled:=Zustand;
    end;
  end;

   procedure TMain.Anzeige;
  begin
   RotorAnzeige.Clear;
   RotorAnzeige.Lines.Add(Alfa+'  Alphabet');
   RotorAnzeige.Lines.Add(Brett+'  SteckBrett');
   RotorAnzeige.Lines.Add(AlfaR+'  Alphabet'+IntToStr(WalzeR));
   RotorAnzeige.Lines.Add(RotorR+'  Verdrahtung Rotor'+IntToStr(WalzeR));
   RotorAnzeige.Lines.Add(AlfaR+'  Alphabet'+IntToStr(WalzeR));
   RotorAnzeige.Lines.Add(AlfaM+'  Alphabet'+IntToStr(WalzeM));
   RotorAnzeige.Lines.Add(RotorM+'  Verdrahtung Rotor'+IntToStr(WalzeM));
   RotorAnzeige.Lines.Add(AlfaM+'  Alphabet'+IntToStr(WalzeM));
   RotorAnzeige.Lines.Add(AlfaL+'  Alphabet'+IntToStr(WalzeL));
   RotorAnzeige.Lines.Add(RotorL+'  Verdrahtung Rotor'+IntToStr(WalzeL));
   RotorAnzeige.Lines.Add(AlfaL+'  Alphabet'+IntToStr(WalzeL));
   RotorAnzeige.Lines.Add(Alfa+'  Alphabet');
   RotorAnzeige.Lines.Add(Reflektor+'  Reflektor'+Alfa[ReflektorWahl.ItemIndex+2]);
  end;

   procedure TMain.Codieren(Zeichen:Char);
  const Runter:TColor=clRed;
        Hoch:TColor=clGreen;
  var Zeile:String;
      Position,Anfang,K:Integer;
  begin
    // zunächst werden die Rotoren weitergedreht
   if ZaehlerM=KerbeM then
    begin
     inc(ZaehlerM);
     AlfaM:=copy(AlfaM,2,25)+AlfaM[1];
     RotorM:=copy(RotorM,2,25)+RotorM[1];
     inc(ZaehlerL);
     AlfaL:=copy(AlfaL,2,25)+AlfaL[1];
     RotorL:=copy(RotorL,2,25)+RotorL[1];
    end
   else if ZaehlerR=KerbeR then
    begin
     inc(ZaehlerM);
     AlfaM:=copy(AlfaM,2,25)+AlfaM[1];
     RotorM:=copy(RotorM,2,25)+RotorM[1];
    end;
   inc(ZaehlerR);
   AlfaR:=copy(AlfaR,2,25)+AlfaR[1];
   RotorR:=copy(RotorR,2,25)+RotorR[1];
   ZaehlerL:=ZaehlerL mod 26;
   ZaehlerM:=ZaehlerM mod 26;
   ZaehlerR:=ZaehlerR mod 26;
   // Änderung anzeigen
   Grund.Text:=Alfa[ZaehlerL+1]+Alfa[ZaehlerM+1]+Alfa[ZaehlerR+1];
   Anzeige; // Anzeige der Rotoren
   // Verschlüsselung
   Position:=pos(Zeichen,Alfa)-1;
   Markieren(Position,1,clRed,[fsBold]);                                 // Zeile 0
   Anfang:=Length(RotorAnzeige.Lines[0])+2;
   Zeile:='  '+Zeichen+' -> ';
   Markieren(Position+Anfang,1,Runter,[fsBold]);                         // Zeile 1
   Anfang:=Anfang+Length(RotorAnzeige.Lines[1])+2;
   Position:=SteckBrett[Position]; // Steckerverbindung
   Zeile:=Zeile+Alfa[Position+1]+'-'+AlfaR[Position+1]+RotorR[(26+Position+StartR-RingR)mod 26+1]+'-';
   Markieren(Position+Anfang,1,Runter,[fsBold]);                         // Zeile 2
   Anfang:=Anfang+Length(RotorAnzeige.Lines[2])+2;
   Markieren((26+Position+StartR-RingR)mod 26+Anfang,1,Runter,[fsBold]); // Zeile 3
   Anfang:=Anfang+Length(RotorAnzeige.Lines[3])+2;
   Position:=(RotorR_Liste[(Position+26-RingR+ZaehlerR)mod 26]+(RingR+26-ZaehlerR))mod 26;
   Zeile:=Zeile+AlfaM[Position+1]+RotorM[(26+Position+StartM-RingM)mod 26+1]+'-';
   Markieren(Position+Anfang,1,Runter,[fsBold]);                         // Zeile 4
   Anfang:=Anfang+Length(RotorAnzeige.Lines[4])+2;
   Markieren(Position+Anfang,1,Runter,[fsBold]);                         // Zeile 5
   Anfang:=Anfang+Length(RotorAnzeige.Lines[5])+2;
   Markieren((26+Position+StartM-RingM)mod 26+Anfang,1,Runter,[fsBold]); // Zeile 6
   Anfang:=Anfang+Length(RotorAnzeige.Lines[6])+2;
   Position:=(RotorM_Liste[(Position+26-RingM+ZaehlerM)mod 26]+(RingM+26-ZaehlerM))mod 26;
   Zeile:=Zeile+AlfaL[Position+1]+RotorL[(26+Position+StartL-RingL)mod 26+1]+'|';
   Markieren(Position+Anfang,1,Runter,[fsBold]);                         // Zeile 7
   Anfang:=Anfang+Length(RotorAnzeige.Lines[7])+2;
   Markieren(Position+Anfang,1,Runter,[fsBold]);                         // Zeile 8
   Anfang:=Anfang+Length(RotorAnzeige.Lines[8])+2;
   Markieren((26+Position+StartL-RingL)mod 26+Anfang,1,Runter,[fsBold]); // Zeile 9
   Anfang:=Anfang+Length(RotorAnzeige.Lines[9])+2;
   Position:=(RotorL_Liste[(Position+26-RingL+ZaehlerL)mod 26]+(RingL+26-ZaehlerL))mod 26;
   Zeile:=Zeile+Alfa[Position+1]+Reflektor[Position+1]+'|';
   Markieren(Position+Anfang,1,Runter,[fsBold]);                         // Zeile 10
   Anfang:=Anfang+Length(RotorAnzeige.Lines[10])+2;
   Markieren(Position+Anfang,1,Runter,[fsBold]);                         // Zeile 11
   Anfang:=Anfang+Length(RotorAnzeige.Lines[11])+2;
   Markieren(Position+Anfang,1,Runter,[fsBold]);                         // Zeile 12
   Position:=UmkehrWalze[Position]; // Umkehrwalze
   Markieren(Position+Anfang,1,Hoch,[fsBold]);                           // Zeile 12
   Anfang:=Anfang-Length(RotorAnzeige.Lines[11])-2;
   Markieren(Position+Anfang,1,Hoch,[fsBold]);                           // Zeile 11
   Anfang:=Anfang-Length(RotorAnzeige.Lines[10])-2;
   Markieren(Position+Anfang,1,Hoch,[fsBold]);                           // Zeile 10
   Anfang:=Anfang-Length(RotorAnzeige.Lines[9])-2;
   Position:=(RotorL_Invers[(Position+26-RingL+ZaehlerL)mod 26]+(RingL+26-ZaehlerL))mod 26;
   Zeile:=Zeile+RotorL[(26+Position+StartL-RingL)mod 26+1]+AlfaL[Position+1]+'-';
   Markieren((26+Position+StartL-RingL)mod 26+Anfang,1,Hoch,[fsBold]);   // Zeile 9
   Anfang:=Anfang-Length(RotorAnzeige.Lines[8])-2;
   Markieren(Position+Anfang,1,Hoch,[fsBold]);                           // Zeile 8
   Anfang:=Anfang-Length(RotorAnzeige.Lines[7])-2;
   Markieren(Position+Anfang,1,Hoch,[fsBold]);                           // Zeile 7
   Anfang:=Anfang-Length(RotorAnzeige.Lines[6])-2;
   Position:=(RotorM_Invers[(Position+26-RingM+ZaehlerM)mod 26]+(RingM+26-ZaehlerM))mod 26;
   Zeile:=Zeile+RotorM[(26+Position+StartM-RingM)mod 26+1]+AlfaM[Position+1]+'-';
   Markieren((26+Position+StartM-RingM)mod 26+Anfang,1,Hoch,[fsBold]);   // Zeile 6
   Anfang:=Anfang-Length(RotorAnzeige.Lines[5])-2;
   Markieren(Position+Anfang,1,Hoch,[fsBold]);                           // Zeile 5
   Anfang:=Anfang-Length(RotorAnzeige.Lines[4])-2;
   Markieren(Position+Anfang,1,Hoch,[fsBold]);                           // Zeile 4
   Anfang:=Anfang-Length(RotorAnzeige.Lines[3])-2;
   Position:=(RotorR_Invers[(Position+26-RingR+ZaehlerR)mod 26]+(RingR+26-ZaehlerR))mod 26;
   Zeile:=Zeile+RotorR[(26+Position+StartR-RingR)mod 26+1]+AlfaR[Position+1]+'-';
   Markieren((26+Position+StartR-RingR)mod 26+Anfang,1,Hoch,[fsBold]);   // Zeile 3
   Anfang:=Anfang-Length(RotorAnzeige.Lines[2])-2;
   Markieren(Position+Anfang,1,Hoch,[fsBold]);                           // Zeile 2
   Anfang:=Anfang-Length(RotorAnzeige.Lines[1])-2;
   Zeile:=Zeile+Alfa[Position+1];
   Position:=SteckBrett[Position]; // Steckerverbindung
   Markieren(Position+Anfang,1,Hoch,[fsBold]);                           // Zeile 1
   Markieren(Position,1,Hoch,[fsBold]);                                  // Zeile 0
   Zeile:=Zeile+' -> '+Alfa[Position+1];
   RotorAnzeige.Lines.Add(Zeile);
   Anfang:=0;
   for K:=0 to 12 do
    Anfang:=Anfang+Length(RotorAnzeige.Lines[K])+2;
   // Endergebnis farbig markieren 
   Markieren(Anfang+2,1,Runter,[fsBold]);
   Markieren(Anfang+7,1,Runter,[fsBold]);
   Markieren(Anfang+9,1,Runter,[fsBold]);
   Markieren(Anfang+10,1,Runter,[fsBold]);
   Markieren(Anfang+12,1,Runter,[fsBold]);
   Markieren(Anfang+13,1,Runter,[fsBold]);
   Markieren(Anfang+15,1,Runter,[fsBold]);
   Markieren(Anfang+16,1,Runter,[fsBold]);
   Markieren(Anfang+18,1,clBlack,[fsBold]);
   Markieren(Anfang+19,1,clBlack,[fsBold]);
   Markieren(Anfang+21,1,Hoch,[fsBold]);
   Markieren(Anfang+22,1,Hoch,[fsBold]);
   Markieren(Anfang+24,1,Hoch,[fsBold]);
   Markieren(Anfang+25,1,Hoch,[fsBold]);
   Markieren(Anfang+27,1,Hoch,[fsBold]);
   Markieren(Anfang+28,1,Hoch,[fsBold]);
   Markieren(Anfang+30,1,Hoch,[fsBold]);
   Markieren(Anfang+35,1,Hoch,[fsBold]);
   Ausgabe.Text:=Ausgabe.Text+Alfa[Position+1];
  end;

procedure settabsinvisible;
var i:integer;
begin
  with main do begin
    for i:=0 to MainControl.PageCount-1 do begin
      MainControl.Pages[i].TabVisible:=false;
      MainControl.Pages[i].Visible:=false;
    end;
  end;
end;

function DeleteFileToRecycleBin(const AFile: string): boolean;
var
  Operation: TSHFileOpStruct;
begin
  with Operation do
  begin
    Wnd := Application.Handle;
    wFunc := FO_DELETE;
    pFrom := PChar(AFile +#0);
    pTo := nil;
    { in den Papierkorb verschieben / keine
      Sicherheitsabfrage }
    fFlags := FOF_ALLOWUNDO or FOF_NOCONFIRMATION;
  end;
  Result := SHFileOperation(Operation) = 0;
end;

procedure setmaincontrol(tab:ttabsheet; imageindex:integer; caption:string);
begin
  with main do begin
    settabsinvisible;
    tab.TabVisible:=true;
    tab.Visible:=true;
    tab.ImageIndex:=imageindex;
  end;
  if caption='' then else
    tab.Caption:=caption;
end;

procedure browse(pagename,pagefile:string; imageindex:integer);
begin
  with main.Webbrowser do begin
    setmaincontrol(main.WebTab,imageindex,'Webbrowser - '+pagename+'');
    Navigate(''+ExtractFilePath(ParamStr(0))+'pages\'+pagefile+'.html');
  end;
end;

procedure browseurl(pagename,pageurl:string; imageindex:integer);
begin
    with main.Webbrowser do begin
      setmaincontrol(main.WebTab,imageindex,'Webbrowser - '+pagename+'');
      main.WebTab.Caption:='Webbrowser - '+pagename+'';
      navigate(pageurl);
    end;
end;

procedure HtmlSynC(RichEdit:Trichedit);
var HTMLSyn : TpsvHTMLRTF;
    A : TMemoryStream;
begin
   HTMLSyn := TpsvHTMLRTF.Create;
   HTMLSyn.SetText(RIchEdit.Text);
   A := TMemoryStream.Create;
   HTMLSyn.ConvertToRTFStream(A);
   RIchEdit.PlainText := false;
   A.Position := 0;
   RIchEdit.Lines.LoadFromStream(A);
   RIchEdit.PlainText := true;
   A.Free;
   HTMLSyn.Free;
end;

function XorStr(const Text: string; Key: Integer): string;
var
  i: Integer;
begin
  SetLength(Result, Length(Text));
  for i:=1 to Length(Text) do
  begin
    if Text[i] > #31 then
      Result[i] := Chr(Ord(Text[i]) xor Key)
    else
      Result[i] := Text[i];
  end;
end;

procedure loadvaluelist(section:string; ValueList:TValueListEditor);
var ini:Tinifile;
    Tempsection:Tstringlist;
    i:integer;
begin
  Tempsection := TStringList.Create;
  ValueList.strings.Clear;
  ini := TIniFile.Create(''+ExtractFilePath(ParamStr(0))+'options.ini');
  ini.ReadSection(section, Tempsection);
  ini.ReadSectionValues(section, Tempsection);
  for i := 0 to Tempsection.Count - 1 do
    ValueList.InsertRow(Tempsection.Names[i], Tempsection.Values[Tempsection.Names[i]], True);
  ini.Free;
  Tempsection.Free;
end;

procedure savevaluelist(section:string; ValueList:TValuelistEditor);
var i:integer;
    ini:Tinifile;
begin
  if ValueList.Keys[1]='' then else begin
    ini := TIniFile.Create(''+ExtractFilePath(ParamStr(0))+'options.ini');
    ini.EraseSection(section);
    for i:=1 to ValueList.RowCount-1 do begin
      ini.WriteString(section,ValueList.Keys[i],Valuelist.Values[ValueList.Keys[i]]);
    end;
    ini.free;
  end;
end;

function EncryptCaesar(AText: string; AKey: Char): string;
var
  i: Integer;
  tmp: Integer;
  normedKey: Integer;
begin
  SetLength(Result, Length(AText));


  AText := UpperCase(AText);
  AKey := UpCase(AKey);

  if not (AKey in ['A'..'Z']) then
    Application.MessageBox('Schlüssel ungültig AKey muss ein Buchstabe zwischen A und Z sein.', 'Cryptolytiker', MB_ICONSTOP or MB_OK);

  normedKey := Ord(AKey) - Ord('A') +1;   // Schlüssel normalisieren

  for i := 1 to Length(AText) do
  begin
    if AText[i] in ['A'..'Z'] then        // nur Buchstaben verschlüsseln
    begin
      tmp := (Ord(AText[i])) - Ord('A');  // Normalisieren
      tmp := (tmp + normedKey) mod 26;    // Verschieben
      Result[i] := Chr(tmp + Ord('A'));   // Denormalisieren
    end
    else
    begin
      Result[i] := AText[i];              // nicht verschlüsseln, wenn kein Buchstabe
    end;
  end;
end;

function DecryptCaesar(AText: string; AKey: Char): string;
var
  i: Integer;
  tmp: Integer;
  normedKey: Integer;
begin
  SetLength(Result, Length(AText));


  AText := UpperCase(AText);
  AKey := UpCase(AKey);

  if not (AKey in ['A'..'Z']) then
    Application.MessageBox('Schlüssel ungültig Akey muss ein Buchstabe zwischen A und Z sein.', 'Cryptolytiker', MB_ICONSTOP or MB_OK);

  normedKey := Ord(AKey) - Ord('A') +1;

  for i := 1 to Length(AText) do
  begin
    if AText[i] in ['A'..'Z'] then
    begin
      tmp := (Ord(AText[i])) - Ord('A');
      tmp := (26 + (tmp - normedKey)) mod 26;
      Result[i] := Chr(tmp + Ord('A'));
    end
    else
    begin
      Result[i] := AText[i];
    end;
  end;
end;

function GetCaesarKey(const AText: string): Char;
var
  letters: array['A'..'Z'] of Integer;
  i: Integer;
  mostFrequentChar: Char;
  c: Char;
begin
  FillChar(letters, SizeOf(letters), 0);

  for i := 1 to Length(AText) do
  begin
    if AText[i] in ['a'..'z', 'A'..'Z'] then
    begin
      Inc(letters[UpCase(AText[i])]);
    end;
  end;


  mostFrequentChar := 'A';
  for c := 'B' to 'Z' do
  begin
    if letters[c] > letters[mostFrequentChar] then
      mostFrequentChar := c;
  end;


  Result := Chr(((26 + Ord(mostFrequentChar) - Ord('A') - 5) mod 26) + Ord('A'));
end;

function CrackCaesar(const AText: string): string;
begin
  Result := DecryptCaesar(AText, GetCaesarKey(AText));
end;

function EncryptVigenere(AText: string; AKey: string): string;
var
  i: integer;             // aktuelle Position im Text
  counter: integer;       // aktuelle Position im Schlüsselwort
  curKeyLetter: integer;  // der momentane Schlüssel-Buchstabe aus dem Schlüsselwort
  curLetter: integer;     // der momentan zu verschlüsselnde Buchstabe
begin
  SetLength(Result, Length(AText));
  counter := 0;
  
  // alles in Großbuchstaben umwandeln
  // Vigenere unterscheidet nicht zwischen Groß- und Kleinbuchstaben
  AText := UpperCase(AText);
  AKey := UpperCase(AKey);
  
  for i := 1 to Length(AKey) do
  begin
    if not (AKey[i] in ['A'..'Z']) then
      Application.MessageBox('Schlüssel ungültig AKey muss ein Buchstabe zwischen A und Z sein.', 'Cryptolytiker', MB_ICONSTOP or MB_OK);
  end;
  
  for i := 1 to Length(AText) do
  begin
    if AText[i] in ['A'..'Z'] then  // nur Buchstaben verschlüsseln
    begin
      curKeyLetter := Ord(AKey[1 + (counter mod Length(AKey))]) - ord('A');
      curLetter := Ord(AText[i]) - Ord('A');
      
      // verschlüsseln
      Result[i] := Chr(Ord('A') + ((curLetter + curKeyLetter) mod 26));
      
      inc(counter);
    end
    else
    begin
      Result[i] := AText[i]; // nicht verschlüsseln, wenn kein Buchstabe
    end;
  end;
end;

function DecryptVigenere(AText: string; AKey: string): string;
var
  i: integer;             // aktuelle Position im Text
  counter: integer;       // aktuelle Position im Schlüsselwort
  curKeyLetter: integer;  // der momentane Schlüssel-Buchstabe aus dem Schlüsselwort
  curLetter: integer;     // der momentan zu entschlüsselnde Buchstabe
begin
  SetLength(Result, Length(AText));
  counter := 0;

  // alles in Großbuchstaben umwandeln
  // Vigenere unterscheidet nicht zwischen Groß- und Kleinbuchstaben
  AText := UpperCase(AText);
  AKey := UpperCase(AKey);
  
  for i := 1 to Length(AKey) do
  begin
    if not (AKey[i] in ['A'..'Z']) then
      Application.MessageBox('Schlüssel ungültig AKey muss ein Buchstabe zwischen A und Z sein.', 'Cryptolytiker', MB_ICONSTOP or MB_OK);
  end;

  for i := 1 to Length(AText) do
  begin
    if AText[i] in ['A'..'Z'] then  // nur Buchstaben entschlüsseln
    begin
      curKeyLetter := Ord(AKey[1 + (counter mod Length(AKey))]) - ord('A');
      curLetter := Ord(AText[i]) - Ord('A');

      // entschlüsseln
      Result[i] := Chr(Ord('A') + ((26 + curLetter - curKeyLetter) mod 26));
      
      inc(counter);
    end
    else
    begin
      Result[i] := AText[i];  // nur Buchstaben sind Verschlüsselt
    end;
  end;
end;

//procedure savevaluelist

procedure ListFileDir(Path,Kennung: string; FileList: TStrings);stdcall;
var
  SR: TSearchRec;
begin
  if FindFirst(Path + '*'+Kennung+'*', faAnyFile, SR) = 0 then
  begin
    repeat
      if (SR.Attr <> faDirectory) then
      begin
        FileList.Add(SR.Name);
      end;
    until FindNext(SR) <> 0;
    FindClose(SR);
  end;
end;

{$R *.dfm}

procedure TMain.FormCreate(Sender: TObject);
begin
  Tform(Sender).WindowState:=wsMaximized;
  settabsinvisible;
  browse('Willkommen bei Cryptolytiker!','welcome',3);
  loadvaluelist('letters',CAlphaList);
end;

procedure TMain.Credits1Click(Sender: TObject);
begin
  showmessage('CryptTool by Myth (Tobias)');
end;

procedure TMain.LeftMenuClick(Sender: TObject);
  var SCaption:string;
      Selected:TTreenode;
      SImageindex:integer;
      ini:TInifile;
      i:integer;
      slist:Tstringlist;
begin
  Selected:=leftmenu.Selected;
  SCaption:=Selected.text;
  SImageINdex:=Selected.ImageIndex;
  WEbEdit.Visible:=false;
  WebBRowser.Visible:=true;
  WeEditSave.Visible:=false;
  WeEditRev.Visible:=false;
  if Scaption='Willkommen' then begin
    browse(Scaption,'welcome',SImageIndex);
  end;
  if Scaption='Xor Geschichte' then begin
    browse('XOR - Geschichte','xor_1_history',SImageIndex);
  end;
  if Scaption='Xor Verstehen' then begin
    browse(Scaption,'xor_1_understand',SImageIndex);
  end;

  if Scaption='Variante 1 Geschichte' then begin
    browse(Scaption,'caesar_1_history',SImageINdex);
  end;
  if Scaption='Variante 1 Verstehen' then begin
    browse(Scaption,'caesar_1_understand',SImageIndex);
  end;
  if Scaption='Variante 2 Verstehen' then begin
    browse(Scaption,'caesar_2_understand',SImageIndex);
  end;
  if Scaption='Variante 2 Geschichte' then begin
    browse(Scaption,'caesar_2_history',SImageIndex);
  end;
  if Scaption='Vigenère Geschichte' then begin
    browse(Scaption,'Vigenere_history',SImageIndex);
  end;
  if Scaption='Vigenère Verstehen' then begin
    browse(Scaption,'Vigenere_understand',SImageIndex);
  end;
  if Scaption='Enigma Verstehen' then begin
    browse(Scaption,'Enigma_understand',SImageIndex);
  end;
    if Scaption='Enigma Geschichte' then begin
    browse(Scaption,'Enigma_history',SImageIndex);
  end;


  if Scaption='Variante 1 Ent/Verschlüsseln' then begin
    setmaincontrol(ccrypt1,SImageINdex,scaption);
    loadvalueList('letters',CAlphaList);
  end;
  if Scaption='Xor Ent/Verschlüsseln' then begin
    setmaincontrol(XorPage,SImageINdex,scaption);
  end;
  if Scaption='Variante 2 Ent/Verschlüsseln' then begin
    setmaincontrol(Tabsheet1,SImageINdex,scaption);
    ini := TIniFile.Create(''+ExtractFilePath(ParamStr(0))+'options.ini');
    slist:=TStringlist.Create;
    ini.ReadSection('letters',slist);
    CCKey.Items.Clear;
    for i:=0 to slist.Count-1 do begin
      CCKey.Items.Add(slist.Strings[i])
    end;
    CCKey.Text:=CCKey.Items[0];
    slist.Free;
    ini.free;
  end;
  if (Scaption='Variante 2 Cracken') or (Scaption='Variante 1 Cracken') then begin
    setmaincontrol(Tabsheet2,SImageINdex,scaption);
  end;
  if Scaption='Vigenère Ent/Verschlüsseln' then begin
    setmaincontrol(Tabsheet3,SImageINdex,scaption);
  end;
  if SCaption='Enigma Ent/Verschlüsseln' then begin
    setmaincontrol(Tabsheet4,SImageINdex,scaption);
  end;
end;

procedure TMain.Button1Click(Sender: TObject);
var i:integer;
    s:string;
begin
  s:=CInput.Text;
  if Cchoosebox.text='Verschlüsseln' then begin
   for i:=1 to CAlphaList.RowCount-1 do begin
    s:=stringreplace(s,CAlphaList.Keys[i],Calphalist.Values[CAlphaList.Keys[i]],[rfreplaceall,rfignorecase]);
   end;
  end else begin
    for i:=1 to CAlphaList.RowCount-1 do begin
      s:=stringreplace(s,Calphalist.Values[CAlphaList.Keys[i]],CAlphaList.Keys[i],[rfreplaceall,rfignorecase]);
    end;                
  end;
  COutput.Text:=s;

end;

procedure TMain.Image1Click(Sender: TObject);
begin
  showmessage('ddd');
end;

procedure TMain.WebTabShow(Sender: TObject);
begin
  Webbrowser1.Enabled:=true;
end;

procedure TMain.WebTabHide(Sender: TObject);
begin
  Webbrowser1.Enabled:=false;
end;

procedure TMain.Editieren1Click(Sender: TObject);
  procedure settoedit;
  begin
    WEbEdit.Visible:=true;
    WebBRowser.Visible:=false;
    WeEditSave.Visible:=true;
    WeEditRev.Visible:=true;
    WebTab.Caption:=''+webTab.Caption+' - Editiermodus';
    HtmlSynC(WebEdit);
  end;
begin
  if fileexists(stringreplace(Webbrowser.LocationURL,'file:///','',[rfreplaceall,rfignorecase])) then begin
    WebEdit.Lines.LoadFromFile(stringreplace(Webbrowser.LocationURL,'file:///','',[rfreplaceall,rfignorecase]));
    settoedit;
  end else begin
    if Application.MessageBox(pchar('Datei '+stringreplace(Webbrowser.LocationURL,'file:///','',[rfreplaceall,rfignorecase])+' nicht gefunden, aus Vorlage neu erzeugen ?'), 'Cryptolytiker', MB_OKCANCEL or MB_ICONQUESTION)=IDOK then begin
      WebEdit.Lines.LoadFromFile(''+ExtractFilePath(ParamStr(0))+'pages\image.html');
      settoedit;
      WeEditSave.Click;
    end;
  end;
end;

procedure TMain.WeEditRevClick(Sender: TObject);
begin
  Editieren1.Click;
end;

procedure TMain.WeEditSaveClick(Sender: TObject);
var stringlist:Tstringlist;
    var temp:Boolean;
begin
  try
    stringlist:=Tstringlist.Create;
    stringlist.Text:=WebEdit.Text;
    stringlist.SaveToFile(stringreplace(Webbrowser.LocationURL,'file:///','',[rfreplaceall,rfignorecase]));
    stringlist.Free;
    temp:=true;
  except
    temp:=false;
  end;
  if Temp=true then Application.MessageBox('Änderungen erfolgreich gespeichert.', 'Cryptolytiker', MB_ICONINFORMATION or MB_OK) else
                    Application.MessageBox('Änderungen konnten nicht gespeichert werden..', 'Cryptolytiker', MB_ICONSTOP or MB_OK)
end;

procedure TMain.Lschen1Click(Sender: TObject);
begin
  if Application.MessageBox(pchar('Wollen sie wirklich '+stringreplace(Webbrowser.LocationURL,'file:///','',[rfreplaceall,rfignorecase])+' löschen ?'), 'Cryptolytiker', MB_OKCANCEL or MB_ICONQUESTION)=IDOK then begin
    if DeleteFileToRecycleBin(stringreplace(Webbrowser.LocationURL,'file:///','',[rfreplaceall,rfignorecase])) then
      Application.MessageBox('Datei erfolgreich gelöscht.', 'Cryptolytiker', MB_ICONINFORMATION or MB_OK) else
      Application.MessageBox('Datei konnte nicht gelöscht werden.', 'Cryptolytiker', MB_ICONSTOP or MB_OK);
  end;
end;

procedure TMain.Button2Click(Sender: TObject);
begin
  XorOutput.text:=XorStr(XorInput.Text,strtoint(XorOperationkey.text));
end;

procedure TMain.Button3Click(Sender: TObject);
begin
  if CChossebox2.text='Verschlüsseln' then begin
    CCOutput2.Text:=EnCryptCaesar(CCinput2.text,CCKey.text[1]);
  end else begin
    CCOutput2.Text:=decryptCaesar(CCinput2.text,CCKey.text[1]);
  end;
end;

procedure TMain.Button4Click(Sender: TObject);
begin
  CCOutput3.Text:=CrackCaesar(CCInput3.text);
end;

procedure TMain.Button5Click(Sender: TObject);
begin
  if VChoosebox.Text='Verschlüsseln' then begin
    VOutput.Text:=EncryptVigenere(VInput.text,VKey.text);
  end else begin
    VOutput.Text := DecryptVigenere(VInput.text, VKey.text);
  end;
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  saveValueList('letters',CAlphaList);
end;

procedure TMain.WalzenlageKeyPress(Sender: TObject; var Key: Char);
var Ziffern:Set of Char;
    K:Integer;
begin
  Ziffern:=['1'..'5'];
  for K:=1 to Length(Walzenlage.Text) do
    Ziffern:=Ziffern-[Walzenlage.Text[K]];
  if not(Key in Ziffern+[#8]) then Key:=#0;
end;

procedure TMain.RingeKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in['A'..'Z','a'..'z',#8]) then Key:=#0;
end;

procedure TMain.GrundKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in['A'..'Z','a'..'z',#8]) then Key:=#0;
end;

procedure TMain.SteckerKeyPress(Sender: TObject; var Key: Char);
var Buchstaben:Set of Char;
    K:Integer;
begin
  Key:=Upcase(Key);
  Buchstaben:=['A'..'Z'];
  for K:=1 to Length(Stecker.Text) do
    Buchstaben:=Buchstaben-[Stecker.Text[K]];
  if not(Key in Buchstaben+[#8]) then Key:=#0;
end;

procedure TMain.RotorenAnzeigeClick(Sender: TObject);
begin
  if RotorenAnzeige.Checked then RotorANzeige.Visible:=true
    else RotorANzeige.Visible:=false;
end;

procedure TMain.BlockClick(Sender: TObject);
 var Zeile,Code:String;
      K:Integer;
  begin
   if Block.Checked then
    begin // Leerzeichen einfügen
     Zeile:=Eingabe.Text;
     Code:='';
     for K:=1 to Length(Zeile) do
      if pos(Zeile[K],Alfa)>0 then Code:=Code+Zeile[K];
     Zeile:='';
     while Length(Code)>=5 do
      begin
       Zeile:=Zeile+Copy(Code,1,5)+' ';
       Delete(Code,1,5);
      end;
     if Code>'' then Zeile:=Zeile+Code
     else Delete(Zeile,Length(Zeile),1);
     Eingabe.Clear;
     Eingabe.Lines.Add(Zeile);
     Zeile:=Ausgabe.Text;
     Code:='';
     for K:=1 to Length(Zeile) do
      if pos(Zeile[K],Alfa)>0 then Code:=Code+Zeile[K];
     Zeile:='';
     while Length(Code)>=5 do
      begin
       Zeile:=Zeile+Copy(Code,1,5)+' ';
       Delete(Code,1,5);
      end;
     if Code>'' then Zeile:=Zeile+Code
     else Delete(Zeile,Length(Zeile),1);
     Ausgabe.Clear;
     Ausgabe.Lines.Add(Zeile);
    end
   else
    begin // Leerzeichen löschen
     Zeile:=Eingabe.Text;
     Code:='';
     for K:=1 to Length(Zeile) do
      if pos(Zeile[K],Alfa)>0 then Code:=Code+Zeile[K];
     Eingabe.Clear;
     Eingabe.Lines.Add(Code);
     Zeile:=Ausgabe.Text;
     Code:='';
     for K:=1 to Length(Zeile) do
      if pos(Zeile[K],Alfa)>0 then Code:=Code+Zeile[K];
     Ausgabe.Clear;
     Ausgabe.Lines.Add(Code);
    end;
   SendMessage(Eingabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
   SendMessage(Ausgabe.Handle,WM_VSCROLL,SB_BOTTOM,0); 
  end;

procedure TMain.StartClick(Sender: TObject);
 const Ziffern='12345';
  var K,LS:Integer;
//   5 mögliche Walzen I=1, II=2, III=3, IV=4, V=5, feste Umkehrwalze 'B' oder 'C'
//   Aufbau:
//   1. Walzenlage (WalzeL,WalzeM,WalzeR)    Rotor I bis V mit Übertragskerbe
//   2. Ringstellung (RingL,RingM,RingR)     Versatz zwischen der internen Verdrahtung
//   3. Steckerverbindung auf SteckBrett     Vertauschung von maximal 10 Buchstabenpaaren
//   4. Grundstellung (StartL,StartW,StartR) Startposition der Rotoren
  begin
   if Length(Walzenlage.Text)<3 then
    begin
     MessageDlg('Die Walzenlage ist NICHT korrekt!',mtError,[mbRetry],0);
     exit;
    end;
   if Length(Ringe.Text)<3 then
    begin
     MessageDlg('Die Ringstellung ist NICHT korrekt!',mtError,[mbRetry],0);
     exit;
    end;
   if Length(Grund.Text)<3 then
    begin
     MessageDlg('Die Grundstellung ist NICHT korrekt!',mtError,[mbRetry],0);
     exit;
    end;
   TLEin:=0; // Zähler der Buchstaben
   // Umkehrwalze
   if ReflektorWahl.ItemIndex=0 then Reflektor:=ReflektorB
   else Reflektor:=ReflektorC;
   for K:=0 to 25 do
    UmkehrWalze[K]:=pos(Reflektor[K+1],Alfa)-1;
   // Walzenlage
   WalzeL:=pos(Walzenlage.Text[1],Ziffern);
   WalzeM:=pos(Walzenlage.Text[2],Ziffern);
   WalzeR:=pos(Walzenlage.Text[3],Ziffern);
   // Grundstellung
   StartL:=pos(Grund.Text[1],Alfa)-1;ZaehlerL:=StartL;
   StartM:=pos(Grund.Text[2],Alfa)-1;ZaehlerM:=StartM;
   StartR:=pos(Grund.Text[3],Alfa)-1;ZaehlerR:=StartR;
   AlfaL:=copy(Alfa,StartL+1,26-StartL)+copy(Alfa,1,StartL);
   AlfaM:=copy(Alfa,StartM+1,26-StartM)+copy(Alfa,1,StartM);
   AlfaR:=copy(Alfa,StartR+1,26-StartR)+copy(Alfa,1,StartR);
   // Ringstellung
   RingL:=pos(Ringe.Text[1],Alfa)-1;
   RingM:=pos(Ringe.Text[2],Alfa)-1;
   RingR:=pos(Ringe.Text[3],Alfa)-1;
   // Rotoren
   RotorL:=Rotor[WalzeL];
   RotorM:=Rotor[WalzeM];
   RotorR:=Rotor[WalzeR];
   for K:=0 to 25 do
    begin
     RotorL_Liste[K]:=pos(RotorL[K+1],Alfa)-1;
     RotorM_Liste[K]:=pos(RotorM[K+1],Alfa)-1;
     RotorR_Liste[K]:=pos(RotorR[K+1],Alfa)-1;
     RotorL_Invers[RotorL_Liste[K]]:=K;
     RotorM_Invers[RotorM_Liste[K]]:=K;
     RotorR_Invers[RotorR_Liste[K]]:=K;
    end;
   // Übertragskerbe
   KerbeL:=pos(Kerbe[WalzeL],Alfa)-1;
   KerbeM:=pos(Kerbe[WalzeM],Alfa)-1;
   KerbeR:=pos(Kerbe[WalzeR],Alfa)-1;
   // Steckerverbindung
   for K:=0 to 25 do SteckBrett[K]:=K; // keine Steckverbindungen
   LS:=Length(Stecker.Text);
   if odd(LS) then // ungerade Anzahl
    begin
     MessageDlg('Die Stecker sind NICHT korrekt!',mtError,[mbRetry],0);
     exit;
    end;
   for K:=1 to LS div 2 do
    begin
     SteckBrett[pos(Stecker.Text[2*K-1],Alfa)-1]:=pos(Stecker.Text[2*K],Alfa)-1;
     SteckBrett[pos(Stecker.Text[2*K],Alfa)-1]:=pos(Stecker.Text[2*K-1],Alfa)-1;
    end;
   Brett:='';
   for K:=0 to 25 do Brett:=Brett+Alfa[SteckBrett[K]+1];
   ButtonEinAus(True);
   Eingabe.Text:='';
   Ausgabe.Text:='';
   Walzenlage.ReadOnly:=True;
   Ringe.ReadOnly:=True;
   Grund.ReadOnly:=True;
   Stecker.ReadOnly:=True;
   KeyPreview:=True; // Tastaturereignisse werden zuerst ans Formular geschickt
   Start.Enabled:=False;
   ReflektorWahl.Enabled:=False;
   Ende.Enabled:=True;
   Reset.Enabled:=False;
   ERO.Enabled:=True;
   Einstellung.Enabled:=False;
   Anzeige;
  end;

procedure TMain.EndeClick(Sender: TObject);
begin
   ButtonEinAus(False);
   Walzenlage.ReadOnly:=False;
   Ringe.ReadOnly:=False;
   Grund.ReadOnly:=False;
   Stecker.ReadOnly:=False;
   KeyPreview:=False;
   Start.Enabled:=True;
   ReflektorWahl.Enabled:=True;
   Ende.Enabled:=False;
   Reset.Enabled:=True;
   Coden.Enabled:=False;
   ERO.Checked:=True;
   Einstellung.Enabled:=True;
   Einstellung.ItemIndex:=-1;
end;

procedure TMain.EinstellungClick(Sender: TObject);
begin
   case Einstellung.ItemIndex of
    0: begin
        Walzenlage.Text:='123';
        Ringe.Text:='AAA';
        Grund.Text:='HDX';
        Stecker.Text:='';
        Reflektorwahl.ItemIndex:=0;
       end;
    1: begin
        Walzenlage.Text:='143';
        Ringe.Text:='PZH';
        Grund.Text:='RTZ';
        Stecker.Text:='ADCNETFLGIJVKZPUQYWX';
        Reflektorwahl.ItemIndex:=0;
       end;
    2: begin
        Walzenlage.Text:='321';
        Ringe.Text:='AAA';
        Grund.Text:='AAA';
        Stecker.Text:='';
        Reflektorwahl.ItemIndex:=0;
       end;
   end;
  end;

procedure TMain.Button18Click(Sender: TObject);
 var Button:TButton;
      K:Integer;
      Zeichen:Char;
  begin
   // Button finden
   for K:=1 to Length(Alfa) do
    begin
     Button:=TButton(FindComponent('Button'+IntToStr(K)));
     if Button=Sender then
      begin Zeichen:=Alfa[K];Break end
    end;
   Eingabe.Text:=Eingabe.Text+Zeichen;
   if Block.Checked then inc(TLEin);
   Codieren(Zeichen);
   if TLEin=5 then
    begin
     Eingabe.Text:=Eingabe.Text+' ';
     Ausgabe.Text:=Ausgabe.Text+' ';
     TLEin:=0;
    end;
   SendMessage(Eingabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
   SendMessage(Ausgabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
  end;

procedure TMain.Button29Click(Sender: TObject);
 var Button:TButton;
      K:Integer;
      Zeichen:Char;
  begin
   // Button finden
   for K:=1 to Length(Alfa) do
    begin
     Button:=TButton(FindComponent('Button'+IntToStr(K)));
     if Button=Sender then
      begin Zeichen:=Alfa[K];Break end
    end;
   Eingabe.Text:=Eingabe.Text+Zeichen;
   if Block.Checked then inc(TLEin);
   Codieren(Zeichen);
   if TLEin=5 then
    begin
     Eingabe.Text:=Eingabe.Text+' ';
     Ausgabe.Text:=Ausgabe.Text+' ';
     TLEin:=0;
    end;
   SendMessage(Eingabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
   SendMessage(Ausgabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
  end;

procedure TMain.Button14Click(Sender: TObject);
 var Button:TButton;
      K:Integer;
      Zeichen:Char;
  begin
   // Button finden
   for K:=1 to Length(Alfa) do
    begin
     Button:=TButton(FindComponent('Button'+IntToStr(K)));
     if Button=Sender then
      begin Zeichen:=Alfa[K];Break end
    end;
   Eingabe.Text:=Eingabe.Text+Zeichen;
   if Block.Checked then inc(TLEin);
   Codieren(Zeichen);
   if TLEin=5 then
    begin
     Eingabe.Text:=Eingabe.Text+' ';
     Ausgabe.Text:=Ausgabe.Text+' ';
     TLEin:=0;
    end;
   SendMessage(Eingabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
   SendMessage(Ausgabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
  end;


procedure TMain.Button20Click(Sender: TObject);
 var Button:TButton;
      K:Integer;
      Zeichen:Char;
  begin
   // Button finden
   for K:=1 to Length(Alfa) do
    begin
     Button:=TButton(FindComponent('Button'+IntToStr(K)));
     if Button=Sender then
      begin Zeichen:=Alfa[K];Break end
    end;
   Eingabe.Text:=Eingabe.Text+Zeichen;
   if Block.Checked then inc(TLEin);
   Codieren(Zeichen);
   if TLEin=5 then
    begin
     Eingabe.Text:=Eingabe.Text+' ';
     Ausgabe.Text:=Ausgabe.Text+' ';
     TLEin:=0;
    end;
   SendMessage(Eingabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
   SendMessage(Ausgabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
  end;

procedure TMain.Button21Click(Sender: TObject);
 var Button:TButton;
      K:Integer;
      Zeichen:Char;
  begin
   // Button finden
   for K:=1 to Length(Alfa) do
    begin
     Button:=TButton(FindComponent('Button'+IntToStr(K)));
     if Button=Sender then
      begin Zeichen:=Alfa[K];Break end
    end;
   Eingabe.Text:=Eingabe.Text+Zeichen;
   if Block.Checked then inc(TLEin);
   Codieren(Zeichen);
   if TLEin=5 then
    begin
     Eingabe.Text:=Eingabe.Text+' ';
     Ausgabe.Text:=Ausgabe.Text+' ';
     TLEin:=0;
    end;
   SendMessage(Eingabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
   SendMessage(Ausgabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
  end;

procedure TMain.Button28Click(Sender: TObject);
 var Button:TButton;
      K:Integer;
      Zeichen:Char;
  begin
   // Button finden
   for K:=1 to Length(Alfa) do
    begin
     Button:=TButton(FindComponent('Button'+IntToStr(K)));
     if Button=Sender then
      begin Zeichen:=Alfa[K];Break end
    end;
   Eingabe.Text:=Eingabe.Text+Zeichen;
   if Block.Checked then inc(TLEin);
   Codieren(Zeichen);
   if TLEin=5 then
    begin
     Eingabe.Text:=Eingabe.Text+' ';
     Ausgabe.Text:=Ausgabe.Text+' ';
     TLEin:=0;
    end;
   SendMessage(Eingabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
   SendMessage(Ausgabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
  end;

procedure TMain.Button26Click(Sender: TObject);
 var Button:TButton;
      K:Integer;
      Zeichen:Char;
  begin
   // Button finden
   for K:=1 to Length(Alfa) do
    begin
     Button:=TButton(FindComponent('Button'+IntToStr(K)));
     if Button=Sender then
      begin Zeichen:=Alfa[K];Break end
    end;
   Eingabe.Text:=Eingabe.Text+Zeichen;
   if Block.Checked then inc(TLEin);
   Codieren(Zeichen);
   if TLEin=5 then
    begin
     Eingabe.Text:=Eingabe.Text+' ';
     Ausgabe.Text:=Ausgabe.Text+' ';
     TLEin:=0;
    end;
   SendMessage(Eingabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
   SendMessage(Ausgabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
  end;

procedure TMain.Button15Click(Sender: TObject);
 var Button:TButton;
      K:Integer;
      Zeichen:Char;
  begin
   // Button finden
   for K:=1 to Length(Alfa) do
    begin
     Button:=TButton(FindComponent('Button'+IntToStr(K)));
     if Button=Sender then
      begin Zeichen:=Alfa[K];Break end
    end;
   Eingabe.Text:=Eingabe.Text+Zeichen;
   if Block.Checked then inc(TLEin);
   Codieren(Zeichen);
   if TLEin=5 then
    begin
     Eingabe.Text:=Eingabe.Text+' ';
     Ausgabe.Text:=Ausgabe.Text+' ';
     TLEin:=0;
    end;
   SendMessage(Eingabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
   SendMessage(Ausgabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
  end;

procedure TMain.Button24Click(Sender: TObject);
 var Button:TButton;
      K:Integer;
      Zeichen:Char;
  begin
   // Button finden
   for K:=1 to Length(Alfa) do
    begin
     Button:=TButton(FindComponent('Button'+IntToStr(K)));
     if Button=Sender then
      begin Zeichen:=Alfa[K];Break end
    end;
   Eingabe.Text:=Eingabe.Text+Zeichen;
   if Block.Checked then inc(TLEin);
   Codieren(Zeichen);
   if TLEin=5 then
    begin
     Eingabe.Text:=Eingabe.Text+' ';
     Ausgabe.Text:=Ausgabe.Text+' ';
     TLEin:=0;
    end;
   SendMessage(Eingabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
   SendMessage(Ausgabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
  end;

procedure TMain.Button6Click(Sender: TObject);
 var Button:TButton;
      K:Integer;
      Zeichen:Char;
  begin
   // Button finden
   for K:=1 to Length(Alfa) do
    begin
     Button:=TButton(FindComponent('Button'+IntToStr(K)));
     if Button=Sender then
      begin Zeichen:=Alfa[K];Break end
    end;
   Eingabe.Text:=Eingabe.Text+Zeichen;
   if Block.Checked then inc(TLEin);
   Codieren(Zeichen);
   if TLEin=5 then
    begin
     Eingabe.Text:=Eingabe.Text+' ';
     Ausgabe.Text:=Ausgabe.Text+' ';
     TLEin:=0;
    end;
   SendMessage(Eingabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
   SendMessage(Ausgabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
  end;

procedure TMain.Button25Click(Sender: TObject);
 var Button:TButton;
      K:Integer;
      Zeichen:Char;
  begin
   // Button finden
   for K:=1 to Length(Alfa) do
    begin
     Button:=TButton(FindComponent('Button'+IntToStr(K)));
     if Button=Sender then
      begin Zeichen:=Alfa[K];Break end
    end;
   Eingabe.Text:=Eingabe.Text+Zeichen;
   if Block.Checked then inc(TLEin);
   Codieren(Zeichen);
   if TLEin=5 then
    begin
     Eingabe.Text:=Eingabe.Text+' ';
     Ausgabe.Text:=Ausgabe.Text+' ';
     TLEin:=0;
    end;
   SendMessage(Eingabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
   SendMessage(Ausgabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
  end;

procedure TMain.Button13Click(Sender: TObject);
 var Button:TButton;
      K:Integer;
      Zeichen:Char;
  begin
   // Button finden
   for K:=1 to Length(Alfa) do
    begin
     Button:=TButton(FindComponent('Button'+IntToStr(K)));
     if Button=Sender then
      begin Zeichen:=Alfa[K];Break end
    end;
   Eingabe.Text:=Eingabe.Text+Zeichen;
   if Block.Checked then inc(TLEin);
   Codieren(Zeichen);
   if TLEin=5 then
    begin
     Eingabe.Text:=Eingabe.Text+' ';
     Ausgabe.Text:=Ausgabe.Text+' ';
     TLEin:=0;
    end;
   SendMessage(Eingabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
   SendMessage(Ausgabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
  end;

procedure TMain.Button9Click(Sender: TObject);
 var Button:TButton;
      K:Integer;
      Zeichen:Char;
  begin
   // Button finden
   for K:=1 to Length(Alfa) do
    begin
     Button:=TButton(FindComponent('Button'+IntToStr(K)));
     if Button=Sender then
      begin Zeichen:=Alfa[K];Break end
    end;
   Eingabe.Text:=Eingabe.Text+Zeichen;
   if Block.Checked then inc(TLEin);
   Codieren(Zeichen);
   if TLEin=5 then
    begin
     Eingabe.Text:=Eingabe.Text+' ';
     Ausgabe.Text:=Ausgabe.Text+' ';
     TLEin:=0;
    end;
   SendMessage(Eingabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
   SendMessage(Ausgabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
  end;

procedure TMain.Button8Click(Sender: TObject);
 var Button:TButton;
      K:Integer;
      Zeichen:Char;
  begin
   // Button finden
   for K:=1 to Length(Alfa) do
    begin
     Button:=TButton(FindComponent('Button'+IntToStr(K)));
     if Button=Sender then
      begin Zeichen:=Alfa[K];Break end
    end;
   Eingabe.Text:=Eingabe.Text+Zeichen;
   if Block.Checked then inc(TLEin);
   Codieren(Zeichen);
   if TLEin=5 then
    begin
     Eingabe.Text:=Eingabe.Text+' ';
     Ausgabe.Text:=Ausgabe.Text+' ';
     TLEin:=0;
    end;
   SendMessage(Eingabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
   SendMessage(Ausgabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
  end;

procedure TMain.Button10Click(Sender: TObject);
 var Button:TButton;
      K:Integer;
      Zeichen:Char;
  begin
   // Button finden
   for K:=1 to Length(Alfa) do
    begin
     Button:=TButton(FindComponent('Button'+IntToStr(K)));
     if Button=Sender then
      begin Zeichen:=Alfa[K];Break end
    end;
   Eingabe.Text:=Eingabe.Text+Zeichen;
   if Block.Checked then inc(TLEin);
   Codieren(Zeichen);
   if TLEin=5 then
    begin
     Eingabe.Text:=Eingabe.Text+' ';
     Ausgabe.Text:=Ausgabe.Text+' ';
     TLEin:=0;
    end;
   SendMessage(Eingabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
   SendMessage(Ausgabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
  end;

procedure TMain.Button11Click(Sender: TObject);
 var Button:TButton;
      K:Integer;
      Zeichen:Char;
  begin
   // Button finden
   for K:=1 to Length(Alfa) do
    begin
     Button:=TButton(FindComponent('Button'+IntToStr(K)));
     if Button=Sender then
      begin Zeichen:=Alfa[K];Break end
    end;
   Eingabe.Text:=Eingabe.Text+Zeichen;
   if Block.Checked then inc(TLEin);
   Codieren(Zeichen);
   if TLEin=5 then
    begin
     Eingabe.Text:=Eingabe.Text+' ';
     Ausgabe.Text:=Ausgabe.Text+' ';
     TLEin:=0;
    end;
   SendMessage(Eingabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
   SendMessage(Ausgabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
  end;

procedure TMain.Button16Click(Sender: TObject);
 var Button:TButton;
      K:Integer;
      Zeichen:Char;
  begin
   // Button finden
   for K:=1 to Length(Alfa) do
    begin
     Button:=TButton(FindComponent('Button'+IntToStr(K)));
     if Button=Sender then
      begin Zeichen:=Alfa[K];Break end
    end;
   Eingabe.Text:=Eingabe.Text+Zeichen;
   if Block.Checked then inc(TLEin);
   Codieren(Zeichen);
   if TLEin=5 then
    begin
     Eingabe.Text:=Eingabe.Text+' ';
     Ausgabe.Text:=Ausgabe.Text+' ';
     TLEin:=0;
    end;
   SendMessage(Eingabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
   SendMessage(Ausgabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
  end;

procedure TMain.Button19Click(Sender: TObject);
 var Button:TButton;
      K:Integer;
      Zeichen:Char;
  begin
   // Button finden
   for K:=1 to Length(Alfa) do
    begin
     Button:=TButton(FindComponent('Button'+IntToStr(K)));
     if Button=Sender then
      begin Zeichen:=Alfa[K];Break end
    end;
   Eingabe.Text:=Eingabe.Text+Zeichen;
   if Block.Checked then inc(TLEin);
   Codieren(Zeichen);
   if TLEin=5 then
    begin
     Eingabe.Text:=Eingabe.Text+' ';
     Ausgabe.Text:=Ausgabe.Text+' ';
     TLEin:=0;
    end;
   SendMessage(Eingabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
   SendMessage(Ausgabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
  end;

procedure TMain.Button27Click(Sender: TObject);
 var Button:TButton;
      K:Integer;
      Zeichen:Char;
  begin
   // Button finden
   for K:=1 to Length(Alfa) do
    begin
     Button:=TButton(FindComponent('Button'+IntToStr(K)));
     if Button=Sender then
      begin Zeichen:=Alfa[K];Break end
    end;
   Eingabe.Text:=Eingabe.Text+Zeichen;
   if Block.Checked then inc(TLEin);
   Codieren(Zeichen);
   if TLEin=5 then
    begin
     Eingabe.Text:=Eingabe.Text+' ';
     Ausgabe.Text:=Ausgabe.Text+' ';
     TLEin:=0;
    end;
   SendMessage(Eingabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
   SendMessage(Ausgabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
  end;

procedure TMain.Button12Click(Sender: TObject);
 var Button:TButton;
      K:Integer;
      Zeichen:Char;
  begin
   // Button finden
   for K:=1 to Length(Alfa) do
    begin
     Button:=TButton(FindComponent('Button'+IntToStr(K)));
     if Button=Sender then
      begin Zeichen:=Alfa[K];Break end
    end;
   Eingabe.Text:=Eingabe.Text+Zeichen;
   if Block.Checked then inc(TLEin);
   Codieren(Zeichen);
   if TLEin=5 then
    begin
     Eingabe.Text:=Eingabe.Text+' ';
     Ausgabe.Text:=Ausgabe.Text+' ';
     TLEin:=0;
    end;
   SendMessage(Eingabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
   SendMessage(Ausgabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
  end;

procedure TMain.Button31Click(Sender: TObject);
 var Button:TButton;
      K:Integer;
      Zeichen:Char;
  begin
   // Button finden
   for K:=1 to Length(Alfa) do
    begin
     Button:=TButton(FindComponent('Button'+IntToStr(K)));
     if Button=Sender then
      begin Zeichen:=Alfa[K];Break end
    end;
   Eingabe.Text:=Eingabe.Text+Zeichen;
   if Block.Checked then inc(TLEin);
   Codieren(Zeichen);
   if TLEin=5 then
    begin
     Eingabe.Text:=Eingabe.Text+' ';
     Ausgabe.Text:=Ausgabe.Text+' ';
     TLEin:=0;
    end;
   SendMessage(Eingabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
   SendMessage(Ausgabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
  end;

procedure TMain.Button30Click(Sender: TObject);
 var Button:TButton;
      K:Integer;
      Zeichen:Char;
  begin
   // Button finden
   for K:=1 to Length(Alfa) do
    begin
     Button:=TButton(FindComponent('Button'+IntToStr(K)));
     if Button=Sender then
      begin Zeichen:=Alfa[K];Break end
    end;
   Eingabe.Text:=Eingabe.Text+Zeichen;
   if Block.Checked then inc(TLEin);
   Codieren(Zeichen);
   if TLEin=5 then
    begin
     Eingabe.Text:=Eingabe.Text+' ';
     Ausgabe.Text:=Ausgabe.Text+' ';
     TLEin:=0;
    end;
   SendMessage(Eingabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
   SendMessage(Ausgabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
  end;

procedure TMain.Button7Click(Sender: TObject);
 var Button:TButton;
      K:Integer;
      Zeichen:Char;
  begin
   // Button finden
   for K:=1 to Length(Alfa) do
    begin
     Button:=TButton(FindComponent('Button'+IntToStr(K)));
     if Button=Sender then
      begin Zeichen:=Alfa[K];Break end
    end;
   Eingabe.Text:=Eingabe.Text+Zeichen;
   if Block.Checked then inc(TLEin);
   Codieren(Zeichen);
   if TLEin=5 then
    begin
     Eingabe.Text:=Eingabe.Text+' ';
     Ausgabe.Text:=Ausgabe.Text+' ';
     TLEin:=0;
    end;
   SendMessage(Eingabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
   SendMessage(Ausgabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
  end;

procedure TMain.Button23Click(Sender: TObject);
 var Button:TButton;
      K:Integer;
      Zeichen:Char;
  begin
   // Button finden
   for K:=1 to Length(Alfa) do
    begin
     Button:=TButton(FindComponent('Button'+IntToStr(K)));
     if Button=Sender then
      begin Zeichen:=Alfa[K];Break end
    end;
   Eingabe.Text:=Eingabe.Text+Zeichen;
   if Block.Checked then inc(TLEin);
   Codieren(Zeichen);
   if TLEin=5 then
    begin
     Eingabe.Text:=Eingabe.Text+' ';
     Ausgabe.Text:=Ausgabe.Text+' ';
     TLEin:=0;
    end;
   SendMessage(Eingabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
   SendMessage(Ausgabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
  end;

procedure TMain.Button22Click(Sender: TObject);
 var Button:TButton;
      K:Integer;
      Zeichen:Char;
  begin
   // Button finden
   for K:=1 to Length(Alfa) do
    begin
     Button:=TButton(FindComponent('Button'+IntToStr(K)));
     if Button=Sender then
      begin Zeichen:=Alfa[K];Break end
    end;
   Eingabe.Text:=Eingabe.Text+Zeichen;
   if Block.Checked then inc(TLEin);
   Codieren(Zeichen);
   if TLEin=5 then
    begin
     Eingabe.Text:=Eingabe.Text+' ';
     Ausgabe.Text:=Ausgabe.Text+' ';
     TLEin:=0;
    end;
   SendMessage(Eingabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
   SendMessage(Ausgabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
  end;

procedure TMain.Button17Click(Sender: TObject);
 var Button:TButton;
      K:Integer;
      Zeichen:Char;
  begin
   // Button finden
   for K:=1 to Length(Alfa) do
    begin
     Button:=TButton(FindComponent('Button'+IntToStr(K)));
     if Button=Sender then
      begin Zeichen:=Alfa[K];Break end
    end;
   Eingabe.Text:=Eingabe.Text+Zeichen;
   if Block.Checked then inc(TLEin);
   Codieren(Zeichen);
   if TLEin=5 then
    begin
     Eingabe.Text:=Eingabe.Text+' ';
     Ausgabe.Text:=Ausgabe.Text+' ';
     TLEin:=0;
    end;
   SendMessage(Eingabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
   SendMessage(Ausgabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
  end;

procedure TMain.ResetClick(Sender: TObject);
begin
   Eingabe.Text:='';
   Ausgabe.Text:='';
   Stecker.Text:='';
   RotorAnzeige.Clear;
   Walzenlage.Text:='123';
   Ringe.Text:='AAA';
   Grund.Text:='AAA';
   ReflektorWahl.ItemIndex:=0;
   RotorenAnzeige.Checked:=True;
   Block.Checked:=True;
   ERO.Enabled:=False;
   Coden.Enabled:=False;
end;

procedure TMain.CodenClick(Sender: TObject);
 var Zeile,Code:String;
      K,Position:Integer;
  begin
   Zeile:=Eingabe.Text;
   Code:='';
   // alle Nicht-Buchstaben löschen
   for K:=1 to Length(Zeile) do
    if pos(Zeile[K],Alfa)>0 then Code:=Code+Zeile[K];
   Eingabe.Clear;
   Eingabe.Text:=Code;
   SendMessage(Eingabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
   Zeile:=Code;
   Rotorenanzeige.Checked:=False;
   Block.Checked:=False;
   Code:='';
   for K:=1 to Length(Zeile) do
    begin
     if ZaehlerM=KerbeM then
      begin
       inc(ZaehlerM);
       AlfaM:=copy(AlfaM,2,25)+AlfaM[1];
       RotorM:=copy(RotorM,2,25)+RotorM[1];
       inc(ZaehlerL);
       AlfaL:=copy(AlfaL,2,25)+AlfaL[1];
       RotorL:=copy(RotorL,2,25)+RotorL[1];
      end
     else if ZaehlerR=KerbeR then
      begin
       inc(ZaehlerM);
       AlfaM:=copy(AlfaM,2,25)+AlfaM[1];
       RotorM:=copy(RotorM,2,25)+RotorM[1];
      end;
     inc(ZaehlerR);
     AlfaR:=copy(AlfaR,2,25)+AlfaR[1];
     RotorR:=copy(RotorR,2,25)+RotorR[1];
     ZaehlerL:=ZaehlerL mod 26;
     ZaehlerM:=ZaehlerM mod 26;
     ZaehlerR:=ZaehlerR mod 26;
     Position:=pos(Zeile[K],Alfa)-1;
     Position:=SteckBrett[Position]; // Steckerverbindung
     Position:=(RotorR_Liste[(Position+26-RingR+ZaehlerR)mod 26]+(RingR+26-ZaehlerR))mod 26;
     Position:=(RotorM_Liste[(Position+26-RingM+ZaehlerM)mod 26]+(RingM+26-ZaehlerM))mod 26;
     Position:=(RotorL_Liste[(Position+26-RingL+ZaehlerL)mod 26]+(RingL+26-ZaehlerL))mod 26;
     Position:=UmkehrWalze[Position]; // Umkehrwalze
     Position:=(RotorL_Invers[(Position+26-RingL+ZaehlerL)mod 26]+(RingL+26-ZaehlerL))mod 26;
     Position:=(RotorM_Invers[(Position+26-RingM+ZaehlerM)mod 26]+(RingM+26-ZaehlerM))mod 26;
     Position:=(RotorR_Invers[(Position+26-RingR+ZaehlerR)mod 26]+(RingR+26-ZaehlerR))mod 26;
     Position:=SteckBrett[Position]; // Steckerverbindung
     Code:=Code+Alfa[Position+1];
    end;
   Ausgabe.Text:=Code;
   SendMessage(Ausgabe.Handle,WM_VSCROLL,SB_BOTTOM,0);
   Grund.Text:=Alfa[ZaehlerL+1]+Alfa[ZaehlerM+1]+Alfa[ZaehlerR+1];
  end;

procedure TMain.EROClick(Sender: TObject);
  begin
   if ERO.Checked then
    begin
     Eingabe.ReadOnly:=True;
     Coden.Enabled:=False;
     if not Start.Enabled then KeyPreview:=True;
    end
   else
    begin
     Eingabe.ReadOnly:=False;
     Coden.Enabled:=True;
     KeyPreview:=False;
    end
  end;

end.
