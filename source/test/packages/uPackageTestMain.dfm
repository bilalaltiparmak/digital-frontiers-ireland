object frmListView: TfrmListView
  Left = 0
  Top = 0
  Caption = 'Listview'
  ClientHeight = 528
  ClientWidth = 736
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  inline fraListView: TfraListView
    Left = 0
    Top = 180
    Width = 736
    Height = 348
    Align = alClient
    TabOrder = 0
    ExplicitTop = 180
    ExplicitWidth = 736
    ExplicitHeight = 348
    inherited ListView: TJvListView
      Width = 736
      Height = 348
      ExplicitWidth = 736
      ExplicitHeight = 348
    end
    inherited ActionList_ListView: TActionList
      inherited actListViewGrouped: TAction
        OnExecute = fraListViewactListViewGroupedExecute
      end
      inherited actFlatScrollBars: TAction
        Category = 'ListView.Behavour'
      end
      inherited actGridLines: TAction
        Category = 'ListView.Behavour'
      end
      inherited actShowHint: TAction
        Category = 'ListView.Behavour'
      end
      inherited actRowSelect: TAction
        OnExecute = fraListViewactRowSelectExecute
      end
      inherited actShowColHeaders: TAction
        Category = 'ListView.Behavour'
      end
      inherited actAddGroup: TAction
        OnExecute = fraListViewactAddGroupExecute
      end
      inherited actShowHiddenGroupItems: TAction
        OnExecute = fraListViewactShowHiddenGroupItemsExecute
      end
    end
    inherited Menu_ListView: TJvPopupMenu
      OnPopup = fraListViewMenu_ListViewPopup
    end
  end
  object Ribbon: TRibbon
    Left = 0
    Top = 0
    Width = 736
    Height = 180
    ActionManager = ActionManager
    ApplicationMenu.Menu = RibbonApplicationMenuBar1
    Caption = 'Ribbon'
    QuickAccessToolbar.ActionBar = RibbonQuickAccessToolbar1
    QuickAccessToolbar.Position = qpBottom
    ShowHelpButton = False
    Tabs = <
      item
        Caption = 'Items'
        Page = RibbonPage1
      end
      item
        Caption = 'Customize'
        Page = RibbonPage2
      end>
    TabIndex = 1
    DesignSize = (
      736
      180)
    StyleName = 'Ribbon - Luna'
    object RibbonQuickAccessToolbar1: TRibbonQuickAccessToolbar
      Left = 0
      Top = 0
      Width = 736
      Height = 26
      ActionManager = ActionManager
      VertMargin = 2
    end
    object RibbonApplicationMenuBar1: TRibbonApplicationMenuBar
      ActionManager = ActionManager
      OptionItems = <>
      RecentItems = <>
    end
    object RibbonPage1: TRibbonPage
      Left = 0
      Top = 64
      Width = 735
      Height = 116
      Caption = 'Items'
      Index = 0
      object rgNavSelect: TRibbonGroup
        Left = 4
        Top = 3
        Width = 301
        Height = 108
        ActionManager = ActionManager
        Caption = 'Navigate & Select'
        GroupIndex = 0
      end
      object rgItems: TRibbonGroup
        Left = 307
        Top = 3
        Width = 134
        Height = 108
        ActionManager = ActionManager
        Caption = 'Items'
        GroupIndex = 1
      end
      object rgGroup: TRibbonGroup
        Left = 443
        Top = 3
        Width = 103
        Height = 108
        ActionManager = ActionManager
        Caption = 'Group'
        GroupIndex = 2
      end
    end
    object RibbonPage2: TRibbonPage
      Left = 0
      Top = 64
      Width = 735
      Height = 116
      Caption = 'Customize'
      Index = 1
      object rgViewStyle: TRibbonGroup
        Left = 4
        Top = 3
        Width = 202
        Height = 108
        ActionManager = ActionManager
        Caption = 'View Style'
        GroupIndex = 0
      end
      object rgBehaviour: TRibbonGroup
        Left = 208
        Top = 3
        Width = 623
        Height = 108
        ActionManager = ActionManager
        Caption = 'Behaviour'
        GroupIndex = 1
      end
    end
  end
  object ActionManager: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = fraListView.actSelectFirst
          end
          item
            Action = fraListView.actSelectPrevious
          end
          item
            Action = fraListView.actSelectNext
          end
          item
            Action = fraListView.actSelectLast
          end
          item
            Action = fraListView.actSelectAll
          end
          item
            Action = fraListView.actSelectNone
            Caption = '&Select None'
          end
          item
            Action = fraListView.actSelectInvert
          end
          item
            Action = fraListView.actRowSelect
            CommandStyle = csCheckBox
            CommandProperties.Width = -1
          end
          item
            Action = fraListView.actMultiselect
            CommandStyle = csCheckBox
            CommandProperties.Width = -1
          end>
        ActionBar = rgNavSelect
      end
      item
        Items = <
          item
            Action = fraListView.actClearListView
          end
          item
            Action = fraListView.actRefreshListView
            Caption = 'R&efresh'
          end
          item
            Action = fraListView.actDeleteItem
          end>
        ActionBar = rgItems
      end
      item
        Items = <
          item
            Tag = 1
            Action = fraListView.actListViewIcon
            CommandStyle = csRadioButton
            CommandProperties.Width = -1
          end
          item
            Tag = 1
            Action = fraListView.actListViewList
            CommandStyle = csRadioButton
            CommandProperties.Width = -1
          end
          item
            Tag = 1
            Action = fraListView.actListViewReport
            CommandStyle = csRadioButton
            CommandProperties.Width = -1
          end
          item
            Tag = 1
            Action = fraListView.actListViewSmallIcon
            CommandStyle = csRadioButton
            CommandProperties.Width = -1
          end
          item
            Tag = 1
            Action = fraListView.actListViewTiled
            CommandStyle = csRadioButton
            CommandProperties.Width = -1
          end
          item
            Action = fraListView.actListViewGrouped
            CommandStyle = csCheckBox
            CommandProperties.Width = -1
          end>
        ActionBar = rgViewStyle
      end
      item
        Items = <
          item
            Action = fraListView.actFlatScrollBars
            CommandStyle = csCheckBox
            CommandProperties.Width = -1
          end
          item
            Action = fraListView.actGridLines
            Caption = 'Gri&d Lines'
            CommandStyle = csCheckBox
            CommandProperties.Width = -1
          end
          item
            Action = fraListView.actFulldrag
            Caption = 'F&ulldrag'
            CommandStyle = csCheckBox
            CommandProperties.Width = -1
          end
          item
            Action = fraListView.actHotTrack
            Caption = 'H&ot Tracking'
            CommandStyle = csCheckBox
            CommandProperties.Width = -1
          end
          item
            Action = fraListView.actDotNetHighlight
            CommandStyle = csCheckBox
            CommandProperties.Width = -1
          end
          item
            Action = fraListView.actMultiselect
            CommandStyle = csCheckBox
            CommandProperties.Width = -1
          end
          item
            Action = fraListView.actRowSelect
            CommandStyle = csCheckBox
            CommandProperties.Width = -1
          end
          item
            Action = fraListView.actShowHint
            Caption = '&Show Hint'
            CommandStyle = csCheckBox
            CommandProperties.Width = -1
          end
          item
            Action = fraListView.actShowColHeaders
            CommandStyle = csCheckBox
            CommandProperties.Width = -1
          end
          item
            Action = fraListView.actShowHiddenGroupItems
            Caption = 'Sho&w Hidden'
            CommandStyle = csCheckBox
            CommandProperties.Width = -1
          end>
        ActionBar = rgBehaviour
      end
      item
        Items = <
          item
            Action = fraListView.actGroupCollapseAll
          end
          item
            Action = fraListView.actGroupExpandAll
          end>
        ActionBar = rgGroup
      end
      item
        Items = <
          item
            Caption = 'ActionClientItem0'
          end>
      end>
    PrioritySchedule.Strings = (
      '0=3'
      '1=3'
      '10=23'
      '11=23'
      '12=23'
      '13=23'
      '14=31'
      '15=31'
      '16=31'
      '17=31'
      '18=31'
      '19=31'
      '2=6'
      '20=31'
      '21=31'
      '22=31'
      '23=31'
      '24=31'
      '25=31'
      '3=9'
      '4=12'
      '5=12'
      '6=17'
      '7=17'
      '8=17'
      '9=23')
    Left = 40
    Top = 320
    StyleName = 'Ribbon - Luna'
  end
end
