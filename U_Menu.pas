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
    BtnSelectFileImage: TSpeedButton;
    filePathText: TEdit;
    DsGridCoins: TDataSource;
    Grid_Coins: TDBGrid;
    ClientDataSet: TClientDataSet;
    DataSetProvider: TDataSetProvider;
    ReturnParametersProvider: TDataSetProvider;
    ReturnParametersDataSet: TClientDataSet;
    Panel4: TPanel;
    image01: TImage;
    OpenDialog1: TOpenDialog;
    chkCoin: TCheckBox;
    chk_bill: TCheckBox;
    Label7: TLabel;
    Value_Edit: TEdit;
    lb_value: TLabel;
    BillsGrid: TDBGrid;
    DsGridBills: TDataSource;
    BtnRemoveImage: TButton;
    Panel5: TPanel;
    ImageRegister: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Info1Click(Sender: TObject);
    procedure Grid_CoinsCellClick(Column: TColumn);
    procedure ButtonRefreshDataClick(Sender: TObject);
    procedure BtnNewRegisterClick(Sender: TObject);
    procedure BtnSelectFileImageClick(Sender: TObject);
    procedure chkCoinClick(Sender: TObject);
    procedure chk_billClick(Sender: TObject);
    procedure BtnSaveRegisterClick(Sender: TObject);
    procedure PageControlGeralChange(Sender: TObject);
    procedure Grid_CoinsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SearchFieldChange(Sender: TObject);
    procedure BtnRemoveImageClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure RefreshImage(Field : TField; Img : TImage);
  procedure LoaderImage;
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

uses U_DataModule,U_FrInfo;

{$R *.dfm}


////////////////////////////////////////////////////////////
//FORM CREATE

procedure TFrMenu.FormCreate(Sender: TObject);
begin
  //Define Version
  GlbInfoVersion  :=  '1.0.1';


  ActiveControl   :=  pageControl;
  Self.Caption    :=  'Numismatic Pro Desktop - Vs' + GlbInfoVersion + ' - 2022 - Beta';

  DsGridCoins.DataSet.Active      := False;
  ReturnParametersDataSet.Active  := False;
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
  BtnSelectFileImage.Enabled := True;
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

////////////////////////////////////////////////////////////


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

procedure TFrMenu.LoaderImage;
Var 
  JPG : TJPegImage; 
begin 
 ImageRegister.Picture.Assign(nil);
  If OpenDialog1.Execute Then
    Begin
      Try
        JPG := TJPEGImage.Create(); 
        JPG.LoadFromFile(OpenDialog1.FileName); 
        ImageRegister.Picture.Assign(JPG); 
    Finally 
         FreeAndNil(JPG);      
    End;
    
  End; 

  filePathText.Text :=  OpenDialog1.FileName; 
  
end;

////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////
// LOAD DATA ON GRID ACTIONS

procedure TFrMenu.LoadDataOnActionsGrid;
begin
  image01.Picture.Assign(nil);


  StatusBar_Bottom.Panels[2].Text := IntToStr(Grid_Coins.SelectedRows.Count)+ ' Moedas(s) Selecionadas';
  RefreshImage(ClientDataSet.FieldByName('Image'),image01);
  //RefreshImage(ClientDataSet.FieldByName('Image'),ImageRegister);

  if ImageRegister.Picture = nil then filePathText.Text := '';

  Name_Edit.Text    :=  ClientDataSet.FieldByName('Name').asString;
  Value_Edit.Text   :=  ClientDataSet.FieldByName('Value').asString;
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
        SQL.Add('ORDER BY Name DESC');
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
        SQL.Add('ORDER BY Name DESC');
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
        SQL.Add('ORDER BY Name DESC');
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
        SQL.Add('ORDER BY Name DESC');
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

end;

////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////
//PAGE CONTROL VALIDATIONS

procedure TFrMenu.PageControlGeralChange(Sender: TObject);
begin
  SearchField.Text := '';
  ButtonRefreshDataClick(ButtonRefreshData);
end;

////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////
// LOAD FILE EXPLORER

procedure TFrMenu.BtnSelectFileImageClick(Sender: TObject);
begin
  LoaderImage;
  BtnRemoveImage.Visible := True;
  ActiveControl := Name_Edit;
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
        SQL.Add('ORDER BY Name DESC');

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
        SQL.Add('ORDER BY Name DESC');
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

procedure TFrMenu.ButtonDeleteClick(Sender: TObject);
var
  ResultModal: Integer;

