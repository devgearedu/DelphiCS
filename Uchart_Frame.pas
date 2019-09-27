unit Uchart_Frame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus,
  Data.DB, Vcl.StdCtrls, VCLTee.TeEngine, VCLTee.Series, Vcl.ExtCtrls,
  VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart, Vcl.ColorGrd;

type
  TchartFrame = class(TFrame)
    DBChart1: TDBChart;
    Series1: TBarSeries;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    CheckBox1: TCheckBox;
    ComboBox1: TComboBox;
    ColorGrid1: TColorGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ColorGrid1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TchartFrame.Button1Click(Sender: TObject);
begin
  dbchart1.Page := 1;
end;

procedure TchartFrame.Button2Click(Sender: TObject);
begin
  dbchart1.PreviousPage;
end;

procedure TchartFrame.Button3Click(Sender: TObject);
begin
  dbchart1.NextPage;
end;

procedure TchartFrame.Button4Click(Sender: TObject);
begin
  dbchart1.Page := dbchart1.NumPages;
end;

procedure TchartFrame.CheckBox1Click(Sender: TObject);
begin
   DBchart1.View3D := checkBox1.Checked;
end;

procedure TchartFrame.ColorGrid1Change(Sender: TObject);
begin
  dbChart1.Series[0].color := ColorGrid1.ForegroundColor;
end;

procedure TchartFrame.ComboBox1Change(Sender: TObject);
begin
  dbchart1.ZoomPercent(strtoint(combobox1.Items[combobox1.ItemIndex]));
end;

end.
