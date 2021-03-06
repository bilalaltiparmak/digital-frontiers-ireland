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
      ExplicitWidth = 450
      ExplicitHeight = 331
    end
    inherited StatusBar: TJvStatusBar
      Top = 331
      Width = 450
      Panels = <
        item
          Width = 200
        end
        item
          Width = 100
        end
        item
          Style = psOwnerDraw
          Width = 100
        end>
      ExplicitTop = 331
      ExplicitWidth = 450
      inherited ProgressBar: TJvProgressBar
        Left = 255
        Top = -2
        ExplicitLeft = 255
        ExplicitTop = -2
      end
    end
    inherited Menu_ListView: TJvPopupMenu
      Left = 184
      Top = 72
      inherited Statusbar1: TMenuItem
        inherited Visible1: TMenuItem
          OnClick = nil
        end
      end
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
  object ActionList_Plugins: TActionList
    Left = 48
    Top = 192
    object actAddPlugin: TAction
      Tag = 1
      Category = 'Plugins'
      Caption = '&Add'
    end
    object actLoadPlugin: TAction
      Category = 'Plugins'
      Caption = '&Load'
    end
    object actUnloadPlugin: TAction
      Category = 'Plugins'
      Caption = '&Unload Plugin'
    end
    object actLoadAll: TAction
      Category = 'Plugins'
      Caption = 'Load &All'
    end
    object actUnloadAll: TAction
      Category = 'Plugins'
      Caption = 'Unload A&ll'
    end
  end
end
