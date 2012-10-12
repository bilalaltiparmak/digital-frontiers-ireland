object frmGenericConfig: TfrmGenericConfig
  Left = 0
  Top = 0
  ActiveControl = JvWizard
  BorderStyle = bsDialog
  Caption = 'Configuration'
  ClientHeight = 485
  ClientWidth = 805
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 120
  TextHeight = 16
  object JvWizard: TJvWizard
    Left = 0
    Top = 0
    Width = 805
    Height = 485
    DotNetHighlighting = True
    ActivePage = jvDebugInfoPage
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
      805
      485)
    object jvDebugInfoPage: TJvWizardInteriorPage
      Header.Color = 3681063
      Header.ParentFont = False
      Header.Title.Color = 3681063
      Header.Title.Text = 'Debug Mode'
      Header.Title.Anchors = [akLeft, akTop, akRight]
      Header.Title.Font.Charset = ANSI_CHARSET
      Header.Title.Font.Color = clWhite
      Header.Title.Font.Height = -20
      Header.Title.Font.Name = 'Segoe UI'
      Header.Title.Font.Style = [fsBold]
      Header.Subtitle.Color = 3681063
      Header.Subtitle.Text = 
        'You are seeing this page because /debug was specified on the com' +
        'mand line. You may use the information here to Assist in trouble' +
        'shooing or development'
      Header.Subtitle.Anchors = [akLeft, akTop, akRight, akBottom]
      Header.Subtitle.Font.Charset = DEFAULT_CHARSET
      Header.Subtitle.Font.Color = clWhite
      Header.Subtitle.Font.Height = -13
      Header.Subtitle.Font.Name = 'Tahoma'
      Header.Subtitle.Font.Style = []
      Image.Alignment = iaCenter
      Image.Layout = ilBottom
      Image.Transparent = True
      Color = clWhite
      Enabled = False
      DesignSize = (
        620
        443)
      object Label1: TLabel
        Left = 16
        Top = 88
        Width = 577
        Height = 65
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 
          'Below is some basic information about this program. You can clic' +
          'k '#39'Save to File'#39' if you need to save this information. It is gen' +
          'erally only required if asked for during support or on the onlin' +
          'e forums and is used to aid in troubleshooting by identifying th' +
          'e version of the program you are using. '
        WordWrap = True
      end
      object Label2: TLabel
        Left = 16
        Top = 151
        Width = 577
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 
          'If you don'#39't know what this is about, or you don'#39't need this inf' +
          'ormation - just click Next to continue'
        WordWrap = True
      end
      inline fraGenericProgramInfo1: TfraGenericProgramInfo
        Left = 16
        Top = 184
        Width = 569
        Height = 209
        TabOrder = 0
        ExplicitLeft = 16
        ExplicitTop = 184
        ExplicitWidth = 569
        ExplicitHeight = 209
        inherited GroupBox: TGroupBox
          Width = 569
          Height = 209
          ExplicitWidth = 569
          ExplicitHeight = 209
          inherited pnlRight: TPanel
            Width = 296
            Height = 189
            ExplicitWidth = 296
            ExplicitHeight = 189
            inherited ListView: TListView
              Width = 296
              Height = 169
              ExplicitWidth = 296
              ExplicitHeight = 169
            end
            inherited btnToFile: TButton
              Top = 169
              Width = 296
              ExplicitTop = 169
              ExplicitWidth = 296
            end
          end
          inherited btnMoreInfo: TButton
            Top = 182
            ExplicitTop = 182
          end
        end
      end
    end
    object JvWizardInteriorPage1: TJvWizardInteriorPage
      Header.Title.Color = clNone
      Header.Title.Text = 'Configuration'
      Header.Title.Anchors = [akLeft, akTop, akRight]
      Header.Title.Font.Charset = DEFAULT_CHARSET
      Header.Title.Font.Color = clWindowText
      Header.Title.Font.Height = -20
      Header.Title.Font.Name = 'Tahoma'
      Header.Title.Font.Style = [fsBold]
      Header.Subtitle.Color = clNone
      Header.Subtitle.Text = 
        'This wizard will guide you through setting up or configuring thi' +
        's program. '
      Header.Subtitle.Anchors = [akLeft, akTop, akRight, akBottom]
      Header.Subtitle.Font.Charset = DEFAULT_CHARSET
      Header.Subtitle.Font.Color = clWindowText
      Header.Subtitle.Font.Height = -13
      Header.Subtitle.Font.Name = 'Tahoma'
      Header.Subtitle.Font.Style = []
      ExplicitLeft = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object JvWizardRouteMapNodes1: TJvWizardRouteMapNodes
      Left = 0
      Top = 0
      Width = 185
      Height = 443
      Color = 3681063
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Image.Alignment = iaCenter
      Image.Layout = ilCenter
    end
  end
end
