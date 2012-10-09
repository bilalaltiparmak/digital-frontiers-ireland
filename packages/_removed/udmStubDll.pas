unit udmStubDll;

interface

uses
  FastMM4,System.SysUtils, System.Classes, uStubCommon, Cromis.IPC, uStubDllEventHandler, vcl.dialogs;

//        function stub_Initialize(Var InitData : TStub_InitObject) : boolean; export;
        function stub_Initialize() : boolean; export;
        function stub_Deinitalize() : boolean; export; stdcall
        FUNCTION stub_MessageIn(aMessage : String;  Var Handled : Boolean) : boolean export;
        FUNCTION stub_MessageInWithData( aMessage : String; Data : TMessageParamRec;  Var Handled : Boolean) : boolean export;
        PROCEDURE stub_GetExportedFunctionNames(Sender : TObject; Var aStringList : TStringlist); export;
        FUNCTION stub_AskForListItemCaption(Sender : TObject) : string; export;
        PROCEDURE stub_AskForGroupDetails(Sender : TObject; Var aGroupDetail : TGroupInfoRec); export;

type
  TdmStubDll = class(TDataModule)
    StubDllEventHandler: TStubDllEventHandler;
//    procedure StubDllEventHandlerDllInit(Sender: TObject;
//      var InitData: TStub_InitObject);
    procedure StubDllEventHandlerDllDeInit(Sender: TObject);
    function StubDllEventHandlerAskForListItemCaption(Sender: TObject): string;
    procedure StubDllEventHandlerMessageDataRecieved(sender: TObject;
      aMessage: string; Data: TMessageParamRec; var Handled: Boolean);
    procedure StubDllEventHandlerMessageRecieved(Sender: TObject;
      aMessage: string; var Handled: Boolean);
    procedure StubDllEventHandlerGetExportedFunctions(sender: TObject;
      aStringList: TStringList);
    procedure StubDllEventHandlerAskForGroupDetails(sender: TObject;
      var aGroupDetails: TGroupInfoRec);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmStubDll: TdmStubDll;








exports stub_Initialize,
        stub_Deinitalize,
        stub_MessageIn,
        stub_MessageInWithData,
        stub_GetExportedFunctionNames,
        stub_AskForGroupDetails,
        stub_AskForListItemCaption;

implementation
Var
  IsInitOk : boolean;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}





function stub_AskForListItemCaption(Sender : TObject) : string; export;
Begin
if assigned(dmStubDll) AND
   assigned(dmStubDll.StubDllEventHandler.OnAskForListItemCaption) then
   Begin
     Result := dmStubDll.StubDllEventHandler.OnAskForListItemCaption(Sender);
   End;
End;

PROCEDURE stub_AskForGroupDetails(Sender : TObject; Var aGroupDetail : TGroupInfoRec); export;
Begin
if assigned(dmStubDll) AND
   assigned(dmStubDll.StubDllEventHandler.OnAskForGroupDetails) then
   Begin
     dmStubDll.StubDllEventHandler.OnAskForGroupDetails(Sender, aGroupDetail);
   End;

End;

PROCEDURE stub_GetExportedFunctionNames(Sender : TObject; Var aStringList : TStringlist);
Begin
if (Assigned(aStringList) = true) AND (IsInitOk = true) then
   Begin
     // return exported functions
   aStringList.Clear;
   // Add default required functions to the list
   aStringList.Add(FUNC_PREFIX_STUB + FUNC_Init);
   aStringList.Add(FUNC_PREFIX_STUB + FUNC_deinit);
   aStringList.Add(FUNC_PREFIX_STUB + FUNC_Message);
   aStringList.Add(FUNC_PREFIX_STUB + FUNC_MessageData);
   aStringList.Add(FUNC_PREFIX_STUB + FUNC_GetExportedFunctionNames);
   aStringList.Add(FUNC_PREFIX_STUB + FUNC_AskForGroupDetails);
   aStringList.Add(FUNC_PREFIX_STUB + FUNC_AskForListItemCaption);

   if assigned(dmStubDll) AND
      assigned(dmStubDll.StubDllEventHandler.OnGetExportedFunctions) then
         Begin
         dmStubDll.StubDllEventHandler.OnGetExportedFunctions(Sender,aStringList);
         End;
   End;
