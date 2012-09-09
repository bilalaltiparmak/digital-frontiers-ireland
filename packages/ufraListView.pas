unit ufraListView;

interface

uses
  JvExComCtrls, JvToolBar, JvMenus,Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.ActnList, Vcl.Menus, Vcl.ToolWin, Vcl.Controls,VCL.Forms, Vcl.ComCtrls,
  JvListView;

type TListItemInfoRec         =       packed record
        Caption               :       string;
        Checked               :       boolean;
        Data                  :       Pointer;
        GroupID               :       Integer;
        ImageIndex            :       integer;
        StateIndex            :       integer;
        OverlayIndex          :       integer;
end;

type TGroupInfoRec            =       packed record
        Header                :       string;
        Footer                :       string;
        HeaderAlign           :       TAlignment;
        FooterAlign           :       TAlignment;
        Subtitle              :       string;
        TitleImage            :       integer;
end;

type
  TfraListView = class(TFrame)
    ActionList_ListView: TActionList;
    actClearListView: TAction;
    actRefreshListView: TAction;
    actListViewList: TAction;
    actListViewReport: TAction;
    actListViewIcon: TAction;
    actListViewTiled: TAction;
    actListViewSmallIcon: TAction;
    actSelectAll: TAction;
    actSelectNone: TAction;
    actSelectInvert: TAction;
    actSelectFirst: TAction;
    actSelectLast: TAction;
    actSelectPrevious: TAction;
    actSelectNext: TAction;
    actListViewGrouped: TAction;
    Menu_ListView: TJvPopupMenu;
    Clear1: TMenuItem;
    Refresh1: TMenuItem;
    N1: TMenuItem;
    Items1: TMenuItem;
    First1: TMenuItem;
    Last1: TMenuItem;
    Next1: TMenuItem;
    Previous1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Select1: TMenuItem;
    SelectAll1: TMenuItem;
    SelectNone1: TMenuItem;
    N4: TMenuItem;
    InvertSelection1: TMenuItem;
    ViewStyle1: TMenuItem;
    GroupView1: TMenuItem;
    Icon1: TMenuItem;
    List1: TMenuItem;
    Report1: TMenuItem;
    SmallIcon1: TMenuItem;
    ile1: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    actGroupCollapseAll: TAction;
    actGroupExpandAll: TAction;
    Groups1: TMenuItem;
    N7: TMenuItem;
    UnCollapseAll1: TMenuItem;
    CollapseAll1: TMenuItem;
    actFlatScrollBars: TAction;
    actGridLines: TAction;
    actDotNetHighlight: TAction;
    actHotTrack: TAction;
    FlatScrollbars1: TMenuItem;
    HotTracking1: TMenuItem;
    NETHighlighting1: TMenuItem;
    GridLines1: TMenuItem;
    actFulldrag: TAction;
    Fulldrag1: TMenuItem;
    Behaviour1: TMenuItem;
    actShowHint: TAction;
    actRowSelect: TAction;
    actShowColHeaders: TAction;
    ShowColumnHeaders1: TMenuItem;
    RowSelect1: TMenuItem;
    ShowHint1: TMenuItem;
    ListView: TJvListView;
    actAddGroup: TAction;
    N8: TMenuItem;
    AddGroup1: TMenuItem;
    actMultiselect: TAction;
    N9: TMenuItem;
    N10: TMenuItem;
    Multiselect1: TMenuItem;
    N11: TMenuItem;
    actShowHiddenGroupItems: TAction;
    ShowHidden1: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    actAddListviewItem: TAction;
    N15: TMenuItem;
    AddItem1: TMenuItem;
    actDeleteItem: TAction;
    Delete1: TMenuItem;
    Multiselect2: TMenuItem;
    procedure actClearListViewExecute(Sender: TObject);
    procedure actRefreshListViewExecute(Sender: TObject);
    procedure actListViewListExecute(Sender: TObject);
    procedure actListViewReportExecute(Sender: TObject);
    procedure actListViewIconExecute(Sender: TObject);
    procedure actListViewTiledExecute(Sender: TObject);
    procedure actListViewSmallIconExecute(Sender: TObject);
    procedure FrameEnter(Sender: TObject);
    procedure FrameExit(Sender: TObject);
    procedure actSelectAllExecute(Sender: TObject);
    procedure actSelectNoneExecute(Sender: TObject);
    procedure actSelectInvertExecute(Sender: TObject);
    procedure actSelectFirstExecute(Sender: TObject);
    procedure actSelectLastExecute(Sender: TObject);
    procedure actSelectPreviousExecute(Sender: TObject);
    procedure FrameClick(Sender: TObject);
    procedure actListViewGroupedExecute(Sender: TObject);
    procedure actSelectNextExecute(Sender: TObject);
    procedure actGroupCollapseAllExecute(Sender: TObject);
    procedure actGroupExpandAllExecute(Sender: TObject);
    procedure Menu_ListViewPopup(Sender: TObject);
    procedure actFlatScrollBarsExecute(Sender: TObject);
    procedure actGridLinesExecute(Sender: TObject);
    procedure actDotNetHighlightExecute(Sender: TObject);
    procedure actHotTrackExecute(Sender: TObject);
    procedure actFulldragExecute(Sender: TObject);
    procedure actShowHintExecute(Sender: TObject);
    procedure actRowSelectExecute(Sender: TObject);
    procedure actShowColHeadersExecute(Sender: TObject);
    procedure actAddGroupExecute(Sender: TObject);
    procedure actMultiselectExecute(Sender: TObject);
    procedure ListViewChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure actShowHiddenGroupItemsExecute(Sender: TObject);
    procedure ListViewDeletion(Sender: TObject; Item: TListItem);
    procedure ListViewEdited(Sender: TObject; Item: TListItem; var S: string);
    procedure ListViewInsert(Sender: TObject; Item: TListItem);
    procedure ListViewItemChecked(Sender: TObject; Item: TListItem);
    procedure actAddListviewItemExecute(Sender: TObject);
    procedure actDeleteItemExecute(Sender: TObject);
    procedure ListViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private
    { Private declarations }
    GrpIndex : integer;
  FShowHiddenGroupItems           :       boolean;
  public
    { Public declarations }

  procedure UpdateActionStates();
  procedure AddItem(ItemInfo : TListItemInfoRec; ClearList : Boolean);
  procedure AddItems(var ItemNames : TStringList; ClearList : boolean; DefaultData : TListItemInfoRec);
  FUNCTION AddGroup(aGroupInfo: TGroupInfoRec; ClearGroups: Boolean) : integer;
  procedure AddGroups(Var aHeaderList : TStringList; aGroupInfo : TGroupInfoRec; ClearGroups : Boolean);
  procedure AddColumn(aColumn : String;
                      ClearExistingCols : boolean;
                      Alignment : TAlignment;
                      AutoSize : Boolean;
                      MinWidth : Integer;
                      MaxWidth : Integer;
                      ImageIndex : Integer;
                      Tag : Integer);

  procedure AddColumns(Var aColList : TStringList;
                      ClearExistingCols : boolean;
                      Alignment : TAlignment;
                      AutoSize : Boolean;
                      MinWidth : Integer;
                      MaxWidth : Integer;
                      ImageIndex : Integer;
                      Tag : Integer);
  Published
  PROPERTY ShowHiddenGroupItems : boolean read FShowHiddenGroupItems write FShowHiddenGroupItems;
  end;

