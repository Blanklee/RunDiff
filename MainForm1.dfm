object MainForm: TMainForm
  Left = 192
  Top = 107
  Width = 593
  Height = 391
  Caption = 'Run DIFF'
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
    577
    352)
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 30
    Height = 12
    Caption = 'File1:'
  end
  object Label2: TLabel
    Left = 16
    Top = 40
    Width = 30
    Height = 12
    Caption = 'File2:'
  end
  object Button1: TButton
    Left = 48
    Top = 64
    Width = 105
    Height = 25
    Caption = '&Run DIFF !'
    Default = True
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button5: TButton
    Left = 400
    Top = 64
    Width = 73
    Height = 25
    Cancel = True
    Caption = 'E&xit'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button3: TButton
    Left = 240
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
      'Run Diff v1.3'
      ''
      'cmd /c diff -ur file1 file2 > ddd'
      'vi ddd'
      '')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Button4: TButton
    Left = 320
    Top = 64
    Width = 73
    Height = 25
    Caption = '&Swap'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button2: TButton
    Left = 160
    Top = 64
    Width = 73
    Height = 25
    Caption = 'Run &VI'
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
