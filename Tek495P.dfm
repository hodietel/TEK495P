object Hauptansicht: THauptansicht
  Left = 0
  Top = 0
  Caption = 'Tek 495P Steuerung'
  ClientHeight = 469
  ClientWidth = 762
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = HauptMenu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 450
    Width = 762
    Height = 19
    Panels = <>
  end
  object HauptMenu: TMainMenu
    Left = 32
    Top = 392
  end
  object ActionsListe: TActionList
    Left = 104
    Top = 392
    object FileExit1: TFileExit
      Category = 'Datei'
      Caption = '&Beenden'
      Hint = 'Beenden|Anwendung beenden'
      ImageIndex = 43
    end
  end
end
