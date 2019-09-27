unit uListUp_DLL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TDllLoadForm = class(TForm)
    Button1: TButton;
    ListBox: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
  public
  end;

var
  DllLoadForm: TDllLoadForm;

implementation

uses
  TlHelp32;

{$R *.dfm}

procedure EnumModules(Strings: TStrings);
var
  Snapshot: THandle;
  ModuleEntry: TModuleEntry32;
  NextModule: BOOL;
begin
  Snapshot := CreateToolhelp32Snapshot( TH32CS_SNAPALL, GetCurrentProcessID );
  ModuleEntry.dwSize := Sizeof(MODULEENTRY32);
  NextModule := Module32First( Snapshot, ModuleEntry );
  while NextModule do
   begin
     Strings.Add( ModuleEntry.szExePath );
     NextModule := Module32Next( Snapshot, ModuleEntry );
   end;
  CloseHandle( Snapshot );
end;

procedure TDllLoadForm.Button1Click(Sender: TObject);
begin
  ListBox.Items.Clear;
  EnumModules( ListBox.Items );
end;

procedure TDllLoadForm.FormActivate(Sender: TObject);
begin
  Button1Click(Button1);
end;

procedure TDllLoadForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.


