program iOS_Contacts_Demo;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Form3},
  iOSContactsManager in 'iOSContactsManager.pas',
  iOSAddressBookWrap in 'iOSAddressBookWrap.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
