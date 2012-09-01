program yourarchive;

uses
  Forms,
  yarchive in 'units\yarchive.pas' {Main},
  player in 'units\player.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
