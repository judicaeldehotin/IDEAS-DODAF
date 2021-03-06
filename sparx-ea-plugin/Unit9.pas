unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, EA_Ideas_Lib, EA_TLB;

type
  TForm9 = class(TForm)
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    rep : iDualRepository;
    build, authVersion : integer;
    ideasAuthor : iDualAuthor;
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}

procedure TForm9.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TForm9.Button2Click(Sender: TObject);
var
  elements : tStringList;
  myPackage : iDualPackage;
  myElemHolder : tElemHolder;
  myAttr : iDualAttribute;
  myTV : iDualTaggedValue;
  i,j : integer;
  ns : string;
  errors : tStrings;
begin
  //pre build 14 used attributes for names instead of tagged values....
  if Authversion < 14 then
  begin
    Screen.Cursor := crHourGlass;
    errors := memo1.Lines;
    elements := tStringList.Create;
    elements.Sorted := true;
    if rep.Models.Count > 0 then
    for i := 0 to rep.Models.Count - 1 do
    begin
      myPackage := rep.Models.GetAt(i) as iDualPackage;
      errors.Add('Getting all elements in package: ' + myPackage.Name);
      getElementsInPackage(myPackage,elements,'',rep,true,errors,self);
    end;
    ProgressBar1.Min := 0;
    ProgressBar1.Max := elements.Count;
    if elements.Count > 0 then
    for i := 0 to elements.Count - 1 do
    begin
      myElemHolder := elements.Objects[i] as tElemHolder;
      ProgressBar1.Position := i;
      Refresh;

      setDefaultNameForElement(myElemHolder.element,rep);


      if pos(string('IDEAS'),string(myElemHolder.element.Stereotype)) = 1 then
      begin
        checkElem(rep,myElemHolder,errors,true, true,false);
        if myElemHolder.element.Attributes.Count > 0 then
        for j := 0 to myElemHolder.element.Attributes.Count - 1 do
        begin
          myAttr :=  myElemHolder.element.Attributes.GetAt(j) as iDualAttribute;
          if myAttr.Stereotype = 'Name' then setThingName(myElemHolder.element,myAttr.Default,myAttr.Name);
        end;
        j := 0;
        while j < myElemHolder.element.Attributes.Count do
        begin
          myAttr :=  myElemHolder.element.Attributes.GetAt(j) as iDualAttribute;
          if myAttr.Stereotype = 'Name' then
          begin
            myElemHolder.element.Attributes.DeleteAt(j,true);
          end else j := j + 1;
        end;
      end;
    end;
    ideasAuthor.Notes := vartostr(build);
    ideasAuthor.Update;
    Screen.Cursor := crDefault;
  end;
  close;
end;

end.
