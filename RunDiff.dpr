program RunDiff;

uses
  Forms,
  MainForm1 in 'MainForm1.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'DIFF �����';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
