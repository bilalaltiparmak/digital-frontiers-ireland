object fraPluginListView: TfraPluginListView
  Left = 0
  Top = 0
  Width = 450
  Height = 350
  TabOrder = 0
  inline fraListView: TfraListView
    Left = 0
    Top = 0
    Width = 450
    Height = 350
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 450
    ExplicitHeight = 350
    inherited ListView: TJvListView
      Width = 450
      Height = 331
      ViewStyle = vsList
      ExplicitWidth = 450
      ExplicitHeight = 331
    end
    inherited StatusBar: TJvStatusBar
      Top = 331
      Width = 450
      ExplicitTop = 331
      ExplicitWidth = 450
    end
    inherited ActionList_ListView: TActionList
      inherited actClearListView: TAction
        OnExecute = fraListViewactClearListViewExecute
      end
      inherited actRefreshListView: TAction
        OnExecute = fraListViewactRefreshListViewExecute
      end
      inherited actSelectAll: TAction
        OnExecute = fraListViewactSelectAllExecute
      end
      inherited actSelectNone: TAction
        OnExecute = fraListViewactSelectNoneExecute
      end
      inherited actSelectInvert: TAction
        OnExecute = fraListViewactSelectInvertExecute
      end
      inherited actSelectFirst: TAction
        OnExecute = fraListViewactSelectFirstExecute
      end
      inherited actAddListviewItem: TAction
        OnExecute = fraListViewactAddListviewItemExecute
      end
      inherited actDeleteItem: TAction
        OnExecute = fraListViewactDeleteItemExecute
      end
    end
    inherited Menu_ListView: TJvPopupMenu
      Left = 184
      Top = 72
      object N1: TMenuItem
        Caption = '-'
      end
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'dll'
    Filter = 'DLL Files|*.dll|All Files|*.*'
    Options = [ofAllowMultiSelect, ofExtensionDifferent, ofPathMustExist, ofFileMustExist, ofEnableSizing, ofDontAddToRecent]
    Left = 176
    Top = 232
  end
  object PluginManager: TPluginManager
    AutoUnloadDll = False
    OnBeforeUnloadDllEvent = PluginManagerBeforeUnloadDllEvent
    OnAfterUnloadDllEvent = PluginManagerAfterUnloadDllEvent
    OnBeforeLoadDllEvent = PluginManagerBeforeLoadDllEvent
    OnAfterLoadDllEvent = PluginManagerAfterLoadDllEvent
    Left = 272
    Top = 232
  end
  object ActionList_Plugins: TActionList
    Left = 48
    Top = 192
    object actAddPlugin: TAction
      Tag = 1
      Category = 'Plugins'
      Caption = '&Add'
      OnExecute = actAddPluginExecute
    end
    object actLoadPlugin: TAction
      Category = 'Plugins'
      Caption = '&Load'
      OnExecute = actLoadPluginExecute
    end
    object actUnloadPlugin: TAction
      Category = 'Plugins'
      Caption = '&Unload Plugin'
    end
    object actLoadAll: TAction
      Category = 'Plugins'
      Caption = 'Load &All'
      OnExecute = actLoadAllExecute
    end
    object actUnloadAll: TAction
      Category = 'Plugins'
      Caption = 'Unload A&ll'
      OnExecute = actUnloadAllExecute
    end
  end
end
