object dmStubDll: TdmStubDll
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 150
  Width = 215
  object StubDllEventHandler: TStubDllEventHandler
    IPCServerName = 'HelloWorld'
    OnDllInit = StubDllEventHandlerDllInit
    OnDllDeInit = StubDllEventHandlerDllDeInit
    OnMessageRecieved = StubDllEventHandlerMessageRecieved
    OnMessageDataRecieved = StubDllEventHandlerMessageDataRecieved
    OnGetExportedFunctions = StubDllEventHandlerGetExportedFunctions
    OnAskForGroupDetails = StubDllEventHandlerAskForGroupDetails
    OnAskForListItemCaption = StubDllEventHandlerAskForListItemCaption
    Left = 56
    Top = 24
  end
end
