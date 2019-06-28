unit Utrans;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TTransForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Button1: TButton;
    DBGrid2: TDBGrid;
    FDQuery1: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TransForm: TTransForm;

implementation

{$R *.dfm}

uses Udm;

procedure TTransForm.Button1Click(Sender: TObject);
begin
  DM.FDConnection1.StartTransaction;
  try
    try
      FDQuery1.Close;
      FDQuery1.SQL.Text := 'delete from insa where dept_code =:code';
      FDQuery1.Params[0].AsString := dm.Dept.Fields[0].AsString;
      FDQuery1.ExecSQL;
    except
      ShowMessagE('사원 삭제 오류');
      raise;
    end;
    try
      DM.Dept.Delete;
    except
      ShowMessage('부서 삭제 오류');
      raise;
    end;

   DM.FDConnection1.Commit;
  except
   DM.FDConnection1.Rollback;
    end;
  DM.Dept.Refresh;
  DM.Insa.Refresh;
end;

procedure TTransForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DM.FDConnection1.InTransaction then
     DM.FDConnection1.Rollback;

  Action := caFree;
end;

end.
