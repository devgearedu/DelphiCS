unit Udept;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls;

type
  TDeptForm = class(TForm)
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    DBGrid2: TDBGrid;
    Tot_Query: TFDQuery;
    StringGrid1: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    FDStoredProc1: TFDStoredProc;
    Button2: TButton;
    TabSheet4: TTabSheet;
    StringGrid2: TStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
   procedure CheckBoxMouseUp(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: integer);
   procedure CheckBoxKeyUp(Sender: TObject; var Key: Word;
     Shift: TShiftState);
    { Public declarations }
  end;

var
  DeptForm: TDeptForm;

implementation

{$R *.dfm}

uses Udm,comobj, Ucheckgrid;
var
  Excel: OleVariant;
  WorkBook: OleVariant;
  WorkSheet: OleVariant;

procedure TDeptForm.Button1Click(Sender: TObject);
begin
   if Edit1.Text = '' then
      raise Exception.Create('�μ��ڵ�� �ݵ�� �Է��Ͻʽÿ�');

   if Edit2.Text = '' then
      raise Exception.Create('�μ���� �ݵ�� �Է��Ͻʽÿ�');

   if Edit3.Text = '' then
      raise Exception.Create('����� �ݵ�� �Է��Ͻʽÿ�');

   if DM.Dept.Locate('code', Edit1.Text, []) then
      raise Exception.Create('�̹� ��ϵ� �μ��ڵ��Դϴ�');

   FDStoredProc1.Close;
   FDStoredProc1.params[0].asstring := Edit1.Text;
   FDStoredProc1.params[1].asstring := Edit2.Text;
   FDStoredProc1.params[2].asstring := Edit3.Text;
   FDStoredProc1.ExecProc;

   DM.Dept.Refresh;

end;

procedure TDeptForm.Button2Click(Sender: TObject);
var
  I: Integer;
begin
    Excel := CreateOleObject('Excel.Application');
    Excel.Visible := True;

  // ��ũ�� �߰�
   Excel.WorkBooks.Add;
   WorkBook := Excel.ActiveWorkBook;

  // ��ũ��Ʈ �߰�
   Workbook.sheets.add;

  try
    // �۾���  ��ũ��Ʈ ����
    WorkSheet := WorkBook.WorkSheets[1];
     for I := 0 to StringGrid1.RowCount do
     begin
       WorkSheet.Cells[i+1,1].value := StringGrid1.Cells[0,i];
       WorkSheet.Cells[i+1,2].value := StringGrid1.Cells[1,i];
       WorkSheet.Cells[i+1,3].value := StringGrid1.Cells[2,i];
     end;
//     WorkBook.SaveAs('d:\ExcelOutputTest.xls');

  finally
    // ��ũ�� �ݱ�
    WorkBook.close;
    WorkBook:=unAssigned;
    WorkSheet:=unAssigned;
    // ���� ����
    Excel.Quit;
    Excel:=unAssigned;
  end ;


end;

procedure TDeptForm.CheckBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_SPACE then
   with TCheckBox(Sender) do
     Checked := not Checked;
end;

procedure TDeptForm.CheckBoxMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  with TCheckBox(Sender) do
   Checked := not Checked;
end;

procedure TDeptForm.Edit1Change(Sender: TObject);
begin
   if (Sender as TEdit).MaxLength = Length((Sender as TEdit).Text) then
      SelectNext(Sender as TWinControl, True, True);

end;

procedure TDeptForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   action := caFree;
end;

procedure TDeptForm.FormCreate(Sender: TObject);
var
  i:integer;
begin
 for  i := 0 to StringGrid2.RowCount - 1 do
 begin
    StringGrid2.Objects[1, i] := TCheckBox.Create(StringGrid2);
    with TCheckBox(StringGrid2.Objects[1, i]) do
    begin
       OnKeyUp := CheckBoxKeyUp;
       OnMouseUp := CheckBoxMouseUp;
       Parent := StringGrid2;
       BoundsRect := StringGrid2.CellRect(1, i);
       Width := StringGrid1.ColWidths[1];
       Height := StringGrid1.RowHeights[1];
       Caption := 'üũ';
       Checked := false;
    end;
 end;

  StringGrid1.RowCount := DM.Dept.RecordCount + 2;
  for I := 0 to StringGrid1.RowCount - 1 do
  begin
    StringGrid1.Cells[0,i] := '';
    StringGrid1.Cells[1,i] := '';
    StringGrid1.Cells[2,i] := '';
  end;
  StringGrid1.Cells[0,0] := '�μ���';
  StringGrid1.Cells[1,0] := '��  ��';
  StringGrid1.Cells[2,0] := '�ο���';
  DM.Dept.First;
  for I := 1 to DM.Dept.RecordCount do
  begin
    StringGrid1.Cells[0,i] := DM.Dept.FieldByName('dept').AsString;
    StringGrid1.Cells[1,i] := DM.Dept.FieldByName('section').AsString;
    Tot_Query.Close;
    Tot_Query.Params[0].AsString := DM.Dept.FieldByName('code').AsString;
    Tot_Query.Open;
    StringGrid1.Cells[2,i] := Tot_Query.FieldByName('Total').AsString;
    DM.Dept.Next;
  end;
  StringGrid1.Cells[0,i] := '���ο���';
  Tot_Query.Close;
  Tot_Query.Params[0].AsString := '%';
  Tot_Query.Open;
  StringGrid1.Cells[2,i] := Tot_Query.FieldByName('Total').AsString;
end;

procedure TDeptForm.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  s:string;
  pos:integer;
  OldAlign:integer;
begin
  s := StringGrid1.Cells[ACol,ARow];
  with StringGrid1.Canvas do
  begin
    FillRect(Rect);
    if ARow = 0 then
    begin
      Font.Color := clBlue;
      Font.Size := Font.Size + 4;
    end;
    if (ACol = 2) and (ARow <> 0) then
    begin
      if (ARow = StringGrid1.RowCount - 1) then
         Brush.color := clyellow;

      Font.Color := clred;
      Font.Size := Font.Size + 4;
      s := s + '��';
      OldAlign := SetTextAlign(Handle,ta_Right);
      TextRect(Rect, Rect.Right, Rect.Top+3, s);
      SetTextAlign(Handle,OldAlign);
    end
    else
    begin
      pos := ((Rect.Right - Rect.Left) - TextWidth(s)) div 2;
      TextRect(Rect, Rect.Left+pos, Rect.Top+3, s);
    end;
  end;
end;

end.