begin
  ResultModal := MessageDlg('Deseja Apagar o Registro?', mtConfirmation, [mbYes, mbNo{, mbCancel}], 0);

  if ResultModal =  mrYes  then
  begin
    IdFieldAction := ClientDataSet.FieldByName('Id').AsInteger;
    ActionsDB('DEL');

    ButtonRefreshDataClick(ButtonRefreshData);
  end;

end;

////////////////////////////////////////////////////////////



 ////////////////////////////////////////////////////////////
 //DB ACTIONS
procedure TFrMenu.ActionsDB(TypaAction: String);
begin
 if DataModule1.SqlActions.active then DataModule1.SqlActions.Close;
    if DataModule1.ReturnParameters.active then DataModule1.ReturnParameters.Close;

    if(TypaAction = 'NEW')then
    begin
       With DataModule1.SqlActions do
        begin
          SQL.Clear;
          SQL.Add('INSERT INTO  CollectionTable');
          SQL.Add('(Image, Name, Value, Unit, Country, Year, Type, Quantity, Coin, Bills)VALUES');        
          SQL.Add('(:Image, :Name, :Value, :Unit, :Country, :Year, :Type, :Quantity, :Coin, :Bills)');                
          ParamByName('Name'    ).AsString := Name_Edit.Text;
          ParamByName('Value'   ).AsString := Value_Edit.Text;
          ParamByName('Unit'    ).AsString := Unit_Edit.Text;
          ParamByName('Country' ).AsString := Country_Edit.Text;
          ParamByName('Year'    ).AsString := Year_Edit.Text;
          ParamByName('Type'    ).AsString := Type_Edit.Text;
          ParamByName('Quantity').AsString := Qtd_Edit.Text;
          ParamByName('Image').LoadFromFile(filePathText.Text,FtBlob);
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

          ShowMessage('Registro Com Sucesso!');
      end;
    end;

    if(TypaAction = 'UPD')then
    begin
       With DataModule1.SqlActions do
        begin
          SQL.Clear;
          SQL.Add('UPDATE CollectionTable SET');
          SQL.Add('Image = :Image, Name = :Name, Value = :Value, Unit = :Unit, Country = :Country, Year = :Year, Type = :Type, Quantity = :Quantity');
          SQL.Add('WHERE Id = :Id');

          ParamByName('Name'    ).AsString := Name_Edit.Text;
          ParamByName('Value'   ).AsString := Value_Edit.Text;
          ParamByName('Unit'    ).AsString := Unit_Edit.Text;
          ParamByName('Country' ).AsString := Country_Edit.Text;
          ParamByName('Year'    ).AsString := Year_Edit.Text;
          ParamByName('Type'    ).AsString := Type_Edit.Text;
          ParamByName('Quantity').AsString := Qtd_Edit.Text;
          if filePathText.Text <> '' then ParamByName('Image').LoadFromFile(filePathText.Text,FtBlob);
          ParamByName('Id').asInteger := IdFieldAction;
          ExecSQL();
          ShowMessage('Alterado Com Sucesso!');
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
          ShowMessage('Registro Apagado Com Sucesso!');
      end;
    end;
end;

////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////
// BTN NEW COIN OR BILLS

procedure TFrMenu.BtnNewRegisterClick(Sender: TObject);
begin
  Name_Edit.Text      := '';
  Country_Edit.Text   := '';
  Qtd_Edit.Text       := '';
  Year_Edit.Text      := '';
  Type_Edit.Text      := '';
  Unit_Edit.Text      := '';
  filePathText.Text   := '';
  chkCoin.Checked     := False;
  chk_bill.Checked    := False;  
  ImageRegister.Picture.Assign(nil);
  BtnSelectFileImage.Enabled := True;

  ActiveControl       := Name_Edit;
end;

procedure TFrMenu.BtnRemoveImageClick(Sender: TObject);
begin
  ImageRegister.Picture.Assign(nil);
  BtnRemoveImage.Visible := False;
end;

////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////
// BUTTON SAVE REGISTER

procedure TFrMenu.BtnSaveRegisterClick(Sender: TObject);
begin

  IdFieldAction := 0;

  if ClientDataSet.Active <> False then  IdFieldAction := ClientDataSet.FieldByName('Id').AsInteger;

    if(IdFieldAction > 0)then ActionsDB('UPD')
    else                      ActionsDB('NEW');

    ButtonRefreshDataClick(ButtonRefreshData);
end;

////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////
// CHECKBOX ACTION

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
