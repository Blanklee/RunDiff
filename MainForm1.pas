unit MainForm1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellApi, FileDrop, IniFiles;

type
  TMainForm = class(TForm)
    FileDrop1: TFileDrop;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FileDrop1Drop(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
    File1: string;
    File2: string;
    FDiffCmd: string;
    FGvimCmd: string;
    FFolderName: string;
    procedure LoadFromIniFile;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FileDrop1.DropControl:= Self;
  FFolderName:= ExtractFileDir(Application.ExeName);
  LoadFromIniFile;
end;

procedure TMainForm.LoadFromIniFile;
var
  IniFile: TIniFile;
begin
  FDiffCmd:= '';
  FGvimCmd:= '';
  IniFile:= TIniFile.Create(FFolderName + '\RunDiff.ini');

  try
    try
      FDiffCmd:= IniFile.ReadString('Options', 'Diff Command', 'C:\Program Files (x86)\GnuWin32\diff.exe');
      FGvimCmd:= IniFile.ReadString('Options', 'Gvim Command', 'C:\Program Files (x86)\gvim\gvim.exe');
    except
    end;
  finally
    IniFile.Free;
  end;
end;

procedure TMainForm.FileDrop1Drop(Sender: TObject);
begin
  // 한꺼번에 2개를 Drop하면
  if (FileDrop1.FileCount >= 2) then begin
    File1:= FileDrop1.Files[0];
    File2:= FileDrop1.Files[1];
    Label1.Caption:= 'File1: ' + File1;
    Label2.Caption:= 'File2: ' + File2;
  end else

  // 하나씩 따로따로 Drop할 수도 있다
  if (FileDrop1.FileCount = 1) then begin
    // 첫번째 파일 Drop
    if (File1='') then begin
      File1:= FileDrop1.Files[0];
      Label1.Caption:= 'File1: ' + File1;
    end
    // 두번째 파일 Drop
    else begin
      File2:= FileDrop1.Files[0];
      Label2.Caption:= 'File2: ' + File2;
    end;
  end;
end;

procedure TMainForm.Button1Click(Sender: TObject);
var
  diff: string;
begin
  if (File1 = '') or (File2 = '') then exit;
  if (File1 = File2) then exit;

  Memo1.Lines.Add('cmd /c "' + FDiffCmd + '" -ur');
  Memo1.Lines.Add('"' + File1 + '"');
  Memo1.Lines.Add('"' + File2 + '"');
  Memo1.Lines.Add('> "' + FFolderName + '\ddd"');
  Memo1.Lines.Add('');

  // Diff 명령을 실행한다
  // ShellExecute (0, nil, PChar('"C:\Program Files\GnuWin32\diff.exe"'), PChar('-ur "' + File1 + '" "' + File2 + '" > "' + FFolderName + '\ddd"'), PChar(FFolderName), SW_NORMAL);
  diff:= '/c ""' + FDiffCmd + '" -ur "' + File1 + '" "' + File2 + '" > ddd"';
  ShellExecute (0, nil, PChar('cmd'), PChar(diff), PChar(FFolderName), SW_NORMAL);

  // gvim 명령을 실행한다
  ShellExecute (0, nil, PChar(FGvimCmd), PChar('"' + FFolderName + '\ddd"'), nil, SW_NORMAL);
end;

procedure TMainForm.Button2Click(Sender: TObject);
begin
  // FGvimCmd는 중간에 공백이 있더라도 아래처럼 ""로 묶어주지 않아도 된다
  // ShellExecute (0, nil, PChar('"' + FGvimCmd + '"'), PChar('"' + FFolderName + '\ddd"'), nil, SW_NORMAL);
  ShellExecute (0, nil, PChar(FGvimCmd), PChar('"' + FFolderName + '\ddd"'), nil, SW_NORMAL);
end;

procedure TMainForm.Button3Click(Sender: TObject);
begin
  // 파일명 초기화
  File1:= '';
  File2:= '';
  Label1.Caption:= 'File1:';
  Label2.Caption:= 'File2:';
end;

procedure TMainForm.Button4Click(Sender: TObject);
var
  s: string;
begin
  // File1과 File2를 서로 바꾼다
  s:= File1;
  File1:= File2;
  File2:= s;

  Label1.Caption:= 'File1: ' + File1;
  Label2.Caption:= 'File2: ' + File2;
end;

procedure TMainForm.Button5Click(Sender: TObject);
begin
  Close;
end;

end.