implementation

uses udlgListView_AddGroup, udlgListView_AddItem, uDFICommon;

{$R *.dfm}

procedure TfraListView.UpdateActionStates();
Var
  i       :     integer;
Begin
// Uncheck all Actions
// Disable all actions
for i := 0 to Self.ComponentCount - 1 do
     Begin
       if Self.Components[i] is TAction then
          Begin
          with Self.Components[i] as TAction do
             Begin
               Checked := False;
               Enabled := False;
             End;
          End;
     End;

// Begin enabling what should be enabled based on component state
// Any action that is given TAG = 1 will be enabled
// Any action that is given TAG = 2 will be enabled only if items.count > 0
// Any action that is given TAG = 3 will be enabled only if items.count > 0 and selcount > 1
// Any action that is given TAG = 4 will be enabled only if listview.selcount = 1 and items.count > 0
// Any action that is given TAG = 5 will be enabled only if first item not selected and case 3 or 4 also apply
// Any action that is given TAG = 6 will be enabled only if last item is not selected and case 4 or 4 also apply

for i := 0 to Self.ComponentCount - 1 do
  Begin
  if Self.Components[i] is TAction then
     Begin
       With Self.Components[i] as TAction do
          Begin
            if Tag = 1 then Enabled := True;
            if Tag = 2 then
               Begin
                 if ListView.Items.Count > 0 then
                    Begin
                      Enabled := True;
                    End
                 ELSE
                    Begin
                    Enabled := False;
                    End;
               End;
            if Tag = 3 then
               Begin
               // action state when more than one item is selected
               if (ListView.Items.Count > 0) AND
                  (listview.SelCount > 1) then
                     begin
                     Enabled := True;
                     end
                  else
                     begin
                       enabled := false;
                     end;
               End;
            if Tag = 4 then
               Begin
               // action state when exactly 1 one item is selected
               if (ListView.Items.Count > 0) AND
                  (listview.SelCount = 1) then
                     begin
                     Enabled := True;
                     end
                  else
                     begin
                       enabled := false;
                     end;
               End;
            if Tag = 5 then
               Begin
               if (ListView.Items.Count > 0) and
                  (listview.SelCount > 0) then
               if (listview.Selected.Index > 0) then
                  begin
                  // first is NOT selected
                    enabled := true
                  end
               else
                  begin
                    enabled := false;
                  end;
               End;
            if Tag = 6 then
               Begin
               if (ListView.Items.Count > 0) and
                  (listview.SelCount > 0) then
               if (listview.Selected.Index < ListView.Items.Count - 1) then
                  begin
                  // last is NOT selected
                    enabled := true
                  end
               else
                  begin
                    enabled := false;
                  end;
               End;
          End;
     End;
  End;


