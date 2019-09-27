unit UABOUT;

interface

uses WinApi.Windows, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Forms, Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    OKButton: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

procedure Display_About; export; stdcall;
function Add(x,y:integer):integer; export; stdcall;
function Sub(x,y:integer):integer; export; stdcall;
function Divide(x,y:real):real; export; stdcall;

implementation
procedure Display_About;
var
  Abox:TAboutBox;
begin
  Abox := TAboutBox.Create(nil);
  try
    ABox.ShowModal;
  finally
    Abox.Free;
  end;
end;
function Add(x,y:integer):integer;
begin
  result := x + y;
end;
function Sub(x,y:integer):integer;
begin
  result := x - y;
end;
function Divide(x,y:real):real;
begin
  result := x / y;
end;
{$R *.dfm}

end.

