unit U_Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Menus, Vcl.ComCtrls, Vcl.Imaging.pngimage,
  System.ImageList, Vcl.ImgList, Vcl.Buttons, Vcl.ExtDlgs, Data.FMTBcd,
  Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Imaging.jpeg;

type
  TFrMenu = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    pageControl: TPageControl;
    page01_register: TTabSheet;
    SearchField: TEdit;
    BtnSaveRegister: TSpeedButton;
    BtnNewRegister: TSpeedButton;
    ButtonDelete: TSpeedButton;
    ButtonRefreshData: TSpeedButton;
    MainMenu1: TMainMenu;
    Configuraes1: TMenuItem;
    StatusBar_Bottom: TStatusBar;
    Info1: TMenuItem;
    PageControlGeral: TPageControl;
    page1: TTabSheet;
    page2: TTabSheet;
    Name_Edit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Country_Edit: TEdit;
    Label3: TLabel;
    Qtd_Edit: TEdit;
    Year_Edit: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Type_Edit: TEdit;
    Label6: TLabel;
    Unit_Edit: TEdit;
    DsGridCoins: TDataSource;
    Grid_Coins: TDBGrid;
    ClientDataSet: TClientDataSet;
    DataSetProvider: TDataSetProvider;
    ReturnParametersProvider: TDataSetProvider;
    ReturnParametersDataSet: TClientDataSet;
    OpenDialog1: TOpenDialog;
    chkCoin: TCheckBox;
    chk_bill: TCheckBox;
    Label7: TLabel;
    Value_Edit: TEdit;
    lb_value: TLabel;
    BillsGrid: TDBGrid;
    Panel4: TPanel;
    image01: TImage;
    image02: TImage;
    DsGridBills: TDataSource;
    PopupMenu1: TPopupMenu;
    button1pop: TMenuItem;
    PopupMenu2: TPopupMenu;
    button2pop: TMenuItem;
    OpenDialog2: TOpenDialog;
    RemoverImagem1: TMenuItem;
    RemoverImagem2: TMenuItem;
    Button2: TButton;
    SpeedButton1: TSpeedButton;
    cb_orderbylist: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure Info1Click(Sender: TObject);
    procedure Grid_CoinsCellClick(Column: TColumn);
    procedure ButtonRefreshDataClick(Sender: TObject);
    procedure BtnNewRegisterClick(Sender: TObject);
    procedure chkCoinClick(Sender: TObject);
    procedure chk_billClick(Sender: TObject);
    procedure BtnSaveRegisterClick(Sender: TObject);
    procedure PageControlGeralChange(Sender: TObject);
    procedure Grid_CoinsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SearchFieldChange(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure image02Click(Sender: TObject);
    procedure button1popClick(Sender: TObject);
    procedure button2popClick(Sender: TObject);
    procedure RemoverImagem1Click(Sender: TObject);
    procedure RemoverImagem2Click(Sender: TObject);
    procedure Configuraes1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cb_orderbylistChange(Sender: TObject);
    procedure Value_EditExit(Sender: TObject);
    procedure Year_EditExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure RefreshImage(Field : TField; Img : TImage);
  procedure LoaderImage(ImgComponent : String);
  procedure ActionsDB(TypaAction: String);
  procedure SearchAction(Textsearch : String);  //FUNÇÃO DE BUSCA DO CAMPO SEARCH FIELD
  procedure LoadDataOnGrid;
  procedure LoadDataOnActionsGrid;
  end;

var
  FrMenu: TFrMenu;
  GlbInfoVersion : String;
  IdFieldAction  : Integer;

implementation

uses U_DataModule, U_Format, U_FrInfo, U_Config;

{$R *.dfm}


////////////////////////////////////////////////////////////
//FORM CREATE

procedure TFrMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  self.Free;
  Application.Terminate;
end;

procedure TFrMenu.FormCreate(Sender: TObject);
var
  path  : String;
begin
  //Define Version
  GlbInfoVersion  :=  '2.3';

  path := ExtractFilePath(ParamStr(0));



  ActiveControl   :=  pageControl;
  Self.Caption    :=  'Numismatic Pro Desktop - Vs' + GlbInfoVersion + ' - 2022';

  StatusBar_Bottom.Panels[0].Text  :=  path + 'database.db';
  DsGridCoins.DataSet.Active      := False;
  ReturnParametersDataSet.Active  := False;

  ButtonRefreshDataClick(ButtonRefreshData);//LoadData
end;


////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////
//GRID CLICK ACTION

procedure TFrMenu.Grid_CoinsCellClick(Column: TColumn);
begin
  if PageControlGeral.ActivePage = page1 then
  begin
    if not DsGridCoins.DataSet.Active then abort;
  end;

  if PageControlGeral.ActivePage = page2 then
  begin
    if not DsGridBills.DataSet.Active then abort;
  end;

  LoadDataOnActionsGrid;

  IdFieldAction := ClientDataSet.FieldByName('Id').AsInteger;  
  
  button1pop.Caption  := 'Atualizar Imagem Frente';
  button1pop.Caption  := 'Atualizar Imagem Verso';

end;

procedure TFrMenu.Grid_CoinsKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if PageControlGeral.ActivePage = page1 then
  begin
    if not DsGridCoins.DataSet.Active then abort;
  end;

  if PageControlGeral.ActivePage = page2 then
  begin
    if not DsGridBills.DataSet.Active then abort;
  end;

  LoadDataOnActionsGrid;
end;

procedure TFrMenu.image02Click(Sender: TObject);
begin

end;

////////////////////////////////////////////////////////////
// OPEN CONFIG MODAL
procedure TFrMenu.Configuraes1Click(Sender: TObject);
begin
  Application.CreateForm(TFrConfig,FrConfig);
  FrConfig.ShowModal;
end;


////////////////////////////////////////////////////////////
// OPEN INFO MODAL

procedure TFrMenu.Info1Click(Sender: TObject);
begin
  Application.CreateForm(TFrInfo,FrInfo);
  FrInfo.ShowModal;
end;

////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////
//LOAD IMAGE

procedure TFrMenu.LoaderImage(ImgComponent : String);
Var 
  JPG1 : TJPegImage;
  JPG2 : TJPegImage;
begin 

  if ImgComponent = '1' then
  begin
    image01.Picture.Assign(nil);
    If OpenDialog1.Execute Then
      Begin
        Try
          JPG1 := TJPEGImage.Create();
          JPG1.LoadFromFile(OpenDialog1.FileName);
          image01.Picture.Assign(JPG1);
        Except
          Application.MessageBox('Operação Cancelada! Não Foi Possivel Selecionar a Imagem - #001, Tente Novamente.','Numismatic Pro Desktop',48);
          FreeAndNil(JPG1);
        End;
    End;
  End;


  if ImgComponent = '2' then
  begin
    image02.Picture.Assign(nil);
    If OpenDialog2.Execute Then
    Begin
      Try
        JPG2 := TJPEGImage.Create();
        JPG2.LoadFromFile(OpenDialog2.FileName);
        image02.Picture.Assign(JPG2);
      Except
        Application.MessageBox('Operação Cancelada! Não Foi Possivel Selecionar a Imagem - #002, Tente Novamente.','Numismatic Pro Desktop',48);
        FreeAndNil(JPG2);
      End;
    end;
  end;

end;

procedure TFrMenu.button2popClick(Sender: TObject);
begin
  LoaderImage('2');
  ActiveControl := Name_Edit;
end;

////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////
// LOAD DATA ON GRID ACTIONS

procedure TFrMenu.LoadDataOnActionsGrid;
begin
  image01.Picture.Assign(nil);
  image02.Picture.Assign(nil);


  StatusBar_Bottom.Panels[2].Text := IntToStr(Grid_Coins.SelectedRows.Count)+ ' Moedas(s) Selecionadas';
  RefreshImage(ClientDataSet.FieldByName('ImageFront'),image01);
  RefreshImage(ClientDataSet.FieldByName('ImageBack'),image02);

  Name_Edit.Text    :=  ClientDataSet.FieldByName('Name').asString;
  Value_Edit.Text   :=  Formatfloat('#####0.00',ClientDataSet.FieldByName('Value').asFloat);
  Unit_Edit.Text    :=  ClientDataSet.FieldByName('Unit').asString;
  Country_Edit.Text :=  ClientDataSet.FieldByName('Country').asString;
  Year_Edit.Text    :=  ClientDataSet.FieldByName('Year').asString;
  Type_Edit.Text    :=  ClientDataSet.FieldByName('Type').asString;
  Qtd_Edit.Text     :=  ClientDataSet.FieldByName('Quantity').asString;

  if  ClientDataSet.FieldByName('Coin').asString  = 'TRUE'  then
  begin
    chkCoin.Checked     := True;
    chk_bill.Checked    := False;
  end
  else
    begin
      chkCoin.Checked   := False;
      chk_bill.Checked  := True;
  end;
end;

////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////
// LOAD DATA FROM DB

procedure TFrMenu.LoadDataOnGrid;
begin
  if pageControl.ActivePage = page1 then
  begin

    if DataModule1.SqlActions.active then DataModule1.SqlActions.Close;
    if DataModule1.ReturnParameters.active then DataModule1.ReturnParameters.Close;

    With DataModule1.SqlActions do
      begin
        SQL.Clear;
        SQL.Add('SELECT * FROM CollectionTable');
        SQL.Add('WHERE  Coin = "TRUE"');
        SQL.Add('ORDER BY Name Year, Country');
        Open;
      end;
  end;

  if pageControl.ActivePage = page2 then
  begin

    if DataModule1.SqlActions.active then DataModule1.SqlActions.Close;
    if DataModule1.ReturnParameters.active then DataModule1.ReturnParameters.Close;

    With DataModule1.SqlActions do
      begin
        SQL.Clear;
        SQL.Add('SELECT * FROM CollectionTable');
        SQL.Add('WHERE  Bills = "TRUE"');
        SQL.Add('ORDER BY Name Year, Country');
        Open;
      end;
  end;
end;

////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////
// REFRESH BUTTON GRID DB

procedure TFrMenu.ButtonRefreshDataClick(Sender: TObject);
var
  TotalRegistersCoins : String;
  TotalRegistersGeneral : String;
begin

  TotalRegistersCoins   := '0';
  TotalRegistersGeneral := '0';

  DsGridCoins.DataSet.Active      := False;
  ReturnParametersDataSet.Active  := False;


  if PageControlGeral.ActivePage = page1 then
  begin

    if DataModule1.SqlActions.active then DataModule1.SqlActions.Close;
    if DataModule1.ReturnParameters.active then DataModule1.ReturnParameters.Close;


    With DataModule1.SqlActions do
      begin
        SQL.Clear;
        SQL.Add('SELECT * FROM CollectionTable');
        SQL.Add('WHERE  Coin = "TRUE"');
        SQL.Add('ORDER BY Year, Country');
        Open;

        DsGridCoins.DataSet.Active := True;

        TotalRegistersCoins := IntToStr(ClientDataSet.RecordCount);

        if StrToInt(TotalRegistersCoins) < 1 then
        begin
          DsGridCoins.DataSet.Active := False;
          StatusBar_Bottom.Panels[1].Text := '0/0';
          abort;
        end;

    end;
  end;


 if PageControlGeral.ActivePage = page2 then
  begin

    if DataModule1.SqlActions.active then DataModule1.SqlActions.Close;
    if DataModule1.ReturnParameters.active then DataModule1.ReturnParameters.Close;


    With DataModule1.SqlActions do
      begin
        SQL.Clear;
        SQL.Add('SELECT * FROM CollectionTable');
        SQL.Add('WHERE  Bills = "TRUE"');
        SQL.Add('ORDER BY Year, Country');
        Open;

        DsGridBills.DataSet.Active := True;

        TotalRegistersCoins := IntToStr(ClientDataSet.RecordCount);

        if StrToInt(TotalRegistersCoins) < 1 then
        begin
          DsGridBills.DataSet.Active := False;
          StatusBar_Bottom.Panels[1].Text := '0/0';
          abort;
        end;

    end;
  end;

   With DataModule1.ReturnParameters do
      begin
        SQL.Clear;
        SQL.Add('SELECT * FROM CollectionTable');
        Open;

        ReturnParametersDataSet.Active := True;

        TotalRegistersGeneral := IntToStr(ReturnParametersDataSet.RecordCount);
    end;

    StatusBar_Bottom.Panels[1].Text := TotalRegistersCoins + '/' + TotalRegistersGeneral;
    Grid_CoinsCellClick(Grid_Coins.Columns[0]);
end;

////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////
//PAGE CONTROL VALIDATIONS

procedure TFrMenu.PageControlGeralChange(Sender: TObject);
begin
  if  ClientDataSet.Active = False  then  abort;

  SearchField.Text := '';
  ButtonRefreshDataClick(ButtonRefreshData);
end;

////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////
// SHOW IMAGE ON TIMAGE

procedure TFrMenu.RefreshImage(Field: TField; Img: TImage);
var
  vJpeg   : TJPEGImage;
  vStream : TMemoryStream;
begin
  {Passa Vazio, Para Zerar o TImage}
   Img.Picture.Assign(nil);

  { Verifica se o campo esta vázio. }
  if not Field.IsNull then
  begin

    { Cria objeto do tipo TJPEG, e objeto do tipo MemoryStream}
    vJpeg   := TJPEGImage.Create;
    vStream := TMemoryStream.Create;

    { Trata o campo como do tipo BLOB e salva o seu conteudo na memória. }
    TBlobField(Field).SaveToStream(vStream);

    { Ajusta a posicao inicial de leitura da memória }
    vStream.Position := 0;

    { Carrega da memoria os dados, para uma estrutura do tipo TJPEG
      (A partir da posicao 0)}
    vJpeg.LoadFromStream(vStream);

    { Exibe o jpg no Timage. }
    Img.Picture.Assign(vJpeg);

    { Libera a memoria utilizada pelos componentes de conversão }
    vJpeg.Free;
    vStream.Free;
  end;

end;

procedure TFrMenu.RemoverImagem1Click(Sender: TObject);
begin
  image01.Picture.Assign(nil);
  OpenDialog1.FileName  :=  '';
end;

procedure TFrMenu.RemoverImagem2Click(Sender: TObject);
begin
  image02.Picture.Assign(nil);
  OpenDialog2.FileName  :=  '';
end;

////////////////////////////////////////////////////////////




////////////////////////////////////////////////////////////
// FUNÇÃO QUE BUSCA STRING NO BANCO DE DADOS

procedure TFrMenu.SearchAction(Textsearch: String);
var
  TotalRegistersCoins : String;
  TotalRegistersGeneral : String;
begin

  TotalRegistersCoins   := '0';
  TotalRegistersGeneral := '0';

  if  Textsearch = '' then ButtonRefreshDataClick(ButtonRefreshData);

  DsGridCoins.DataSet.Active      := False;
  ReturnParametersDataSet.Active  := False;


  if PageControlGeral.ActivePage = page1 then
  begin

    if DataModule1.SqlActions.active then DataModule1.SqlActions.Close;
    if DataModule1.ReturnParameters.active then DataModule1.ReturnParameters.Close;


    With DataModule1.SqlActions do
      begin
        SQL.Clear;
        SQL.Add('SELECT * FROM CollectionTable');
        SQL.Add('WHERE Name LIKE :TextParam AND Coin = "TRUE"');
        SQL.Add('ORDER BY Year, Name, Country');

        ParambyName('TextParam').AsString :=  '%' + Textsearch  + '%';
        Open;

        DsGridCoins.DataSet.Active := True;

        TotalRegistersCoins := IntToStr(ClientDataSet.RecordCount);

        if StrToInt(TotalRegistersCoins) < 1 then
        begin
          DsGridCoins.DataSet.Active := False;
          StatusBar_Bottom.Panels[1].Text := '0/0';
          abort;
        end;


    end;

    With DataModule1.ReturnParameters do
      begin
        SQL.Clear;
        SQL.Add('SELECT * FROM CollectionTable');
        Open;

        ReturnParametersDataSet.Active := True;

        TotalRegistersGeneral := IntToStr(ReturnParametersDataSet.RecordCount);
    end;

 if PageControlGeral.ActivePage = page2 then
  begin

    if DataModule1.SqlActions.active then DataModule1.SqlActions.Close;
    if DataModule1.ReturnParameters.active then DataModule1.ReturnParameters.Close;


    With DataModule1.SqlActions do
      begin
        SQL.Clear;
        SQL.Add('SELECT * FROM CollectionTable');
        SQL.Add('WHERE Name LIKE :TextParam AND  Bills = "TRUE"');
        SQL.Add('ORDER BY Name Year, Country');
        ParambyName('TextParam').AsString :=  '%' + Textsearch  + '%';
        Open;

        DsGridBills.DataSet.Active := True;

        TotalRegistersCoins := IntToStr(ClientDataSet.RecordCount);

        if StrToInt(TotalRegistersCoins) < 1 then
        begin
          DsGridBills.DataSet.Active := False;
          StatusBar_Bottom.Panels[1].Text := '0/0';
          abort;
        end;

    end;
  end;

    StatusBar_Bottom.Panels[1].Text := TotalRegistersCoins + '/' + TotalRegistersGeneral;

  end;
end;

procedure TFrMenu.SearchFieldChange(Sender: TObject);
begin
  SearchAction(SearchField.Text);
end;

procedure TFrMenu.SpeedButton1Click(Sender: TObject);
begin
  LoaderImage('1');
  ActiveControl := Name_Edit;
end;

procedure TFrMenu.Value_EditExit(Sender: TObject);
begin
  Value_Edit.Text:= Formatfloat('#####0.00',strtofloat(Value_Edit.Text));
end;

procedure TFrMenu.Year_EditExit(Sender: TObject);
var
  validate_auxiliar :  integer;
begin
  Try
    validate_auxiliar :=  StrToInt(Year_Edit.Text);
  Except
    Application.MessageBox('Operação Cancelada! Ano Inválido - #001','Numismatic Pro Desktop',48);
    Abort;
  End;

  if not ((validate_auxiliar  > 1800)  and (validate_auxiliar < 2999))then
  begin
    Application.MessageBox('Operação Cancelada! Ano Inválido - #002','Numismatic Pro Desktop',48);
    Abort;
  end;
end;

procedure TFrMenu.ButtonDeleteClick(Sender: TObject);
var
  ResultModal: Integer;

begin

  if PageControlGeral.ActivePage = page1 then
  begin
    if  DsGridCoins.DataSet.Active = False  then  abort;
  end;

  if PageControlGeral.ActivePage = page2 then
  begin
    if  DsGridBills.DataSet.Active = False  then  abort;
  end;

  ResultModal := MessageDlg('Deseja Apagar o Registro: '+ ClientDataSet.FieldByName('Name').asString + '?', mtConfirmation, [mbYes, mbNo{, mbCancel}], 0);

  if ResultModal =  mrYes  then
  begin
    IdFieldAction := ClientDataSet.FieldByName('Id').AsInteger;
    ActionsDB('DEL');

    ButtonRefreshDataClick(ButtonRefreshData);
    BtnNewRegisterClick(BtnNewRegister);
  end;

end;

////////////////////////////////////////////////////////////



 ////////////////////////////////////////////////////////////
 //DB ACTIONS
procedure TFrMenu.ActionsDB(TypaAction: String);
var
  Stream1: TMemoryStream;
  Stream2: TMemoryStream;
  ResultModal: Integer;  
begin
 if DataModule1.SqlActions.active then DataModule1.SqlActions.Close;
    if DataModule1.ReturnParameters.active then DataModule1.ReturnParameters.Close;

    if(TypaAction = 'NEW')then
    begin
       With DataModule1.SqlActions do
        begin
          SQL.Clear;
          SQL.Add('INSERT INTO  CollectionTable');

          SQL.Add('(ImageFront, ImageBack, Name, Value, Unit, Country, Year, Type, Quantity, Coin, Bills)VALUES');
          SQL.Add('(:ImageFront, :ImageBack, :Name, :Value, :Unit, :Country, :Year, :Type, :Quantity, :Coin, :Bills)');
          ParamByName('Name'    ).AsString := Name_Edit.Text;
          ParamByName('Value'   ).asFloat  := StrToFloat(Value_Edit.Text);
          ParamByName('Unit'    ).AsString := Unit_Edit.Text;
          ParamByName('Country' ).AsString := Country_Edit.Text;
          ParamByName('Year'    ).AsString := Year_Edit.Text;
          ParamByName('Type'    ).AsString := Type_Edit.Text;
          ParamByName('Quantity').AsString := Qtd_Edit.Text;


          Stream1 := TMemoryStream.Create; 
          Stream2 := TMemoryStream.Create; 

          if image01.Picture <> nil then 
            begin
             image01.Picture.SaveToStream(Stream1);
             ParamByName('ImageFront').LoadFromStream(Stream1,ftBlob);
            end
          else                           ParamByName('ImageFront').LoadFromFile('',FtBlob);            

          if image02.Picture <> nil then 
            begin
             image02.Picture.SaveToStream(Stream2);
             ParamByName('ImageBack').LoadFromStream(Stream2,ftBlob);
            end
          else                           ParamByName('ImageBack').LoadFromFile('',FtBlob); 
          
          if chkCoin.Checked = True then
          begin
            ParamByName('Coin'    ).AsString := 'TRUE';
            ParamByName('Bills'   ).AsString := 'FALSE';
          end
          else
            begin
              ParamByName('Coin'    ).AsString := 'FALSE';
              ParamByName('Bills'   ).AsString := 'TRUE';
          end;
          ExecSQL();

          ShowMessage('Salvo Com Sucesso!');
    Abort;
      end;
    end;

    if(TypaAction = 'UPD')then
    begin        

      ResultModal := MessageDlg('Deseja Alterar o Registro?', mtConfirmation, [mbYes, mbNo{, mbCancel}],0);

      if ResultModal =  7  then abort;
    
       With DataModule1.SqlActions do
        begin
          SQL.Clear;
          SQL.Add('UPDATE CollectionTable SET');
          SQL.Add('ImageFront = :ImageFront, ImageBack = :ImageBack, Name = :Name, Value = :Value, Unit = :Unit, Country = :Country, Year = :Year, Type = :Type, Quantity = :Quantity');
          SQL.Add('WHERE Id = :Id');

          ParamByName('Name'    ).AsString := Name_Edit.Text;
          ParamByName('Value'   ).AsFloat  := StrToFloat(Value_Edit.Text);
          ParamByName('Unit'    ).AsString := Unit_Edit.Text;
          ParamByName('Country' ).AsString := Country_Edit.Text;
          ParamByName('Year'    ).AsString := Year_Edit.Text;
          ParamByName('Type'    ).AsString := Type_Edit.Text;
          ParamByName('Quantity').AsString := Qtd_Edit.Text;

          Stream1 := TMemoryStream.Create; 
          Stream2 := TMemoryStream.Create; 

          if image01.Picture <> nil then 
            begin
             image01.Picture.SaveToStream(Stream1);
             ParamByName('ImageFront').LoadFromStream(Stream1,ftBlob);
            end
          else                           ParamByName('ImageFront').LoadFromFile('',FtBlob);            

          if image02.Picture <> nil then 
            begin
             image02.Picture.SaveToStream(Stream2);
             ParamByName('ImageBack').LoadFromStream(Stream2,ftBlob);
            end
          else                           ParamByName('ImageBack').LoadFromFile('',FtBlob);           

          ParamByName('Id').asInteger := IdFieldAction;

          ExecSQL();

          ShowMessage('Alterado Com Sucesso!');

          Stream1.Free;
          Stream2.Free;
          
      end;
    end;

    if(TypaAction = 'DEL')then
    begin
       With DataModule1.SqlActions do
        begin
          SQL.Clear;
          SQL.Add('DELETE FROM CollectionTable');
          SQL.Add('WHERE Id = :Id');

          ParamByName('Id').asInteger := IdFieldAction;
          ExecSQL();
          ShowMessage('Apagado Com Sucesso!');
          BtnNewRegisterClick(BtnNewRegister);
      end;
    end;
end;

////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////
// BTN NEW COIN OR BILLS

procedure TFrMenu.button1popClick(Sender: TObject);
begin
  LoaderImage('1');
  ActiveControl := Name_Edit;
end;

procedure TFrMenu.Button2Click(Sender: TObject);
begin
  LoaderImage('2');
  ActiveControl := Name_Edit;
end;

procedure TFrMenu.BtnNewRegisterClick(Sender: TObject);
begin
  IdFieldAction       :=  0;
  Name_Edit.Text      := '';
  Country_Edit.Text   := '';
  Qtd_Edit.Text       := '';
  Year_Edit.Text      := '';
  Type_Edit.Text      := '';
  Unit_Edit.Text      := '';
  Value_Edit.Text     := '';
  chkCoin.Checked     := False;
  chk_bill.Checked    := False;  
  image01.Picture.Assign(nil);
  image02.Picture.Assign(nil);
  OpenDialog1.FileName  :=  '';
  OpenDialog2.FileName  :=  '';

  button1pop.Caption  := 'Adicionar Imagem Frente';
  button1pop.Caption  := 'Adicionar Imagem Verso';

  ActiveControl       := Name_Edit;
end;

////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////
// BUTTON SAVE REGISTER

procedure TFrMenu.BtnSaveRegisterClick(Sender: TObject);
var
  validate_auxiliar : Integer;
begin

   /////////////////////////////////////////////////
   //VALIDATION FIELDS

   if Trim(Name_Edit.Text) = ''  then
   begin
    ShowMessage('Campo Nome Não Pode Ficar Vazio!');
    ActiveControl :=  Name_Edit;
    abort;
   end;

   if Trim(Country_Edit.Text) = ''  then
   begin
    ShowMessage('Campo Pais Não Pode Ficar Vazio!');
    ActiveControl :=  Country_Edit;
    abort;
   end;   

   if Trim(Qtd_Edit.Text) = ''  then
   begin
    ShowMessage('Campo Quantidade Não Pode Ficar Vazio!');
    ActiveControl :=  Qtd_Edit;
    abort;
   end; 

   if Trim(Year_Edit.Text) = ''  then
   begin
    ShowMessage('Campo Ano Não Pode Ficar Vazio!');
    ActiveControl :=  Year_Edit;
    abort;
   end;

   Try
    validate_auxiliar :=  StrToInt(Year_Edit.Text);
   Except
    Application.MessageBox('Operação Cancelada! Ano Inválido - #001','Numismatic Pro Desktop',48);
    Abort;
   End;

   if not ((validate_auxiliar  > 1800)  and (validate_auxiliar < 2999))then
   begin
    Application.MessageBox('Operação Cancelada! Ano Inválido - #002','Numismatic Pro Desktop',48);
    Abort;
   end;

   if Trim(Type_Edit.Text) = ''  then
   begin
    ShowMessage('Campo Tipo Não Pode Ficar Vazio!');
    ActiveControl :=  Type_Edit;
    abort;
   end;

   if Trim(Unit_Edit.Text) = ''  then
   begin
    ShowMessage('Campo Unidade Não Pode Ficar Vazio!');
    ActiveControl :=  Unit_Edit;
    abort;
   end;       

   if Trim(Value_Edit.Text) = ''  then
   begin
    ShowMessage('Campo Valor Não Pode Ficar Vazio!');
    ActiveControl :=  Value_Edit;
    abort;
   end;         

   if ((chkCoin.Checked = False) and (chk_bill.Checked = False)) then
   begin
    ShowMessage('Escolha uma Coleção!');
    ActiveControl :=  chkCoin;
    abort;
   end;

   /////////////////////////////////////////////////



    if IdFieldAction <> 0 then  IdFieldAction := ClientDataSet.FieldByName('Id').AsInteger;

    if(IdFieldAction > 0)then ActionsDB('UPD')
    else                      ActionsDB('NEW');

    ButtonRefreshDataClick(ButtonRefreshData);
end;

////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////
// CHECKBOX ACTION

procedure TFrMenu.cb_orderbylistChange(Sender: TObject);
var
  TotalRegistersCoins,
  TotalRegistersGeneral  : String;
  OrderString            : String;
begin

  TotalRegistersCoins   := '0';
  TotalRegistersGeneral := '0';

  DsGridCoins.DataSet.Active      := False;
  ReturnParametersDataSet.Active  := False;


  //////////////////////////////////////////////////
  //define order to select

    case  cb_orderbylist.ItemIndex  of
      0 : OrderString :=  'ORDER BY Year, Country ASC';
      1 : OrderString :=  'ORDER BY Name, Year ASC';
      2 : OrderString :=  'ORDER BY Unit, Year ASC';
      3 : OrderString :=  'ORDER BY Country ASC';
      4 : OrderString :=  'ORDER BY Year, Country ASC';
      5 : OrderString :=  'ORDER BY Quantity, Country DESC';
    end;

  //////////////////////////////////////////////////
  if PageControlGeral.ActivePage = page1 then
  begin

    if DataModule1.SqlActions.active then DataModule1.SqlActions.Close;
    if DataModule1.ReturnParameters.active then DataModule1.ReturnParameters.Close;


    With DataModule1.SqlActions do
      begin
        SQL.Clear;
        SQL.Add('SELECT * FROM CollectionTable');
        SQL.Add('WHERE  Coin = "TRUE"');
        SQL.Add(OrderString);
        Open;

        DsGridCoins.DataSet.Active := True;

        TotalRegistersCoins := IntToStr(ClientDataSet.RecordCount);

        if StrToInt(TotalRegistersCoins) < 1 then
        begin
          DsGridCoins.DataSet.Active := False;
          StatusBar_Bottom.Panels[1].Text := '0/0';
          abort;
        end;

    end;
  end;


 if PageControlGeral.ActivePage = page2 then
  begin

    if DataModule1.SqlActions.active then DataModule1.SqlActions.Close;
    if DataModule1.ReturnParameters.active then DataModule1.ReturnParameters.Close;


    With DataModule1.SqlActions do
      begin
        SQL.Clear;
        SQL.Add('SELECT * FROM CollectionTable');
        SQL.Add('WHERE  Bills = "TRUE"');
        SQL.Add(OrderString);
        Open;

        DsGridBills.DataSet.Active := True;

        TotalRegistersCoins := IntToStr(ClientDataSet.RecordCount);

        if StrToInt(TotalRegistersCoins) < 1 then
        begin
          DsGridBills.DataSet.Active := False;
          StatusBar_Bottom.Panels[1].Text := '0/0';
          abort;
        end;

    end;
  end;

   With DataModule1.ReturnParameters do
      begin
        SQL.Clear;
        SQL.Add('SELECT * FROM CollectionTable');
        Open;

        ReturnParametersDataSet.Active := True;

        TotalRegistersGeneral := IntToStr(ReturnParametersDataSet.RecordCount);
    end;

    StatusBar_Bottom.Panels[1].Text := TotalRegistersCoins + '/' + TotalRegistersGeneral;

    Grid_CoinsCellClick(Grid_Coins.Columns[0]);
end;

procedure TFrMenu.chkCoinClick(Sender: TObject);
begin

  if chkCoin.Checked = True then  chk_bill.Enabled   := False
  else                            chk_bill.Enabled   := True;

end;

procedure TFrMenu.chk_billClick(Sender: TObject);
begin
  if chk_bill.Checked = True then  chkCoin.Enabled   := False
  else                             chkCoin.Enabled   := True;
end;

////////////////////////////////////////////////////////////




end.