// List View Style



case ListView.ViewStyle of
  vsIcon: actListViewIcon.Checked := True;
  vsSmallIcon: actListViewSmallIcon.Checked := True;
  vsList: actListViewList.Checked := True;
  vsReport: actListViewReport.Checked := True;
  vsTile: actListViewTiled.Checked := true;
end;

// Adjust actions .Checked values based on state
actListViewGrouped.Checked := ListView.GroupView;
actFlatScrollBars.Checked := ListView.FlatScrollBars;
actGridLines.Checked := ListView.GridLines;
actDotNetHighlight.Checked := ListView.DotNetHighlighting;
actHotTrack.Checked := ListView.HotTrack;
// TODO: Add Hot track styles

actFullDrag.Checked := ListView.FullDrag;
actShowHint.Checked := ListView.ShowHint;
actShowColHeaders.Checked := lISTvIEW.ShowColumnHeaders;
actRowSelect.Checked := ListView.RowSelect;
actMultiSelect.Checked := ListView.MultiSelect;
actShowHiddenGroupItems.Checked := Self.ShowHiddenGroupItems;
End;


procedure TfraListView.AddItem(ItemInfo : TListItemInfoRec; ClearList : Boolean);
Var
  aStringList : TStringList;
Begin
aStringList := TStringList.Create;
aStringList.Add(ItemInfo.Caption);
AddItems(aStringList,ClearList,ItemInfo);
aStringList.Free;
End;

procedure TfraListView.AddItems(var ItemNames : TStringList; ClearList : boolean; DefaultData : TListItemInfoRec);
Var
  ListItem : TListItem;
  i: Integer;
Begin
if Assigned(ItemNames) then
   Begin
   ListView.Items.BeginUpdate;
   if ClearList then ListView.Items.Clear;

   for i := 0 to ItemNames.Count - 1 do
      Begin
      ListItem := ListView.Items.Add;
      ListItem.Caption := ItemNames.Strings[i];
      ListItem.Checked := DefaultData.Checked;
      ListItem.Data := DefaultData.Data;
      ListItem.GroupID := DefaultData.GroupID;
      ListItem.ImageIndex := DefaultData.ImageIndex;
      ListItem.OverlayIndex := DefaultData.OverlayIndex;
      ListItem.StateIndex := DefaultData.StateIndex;
      End;

   ListView.Items.EndUpdate;
   End;
End;

procedure TfraListView.FrameClick(Sender: TObject);
begin
self.UpdateActionStates;
end;

procedure TfraListView.FrameEnter(Sender: TObject);
begin
UpdateActionStates;
end;

procedure TfraListView.FrameExit(Sender: TObject);
begin
UpdateActionStates;
end;

procedure TfraListView.ListViewChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
self.actRefreshListView.Execute;
end;

procedure TfraListView.ListViewDeletion(Sender: TObject; Item: TListItem);
begin
self.actRefreshListView.Execute;
end;

procedure TfraListView.ListViewEdited(Sender: TObject; Item: TListItem;
  var S: string);
begin
self.actRefreshListView.Execute;
end;

procedure TfraListView.ListViewInsert(Sender: TObject; Item: TListItem);
begin
self.actRefreshListView.Execute;
end;

