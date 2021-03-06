unit IdeasFormImpl;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ActiveX, AxCtrls, IdeasAddIn_TLB, StdVcl, StdCtrls, Dialogs, GIFImg, ExtCtrls, EA_TLB;

type
  TIdeasForm = class(TActiveForm, IIdeasForm)
    Image1: TImage;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    CheckBox5: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox6: TCheckBox;
    ComboBox1: TComboBox;
    CheckBox1: TCheckBox;
    Label3: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Button6: TButton;
    Button5: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button7: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
    FEvents: IIdeasFormEvents;
    rep : iRepository;
    AddIn : iAddIn;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure MouseEnterEvent(Sender: TObject);
    procedure MouseLeaveEvent(Sender: TObject);
    procedure PaintEvent(Sender: TObject);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function Get_Active: WordBool; safecall;
    function Get_AlignDisabled: WordBool; safecall;
    function Get_AlignWithMargins: WordBool; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    function Get_Caption: WideString; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_DockSite: WordBool; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_ExplicitHeight: Integer; safecall;
    function Get_ExplicitLeft: Integer; safecall;
    function Get_ExplicitTop: Integer; safecall;
    function Get_ExplicitWidth: Integer; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_HelpFile: WideString; safecall;
    function Get_KeyPreview: WordBool; safecall;
    function Get_MouseInClient: WordBool; safecall;
    function Get_PixelsPerInch: Integer; safecall;
    function Get_PopupMode: TxPopupMode; safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    function Get_Scaled: WordBool; safecall;
    function Get_ScreenSnap: WordBool; safecall;
    function Get_SnapBuffer: Integer; safecall;
    function Get_UseDockManager: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    procedure _Set_Font(var Value: IFontDisp); safecall;
    procedure Set_AlignWithMargins(Value: WordBool); safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_DockSite(Value: WordBool); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    procedure Set_PopupMode(Value: TxPopupMode); safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    procedure Set_ScreenSnap(Value: WordBool); safecall;
    procedure Set_SnapBuffer(Value: Integer); safecall;
    procedure Set_UseDockManager(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    procedure AddError(const error: WideString); safecall;
    procedure ClearErrors; safecall;
    function GetReservedWords: WideString; safecall;
    function Recurse: WordBool; safecall;
    function ResetDirections: WordBool; safecall;
    function FoundationIncluded: WordBool; safecall;
    function FillInSuperSub: WordBool; safecall;
    function ExcludeText: WideString; safecall;
    function CreateNames: WordBool; safecall;
    function RenameNonUnique: WordBool; safecall;
    function SetStereotypes: WordBool; safecall;
    function DefaultStereotype: WideString; safecall;
    procedure SetURL(const URL: WideString); safecall;
    function getURL : WideString; safecall;
    procedure DisableRDFButton; safecall;
    procedure EnableRDFButton; safecall;
    procedure setRepository(const repository: IDispatch); safecall;
    procedure setAddIn(const newAddIn: IDispatch); safecall;
  public
    { Public declarations }
    procedure Initialize; override;
  end;

implementation

uses ComObj, ComServ;

{$R *.DFM}

{ TIdeasForm }

procedure TIdeasForm.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_IdeasFormPage); }
end;

procedure TIdeasForm.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IIdeasFormEvents;
  inherited EventSinkChanged(EventSink);
end;

procedure TIdeasForm.Initialize;
begin
  inherited Initialize;
  OnActivate := ActivateEvent;
  OnClick := ClickEvent;
  OnCreate := CreateEvent;
  OnDblClick := DblClickEvent;
  OnDeactivate := DeactivateEvent;
  OnDestroy := DestroyEvent;
  OnKeyPress := KeyPressEvent;
  OnMouseEnter := MouseEnterEvent;
  OnMouseLeave := MouseLeaveEvent;
  OnPaint := PaintEvent;
end;

function TIdeasForm.Get_Active: WordBool;
begin
  Result := Active;
end;

function TIdeasForm.Get_AlignDisabled: WordBool;
begin
  Result := AlignDisabled;
end;

function TIdeasForm.Get_AlignWithMargins: WordBool;
begin
  Result := AlignWithMargins;
end;

function TIdeasForm.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TIdeasForm.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TIdeasForm.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TIdeasForm.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TIdeasForm.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TIdeasForm.Get_DockSite: WordBool;
begin
  Result := DockSite;
end;

function TIdeasForm.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TIdeasForm.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TIdeasForm.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TIdeasForm.Get_ExplicitHeight: Integer;
begin
  Result := ExplicitHeight;
end;

function TIdeasForm.Get_ExplicitLeft: Integer;
begin
  Result := ExplicitLeft;
end;

function TIdeasForm.Get_ExplicitTop: Integer;
begin
  Result := ExplicitTop;
end;

function TIdeasForm.Get_ExplicitWidth: Integer;
begin
  Result := ExplicitWidth;
end;

