object MainForm: TMainForm
  Left = 192
  Top = 107
  Width = 574
  Height = 370
  Caption = 'DIFF '#47749#47161' '#44036#54200' '#49892#54665#44592
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548
  Font.Style = []
  OldCreateOrder = False
  Position = poDefaultPosOnly
  OnCreate = FormCreate
  DesignSize = (
    566
    343)
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 34
    Height = 12
    Caption = #54028#51068'1:'
  end
  object Label2: TLabel
    Left = 16
    Top = 40
    Width = 34
    Height = 12
    Caption = #54028#51068'2:'
  end
  object Button1: TButton
    Left = 48
    Top = 64
    Width = 137
    Height = 25
    Caption = '&DIFF '#47749#47161' '#49892#54665'!'
    Default = True
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button5: TButton
    Left = 432
    Top = 64
    Width = 73
    Height = 25
    Cancel = True
    Caption = 'E&xit'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button3: TButton
    Left = 272
    Top = 64
    Width = 73
    Height = 25
    Caption = '&Clear'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Memo1: TMemo
    Left = 16
    Top = 104
    Width = 539
    Height = 225
    Anchors = [akLeft, akTop, akRight, akBottom]
    ImeName = 'Microsoft Office IME 2007'
    Lines.Strings = (
      'diff '#47749#47161' '#44036#54200' '#49892#54665#44592' v1.0'
      ''
      'cmd /c diff -ur file1 file2 > ddd'
      'vi ddd'
      '')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Button4: TButton
    Left = 352
    Top = 64
    Width = 73
    Height = 25
    Caption = '&Swap'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button2: TButton
    Left = 192
    Top = 64
    Width = 73
    Height = 25
    Caption = '&VI '#49892#54665
    TabOrder = 2
    OnClick = Button2Click
  end
  object FileDrop1: TFileDrop
    EnableDrop = False
    OnDrop = FileDrop1Drop
    Left = 152
    Top = 16
  end
end