procedure TfraListView.ListViewItemChecked(Sender: TObject; Item: TListItem);
begin
self.actRefreshListView.Execute;
end;

procedure TfraListView.ListViewSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
self.UpdateActionStates;
end;

procedure TfraListView.Menu_ListViewPopup(Sender: TObject);
begin
Self.UpdateActionStates;
end;

function TfraListView.AddGroup(aGroupInfo: TGroupInfoRec; ClearGroups: Boolean) : integer;
Var
  aGroup : TListGroup;
begin
if ClearGroups then ListView.Groups.Clear;

aGroup := ListView.Groups.Add;
aGroup.Header := aGroupInfo.Header;
aGroup.Footer := aGroupInfo.Footer;
aGroup.FooterAlign := aGroupInfo.FooterAlign;
aGroup.HeaderAlign := aGroupInfo.HeaderAlign;
aGroup.Subtitle := aGroupInfo.Subtitle;
aGroup.TitleImage := aGroupInfo.TitleImage;
aGroup.State := [lgsNormal,lgsCollapsible];

Result := aGroup.Index;
end;

procedure TfraListView.AddGroups(Var aHeaderList : TStringList; aGroupInfo : TGroupInfoRec; ClearGroups : Boolean);
Var
  i     : integer;
  Info  : TGroupInfoRec;
Begin
if assigned(aHeaderList) then
   Begin
   ListView.Groups.BeginUpdate;

   if ClearGroups then ListView.Groups.Clear;

   for i := 0 to aHeaderList.Count - 1 do
        Begin
        Info := aGroupInfo;
        Info.Header := aHeaderList.Strings[i];
        AddGroup(Info, false);
        End;

   ListView.Groups.EndUpdate;
   End;

End;


procedure TfraListView.actAddGroupExecute(Sender: TObject);
Var
  dlgAddGroup     :     TdlgAddGroup;
begin
dlgAddGroup := TdlgAddGroup.Create(self);
dlgAddGroup.fraListView_Groups.AddGroupsFrom(Self.ListView);
if dlgAddGroup.ShowModal = mrOk then
   Begin
   self.AddGroup(dlgAddGroup.GroupData,dlgAddGroup.ClearGroups);
   self.actRefreshListView.Execute;
   End;

dlgAddGroup.Free;
end;

procedure TfraListView.actAddListviewItemExecute(Sender: TObject);
Var
  dlgAddItem  : TdlgAddItem;
  aItem       : TListItem;
begin
dlgAddItem := TdlgAddItem.Create(Self);
if dlgAddItem.ShowModal = mrOk then
   Begin
   // add item
   aItem := ListView.Items.Add;

   aItem.Caption := dlgAddItem.ItemCaption;
   aItem.SubItems.Text := dlgAddItem.ebSubitems.Lines.Text;


   End;
dlgAddItem.Free;
end;

procedure TfraListView.actClearListViewExecute(Sender: TObject);
begin
ListView.Items.Clear;
end;

procedure TfraListView.actDeleteItemExecute(Sender: TObject);
begin
if ListView.Items.Count > 0 then
   Begin
   if ListView.SelCount > 0 then
      Begin
      ListView.DeleteSelected;
      End;
   End;
end;

procedure TfraListView.actDotNetHighlightExecute(Sender: TObject);
begin
ListView.DotNetHighlighting := NOT ListView.DotNetHighlighting;
Self.UpdateActionStates;
end;

procedure TfraListView.actFlatScrollBarsExecute(Sender: TObject);
begin
ListView.FlatScrollBars := NOT ListView.FlatScrollBars;
Self.UpdateActionStates;
end;

procedure TfraListView.actFulldragExecute(Sender: TObject);
begin
ListView.FullDrag := NOT ListView.FullDrag;
Self.UpdateActionStates;
end;

procedure TfraListView.actGridLinesExecute(Sender: TObject);
begin
lISTvIEW.GridLines := NOT ListView.GridLines;
Self.UpdateActionStates;
end;

procedure TfraListView.actGroupCollapseAllExecute(Sender: TObject);
Var
  i : integer;
begin
for i := 0 to ListView.Groups.Count - 1 do
     Begin
       ListView.Groups.Items[i].State := [lgsNormal,lgsCollapsed,lgsCollapsible];
     End;
end;

procedure TfraListView.actGroupExpandAllExecute(Sender: TObject);
Var
  i : integer;
