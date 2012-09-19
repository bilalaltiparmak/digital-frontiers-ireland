unit udmStubDll;

interface

uses
  System.SysUtils, System.Classes, uStubCommon, Cromis.IPC, uStubDllEventHandler;

        function stub_Initialize(Var InitData : TStub_InitObject) : boolean; export;
        function stub_Deinitalize() : boolean; export; stdcall
        FUNCTION stub_MessageIn(aMessage : String;  Var Handled : Boolean) : boolean export;
        FUNCTION stub_MessageInWithData( aMessage : String; Data : TMessageParamRec;  Var Handled : Boolean) : boolean export;
        PROCEDURE stub_GetExportedFunctionNames(Sender : TObject; Var aStringList : TStringlist); export;
        FUNCTION stub_AskForListItemCaption(Sender : TObject) : string; export;
        FUNCTION stub_AskForGroupDetails(Sender : TObject) : TGroupInfoRec; export;
        FUNCTION stub_AskForIPCServerName(Sender : TObject) : string; export;

type
  TdmStubDll = class(TDataModule)
    StubDllEventHandler: TStubDllEventHandler;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    FRequestCount : Int64;
    FIPCServer    : TIPCServer;
    FIPCLog       : TStringList;
    procedure OnExecuteRequest(const Request, Response: IIPCData);
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
        stub_AskForListItemCaption,
        stub_AskForIPCServerName;

implementation
Var
  IsInitOk : boolean;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}




function stub_AskForIPCServerName(Sender : TObject) : string; export;
Begin
if assigned(dmStubDll) then
   Begin
     Result := dmStubDLL.FIPCServer.ServerName;
   End;

End;

function stub_AskForListItemCaption(Sender : TObject) : string; export;
Begin
if assigned(dmStubDll) AND
   assigned(dmStubDll.StubDllEventHandler.OnAskForListItemCaption) then
   Begin
     Result := dmStubDll.StubDllEventHandler.OnAskForListItemCaption(Sender);
   End;
End;

FUNCTION stub_AskForGroupDetails(Sender : TObject) : TGroupInfoRec; export;
Begin
if assigned(dmStubDll) AND
   assigned(dmStubDll.StubDllEventHandler.OnAskForGroupDetails) then
   Begin
     dmStubDll.StubDllEventHandler.OnAskForGroupDetails(Sender);
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
   aStringList.Add(FUNC_PREFIX_STUB + FUNC_AskForIPCServerName);

   if assigned(dmStubDll) AND
      assigned(dmStubDll.StubDllEventHandler.OnGetExportedFunctions) then
      dmStubDll.StubDllEventHandler.OnGetExportedFunctions(Sender,aStringList);
   End;
End;


function stub_Initialize(Var InitData : TStub_InitObject) : boolean; export;
Begin
   IsInitOk := True;
   Result := True;

   if assigned(dmStubDll) AND
      assigned(dmStubDll.StubDllEventHandler.OnDllInit) then
          Begin
          dmStubDll.StubDllEventHandler.OnDllInit(dmStubDll,InitData);
          dmStubDLL.FIPCServer.Start;
          End;

End;

function stub_Deinitalize() : boolean; export;
Begin
if IsInitOk then
   Begin
   if assigned(dmStubDll) AND
      assigned(dmStubDll.StubDllEventHandler.OnDllDeInit) then
         Begin
         dmStubDll.StubDllEventHandler.OnDllDeInit(dmStubDll);
         IsInitOk := False; // set to false so init can be called again
         if dmStubDLL.FIPCServer.Listening then dmStubDLL.FIPCServer.Stop;
         Result := True;
         End;
   End
else
   Begin
     Result := False;
   End;
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
   Result := Handled;
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



procedure TdmStubDll.OnExecuteRequest(const Request, Response: IIPCData);
var
  Command: AnsiString;
begin
  Command := Request.Data.ReadUTF8String('Command');
  FIPCLog.Add(Format('%s Request Recieved (Sent at: %s)', [Command, Request.ID]));
  Inc(FRequestCount);

  Response.ID := Format('Response nr. %d', [FRequestCount]);
  Response.Data.WriteDateTime('TDateTime', Now);
  Response.Data.WriteInteger('Integer', 5);
  Response.Data.WriteReal('Real', 5.33);
  Response.Data.WriteUTF8String('String', 'to je testni string');
 // Caption := Format('%d requests processed', [FRequestCount]);
end;


procedure TdmStubDll.DataModuleCreate(Sender: TObject);
begin
FIPCLog := TStringList.Create;
FIPCServer := TIPCServer.Create;
// TODO: TIPCServer: Servername needs sorting
FIPCServer.ServerName := 'IPCTEST';
FIPCServer.OnExecuteRequest := OnExecuteRequest;
end;

procedure TdmStubDll.DataModuleDestroy(Sender: TObject);
begin
// TODO: TIPCServer: Right way to destroy these?
  FreeAndNil(FIPCLog);
  FreeAndNil(FIPCServer);
end;

initialization
  Begin
  IsInitOk := false;


  End;
finalization
  Begin
  //
  End;

end.
