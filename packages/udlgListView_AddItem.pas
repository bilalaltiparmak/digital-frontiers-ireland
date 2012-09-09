unit udlgListView_AddItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, ufraListView;

type
  TdlgAddItem = class(TForm)
    ebCaption: TLabeledEdit;
    Label1: TLabel;
    ebSubitems: TMemo;
    fraListView: TfraListView;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ebCaptionChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ebSubitemsChange(Sender: TObject);
  private
    { Private declarations }
    FItemCaption : String;
    FSubItems : TStringList;
  public
    { Public declarations }
  Published
  PROPERTY ItemCaption : String read FItemCaption;
  PROPERTY SubItems : TStringList read FSubItems;
  end;

var
  dlgAddItem: TdlgAddItem;

implementation

{$R *.dfm}

procedure TdlgAddItem.Button1Click(Sender: TObject);
begin
ModalResult := mrOk;
end;

procedure TdlgAddItem.Button2Click(Sender: TObject);
begin
ModalResult := mrCancel;
end;

procedure TdlgAddItem.ebCaptionChange(Sender: TObject);
Var
    i     :     integer;
    item  : TListItemInfoRec;
begin
if fraListView.ListView.Items.Count = 0 then
   Begin
   Item.Caption := ebCaption.Text;
   SELF.fraListView.AddItem(Item, true);
   End;

for i := 0 to fraListView.ListView.Items.Count -1 do
     Begin
     fraListView.ListView.Items.Item[i].Caption := ebCaption.Text;
     fraListView.ListView.Items.Item[i].SubItems.Text := FSubItems.Text;
     End;
Self.FItemCaption := ebCaption.Text;

end;


procedure TdlgAddItem.ebSubitemsChange(Sender: TObject);
Var
  I : INteger;
begin
// TODO: Add a number of default cols to support number of subitems
SubItems.Text := ebSubitems.Lines.Text;

for I := 0 to fraListView.ListView.Items.Count - 1 do
     begin
       FraListView.ListView.Items.Item[i].SubItems.Text := FSubItems.Text;
     end;

end;

procedure TdlgAddItem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FSubItems.Free;
end;

procedure TdlgAddItem.FormCreate(Sender: TObject);
begin

FItemCaption := ebCaption.Text;
FSubItems := TStringList.Create;
FSubItems.Clear;
FSubItems.Text := ebSubItems.Lines.Text;
ebCaptionChange(Self);
self.ebSubitems.OnChange(self);
FSubItems.Text := ebSubItems.Lines.Text;
end;

end.
