program sample;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {MainForm},
  Vcl.Themes,
  Vcl.Styles,
  USplash in 'USplash.pas' {SplashForm},
  Uchart_Frame in 'Uchart_Frame.pas' {chartFrame: TFrame},
  uListUp_DLL in 'uListUp_DLL.pas' {DllLoadForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Aqua Light Slate');
  SplashForm := TSplashForm.Create(application);
  SplashFOrm.Show;
  SplaShForm.Refresh;
  Application.CreateForm(TMainForm, MainForm);
  SplashForm.Hide;
  SplashForm.free;
  Application.Run;
end.