End;


//function stub_Initialize(Var InitData : TStub_InitObject) : boolean; export;
function stub_Initialize() : boolean; export;
Begin
   IsInitOk := false;

   if assigned(dmStubDll) AND
      assigned(dmStubDll.StubDllEventHandler.OnDllInit) then
          Begin
//          dmStubDll.StubDllEventHandler.OnDllInit(dmStubDll,InitData);
          dmStubDll.StubDllEventHandler.OnDllInit(dmStubDll);
          result := true;
          isinitok := true;
          End
      else
         Begin
           dmStubDll := TdmStubDll.Create(nil);
           result := stub_Initialize()
         End;
End;

function stub_Deinitalize() : boolean; export;
Begin
Result := False;
if IsInitOk then
   Begin
   if assigned(dmStubDll) AND
      assigned(dmStubDll.StubDllEventHandler.OnDllDeInit) then
         Begin
         dmStubDll.StubDllEventHandler.OnDllDeInit(dmStubDll);
         IsInitOk := False; // set to false so init can be called again


         Result := True;
         End;
   End
End;


FUNCTION stub_MessageIn( aMessage : String;  Var Handled : Boolean) : boolean export;
Begin
if IsInitOk then
   Begin
   Handled := False;
   Result := Handled;

   if assigned(dmStubDll) AND
      assigned(dmStubDll.StubDllEventHandler.OnMessageRecieved) then
         Begin
         dmStubDll.StubDllEventHandler.OnMessageRecieved(dmStubDll,aMessage,Handled);
         Result := True;
         End;
   End
ELSE
   Begin
     Handled := False;
     Result := False;
   End;
End;

FUNCTION stub_MessageInWithData(aMessage : String; Data : TMessageParamRec;  Var Handled : Boolean) : boolean export;
Begin
if IsInitOk then
   Begin
   Handled := False;
   if assigned(dmStubDll) AND
      assigned(dmStubDll.StubDllEventHandler.OnMessageDataRecieved) then
        Begin
        dmStubDll.StubDllEventHandler.OnMessageDataRecieved(dmStubDll,aMessage,Data,Handled);
        End;
   Result := True;
   End
ELSE
   Begin
     Handled := False;
     Result := False;
   End;
End;




procedure TdmStubDll.StubDllEventHandlerAskForGroupDetails(sender: TObject;
  var aGroupDetails: TGroupInfoRec);
begin
//
aGroupDetails.Header.Text := 'Test Header';
aGroupDetails.Footer.Text := 'Footer';
aGroupDetails.Description.Top := 'Top';
aGroupDetails.Description.Bottom := 'Bottom';
aGroupDetails.ExtendedImage := -1;
aGroupDetails.TitleImage := -1;
aGroupDetails.SubsetTitle := 'subset';
aGroupDetails.Subtitle := 'subtitle';
end;

function TdmStubDll.StubDllEventHandlerAskForListItemCaption(
  Sender: TObject): string;
begin
result := 'test plugin';
end;

procedure TdmStubDll.StubDllEventHandlerDllDeInit(Sender: TObject);
begin
ShowMessage('Deinit');
end;


procedure TdmStubDll.StubDllEventHandlerGetExportedFunctions(sender: TObject;
  aStringList: TStringList);
begin
//aStringList.Add('WKAKAKAKAKA');
end;

procedure TdmStubDll.StubDllEventHandlerMessageDataRecieved(sender: TObject;
  aMessage: string; Data: TMessageParamRec; var Handled: Boolean);
begin
Handled := True;
end;

procedure TdmStubDll.StubDllEventHandlerMessageRecieved(Sender: TObject;
  aMessage: string; var Handled: Boolean);
begin
Handled := True;
end;

initialization
  Begin
  IsInitOk := false;
 // dmStubDll := TdmStubDll.Create(nil);

  End;
finalization
  Begin
  FreeAndNil(dmStubDll);
  End;

end.
