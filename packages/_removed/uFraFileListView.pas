unit uFraFileListView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufraListView,
  Vcl.ActnList, uCustomLists;

type
  TFrame2 = class(TFrame)
    fraListView: TfraListView;
    ActionList_Files: TActionList;
    actAddFile: TAction;
    OpenDialog: TOpenDialog;
    procedure actAddFileExecute(Sender: TObject);
    procedure fraListViewactStatusBarVisibleExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}


procedure TFrame2.actAddFileExecute(Sender: TObject);
Var
  FileInfo  : TFileInfoRec;
  i         : integer;
  ListItem  : TListItemInfoRec;
begin
if OpenDialog.Execute then
   Begin
     
   End;
end;

procedure TFrame2.fraListViewactStatusBarVisibleExecute(Sender: TObject);
begin
  fraListView.actStatusBarVisibleExecute(Sender);

end;

end.
