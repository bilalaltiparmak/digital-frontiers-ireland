object fraListView_Groups: TfraListView_Groups
  Left = 0
  Top = 0
  Width = 580
  Height = 344
  TabOrder = 0
  inline fraListView: TfraListView
    Left = 0
    Top = 0
    Width = 580
    Height = 344
    Align = alClient
    TabOrder = 0
    OnClick = fraListViewClick
    ExplicitWidth = 580
    ExplicitHeight = 344
    inherited ListView: TJvListView
      Width = 580
      Height = 325
      Columns = <
        item
          AutoSize = True
          Caption = 'Description'
        end
        item
          AutoSize = True
          Caption = 'Footer'
        end
        item
          AutoSize = True
          Caption = 'Subtitle'
        end
        item
          AutoSize = True
          Caption = 'GroupID'
        end
        item
          AutoSize = True
          Caption = 'Tileimage'
        end>
      ColumnsOrder = '0=50,1=50,2=50,3=50,4=50'
      ExtendedColumns = <
        item
        end
        item
        end
        item
        end
        item
        end
        item
        end>
      ExplicitWidth = 580
      ExplicitHeight = 325
    end
    inherited StatusBar: TJvStatusBar
      Top = 325
      Width = 580
    end
  end
end