function TIdeasForm.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TIdeasForm.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TIdeasForm.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TIdeasForm.Get_MouseInClient: WordBool;
begin
  Result := MouseInClient;
end;

function TIdeasForm.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TIdeasForm.Get_PopupMode: TxPopupMode;
begin
  Result := Ord(PopupMode);
end;

function TIdeasForm.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TIdeasForm.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TIdeasForm.Get_ScreenSnap: WordBool;
begin
  Result := ScreenSnap;
end;

function TIdeasForm.Get_SnapBuffer: Integer;
begin
  Result := SnapBuffer;
end;

function TIdeasForm.Get_UseDockManager: WordBool;
begin
  Result := UseDockManager;
end;

function TIdeasForm.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TIdeasForm.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TIdeasForm._Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TIdeasForm.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TIdeasForm.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TIdeasForm.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TIdeasForm.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TIdeasForm.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TIdeasForm.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TIdeasForm.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TIdeasForm.MouseEnterEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnMouseEnter;
end;

procedure TIdeasForm.MouseLeaveEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnMouseLeave;
end;

procedure TIdeasForm.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TIdeasForm.Set_AlignWithMargins(Value: WordBool);
begin
  AlignWithMargins := Value;
end;

procedure TIdeasForm.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TIdeasForm.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TIdeasForm.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TIdeasForm.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TIdeasForm.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TIdeasForm.Set_DockSite(Value: WordBool);
begin
  DockSite := Value;
end;

procedure TIdeasForm.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TIdeasForm.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TIdeasForm.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TIdeasForm.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TIdeasForm.Set_HelpFile(const Value: WideString);
begin
  HelpFile := string(Value);
end;

procedure TIdeasForm.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TIdeasForm.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TIdeasForm.Set_PopupMode(Value: TxPopupMode);
begin
  PopupMode := TPopupMode(Value);
end;

procedure TIdeasForm.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TIdeasForm.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TIdeasForm.Set_ScreenSnap(Value: WordBool);
begin
  ScreenSnap := Value;
end;

procedure TIdeasForm.Set_SnapBuffer(Value: Integer);
begin
  SnapBuffer := Value;
end;

procedure TIdeasForm.Set_UseDockManager(Value: WordBool);
begin
  UseDockManager := Value;
end;

procedure TIdeasForm.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TIdeasForm.AddError(const error: WideString);
begin
  Memo1.lines.add(error);
end;

procedure TIdeasForm.Button1Click(Sender: TObject);
begin
  addIn.exportRDF;
end;


procedure TIdeasForm.Button2Click(Sender: TObject);
begin
  addIn.populateDB;
end;

procedure TIdeasForm.Button3Click(Sender: TObject);
begin
  addIn.addGUIDs;
end;

procedure TIdeasForm.Button4Click(Sender: TObject);
begin
  addIn.individualType;
end;

procedure TIdeasForm.Button5Click(Sender: TObject);
begin
  addIn.exportOracle;
end;

procedure TIdeasForm.Button6Click(Sender: TObject);
begin
  addIn.diagsToIdeas;
end;

procedure TIdeasForm.ClearErrors;
begin
  memo1.Clear;
end;

function TIdeasForm.GetReservedWords: WideString;
begin
  GetReservedWords := combobox1.Items.CommaText;
end;

function TIdeasForm.Recurse: WordBool;
begin
  Recurse := CheckBox1.Checked;
end;

function TIdeasForm.ResetDirections : WordBool;
begin
  ResetDirections := CheckBox4.Checked;
end;

function TIdeasForm.FoundationIncluded : WordBool;
begin
  FoundationIncluded := CheckBox5.Checked;
end;

function TIdeasForm.FillInSuperSub: WordBool;
begin
  FillInSuperSub := CheckBox7.Checked;
end;

function TIdeasForm.ExcludeText: WideString;
begin
  ExcludeText := edit1.Text;
end;

function TIdeasForm.CreateNames: WordBool;
begin
  CreateNames := CheckBox3.Checked;
end;

function TIdeasForm.RenameNonUnique: WordBool;
begin
  RenameNonUnique := CheckBox2.Checked;
end;

function TIdeasForm.SetStereotypes: WordBool;
begin
  SetStereotypes := CheckBox6.Checked;
end;

function TIdeasForm.DefaultStereotype: WideString;
begin
  DefaultStereotype := ComboBox1.Text;
end;

procedure TIdeasForm.SetURL(const URL: WideString);
begin
  edit2.text := URL;
end;

function TIdeasForm.getURL : WideString;
begin
  getURL := edit2.text;
end;

procedure TIdeasForm.DisableRDFButton;
begin
  button1.enabled := false;
end;

procedure TIdeasForm.EnableRDFButton;
begin
  button1.enabled := true;
end;

procedure TIdeasForm.setRepository(const repository: IDispatch);
begin
  rep := repository as iRepository;
end;

procedure TIdeasForm.setAddIn(const newAddIn: IDispatch);
begin
  AddIn := newAddIN as iAddIn;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TIdeasForm,
    Class_IdeasForm,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.
