object fraCompanyInfo: TfraCompanyInfo
  Left = 0
  Top = 0
  Width = 511
  Height = 342
  Color = clWhite
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 511
    Height = 342
    Align = alClient
    Caption = 'Company Details'
    TabOrder = 0
    DesignSize = (
      511
      342)
    object ebCompanyName: TLabeledEdit
      Left = 120
      Top = 27
      Width = 380
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 95
      EditLabel.Height = 16
      EditLabel.Caption = 'Company Name:'
      LabelPosition = lpLeft
      TabOrder = 0
    end
    object ebSlogan: TLabeledEdit
      Left = 120
      Top = 57
      Width = 380
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 44
      EditLabel.Height = 16
      EditLabel.Caption = 'Slogan:'
      LabelPosition = lpLeft
      TabOrder = 1
    end
    object GroupBox2: TGroupBox
      Left = 120
      Top = 87
      Width = 380
      Height = 243
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Logos'
      TabOrder = 2
      object Panel1: TPanel
        Left = 2
        Top = 200
        Width = 376
        Height = 41
        Align = alBottom
        TabOrder = 0
        DesignSize = (
          376
          41)
        object btnAdd: TButton
          Left = 291
          Top = 6
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = 'Add'
          DropDownMenu = mnuAdd
          Style = bsSplitButton
          TabOrder = 0
        end
        object btnRemove: TButton
          Left = 210
          Top = 6
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = 'Remove'
          DropDownMenu = mnuRemove
          Style = bsSplitButton
          TabOrder = 1
        end
        object btnClear: TButton
          Left = 8
          Top = 6
          Width = 75
          Height = 25
          Action = actClearPictures
          Anchors = [akLeft, akBottom]
          TabOrder = 2
        end
        object ProgressBar: TProgressBar
          Left = 89
          Top = 10
          Width = 112
          Height = 17
          TabOrder = 3
        end
      end
      object JvThumbView: TJvThumbView
        Left = 27
        Top = 43
        Width = 351
        Height = 157
        HorzScrollBar.Tracking = True
        VertScrollBar.Tracking = True
        Align = alClient
        AutoSize = True
        TabOrder = 1
        TabStop = True
        OnResize = JvThumbViewResize
        AlignView = vtNormal
        AutoScrolling = True
        ThumbGap = 4
        AutoHandleKeyb = True
        MinMemory = True
        MaxWidth = 64
        MaxHeight = 64
        Size = 100
        ScrollMode = smHorizontal
        Sorted = True
        OnStartScanning = JvThumbViewStartScanning
        OnStopScanning = JvThumbViewStopScanning
        OnScanProgress = JvThumbViewScanProgress
        AsButtons = True
        Filter = 
          'All (*.gif;*.cur;*.pcx;*.ani;*.gif;*.png;*.jpg;*.jpeg;*.bmp;*.ti' +
          'f;*.tiff;*.ico;*.emf;*.wmf)|*.gif;*.cur;*.pcx;*.ani;*.gif;*.png;' +
          '*.jpg;*.jpeg;*.bmp;*.tif;*.tiff;*.ico;*.emf;*.wmf|CompuServe GIF' +
          ' Image (*.gif)|*.gif|Cursor files (*.cur)|*.cur|PCX Image (*.pcx' +
          ')|*.pcx|ANI Image (*.ani)|*.ani|GIF Image (*.gif)|*.gif|Portable' +
          ' Network Graphics (*.png)|*.png|JPEG Image File (*.jpg)|*.jpg|JP' +
          'EG Image File (*.jpeg)|*.jpeg|Bitmaps (*.bmp)|*.bmp|TIFF Images ' +
          '(*.tif)|*.tif|TIFF Images (*.tiff)|*.tiff|Icons (*.ico)|*.ico|En' +
          'hanced Metafiles (*.emf)|*.emf|Metafiles (*.wmf)|*.wmf'
        ThumbColor = clNone
        ShowShadow = False
        ShadowColor = clBlack
      end
      object TrackBarH: TTrackBar
        Left = 2
        Top = 43
        Width = 25
        Height = 157
        Align = alLeft
        Max = 300
        Min = 64
        Orientation = trVertical
        Position = 128
        PositionToolTip = ptTop
        TabOrder = 2
        TickStyle = tsNone
        Visible = False
        OnChange = TrackBarWChange
      end
      object TrackBarW: TTrackBar
        Left = 2
        Top = 18
        Width = 376
        Height = 25
        Align = alTop
        Max = 200
        Min = 64
        Position = 128
        PositionToolTip = ptTop
        TabOrder = 3
        TickStyle = tsNone
        Visible = False
        OnChange = TrackBarWChange
      end
    end
  end
  object OpenPictureDialog: TOpenPictureDialog
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofPathMustExist, ofFileMustExist, ofNoTestFileCreate, ofNoDereferenceLinks, ofEnableSizing, ofDontAddToRecent]
    Left = 40
    Top = 112
  end
  object ActionList: TActionList
    Left = 40
    Top = 184
    object actRemove: TAction
      Category = 'CompanyDetails'
      Caption = '&Remove'
      Enabled = False
      OnExecute = actRemoveExecute
    end
    object actAddFile: TAction
      Category = 'CompanyDetails'
      Caption = 'Add &File(s)'
      OnExecute = actAddFileExecute
    end
    object actClearPictures: TAction
      Category = 'CompanyDetails'
      Caption = '&Clear'
      Enabled = False
      OnExecute = actClearPicturesExecute
    end
  end
  object mnuAdd: TPopupMenu
    Left = 432
    Top = 232
    object actAddPicture1: TMenuItem
      Action = actAddFile
    end
  end
  object mnuRemove: TPopupMenu
    Left = 352
    Top = 232
    object Remove1: TMenuItem
      Action = actRemove
    end
  end
end
