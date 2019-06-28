unit UInsa;

interface

uses
  FireDAC.Stan.Option,FireDAC.Stan.Error,Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls, VclTee.TeeGDIPlus,
  VCLTee.TeEngine, VCLTee.Series, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart,
  VCLTee.DBChart, Vcl.ColorGrd, Vcl.DBCtrls, Vcl.Mask, Vcl.ExtDlgs;

type
  TInsaForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabControl1: TTabControl;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    TabSheet4: TTabSheet;
    DBChart1: TDBChart;
    Series1: TBarSeries;
    First_Button: TButton;
    Prev_Button: TButton;
    Next_Button: TButton;
    Last_Button: TButton;
    CheckBox1: TCheckBox;
    ComboBox2: TComboBox;
    ColorGrid1: TColorGrid;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBImage1: TDBImage;
    DBRadioGroup1: TDBRadioGroup;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label9: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    TabSheet5: TTabSheet;
    CheckBox2: TCheckBox;
    Button9: TButton;
    Button10: TButton;
    CheckBox3: TCheckBox;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure TabControl1Change(Sender: TObject);
    procedure First_ButtonClick(Sender: TObject);
    procedure Prev_ButtonClick(Sender: TObject);
    procedure Next_ButtonClick(Sender: TObject);
    procedure Last_ButtonClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ColorGrid1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InsaForm: TInsaForm;

implementation

{$R *.dfm}

uses uDM;
var
  Newseries:TBarSeries;

procedure TInsaForm.Button10Click(Sender: TObject);
begin
  DM.Insa.Disconnect;
  DM.Insa.FetchOptions.RecsSkip := 5;
  DM.Insa.FetchOptions.RecsMax := 5;
  DM.Insa.Open;
end;

procedure TInsaForm.First_ButtonClick(Sender: TObject);
begin
  dbchart1.Page := 1;
end;

procedure TInsaForm.Prev_ButtonClick(Sender: TObject);
begin
  dbchart1.PreviousPage;
end;

procedure TInsaForm.Next_ButtonClick(Sender: TObject);
begin
  dbchart1.NextPage;
end;

procedure TInsaForm.Last_ButtonClick(Sender: TObject);
begin
  dbchart1.Page := dbchart1.NumPages;
end;

procedure TInsaForm.Button1Click(Sender: TObject);
begin
  DM.Insa.Insert;
end;

procedure TInsaForm.Button2Click(Sender: TObject);
begin
 if messagedlg('���� ���� ?', mtconfirmation, [mbyes, mbno],0) = mrYes then
    try
       DM.Insa.Delete;
    except
       on e:eFDDBEngineException do
          if e.kind = ekUKViolated then
             showmessage('����Ű����')
          else if e.Kind =ekRecordLocked then
             showmessage('���ڵ��')
          else showmessage(e.Message);
    end;
end;

procedure TInsaForm.Button3Click(Sender: TObject);
begin
   DM.Insa.Cancel;
end;

procedure TInsaForm.Button4Click(Sender: TObject);
begin
 // if DM.Insa.State = dsbrowse then
 //    raise Exception.Create('��ȸ��');

  try
    DM.Insa.Post;
  except
    on e:eFDDBEngineException do
      if e.kind = ekUKViolated then
          showmessage('�ߺ�Ű����')
      else if e.Kind = ekFKviolated then
         showmessage('����Ű����')
       else showmessage(e.Message);
 end;

end;

procedure TInsaForm.Button9Click(Sender: TObject);
begin
  DM.Insa.FetchNext;
end;

procedure TInsaForm.CheckBox1Click(Sender: TObject);
begin
  DBchart1.View3D := checkbox1.Checked;
end;

procedure TInsaForm.CheckBox2Click(Sender: TObject);
begin
DM.Insa.Close;
if TCheckBox(Sender).Checked then
begin
  DM.Insa.FetchOptions.RowsetSize := 3;
  DM.Insa.FetchOptions.Mode := TFDFetchMode.fmManual;
end
else
begin
 DM.Insa.FetchOptions.Mode := TFDFetchMode.fmOnDemand;
