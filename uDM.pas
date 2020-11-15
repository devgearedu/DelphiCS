unit Udm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  vcl.dialogs, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys.IBBase,
  FireDAC.Moni.Base, FireDAC.Moni.FlatFile, FireDAC.VCLUI.Error;

type
  TDM = class(TDataModule)
    InsaQuery: TFDQuery;
    InsaQuerySource: TDataSource;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    Dept: TFDTable;
    DeptSource: TDataSource;
    InsaSource: TDataSource;
    FDMoniFlatFileClientLink1: TFDMoniFlatFileClientLink;
    Insa: TFDTable;
    InsaNAME: TStringField;
    InsaAGE: TSmallintField;
    InsaDEPT_CODE: TStringField;
    InsaCLASS: TStringField;
    InsaSALARY: TIntegerField;
    InsaPHOTO: TBlobField;
    InsaGRADE: TStringField;
    InsaTax: TFloatField;
    InsaSection: TStringField;
    FDConnection1: TFDConnection;
    InsaIPSA_DATE: TDateField;
    InsaID: TIntegerField;
    FDGUIxErrorDialog1: TFDGUIxErrorDialog;
    InsaDuring: TIntegerField;
    procedure insaCalcFields(DataSet: TDataSet);
    procedure insaBeforeInsert(DataSet: TDataSet);
    procedure insaNewRecord(DataSet: TDataSet);
    procedure insaAfterPost(DataSet: TDataSet);
    procedure InsaSourceStateChange(Sender: TObject);
    procedure InsaSourceDataChange(Sender: TObject; Field: TField);
    procedure DeptSourceDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UInsa;

{$R *.dfm}

procedure TDM.DeptSourceDataChange(Sender: TObject; Field: TField);
begin
  InsaQuery.Close;
  InsaQuery.ParamByName('code').AsString :=
  DM.Dept.Fields[0].AsString;
  InsaQuery.Open;
end;

procedure TDM.insaAfterPost(DataSet: TDataSet);
begin
  ShowMessage('등록/수정 완료');
end;

procedure TDM.insaBeforeInsert(DataSet: TDataSet);
begin
    InsaForm.DBEdit2.SetFocus;
end;

procedure TDM.InsaCalcFields(DataSet: TDataSet);
var
 yy1,mm1,dd1:word;
 yy2,mm2,dd2:word;
begin
  DecodeDate(Now, yy1,mm1,dd1);
  DecodeDate(DM.InsaIpsa_Date.Value, yy2,mm2,dd2 );

  if (yy1 = yy2) and (mm1 = mm2) then
     InsaDuring.value := 0
  else
     InsaDuring.Value := yy1 - yy2;


  InsaTax.Value := InsaSalary.Value * 0.1;
end;

procedure TDM.insaNewRecord(DataSet: TDataSet);
begin
  InsaSalary.Value := 5000000;
  InsaGrade.Value := '1';
  InsaIpsa_Date.Value := Date;
end;

procedure TDM.InsaSourceDataChange(Sender: TObject; Field: TField);
begin
  InsaForm.SpeedButton1.Enabled := not Insa.Bof;
  InsaForm.SpeedButton2.Enabled := not Insa.Bof;
  InsaForm.SpeedButton3.Enabled := not Insa.Eof;
  InsaForm.SpeedButton4.Enabled := not Insa.Eof;
end;

procedure TDM.InsaSourceStateChange(Sender: TObject);
begin
  InsaForm.Button1.Enabled := Insa.State = dsBrowse;
  InsaForm.Button2.Enabled := Insa.State = dsBrowse;
  InsaForm.Button3.Enabled := Insa.State in [dsInsert, dsEdit];
  InsaForm.Button4.Enabled := Insa.State in [dsInsert, dsEdit];

end;


end.