begin
for i := 0 to ListView.Groups.Count - 1 do
     Begin
       ListView.Groups.Items[i].State := [lgsNormal,lgsCollapsible];
     End;
end;

procedure TfraListView.actHotTrackExecute(Sender: TObject);
begin
ListView.HotTrack := NOT ListView.HotTrack;
UpdateActionStates;
end;

procedure TfraListView.actListViewGroupedExecute(Sender: TObject);
begin
Self.ListView.GroupView := NOT ListView.GroupView;
Self.UpdateActionStates;
end;

procedure TfraListView.actListViewIconExecute(Sender: TObject);
begin
ListView.ViewStyle := vsIcon;
Self.UpdateActionStates;
end;

procedure TfraListView.actListViewListExecute(Sender: TObject);
begin
ListView.ViewStyle := vsList;
Self.UpdateActionStates;
end;

procedure TfraListView.actListViewReportExecute(Sender: TObject);
begin
ListView.ViewStyle := vsReport;
Self.UpdateActionStates;
end;

procedure TfraListView.actListViewSmallIconExecute(Sender: TObject);
begin
ListView.ViewStyle := vsSmallIcon;
Self.UpdateActionStates;
end;

procedure TfraListView.actRefreshListViewExecute(Sender: TObject);
// TODO: This can be done in one iteration for optimization sake
Var
  Hidden  : TGroupInfoRec;
  i       : integer;
  Found   : integer;
begin
Found := 0;
// check that Items Group Assignment is within range of actual group
// count otherwise items will not be displayed in group mode.
//
// Added Property for 'ShowHiddenGroupItems' to turn this function
// on and off
if Self.ShowHiddenGroupItems then
   Begin

   // Find items that will be hidden in group mode (has a groupid higher than groupcount - 1 or = -1)
   for i := 0 to ListView.Items.Count - 1 do
    Begin
    if (ListView.Items.Item[i].GroupID > (ListView.Groups.Count - 1)) or
       (ListView.Items.Item[i].GroupID = -1) then
       Begin
       // Increase Found
       Inc(Found,1);
       End;
    End;

   // if items were found
   if Found > 0 then
      Begin
      // apply hidden group properties
      Hidden.Header := 'Other Items...';
      Hidden.Subtitle := 'This group shows items that have not been assigned a different group';
      Hidden.Footer := 'Items: ' + IntToStr(Found);
      if grpindex = -1 then
         Begin
         GrpIndex := Self.AddGroup(Hidden,false);
         End;

      // iterate one last time over ListView.Items and set their groupid
      // to Hidden group index
      for i := 0 to ListView.Items.Count - 1 do
           Begin
           if (ListView.Items.Item[i].GroupID > (ListView.Groups.Count - 1)) or
              (ListView.Items.Item[i].GroupID = -1)  then
              Begin
              ListView.Items.Item[i].GroupID := GrpIndex;
              End;
           End;
      End;
   End
else
   begin
   // TODO: Fininsh implementing
   // IF IsShowHiddenItems = False, maybe assign items.groupid to -1
   // for items that have a groupid matching the index for the hidden group?

   // Also search for hidden group and remove it (so its not shown)
   // and the items contained within it will not be shown in group mode
   // as they keep the groupid for the hidden group that we remove (thereby
   // having no group assigned and staying invisible
   end;


ListView.Refresh;
end;

procedure TfraListView.actRowSelectExecute(Sender: TObject);
begin
ListView.RowSelect := NOT ListView.RowSelect;
Self.UpdateActionStates;
end;

procedure TfraListView.actSelectAllExecute(Sender: TObject);
Var
  i : integer;
begin
ListView.Items.BeginUpdate;
for i := 0 to ListView.Items.Count -1 do
   Begin
     ListView.Items[i].Selected := True;
   End;
ListView.Items.EndUpdate;
end;

procedure TfraListView.actSelectFirstExecute(Sender: TObject);
begin
 if ListView.Items.Count > 0 then
   Begin
   if actSelectNone.Execute then
      Begin
        ListView.Items.Item[0].Selected := True;
      End;
   End;
end;

procedure TfraListView.actSelectInvertExecute(Sender: TObject);
Var
  i : integer;
begin
ListView.Items.BeginUpdate;
for i := 0 to ListView.Items.Count -1 do
   Begin
     ListView.Items[i].Selected := NOT ListView.Items[i].Selected;
   End;
ListView.Items.EndUpdate;
end;


