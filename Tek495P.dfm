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
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TStatusBar
    Left = 0
    Top = 450
    Width = 762
    Height = 19
    Panels = <>
  end
  object ConnButton: TButton
    Left = 679
    Top = 419
    Width = 75
    Height = 25
    Caption = 'Connect'
    TabOrder = 1
    OnClick = ConnButtonClick
  end
  object PortButton: TButton
    Left = 576
    Top = 419
    Width = 75
    Height = 25
    Caption = 'Port'
    TabOrder = 2
    OnClick = PortButtonClick
  end
  object ComTerminal: TComTerminal
    Left = 8
    Top = 376
    Width = 409
    Height = 68
    Color = clBlack
    Emulation = teVT100orANSI
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Fixedsys'
    Font.Style = []
    ScrollBars = ssBoth
    TabOrder = 3
  end
  object HauptMenu: TMainMenu
    Left = 24
    Top = 304
  end
  object ActionsListe: TActionList
    Left = 96
    Top = 304
    object FileExit1: TFileExit
      Category = 'Datei'
      Caption = '&Beenden'
      Hint = 'Beenden|Anwendung beenden'
      ImageIndex = 43
    end
  end
  object ComPort: TComPort
    BaudRate = br115200
    Port = 'COM14'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = True
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsHandshake
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    StoredProps = [spBasic]
    TriggersOnRxChar = True
    OnAfterOpen = ComPortAfterOpen
    OnAfterClose = ComPortAfterClose
    Left = 344
    Top = 304
  end
  object ComDataPacket: TComDataPacket
    Left = 416
    Top = 312
  end
end
