object frmCustomerContactAddPhone: TfrmCustomerContactAddPhone
  Left = 0
  Top = 0
  ActiveControl = JvRadioButton1
  BorderStyle = bsDialog
  Caption = 'Add Detail'
  ClientHeight = 350
  ClientWidth = 623
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 120
  TextHeight = 16
  object JvWizard1: TJvWizard
    Left = 0
    Top = 0
    Width = 623
    Height = 350
    ActivePage = JvWizardInteriorPage1
    ButtonBarHeight = 42
    ButtonStart.Caption = 'To &Start Page'
    ButtonStart.NumGlyphs = 1
    ButtonStart.Width = 85
    ButtonLast.Caption = 'To &Last Page'
    ButtonLast.NumGlyphs = 1
    ButtonLast.Width = 85
    ButtonBack.Caption = '< &Back'
    ButtonBack.NumGlyphs = 1
    ButtonBack.Width = 75
    ButtonNext.Caption = '&Next >'
    ButtonNext.NumGlyphs = 1
    ButtonNext.Width = 75
    ButtonFinish.Caption = '&Finish'
    ButtonFinish.NumGlyphs = 1
    ButtonFinish.Width = 75
    ButtonCancel.Caption = 'Cancel'
    ButtonCancel.NumGlyphs = 1
    ButtonCancel.ModalResult = 2
    ButtonCancel.Width = 75
    ButtonHelp.Caption = '&Help'
    ButtonHelp.NumGlyphs = 1
    ButtonHelp.Width = 75
    ShowRouteMap = True
    DesignSize = (
      623
      350)
    object JvWizardInteriorPage1: TJvWizardInteriorPage
      Header.Title.Color = clNone
      Header.Title.Text = 'Contact Type'
      Header.Title.Anchors = [akLeft, akTop, akRight]
      Header.Title.Font.Charset = DEFAULT_CHARSET
      Header.Title.Font.Color = clWindowText
      Header.Title.Font.Height = -20
      Header.Title.Font.Name = 'Tahoma'
      Header.Title.Font.Style = [fsBold]
      Header.Subtitle.Color = clNone
      Header.Subtitle.Text = 'What purpose is this contact detail used for?'
      Header.Subtitle.Anchors = [akLeft, akTop, akRight, akBottom]
      Header.Subtitle.Font.Charset = DEFAULT_CHARSET
      Header.Subtitle.Font.Color = clWindowText
      Header.Subtitle.Font.Height = -13
      Header.Subtitle.Font.Name = 'Tahoma'
      Header.Subtitle.Font.Style = []
      Color = clWhite
      Caption = 'Contact Type'
      object Label1: TLabel
        Left = 16
        Top = 88
        Width = 449
        Height = 49
        AutoSize = False
        Caption = 
          'Some Business/Institutions reserve seperate contact details for ' +
          'Business, Residential, Sales, Support etc while others just use ' +
          'one number, what purpose is this contact for?'
        WordWrap = True
      end
      object JvRadioButton1: TJvRadioButton
        Left = 56
        Top = 168
        Width = 138
        Height = 20
        Alignment = taLeftJustify
        Caption = 'General Information'
        Checked = True
        TabOrder = 0
        TabStop = True
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -13
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
        LinkedControls = <>
      end
      object JvRadioButton2: TJvRadioButton
        Left = 56
        Top = 194
        Width = 132
        Height = 20
        Alignment = taLeftJustify
        Caption = 'Residential / Home'
        TabOrder = 1
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -13
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
        LinkedControls = <>
      end
      object JvRadioButton3: TJvRadioButton
        Left = 56
        Top = 220
        Width = 73
        Height = 20
        Alignment = taLeftJustify
        Caption = 'Business'
        TabOrder = 2
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -13
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
        LinkedControls = <>
      end
      object JvRadioButton4: TJvRadioButton
        Left = 56
        Top = 246
        Width = 60
        Height = 20
        Alignment = taLeftJustify
        Caption = 'Online'
        TabOrder = 3
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -13
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
        LinkedControls = <>
      end
    end
    object JvWizardInteriorPage2: TJvWizardInteriorPage
      Header.Title.Color = clNone
      Header.Title.Text = 'Contact Details'
      Header.Title.Anchors = [akLeft, akTop, akRight]
      Header.Title.Font.Charset = DEFAULT_CHARSET
      Header.Title.Font.Color = clWindowText
      Header.Title.Font.Height = -20
      Header.Title.Font.Name = 'Tahoma'
      Header.Title.Font.Style = [fsBold]
      Header.Subtitle.Color = clNone
      Header.Subtitle.Text = 'Enter the Phone number, Skype or other address'
      Header.Subtitle.Anchors = [akLeft, akTop, akRight, akBottom]
      Header.Subtitle.Font.Charset = DEFAULT_CHARSET
      Header.Subtitle.Font.Color = clWindowText
      Header.Subtitle.Font.Height = -13
      Header.Subtitle.Font.Name = 'Tahoma'
      Header.Subtitle.Font.Style = []
      Color = clWhite
      Caption = 'Contact Details'
      ExplicitLeft = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label2: TLabel
        Left = 18
        Top = 88
        Width = 449
        Height = 65
        AutoSize = False
        Caption = 
          'In the case of phone numbers, it is best to provide them in Inte' +
          'rnational format, ie: +353 56 77 123 456. If you don'#39't not expec' +
          't to recieve calls from outside your country then this shouldn'#39't' +
          ' matter much.'
        WordWrap = True
      end
      object LabeledEdit1: TLabeledEdit
        Left = 64
        Top = 175
        Width = 217
        Height = 24
        EditLabel.Width = 84
        EditLabel.Height = 16
        EditLabel.Caption = 'Contact Detail:'
        TabOrder = 0
      end
    end
    object JvWizardInteriorPage3: TJvWizardInteriorPage
      Header.Title.Color = clNone
      Header.Title.Text = 'Availability'
      Header.Title.Anchors = [akLeft, akTop, akRight]
      Header.Title.Font.Charset = DEFAULT_CHARSET
      Header.Title.Font.Color = clWindowText
      Header.Title.Font.Height = -20
      Header.Title.Font.Name = 'Tahoma'
      Header.Title.Font.Style = [fsBold]
      Header.Subtitle.Color = clNone
      Header.Subtitle.Text = 'During what days/hours is this contact type generally available'
      Header.Subtitle.Anchors = [akLeft, akTop, akRight, akBottom]
      Header.Subtitle.Font.Charset = DEFAULT_CHARSET
      Header.Subtitle.Font.Color = clWindowText
      Header.Subtitle.Font.Height = -13
      Header.Subtitle.Font.Name = 'Tahoma'
      Header.Subtitle.Font.Style = []
      Color = clWhite
      Caption = 'Availability'
      ExplicitLeft = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object JvWizardRouteMapList1: TJvWizardRouteMapList
      Left = 0
      Top = 0
      Width = 145
      Height = 308
      Cursor = crHandPoint
      ActiveFont.Charset = DEFAULT_CHARSET
      ActiveFont.Color = clWindowText
      ActiveFont.Height = -13
      ActiveFont.Name = 'Tahoma'
      ActiveFont.Style = [fsBold]
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clNavy
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = [fsUnderline]
    end
  end
end
