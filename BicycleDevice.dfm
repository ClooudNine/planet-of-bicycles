object Device: TDevice
  Left = 0
  Top = 0
  Align = alClient
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1059#1089#1090#1088#1086#1081#1089#1090#1074#1086' '#1074#1077#1083#1086#1089#1080#1087#1077#1076#1072
  ClientHeight = 671
  ClientWidth = 1550
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Page: TWebBrowser
    Left = 0
    Top = 0
    Width = 1550
    Height = 671
    Align = alClient
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    OnBeforeScriptExecute = PageBeforeScriptExecute
    ExplicitLeft = 8
    ExplicitTop = 48
    ExplicitWidth = 1540
    ExplicitHeight = 661
    ControlData = {
      4C00000032A000005A4500000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
end
