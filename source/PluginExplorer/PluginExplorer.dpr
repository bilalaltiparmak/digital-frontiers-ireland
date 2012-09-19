program PluginExplorer;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form1},
  ufraListView in '..\..\packages\ufraListView.pas' {fraListView: TFrame},
  udlgListView_AddGroup in '..\..\packages\udlgListView_AddGroup.pas' {dlgAddGroup},
  udlgListView_AddItem in '..\..\packages\udlgListView_AddItem.pas' {dlgAddItem},
  ufraListView_Groups in '..\..\packages\ufraListView_Groups.pas' {fraListView_Groups: TFrame},
  ufraPluginListView in '..\..\packages\ufraPluginListView.pas' {fraPluginListView: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdlgAddGroup, dlgAddGroup);
  Application.CreateForm(TdlgAddItem, dlgAddItem);
  Application.Run;
end.