procedure TfraListView.actSelectLastExecute(Sender: TObject);
begin
 if ListView.Items.Count > 0 then
   Begin
   if actSelectNone.Execute then
      Begin
        ListView.Items.Item[ListView.Items.Count - 1].Selected := True;
      End;
   End;
end;

procedure TfraListView.actSelectNextExecute(Sender: TObject);
Var
  TempInt :     integer;
begin
// NOTE: In actSelectPrevious i used ListView.SelectPrev to select
// the correct ListItem; however, in this functions case, for some
// reason, LitView.SelectNext... didn't behave as expected, so wrote
// work around to do it manually
if (ListView.SelCount = 1) AND (ListView.Items.Count > 0) then
   Begin
   TempInt := ListView.Selected.Index;

   if TempInt < (ListView.Items.Count - 1) then
      Begin
      ListView.Items.Item[TempInt + 1].Selected := True;
      ListView.Items.Item[TempInt].Selected := False;
      End;
   End;
end;

procedure TfraListView.actSelectNoneExecute(Sender: TObject);
Var
  i : integer;
begin
ListView.Items.BeginUpdate;
for i := 0 to ListView.Items.Count -1 do
   Begin
     ListView.Items[i].Selected := False;
   End;
ListView.Items.EndUpdate;
end;

procedure TfraListView.actSelectPreviousExecute(Sender: TObject);
Var
  TempInt : integer;
begin
// ListView.SelectPrevItem(True);
if (ListView.SelCount = 1) AND (ListView.Items.Count > 0) then
   Begin
   TempInt := ListView.Selected.Index;

   if TempInt > 0 then
      Begin
      ListView.Items.Item[TempInt - 1].Selected := True;
      ListView.Items.Item[TempInt].Selected := False;
      End;
   End;
end;

procedure TfraListView.actShowColHeadersExecute(Sender: TObject);
begin
ListView.ShowColumnHeaders := NOT ListView.ShowColumnHeaders;
Self.UpdateActionStates;
end;

procedure TfraListView.actShowHiddenGroupItemsExecute(Sender: TObject);
begin
actShowHiddenGroupItems.Checked := not actShowHiddenGroupItems.Checked;
Self.FShowHiddenGroupItems := actShowHiddenGroupItems.Checked;
sELF.UpdateActionStates;
self.actRefreshListView.Execute;
end;

procedure TfraListView.actShowHintExecute(Sender: TObject);
begin
ListView.ShowHint := NOT ListView.ShowHint;
Self.UpdateActionStates;
end;

procedure TfraListView.actListViewTiledExecute(Sender: TObject);
begin
ListView.ViewStyle := vsTile;
Self.UpdateActionStates;
end;

procedure TfraListView.actMultiselectExecute(Sender: TObject);
begin
ListView.MultiSelect := NOT ListView.MultiSelect;
Self.UpdateActionStates;
end;

PROCEDURE TfraListView.AddColumn(aColumn : String;
                                      ClearExistingCols : boolean;
                                      Alignment : TAlignment;
                                      AutoSize : Boolean;
                                      MinWidth : Integer;
                                      MaxWidth : Integer;
                                      ImageIndex : Integer;
                                      Tag : Integer);
Var
  aStringList : TStringList;
Begin
aStringList := TStringList.Create;
aStringList.Add(aColumn);
AddColumns(aStringList,ClearExistingCols,Alignment,AutoSize,MinWidth,MaxWidth,ImageIndex,Tag);
aStringList.Free;
End;

PROCEDURE TfraListView.AddColumns(Var aColList : TStringList;
                                      ClearExistingCols : boolean;
                                      Alignment : TAlignment;
                                      AutoSize : Boolean;
                                      MinWidth : Integer;
                                      MaxWidth : Integer;
                                      ImageIndex : Integer;
                                      Tag : Integer);
Var
  Col     :     TListColumn;
  i       :     integer;
Begin
if Assigned(aColList) then
   Begin
   ListView.Columns.BeginUpdate;
   if ClearExistingCols then ListView.Columns.Clear;

   for i := 0 to aColList.Count - 1 do
      Begin
      Col := ListView.Columns.Add;
      Col.Caption := aColList.Strings[i];
      Col.Alignment := Alignment;
      Col.AutoSize := AUtoSize;
      Col.MinWidth := MinWidth;
      Col.MaxWidth := MaxWidth;
      Col.Tag := Tag;
      Col.ImageIndex := ImageIndex;
      End;

   ListView.Columns.EndUpdate;
   End;
End;

end.
