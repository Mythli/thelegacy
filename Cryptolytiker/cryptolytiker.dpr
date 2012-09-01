program cryptolytiker;

uses
  Forms,
  lytiker in 'lytiker.pas' {Main};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
