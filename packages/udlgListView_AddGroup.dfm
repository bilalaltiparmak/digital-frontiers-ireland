object dlgAddGroup: TdlgAddGroup
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Add Group'
  ClientHeight = 363
  ClientWidth = 729
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Button1: TButton
    Left = 672
    Top = 214
    Width = 49
    Height = 25
    Caption = 'Create'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 619
    Top = 215
    Width = 47
    Height = 25
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = Button2Click
  end
  object SampleBox: TGroupBox
    Left = 351
    Top = 17
    Width = 370
    Height = 192
    Caption = 'Sample:'
    TabOrder = 2
    inline ListViewSample: TfraListView
      Left = 2
      Top = 18
      Width = 366
      Height = 172
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 2
      ExplicitTop = 18
      ExplicitWidth = 366
      ExplicitHeight = 172
      inherited ListView: TJvListView
        Width = 366
        Height = 172
        GroupView = True
        ExplicitWidth = 366
        ExplicitHeight = 172
      end
      inherited Menu_ListView: TJvPopupMenu
        Top = 128
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 18
    Width = 337
    Height = 189
    Caption = 'Group Details:'
    TabOrder = 3
    object Label1: TLabel
      Left = 263
      Top = 18
      Width = 28
      Height = 16
      Caption = 'Align'
    end
    object Label2: TLabel
      Left = 264
      Top = 116
      Width = 28
      Height = 16
      Caption = 'Align'
    end
    object ebHeader: TLabeledEdit
      Left = 23
      Top = 40
      Width = 233
      Height = 24
      EditLabel.Width = 46
      EditLabel.Height = 16
      EditLabel.Caption = 'Header:'
      TabOrder = 0
      OnChange = ebHeaderChange
    end
    object ebFooter: TLabeledEdit
      Left = 24
      Top = 136
      Width = 233
      Height = 24
      EditLabel.Width = 42
      EditLabel.Height = 16
      EditLabel.Caption = 'Footer:'
      TabOrder = 1
      OnChange = ebFooterChange
    end
    object ebSubtitle: TLabeledEdit
      Left = 24
      Top = 86
      Width = 302
      Height = 24
      EditLabel.Width = 48
      EditLabel.Height = 16
      EditLabel.Caption = 'Subtitle:'
      TabOrder = 2
      OnChange = ebSubtitleChange
    end
    object Button3: TButton
      Left = 262
      Top = 42
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 3
    end
    object Button4: TButton
      Left = 283
      Top = 42
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 4
    end
    object Button5: TButton
      Left = 305
      Top = 42
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 5
    end
    object Button6: TButton
      Left = 263
      Top = 140
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 6
    end
    object Button7: TButton
      Left = 284
      Top = 140
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 7
    end
    object Button8: TButton
      Left = 306
      Top = 140
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 8
    end
  end
  object cbClearGroups: TCheckBox
    Left = 8
    Top = 219
    Width = 153
    Height = 17
    Caption = 'Clear Existing Groups?'
    TabOrder = 4
    OnClick = cbClearGroupsClick
  end
  inline fraListView_Groups: TfraListView_Groups
    Left = 0
    Top = 247
    Width = 729
    Height = 116
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 5
    ExplicitTop = 246
    ExplicitWidth = 729
    ExplicitHeight = 342
    inherited fraListView: TfraListView
      Width = 729
      Height = 116
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 580
      ExplicitHeight = 344
      inherited ListView: TJvListView
        Width = 729
        Height = 116
        Columns = <>
        ColumnsOrder = ''
        ExtendedColumns = <>
        ExplicitWidth = 580
        ExplicitHeight = 344
      end
      inherited Menu_ListView: TJvPopupMenu
        Left = 152
        Top = 48
        inherited Groups1: TMenuItem
          Visible = False
        end
        inherited ViewStyle1: TMenuItem
          Visible = False
        end
      end
    end
  end
end
