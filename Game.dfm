object PicturesGame: TPicturesGame
  Left = 329
  Top = 62
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1055#1072#1088#1085#1099#1077' '#1082#1072#1088#1090#1080#1085#1082#1080' '#1089' '#1074#1077#1083#1086#1089#1080#1087#1077#1076#1072#1084#1080
  ClientHeight = 835
  ClientWidth = 1486
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenuGame
  OldCreateOrder = False
  Position = poDesigned
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GameBg: TImage
    Left = 0
    Top = 0
    Width = 1486
    Height = 835
    Align = alClient
    Stretch = True
    ExplicitLeft = 48
    ExplicitTop = -8
    ExplicitWidth = 1077
    ExplicitHeight = 657
  end
  object LevelOneButton: TImage
    Left = 312
    Top = 240
    Width = 105
    Height = 105
    OnClick = LevelOneButtonClick
  end
  object LevelTwoButton: TImage
    Left = 808
    Top = 240
    Width = 105
    Height = 105
    OnClick = LevelTwoButtonClick
  end
  object LevelThreeButton: TImage
    Left = 312
    Top = 384
    Width = 105
    Height = 105
    OnClick = LevelThreeButtonClick
  end
  object LevelFourButton: TImage
    Left = 808
    Top = 384
    Width = 105
    Height = 105
    OnClick = LevelFourButtonClick
  end
  object Field: TPaintBox
    Left = 112
    Top = 208
    Width = 225
    Height = 217
    OnMouseDown = FieldMouseDown
    OnPaint = FieldPaint
  end
  object Time: TLabel
    Left = 8
    Top = 16
    Width = 22
    Height = 13
    Caption = 'Time'
  end
  object MoveCounter: TLabel
    Left = 1232
    Top = 16
    Width = 65
    Height = 13
    Caption = 'MoveCounter'
  end
  object BackToMainMenu: TImage
    Left = 560
    Top = 656
    Width = 105
    Height = 105
    OnClick = BackToMainMenuClick
  end
  object Title: TLabel
    Left = 416
    Top = 16
    Width = 20
    Height = 13
    Caption = 'Title'
  end
  object Update: TTimer
    OnTimer = UpdateTimer
    Left = 8
    Top = 64
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 40
    Top = 64
  end
  object MainMenuGame: TMainMenu
    Left = 104
    Top = 64
    object N1: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      object Help: TMenuItem
        Caption = #1057#1087#1088#1072#1074#1082#1072
        ShortCut = 112
        OnClick = HelpClick
      end
      object AboutProgr: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        ShortCut = 113
        OnClick = AboutProgrClick
      end
    end
  end
  object TitleColor: TTimer
    OnTimer = TitleColorTimer
    Left = 72
    Top = 64
  end
end