end;
DM.Insa.Open;
button9.Enabled := TCheckBox(Sender).Checked;
end;

procedure TInsaForm.CheckBox3Click(Sender: TObject);
begin
//  if TCheckBox(Sender).Checked then
//   DM.subInsa.FetchOptions.DetailDelay := StrToIntDef(Edit1.Text, 300)
//else
//   DM.subInsa.FetchOptions.DetailDelay := 0;
end;


procedure TInsaForm.ColorGrid1Change(Sender: TObject);
begin
  dbchart1.Series[0].Color := colorgrid1.ForegroundColor;
end;

procedure TInsaForm.ComboBox1Change(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0:begin
       DM.Insa.IndexName := 'i_id';
       DM.InsaID.Index := 0;
       DM.InsaName.Index := 1;
      end;
    1:begin
       DM.Insa.IndexName := 'i_name';
       DM.InsaID.Index := 1;
       DM.InsaName.Index := 0;
      end;
    2:DM.Insa.IndexName := 'i_dept';
  end;
end;

procedure TInsaForm.ComboBox2Change(Sender: TObject);
begin
 dbchart1.ZoomPercent(StrToInt(ComboBox2.Items[ComboBox2.ItemIndex]));
end;

procedure TInsaForm.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  case key of
//   vk_return:selectNext(sender as twincontrol, true, true);
//   vk_up:selectNext(sender as twincontrol, false, true);
//   vk_down:selectNext(sender as twincontrol, true, true);
//  end;
end;

procedure TInsaForm.Edit1Change(Sender: TObject);
begin
 DM.Insa.IndexFieldNames := 'name';
 DM.Insa.FindNearest([Edit1.Text]);
end;

procedure TInsaForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      if not DM.Insa.FindKey([Edit1.text]) then
         showmessage('�׷� ��� ����');

//if not DM.Insa.Locate('name', Edit1.text, []) then
//[] locaseInsensitive,loPartialkey
end;

procedure TInsaForm.FormActivate(Sender: TObject);
begin
  DM.InsaSourceStateChange(DM.InsaSource);
  DM.InsaSourceDataChange(DM.InsaSource, DM.Insaid);
end;

procedure TInsaForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.InsaSource.OnStateChange := nil;
  DM.Insasource.onDataChange := nil;
  action := caFree;
end;

procedure TInsaForm.FormCreate(Sender: TObject);
begin
   NewSeries := TBarSeries.Create(dbchart1);
   NewSeries.ParentChart := dbchart1;
   NewSeries.DataSource := DM.Insa;
   NewSeries.CheckDataSource;
   NewSeries.Color := clBlue;
   NewSeries.XLabelsSource := 'tax';
   NewSeries.YValues.ValueSource := 'tax';

   DM.InsaSource.OnDataChange := DM.InsaSourceDataChange;
   DM.InsaSource.OnStateChange := DM.InsaSourceStateChange;
end;

procedure TInsaForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
   vk_Return:SelectNext(ActiveControl, True, True);
   vk_Up:SelectNext(ActiveControl, False,True);
   vk_Down:SelectNext(ActiveControl,True,True);
  end;
end;

procedure TInsaForm.Label9Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
     DBImage1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;

procedure TInsaForm.SpeedButton1Click(Sender: TObject);
begin
  DM.Insa.First;
end;
procedure TInsaForm.SpeedButton2Click(Sender: TObject);
begin
  if not DM.Insa.Bof then
     DM.Insa.Prior;
end;
procedure TInsaForm.SpeedButton3Click(Sender: TObject);
begin
  if not DM.Insa.Eof then
     DM.Insa.Next;
end;
procedure TInsaForm.SpeedButton4Click(Sender: TObject);
begin
  DM.Insa.Last;
end;

procedure TInsaForm.TabControl1Change(Sender: TObject);
begin
  if TabControl1.TabIndex = 0 then
     DM.Insa.Filtered := false
  else
 begin
    DM.Insa.Filtered := true;
    DM.Insa.Filter := 'class =' + '''' +
                       Tabcontrol1.Tabs[TabControl1.TabIndex]+ '''';
  end;
end;

end.
