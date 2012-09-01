library FCaesar;

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ExtCtrls,
  ComCtrls,
  Menus,
  XPMan,
  StdCtrls,
  Grids,
  Buttons,
  ToolWin,
  AppEvnts,
  ValEdit,
  Math,
  OleCtrls,
  SHDocVw,
  shellapi,
  TypInfo,
  inifiles;

{$R *.res}

var
  ThreadID: DWORD;       //Thread-ID
  ThreadHandle: THandle; //Rückgabewert von CreateThread

function encode1(inifile,s:string):pchar;
var ini:Tinifile;
    Tempsection:Tstringlist;
    i:integer;
begin
  Tempsection := TStringList.Create;
  ini := TIniFile.Create(''+ExtractFilePath(ParamStr(0))+'options.ini');
  ini.ReadSection('letters', Tempsection);
  ini.ReadSectionValues('letters', Tempsection);
  for i := 0 to Tempsection.Count - 1 do begin
    stringreplace(s,Tempsection.Names[i],Tempsection.Values[Tempsection.Names[i]], [rfreplaceall]);
    Tempsection.Values[Tempsection.Names[i]]
  end;
  ini.Free;
  Tempsection.Free;
end;





exports
  encode1;

end.
 