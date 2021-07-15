program sample;

uses
  Vcl.Forms,
  uUpdateSql in 'uUpdateSql.pas' {UpdateForm},
  uTree in 'uTree.pas' {TreeForm},
  Utrans in 'Utrans.pas' {TransForm},
  uSplash in 'uSplash.pas' {SplashForm},
  uMain in 'uMain.pas' {MainForm},
  uDM in 'uDM.pas' {DM: TDataModule},
  uDept in 'uDept.pas' {DeptForm},
  UbatchMove in 'UbatchMove.pas' {BatchForm},
  Vcl.Themes,
  Vcl.Styles,
  UmyFrame in 'UmyFrame.pas' {Frame1: TFrame},
  uInsa in 'uInsa.pas' {InsaForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Aqua Light Slate');
  SplashForm := TSplashForm.Create(application);
  SplashFOrm.Show;
  SplaShForm.Refresh;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDM, DM);
  SplashForm.Hide;
  SplashForm.free;
  Application.Run;
end.
