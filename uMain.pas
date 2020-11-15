unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Ribbon, Vcl.ActnMenus,
  Vcl.RibbonActnMenus, Vcl.StdCtrls, Vcl.RibbonActnCtrls, Vcl.ToolWin,
  Vcl.ActnMan, Vcl.ActnCtrls, Vcl.StdActns, Vcl.ExtActns, Vcl.ActnList,
  System.Actions, Vcl.RibbonLunaStyleActnCtrls, System.ImageList, Vcl.ImgList,
  Vcl.RibbonSilverStyleActnCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.JumpList, System.Win.TaskbarCore, Vcl.Taskbar,Vcl.Themes,
  Vcl.Touch.GestureMgr,System.Win.ComObj,System.Win.ScktComp, Vcl.ButtonGroup,
  Vcl.CategoryButtons;

type

  TAboutProc =  procedure; stdcall;
  TcalcFunc<t> = function(x,y:t):t; stdcall;


  TMainForm = class(TForm)
    ImageList1: TImageList;
    ActionManager1: TActionManager;
    FileOpen1: TFileOpen;
    FileSaveAs1: TFileSaveAs;
    FileExit1: TFileExit;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    EditUndo1: TEditUndo;
    EditDelete1: TEditDelete;
    FormatRichEditBold1: TRichEditBold;
    FormatRichEditItalic1: TRichEditItalic;
    FormatRichEditUnderline1: TRichEditUnderline;
    FormatRichEditAlignLeft1: TRichEditAlignLeft;
    FormatRichEditAlignRight1: TRichEditAlignRight;
    FormatRichEditAlignCenter1: TRichEditAlignCenter;
    SearchFind1: TSearchFind;
    SearchFindNext1: TSearchFindNext;
    SearchReplace1: TSearchReplace;
    SearchFindFirst1: TSearchFindFirst;
    New_Action: TAction;
    About_Action: TAction;
    Top_Action: TAction;
    Window_Action: TAction;
    Silver_Action: TAction;
    Auric_Action: TAction;
    Ribbon1: TRibbon;
    RibbonPage1: TRibbonPage;
    RibbonPage2: TRibbonPage;
    RibbonGroup1: TRibbonGroup;
    RibbonGroup2: TRibbonGroup;
    RibbonGroup3: TRibbonGroup;
    RibbonGroup4: TRibbonGroup;
    RibbonGroup5: TRibbonGroup;
    RibbonGroup6: TRibbonGroup;
    RibbonGroup7: TRibbonGroup;
    RibbonSpinEdit1: TRibbonSpinEdit;
    RibbonApplicationMenuBar1: TRibbonApplicationMenuBar;
    RibbonQuickAccessToolbar1: TRibbonQuickAccessToolbar;
    StatusBar1: TStatusBar;
    GridPanel1: TGridPanel;
    CategoryPanelGroup1: TCategoryPanelGroup;
    RichEdit1: TRichEdit;
    PopupMenu1: TPopupMenu;
    New1: TMenuItem;
    Open1: TMenuItem;
    SaveAs1: TMenuItem;
    N1: TMenuItem;
    About1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Exit1: TMenuItem;
    TrayIcon1: TTrayIcon;
    JumpList1: TJumpList;
    Taskbar1: TTaskbar;
    Timer1: TTimer;
    GestureManager1: TGestureManager;
    CategoryPanel1: TCategoryPanel;
    CategoryPanel2: TCategoryPanel;
    CategoryPanel3: TCategoryPanel;
    CategoryPanel4: TCategoryPanel;
    CategoryButtons1: TCategoryButtons;
    ButtonGroup1: TButtonGroup;
    TreeView1: TTreeView;
    ListView1: TListView;
    Action1: TAction;
    Action2: TAction;
    RibbonPage3: TRibbonPage;
    RibbonGroup8: TRibbonGroup;
    RibbonGroup9: TRibbonGroup;
    RibbonGroup10: TRibbonGroup;
    RibbonGroup11: TRibbonGroup;
    Dept_Action: TAction;
    Insa_Action: TAction;
    TreeView_Action: TAction;
    Transaction_Action: TAction;
    Update_Action: TAction;
    Batch_Action: TAction;
    DeptNEW_Action: TAction;
    RibbonGroup12: TRibbonGroup;
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RibbonSpinEdit1Change(Sender: TObject);
    procedure New_ActionExecute(Sender: TObject);
    procedure Window_ActionExecute(Sender: TObject);
    procedure Silver_ActionExecute(Sender: TObject);
    procedure Auric_ActionExecute(Sender: TObject);
    procedure Top_ActionExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure RichEdit1Gesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure ShowHint(Sender:Tobject);
    procedure FileOpen1BeforeExecute(Sender: TObject);
    procedure FileOpen1Accept(Sender: TObject);
    procedure FileSaveAs1BeforeExecute(Sender: TObject);
    procedure FileSaveAs1Accept(Sender: TObject);
    procedure About_ActionExecute(Sender: TObject);
    procedure RichEdit1Change(Sender: TObject);
    procedure ExceptionHandler(sender:TObject; e:exception);
    procedure TreeView1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Insa_ActionExecute(Sender: TObject);
    procedure Dept_ActionExecute(Sender: TObject);
    procedure Transaction_ActionExecute(Sender: TObject);
    procedure TreeView_ActionExecute(Sender: TObject);
    procedure Update_ActionExecute(Sender: TObject);
    procedure Batch_ActionExecute(Sender: TObject);
    procedure DeptNEW_ActionExecute(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    function GetCurrPos(RichEdit:TRichEdit):integer;
    function GetCurrLine(RichEdit:TRichEdit):integer;
    { Private declarations }
  public
    function ShowOnce( AFormClass:TFormClass;AShowing:Boolean=True):TForm;
    { Public decfunctiolarations }
  end;

var
  MainForm: TMainForm;

implementation

uses uInsa, uDept, Utrans, uTree, uUpdateSql, UbatchMove, Udept_New;
type
  Delphi_Curri = record
    Instructor:string;
    Version:string;
    Cnt:integer;
  end;
  P_Delphi_Curri = ^Delphi_Curri;

var
  t:TTreeNode;
  Item:TListItem;
  p:P_Delphi_Curri;
  h:THandle;
  AboutProc:TAboutProc;
  AddFunc:TcalcFunc<integer>;
  DivFunc:TcalcFunc<real>;
  FilePath : string;

procedure Display_About; stdcall;
external 'PAboutBox.dll' delayed;

function Add(x,y:integer):integer; stdcall;
external 'PAboutBox.dll' delayed;

{$R *.dfm}

procedure TMainForm.About_ActionExecute(Sender: TObject);
begin
    Display_About;
end;

procedure TMainForm.Action1Execute(Sender: TObject);
begin

     h := LoadLibrary('PAboutbox.dll');
     if h < 32  then
        raise Exception.Create('�׷� ���̺귯�� ���� �̸��� �о� Ȯ��');

     AboutProc := GetProcAddress(h, 'Display_About');
     AboutProc;

//     Addfunc := GetProcAddress(h, 'Add');
//     showmessage(inttostr(Addfunc(10,2)));

//     DivFunc := GetProcAddress(h, 'Divide');
//     ShowMessage(floattostr(DivFunc(12,3)));

     FreeLibrary(h);
end;

procedure TMainForm.Action2Execute(Sender: TObject);
var
  PackageModule: HModule;
  AClass: TPersistentClass;
begin
  PackageModule := LoadPackage('FormLoad.bpl');
  if PackageModule <> 0 then
  begin
    AClass := GetClass('TAboutBox');

    if AClass <> nil then
      with TComponentClass(AClass).Create(Application)
        as TCustomForm do
      begin
        ShowModal;
        Free;
      end;

    UnloadPackage(PackageModule);
  end;
end;

procedure TMainForm.DeptNEW_ActionExecute(Sender: TObject);
begin
// Cdata excel �� ��ġ�Ǿ� �ִ� ��츸 �����Ͻʽÿ�
//  DeptForm_new := TDeptForm_new.Create(Application);
//  DeptForm_new.Show;
end;

procedure TMainForm.Auric_ActionExecute(Sender: TObject);
begin
  TStyleManager.TrySetStyle('Auric');
end;

procedure TMainForm.Batch_ActionExecute(Sender: TObject);
begin
  BatchForm := TBatchForm.create(Application);
  BatchForm.Show;
end;

procedure TMainForm.ComboBox1Change(Sender: TObject);
begin
  TStyleManager.SetStyle(Combobox1.Text);

end;

procedure TMainForm.Dept_ActionExecute(Sender: TObject);
begin
  DeptForm := TDeptForm.Create(Application);
  DeptForm.Show;
end;

procedure TMainForm.ExceptionHandler(sender: TObject; e: exception);
begin
  if e is EFopenError then
    ShowMessage('���ϸ��� Ʋ���ϴ�. �н��� �̸�Ȯ���Ͻʽÿ�')
  else if e is EWriteError then
     ShowMessage('���� ���� ����')
  else if e is EReadError then
     ShowMessage('���� �б� ����')
  else if e is EoutOfMemory then
     ShowMessage('�޸𸮺���')
  else if E is EconvertError then
     ShowMessage('����ȯ ����')
  else if e is eInvalidCast then
     ShowMessagE('as ������ ����')
  else if e is eOleError then
     showmessage('ms office ����')
  else if e is EsocketError then
     showmessage('���� ��� ����')
  else if e is EintError then
     ShowMessage('������ ����')
  else if e is EMathError then
     ShowMessage('�Ǽ��� ����')
  else if e is eInvalidPointer then
     ShowMessage('������ ����')
  else if e is einouterror then
     ShowMessage('�������ġ ����')
  else if e is EaccessViolation  then
     ShowMessage('�＼�� ���� �ν��Ͻ� Ȯ��')
  else if e is ElistError then
      ShowMessagE('÷�� ���� ����')
  else Application.ShowException(e);


end;

procedure TMainForm.FileOpen1Accept(Sender: TObject);
begin
  try
     RichEdit1.Lines.LoadFromFile(FileOpen1.Dialog.FileName);
  except
     on eFopenError do
        Showmessage('���ϸ��� Ʋ���ϴ�');
     on eOutofResources do
        ShowMessage('����� �ʹ� Ů�ϴ�')
  end;
  Ribbon1.AddRecentItem(FileOpen1.Dialog.FileName);
end;

procedure TMainForm.FileOpen1BeforeExecute(Sender: TObject);
begin
    FileOpen1.Dialog.InitialDir := FilePath;
    FileOpen1.Dialog.Filter :=
    '����Ʈ����|*.pas|������Ʈ����|*.dpr|�ؽ�Ʈ����|*.txt|�������|*.*'
end;

procedure TMainForm.FileSaveAs1Accept(Sender: TObject);
begin
   try
     RichEdit1.Lines.SaveToFile(FileSaveAs1.Dialog.FileName);
   except
     on e:eWriteError do
        ShowMessage(e.Message);
   end;
end;

procedure TMainForm.FileSaveAs1BeforeExecute(Sender: TObject);
begin
   FileSaveAs1.Dialog.InitialDir := filepath;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i:byte;
begin
  for I := 0 to Treeview1.Items.Count - 1 do
    if Treeview1.Items[i].Data <> nil then
       Dispose(P_Delphi_Curri(Treeview1.Items[i].Data));

end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if RichEdit1.Lines.Text <> '' then
     if MessageDlg('�޸��忡 �����Ͱ� �ֽ��ϴ�. �����ҷ� ?', mtConfirmation,[mbYes, mbNo],0) = mrYes then
        RichEdit1.Lines.SaveToFile(filePath + 'sample.txt');
end;

procedure TMainForm.FormCreate(Sender: TObject);
type
  PListColumnClass = ^TCollectionItemClass;
var
  ItemClass: PListColumnClass;
  ListColumn: TListColumn;
  StyleName: string;
begin
  for StyleName in TStyleManager.StyleNames do
   Combobox1.Items.Add(StyleName);

   Combobox1.ItemIndex := Combobox1.Items.IndexOf(TStyleManager.ActiveStyle.Name);

   FilePath := ExtractFilePath(Application.ExeName);
   RibbonSpinEdit1.Value := RichEdit1.Font.Size;
   Application.OnHint := ShowHint;
//   Application.OnException := ExceptionHandler;
   t := ttreeNode.Create(TreeView1.Items);
   TreeView1.Selected := TreeView1.Items.Add(t,'������');
   TreeView1.Items.AddChild(treeview1.Selected, '�ڹ�');
   new(p);
   p^.Instructor := '�����';
   p^.Version := '���� 10.3.1';
   p^.Cnt := 6;

   TreeView1.Items.AddChildObject(TreeView1.Selected,'������', p);
end;

function TMainForm.GetCurrLine(RichEdit: TRichEdit): integer;
begin
  result := RichEdit.Perform(EM_LINEFROMCHAR,richEdit.SelStart,0);
end;

function TMainForm.GetCurrPos(RichEdit: TRichEdit): integer;
begin
  result := RichEdit.SelStart - RichEdit.Perform(EM_LINEINDEX,GetcurrLine(RichEdit),0);

end;

procedure TMainForm.Insa_ActionExecute(Sender: TObject);
begin
 InsaForm := TInsaForm.Create(Application);
 InsaForm.Show;
end;

procedure TMainForm.New_ActionExecute(Sender: TObject);
begin
   RichEdit1.Clear;
end;

procedure TMainForm.RibbonSpinEdit1Change(Sender: TObject);
begin
  RichEdit1.Font.Size := RibbonSpinEdit1.value;
end;

procedure TMainForm.RichEdit1Change(Sender: TObject);
begin
  statusbar1.Panels[1].Text :=
  Format('�����÷�:%d ������μ�:%d', [GetcurrPos(RichEdit1)+1,
  GetCurrLine(Richedit1)+1]);
end;

procedure TMainForm.RichEdit1Gesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  case EventInfo.GestureID of
     sgiCircle:Showmessage('��');
     sgiSquare:Showmessage('�簢��');
     sgiTriAngle:Showmessage('�ﰢ��');
  end;
end;

procedure TMainForm.ShowHint(Sender: Tobject);
begin
  StatusBar1.Panels[0].Text := Application.Hint;
//Application.hintpause
end;

function TMainForm.ShowOnce(AFormClass: TFormClass; AShowing: Boolean): TForm;
var
   i : integer;
begin
   Result := nil;

   for i := 0 to Application.ComponentCount -1 do
     if Application.components[i] is AFormClass then
        Result := Application.components[i] as TForm;

   if not assigned(Result) then
      Result := AFormClass.Create(Application);

   if aShowing then
      Result.Show;
end;

procedure TMainForm.Silver_ActionExecute(Sender: TObject);
begin
  TStyleManager.TrySetStyle('silver');
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
   StatusBar1.Panels[2].Text :=
   FormatDateTime('yyyy-mmmm-dd dddd hh:nn:ss ampm',now);
// FormatFlaot('#,##0.00', i);
// Format('����� =%d , �Ѽ� =%d',[i,j])
end;

procedure TMainForm.Top_ActionExecute(Sender: TObject);
begin
   Top_Action.Checked := not Top_Action.Checked;
   if Top_Action.Checked then
      FormStyle := fsStayOnTop
   else
      FormStyle := fsNormal;
end;

procedure TMainForm.Transaction_ActionExecute(Sender: TObject);
begin
    Tform(TransForm) := (ShowOnce(tTransForm));

//  TransForm := TTransForm.Create(Application);
//  TransForm.Show;
end;

procedure TMainForm.TreeView1Click(Sender: TObject);
begin
  if TreeView1.Selected.Data <> nil then
  begin
     Item := listview1.Items.Add;
     Item.Caption := P_Delphi_Curri(TreeView1.Selected.Data)^.Instructor;
     Item.SubItems.Add(P_Delphi_Curri(TreeView1.Selected.Data)^.Version);
     Item.SubItems.Add(IntToStr(P_Delphi_Curri(TreeView1.Selected.Data)^.Cnt));
  end;
end;

procedure TMainForm.TreeView_ActionExecute(Sender: TObject);
begin
  TreeForm := TTreeForm.Create(Application);
  TreeForm.Show;
end;

procedure TMainForm.Update_ActionExecute(Sender: TObject);
begin
  UpdateForm := TUpdateForm.Create(Application);
  UpdateForm.Show;
end;

procedure TMainForm.Window_ActionExecute(Sender: TObject);
begin
   TStyleManager.TrySetStyle('windows');
end;

{ TTreeView }
end.
