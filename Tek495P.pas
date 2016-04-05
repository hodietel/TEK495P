{ GXFormatter.config=HDS }
{*******************************************************}
{                                                       }
{       Programm Tek495P                                }
{                                                       }
{       Copyright (c) 2016 Horst Dietel                 }
{                                                       }
{*******************************************************}
unit Tek495P;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Driver, Funktionen, System.Actions,
  Vcl.ActnList, Vcl.StdActns, Vcl.Menus, Vcl.ComCtrls, CPort, Vcl.StdCtrls,
  CPortCtl, IniFiles;

type
  THauptansicht = class(TForm)
    StatusBar: TStatusBar;
    HauptMenu: TMainMenu;
    ActionsListe: TActionList;
    FileExit1: TFileExit;
    ComPort: TComPort;
    ComDataPacket: TComDataPacket;
    ConnButton: TButton;
    PortButton: TButton;
    ComTerminal: TComTerminal;
    procedure PortButtonClick(Sender: TObject);
    procedure ConnButtonClick(Sender: TObject);
    procedure ComPortAfterOpen(Sender: TObject);
    procedure ComPortAfterClose(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    FInitFlag: Boolean;
    FIni: TMemIniFile;
  public
    { Public-Deklarationen }
  end;

var
  Hauptansicht: THauptansicht;

implementation

{$R *.dfm}

procedure THauptansicht.ConnButtonClick(Sender: TObject);
begin
  ComTerminal.Connected := not ComTerminal.Connected;
end;

procedure THauptansicht.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FIni) then
  begin
    FIni.WriteString('ComPort', 'ComPort', ComPort.Port);
    FIni.WriteString('ComPort', 'BaudRate', BaudRateToStr(ComPort.BaudRate));
    FIni.WriteString('ComPort', 'FlowControl',
      FlowControlToStr(ComPort.FlowControl.FlowControl));
    FIni.UpdateFile;
    FIni.Free;
  end;
end;

procedure THauptansicht.FormShow(Sender: TObject);
begin
  if not FInitFlag then
  begin
    FInitFlag := true;
    FIni := TMemIniFile.Create(ExtractFilePath(Application.ExeName) +
      'terminal.ini');
    ComPort.Port := FIni.ReadString('ComPort', 'ComPort', ComPort.Port);
    ComPort.BaudRate := StrToBaudRate(FIni.ReadString('ComPort', 'BaudRate',
      '19200'));
    ComPort.FlowControl.FlowControl :=
      StrToFlowControl(FIni.ReadString('ComPort', 'FlowControl', 'Hardware'));
    ConnButton.Click;
  end;
end;

procedure THauptansicht.PortButtonClick(Sender: TObject);
begin
  ComPort.ShowSetupDialog;
end;

procedure THauptansicht.ComPortAfterClose(Sender: TObject);
begin
  ConnButton.Caption := 'Connect';
end;

procedure THauptansicht.ComPortAfterOpen(Sender: TObject);
begin
  ConnButton.Caption := 'Disconnect';
end;
end.

