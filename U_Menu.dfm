object FrMenu: TFrMenu
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = '****'
  ClientHeight = 571
  ClientWidth = 782
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 782
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    Color = clBtnHighlight
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 772
    object SpeedButton1: TSpeedButton
      Left = 84
      Top = 0
      Width = 84
      Height = 57
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'Salvar'
      ImageIndex = 0
      Images = DataModule1.ImageList1
      Flat = True
      Layout = blGlyphTop
      ExplicitLeft = 0
      ExplicitHeight = 58
    end
    object SpeedButton2: TSpeedButton
      Left = 0
      Top = 0
      Width = 84
      Height = 57
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'Novo'
      ImageIndex = 1
      Images = DataModule1.ImageList1
      Flat = True
      Layout = blGlyphTop
      ExplicitLeft = -20
    end
    object SpeedButton3: TSpeedButton
      Left = 168
      Top = 0
      Width = 84
      Height = 57
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'Apagar'
      ImageIndex = 3
      Images = DataModule1.ImageList1
      Flat = True
      Layout = blGlyphTop
      ExplicitLeft = 80
      ExplicitHeight = 58
    end
    object SpeedButton4: TSpeedButton
      Left = 252
      Top = 0
      Width = 84
      Height = 57
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'Atualizar'
      ImageIndex = 2
      Images = DataModule1.ImageList1
      Flat = True
      Layout = blGlyphTop
      ExplicitLeft = 80
      ExplicitHeight = 58
    end
    object SearchField: TEdit
      Left = 591
      Top = 19
      Width = 170
      Height = 21
      TabOrder = 0
      TextHint = 'Buscar Moedas ou C'#233'dulas'
      OnChange = SearchFieldChange
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 295
    Width = 782
    Height = 251
    Align = alBottom
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 285
    ExplicitWidth = 772
    object pageControl: TPageControl
      Left = 0
      Top = 0
      Width = 782
      Height = 251
      ActivePage = page1
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 772
      object page1: TTabSheet
        Caption = 'Informa'#231#245'es'
        object Label1: TLabel
          Left = 12
          Top = 27
          Width = 31
          Height = 21
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Nome:'
          Layout = tlCenter
        end
        object Label2: TLabel
          Left = 12
          Top = 62
          Width = 31
          Height = 21
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Pa'#237's:'
          Layout = tlCenter
        end
        object Label3: TLabel
          Left = 12
          Top = 97
          Width = 31
          Height = 21
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Qtd:'
          Layout = tlCenter
        end
        object Label4: TLabel
          Left = 233
          Top = 97
          Width = 52
          Height = 21
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Ano:'
          Layout = tlCenter
        end
        object Label5: TLabel
          Left = 12
          Top = 132
          Width = 31
          Height = 21
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Tipo'
          Layout = tlCenter
        end
        object Label6: TLabel
          Left = 233
          Top = 132
          Width = 52
          Height = 21
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Unidade:'
          Layout = tlCenter
        end
        object SpeedButton5: TSpeedButton
          Left = 26
          Top = 175
          Width = 127
          Height = 21
          Caption = 'Selecionar Imagem'
          ImageIndex = 4
          Images = DataModule1.ImageList1
        end
        object Edit1: TEdit
          Left = 50
          Top = 27
          Width = 299
          Height = 21
          TabOrder = 0
        end
        object Edit2: TEdit
          Left = 50
          Top = 62
          Width = 299
          Height = 21
          TabOrder = 1
        end
        object Edit3: TEdit
          Left = 50
          Top = 97
          Width = 59
          Height = 21
          TabOrder = 2
        end
        object Edit4: TEdit
          Left = 291
          Top = 97
          Width = 58
          Height = 21
          TabOrder = 3
        end
        object Edit5: TEdit
          Left = 50
          Top = 132
          Width = 177
          Height = 21
          TabOrder = 4
        end
        object Edit6: TEdit
          Left = 291
          Top = 132
          Width = 58
          Height = 21
          TabOrder = 5
        end
        object filePathText: TEdit
          Left = 159
          Top = 175
          Width = 192
          Height = 21
          AutoSize = False
          BorderStyle = bsNone
          Color = clScrollBar
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 782
    Height = 238
    Margins.Bottom = 10
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 772
    ExplicitHeight = 228
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 782
      Height = 238
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 772
      ExplicitHeight = 228
      object TabSheet1: TTabSheet
        Caption = 'Moedas'
        object Grid_Coins: TDBGrid
          Left = 0
          Top = 0
          Width = 774
          Height = 210
          Cursor = crHandPoint
          Align = alClient
          DataSource = DsGridCoins
          DrawingStyle = gdsGradient
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = Grid_CoinsCellClick
          Columns = <
            item
              Expanded = False
              FieldName = 'Image'
              Title.Caption = 'Imagem'
              Width = 147
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Name'
              Title.Caption = 'Nome'
              Width = 178
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'Value'
              Title.Alignment = taRightJustify
              Title.Caption = 'Valor'
              Width = 67
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'Unit'
              Title.Alignment = taRightJustify
              Title.Caption = 'Unidade'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Country'
              Title.Caption = 'Pais'
              Width = 101
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Year'
              Title.Caption = 'Ano'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Type'
              Title.Caption = 'Tipo'
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'Quantity'
              Title.Alignment = taRightJustify
              Title.Caption = 'Quantidade'
              Visible = True
            end>
        end
      end
      object page2: TTabSheet
        Caption = 'C'#233'dulas'
        ImageIndex = 1
        object DBGrid2: TDBGrid
          Left = 0
          Top = 0
          Width = 774
          Height = 210
          Align = alClient
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              Title.Caption = 'Imagem'
              Width = 147
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Nome'
              Width = 178
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Valor'
              Width = 67
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Unidade'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Pais'
              Width = 101
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Ano'
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Tipo'
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Quantidade'
              Visible = True
            end>
        end
      end
    end
  end
  object StatusBar_Bottom: TStatusBar
    AlignWithMargins = True
    Left = 3
    Top = 549
    Width = 776
    Height = 19
    BiDiMode = bdRightToLeft
    Panels = <
      item
        Alignment = taRightJustify
        Text = 'C:\Program Files\NumismaticPro\database.db'
        Width = 400
      end
      item
        Text = '21 / 21'
        Width = 100
      end
      item
        Alignment = taRightJustify
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Width = 280
      end>
    ParentBiDiMode = False
    ExplicitTop = 539
    ExplicitWidth = 766
  end
  object MainMenu1: TMainMenu
    Left = 600
    Top = 320
    object Configuraes1: TMenuItem
      Caption = 'Configura'#231#245'es'
    end
    object Info1: TMenuItem
      Caption = 'Info'
      OnClick = Info1Click
    end
  end
  object OpenTextFileDialog1: TOpenTextFileDialog
    Left = 680
    Top = 320
  end
  object DsGridCoins: TDataSource
    DataSet = ClientDataSet
    Left = 620
    Top = 463
  end
  object ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 554
    Top = 463
  end
  object DataSetProvider: TDataSetProvider
    DataSet = DataModule1.SqlActions
    Left = 476
    Top = 463
  end
  object ReturnParametersProvider: TDataSetProvider
    DataSet = DataModule1.ReturnParameters
    Left = 476
    Top = 394
  end
  object ReturnParametersDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'ReturnParametersProvider'
    Left = 587
    Top = 394
  end
end
