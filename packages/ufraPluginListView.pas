unit ufraPluginListView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufraListView, Vcl.ComCtrls,
  Vcl.ToolWin, JvExComCtrls, JvToolBar, Vcl.ActnList, Vcl.Menus, uDLLUtilsEx,
  uPluginUtilsEx;

type
  TfraPluginListView = class(TFrame)
    fraListView: TfraListView;
    OpenDialog: TOpenDialog;
    PluginManager: TPluginManager;
    ActionList_Plugins: TActionList;
    actAddPlugin: TAction;
    N1: TMenuItem;
    actLoadPlugin: TAction;
    actUnloadPlugin: TAction;
    actLoadAll: TAction;
    actUnloadAll: TAction;
    procedure actAddPluginExecute(Sender: TObject);
    procedure fraListViewactClearListViewExecute(Sender: TObject);
    procedure fraListViewactRefreshListViewExecute(Sender: TObject);
    procedure fraListViewactAddListviewItemExecute(Sender: TObject);
    procedure fraListViewactDeleteItemExecute(Sender: TObject);
    procedure fraListViewactSelectAllExecute(Sender: TObject);
    procedure fraListViewactSelectNoneExecute(Sender: TObject);
    procedure fraListViewactSelectInvertExecute(Sender: TObject);
    procedure actLoadPluginExecute(Sender: TObject);
    procedure actLoadAllExecute(Sender: TObject);
    procedure actUnloadAllExecute(Sender: TObject);
    procedure fraListViewactSelectFirstExecute(Sender: TObject);
    procedure PluginManagerDllProgressEvent(Sender: TObject; Min, Max,
      Position: Integer; aMessage: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}


procedure TfraPluginListView.actLoadAllExecute(Sender: TObject);
begin
PluginManager.LoadAll;
end;

procedure TfraPluginListView.actLoadPluginExecute(Sender: TObject);
Var
  aPluginObject : TPluginObject;
begin
end;

procedure TfraPluginListView.actUnloadAllExecute(Sender: TObject);
begin
PluginManager.UnloadAll;
end;

procedure TfraPluginListView.fraListViewactAddListviewItemExecute(
  Sender: TObject);
begin
  fraListView.actAddListviewItemExecute(Sender);

end;

procedure TfraPluginListView.fraListViewactClearListViewExecute(
  Sender: TObject);
begin
  fraListView.actClearListViewExecute(Sender);
  PluginManager.ClearDlls;
end;

procedure TfraPluginListView.fraListViewactDeleteItemExecute(Sender: TObject);
begin
  fraListView.actDeleteItemExecute(Sender);

end;

procedure TfraPluginListView.fraListViewactRefreshListViewExecute(
  Sender: TObject);
Var
  aPluginObject : TPluginObject;
  i             : integer;
  aListItem     : TListItem;
begin

fraListView.actRefreshListViewExecute(Sender);

if (PluginManager.DLLList.Count > 0) AND
   (fraListView.ListView.Items.Count > 0)then
      Begin
      fraListView.ListView.Items.BeginUpdate;

      for i := 0 to fraListView.ListView.Items.Count - 1 do
           Begin
//             fraListView.ListView.Items.Item[i].Data;
           End;

      fraListView.ListView.Items.EndUpdate;
      End;


end;

procedure TfraPluginListView.fraListViewactSelectAllExecute(Sender: TObject);
begin
  fraListView.actSelectAllExecute(Sender);
end;

procedure TfraPluginListView.fraListViewactSelectFirstExecute(Sender: TObject);
begin
  fraListView.actSelectFirstExecute(Sender);


end;

procedure TfraPluginListView.fraListViewactSelectInvertExecute(Sender: TObject);
begin
  fraListView.actSelectInvertExecute(Sender);
end;

procedure TfraPluginListView.fraListViewactSelectNoneExecute(Sender: TObject);
begin
  fraListView.actSelectNoneExecute(Sender);
end;


procedure TfraPluginListView.PluginManagerDllProgressEvent(Sender: TObject; Min,
  Max, Position: Integer; aMessage: string);
begin
//TODO: Reimplmenet
end;

procedure TfraPluginListView.actAddPluginExecute(Sender: TObject);
Var
  DefaultData : TListItemInfoRec;
  Files : TStringList;
  i     : integer;
begin
Files := TStringList.Create;

if OpenDialog.Execute(Self.Handle) then
   Begin
   PluginManager.AddDlls(Files);
   End;

Files.Free;
end;

end.
