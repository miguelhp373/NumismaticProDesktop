object FrMenu: TFrMenu
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = '****'
  ClientHeight = 571
  ClientWidth = 833
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
    Width = 833
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    Color = clBtnHighlight
    ParentBackground = False
    TabOrder = 0
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
      OnClick = SpeedButton1Click
      ExplicitLeft = 0
      ExplicitHeight = 58
    end
    object BtnNewRegister: TSpeedButton
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
      OnClick = BtnNewRegisterClick
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
      OnClick = SpeedButton4Click
      ExplicitLeft = 80
      ExplicitHeight = 58
    end
    object SearchField: TEdit
      Left = 655
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
    Top = 284
    Width = 833
    Height = 262
    Align = alBottom
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 1
    object pageControl: TPageControl
      Left = 0
      Top = 0
      Width = 833
      Height = 262
      ActivePage = page01_register
      Align = alClient
      TabOrder = 0
      ExplicitHeight = 251
      object page01_register: TTabSheet
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
          Left = -3
          Top = 132
          Width = 46
          Height = 21
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Tipo:'
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
          Left = -1
          Top = 202
          Width = 124
          Height = 21
          Caption = 'Selecionar Imagem'
          ImageIndex = 4
          Images = DataModule1.ImageList1
          OnClick = SpeedButton5Click
        end
        object ImageRegister: TImage
          AlignWithMargins = True
          Left = 369
          Top = 25
          Width = 207
          Height = 168
          Center = True
          Proportional = True
          Stretch = True
        end
        object Label7: TLabel
          Left = 184
          Top = 167
          Width = 46
          Height = 21
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Cole'#231#227'o:'
          Layout = tlCenter
        end
        object lb_value: TLabel
          Left = -8
          Top = 167
          Width = 52
          Height = 21
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Valor:'
          Layout = tlCenter
        end
        object Name_Edit: TEdit
          Left = 50
          Top = 27
          Width = 299
          Height = 21
          TabOrder = 0
        end
        object Country_Edit: TEdit
          Left = 49
          Top = 62
          Width = 299
          Height = 21
          TabOrder = 1
        end
        object Qtd_Edit: TEdit
          Left = 50
          Top = 97
          Width = 59
          Height = 21
          TabOrder = 2
        end
        object Year_Edit: TEdit
          Left = 291
          Top = 97
          Width = 58
          Height = 21
          TabOrder = 3
        end
        object Type_Edit: TEdit
          Left = 50
          Top = 132
          Width = 177
          Height = 21
          TabOrder = 4
        end
        object Unit_Edit: TEdit
          Left = 291
          Top = 132
          Width = 58
          Height = 21
          TabOrder = 5
        end
        object filePathText: TEdit
          Left = 128
          Top = 202
          Width = 448
          Height = 21
          AutoSize = False
          BorderStyle = bsNone
          Color = clScrollBar
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
        object chkCoin: TCheckBox
          Left = 236
          Top = 167
          Width = 47
          Height = 21
          Caption = 'Moeda'
          TabOrder = 7
          OnClick = chkCoinClick
        end
        object chk_bill: TCheckBox
          Left = 289
          Top = 167
          Width = 63
          Height = 21
          Caption = 'C'#233'dula'
          TabOrder = 8
          OnClick = chk_billClick
        end
        object Value_Edit: TEdit
          Left = 50
          Top = 167
          Width = 58
          Height = 21
          TabOrder = 6
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 833
    Height = 227
    Margins.Bottom = 10
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitHeight = 238
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 624
      Height = 227
      ActivePage = page1
      Align = alClient
      TabOrder = 0
      OnChange = PageControl1Change
      ExplicitWidth = 601
      ExplicitHeight = 238
      object page1: TTabSheet
        Caption = 'Moedas'
        object Grid_Coins: TDBGrid
          Left = 0
          Top = 0
          Width = 616
          Height = 199
          Cursor = crHandPoint
          Align = alClient
          DataSource = DsGridCoins
          DrawingStyle = gdsGradient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
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
              ButtonStyle = cbsNone
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
        object BillsGrid: TDBGrid
          Left = 0
          Top = 0
          Width = 616
          Height = 199
          Cursor = crHandPoint
          Align = alClient
          DataSource = DsGridBills
          DrawingStyle = gdsGradient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
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
              ButtonStyle = cbsNone
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
    end
    object Panel4: TPanel
      Left = 624
      Top = 0
      Width = 209
      Height = 227
      Align = alRight
      TabOrder = 1
      ExplicitLeft = 626
      ExplicitTop = 6
      ExplicitHeight = 238
      object image01: TImage
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 201
        Height = 219
        Align = alClient
        AutoSize = True
        Center = True
        Proportional = True
        Stretch = True
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 207
        ExplicitHeight = 122
      end
    end
  end
  object StatusBar_Bottom: TStatusBar
    AlignWithMargins = True
    Left = 3
    Top = 549
    Width = 827
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
  end
  object MainMenu1: TMainMenu
    Left = 648
    Top = 392
    object Configuraes1: TMenuItem
      Caption = 'Configura'#231#245'es'
    end
    object Info1: TMenuItem
      Caption = 'Info'
      OnClick = Info1Click
    end
  end
  object DsGridCoins: TDataSource
    DataSet = ClientDataSet
    Left = 740
    Top = 487
  end
  object ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 738
    Top = 439
  end
  object DataSetProvider: TDataSetProvider
    DataSet = DataModule1.SqlActions
    Left = 644
    Top = 487
  end
  object ReturnParametersProvider: TDataSetProvider
    DataSet = DataModule1.ReturnParameters
    Left = 644
    Top = 442
  end
  object ReturnParametersDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'ReturnParametersProvider'
    Left = 731
    Top = 394
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Todos os Arquivos|*.jpg'
    InitialDir = '\downloads'
    Title = 'Selecione A Imagem'
    Left = 644
    Top = 343
  end
  object DsGridBills: TDataSource
    DataSet = ClientDataSet
    Left = 724
    Top = 343
  end
end
