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
  end
  object Ribbon: TRibbon
    Left = 0
    Top = 0
    Width = 736
    Height = 180
    ActionManager = ActionManager
    Caption = 'Ribbon'
    ShowHelpButton = False
    Tabs = <
      item
        Caption = 'Items'
        Page = rpOptions
      end
      item
        Caption = 'Options'
        Page = rpItems
      end>
    UseCustomFrame = False
    ExplicitLeft = 8
    ExplicitTop = -6
    DesignSize = (
      736
      180)
    StyleName = 'Ribbon - Luna'
    object rpItems: TRibbonPage
      Left = 0
      Top = 64
      Width = 735
      Height = 116
      Caption = 'Options'
      Index = 1
      object rgViewStyle: TRibbonGroup
        Left = 626
        Top = 3
        Width = 229
        Height = 108
        ActionManager = ActionManager
        Caption = 'View Style'
        GroupIndex = 2
      end
      object rgBehavour: TRibbonGroup
        Left = 4
        Top = 3
        Width = 279
        Height = 108
        ActionManager = ActionManager
        Caption = 'Behavour'
        GroupIndex = 1
      end
      object rgViewOptions: TRibbonGroup
        Left = 285
        Top = 3
        Width = 339
        Height = 108
        ActionManager = ActionManager
        Caption = 'Options'
        GroupIndex = 2
      end
    end
    object rpOptions: TRibbonPage
      Left = 0
      Top = 64
      Width = 735
      Height = 116
      Caption = 'Items'
      Index = 0
      object rgNavigate: TRibbonGroup
        Left = 330
        Top = 3
        Width = 119
        Height = 108
        ActionManager = ActionManager
        Caption = 'Navigate'
        GroupIndex = 2
        Rows = 2
      end
      object rgSelect: TRibbonGroup
        Left = 4
        Top = 3
        Width = 199
        Height = 108
        ActionManager = ActionManager
        Caption = 'Items'
        GroupIndex = 1
      end
      object rgGroups: TRibbonGroup
        Left = 205
        Top = 3
        Width = 123
        Height = 108
        ActionManager = ActionManager
        Caption = 'Groups'
        GroupIndex = 2
      end
    end
  end
  object ActionManager: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = fraListView.actListViewGrouped
            CommandStyle = csCheckBox
            CommandProperties.Width = -1
          end
          item
            Action = fraListView.actListViewIcon
            CommandStyle = csRadioButton
            CommandProperties.Width = -1
          end
          item
            Action = fraListView.actListViewList
            CommandStyle = csRadioButton
            CommandProperties.Width = -1
          end
          item
            Action = fraListView.actListViewReport
            CommandStyle = csRadioButton
            CommandProperties.Width = -1
          end
          item
            Action = fraListView.actListViewSmallIcon
            CommandStyle = csRadioButton
            CommandProperties.Width = -1
          end
          item
            Action = fraListView.actListViewTiled
            CommandStyle = csRadioButton
            CommandProperties.Width = -1
          end>
        ActionBar = rgViewStyle
      end
      item
        Items = <
          item
            Action = fraListView.actHotTrack
            CommandStyle = csCheckBox
            CommandProperties.Width = -1
          end
          item
            Action = fraListView.actDotNetHighlight
            Caption = '.&NET Highlighting'
            CommandStyle = csCheckBox
            CommandProperties.Width = -1
          end
          item
            Action = fraListView.actFulldrag
            CommandStyle = csCheckBox
            CommandProperties.Width = -1
          end
          item
            Action = fraListView.actRowSelect
            CommandStyle = csCheckBox
            CommandProperties.Width = -1
          end>
        ActionBar = rgBehavour
      end
      item
        Items = <
          item
            Action = fraListView.actSelectFirst
          end
          item
            Action = fraListView.actSelectNext
          end
          item
            Action = fraListView.actSelectPrevious
          end
          item
            Action = fraListView.actSelectLast
          end>
        ActionBar = rgNavigate
      end
      item
        Items = <
          item
            Action = fraListView.actSelectAll
          end
          item
            Action = fraListView.actSelectNone
          end
          item
            Action = fraListView.actSelectInvert
          end
          item
            Action = fraListView.actClearListView
          end
          item
            Action = fraListView.actRefreshListView
          end>
        ActionBar = rgSelect
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
            CommandStyle = csCheckBox
            CommandProperties.Width = -1
          end
          item
            Action = fraListView.actShowHint
            CommandStyle = csCheckBox
            CommandProperties.Width = -1
          end
          item
            Action = fraListView.actShowColHeaders
            Caption = '&Show Column Headers'
            CommandStyle = csCheckBox
            CommandProperties.Width = -1
          end>
        ActionBar = rgViewOptions
      end
      item
        Items = <
          item
            Action = fraListView.actListViewGrouped
            CommandStyle = csCheckBox
            CommandProperties.Width = -1
          end
          item
            Action = fraListView.actGroupCollapseAll
          end
          item
            Action = fraListView.actGroupExpandAll
          end>
        ActionBar = rgGroups
      end>
    Left = 40
    Top = 320
    StyleName = 'Ribbon - Luna'
  end
end
