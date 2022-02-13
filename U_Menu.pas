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
    SpeedButton1: TSpeedButton;
    BtnNewRegister: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    MainMenu1: TMainMenu;
    Configuraes1: TMenuItem;
    StatusBar_Bottom: TStatusBar;
    Info1: TMenuItem;
    PageControl1: TPageControl;
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
    SpeedButton5: TSpeedButton;
    filePathText: TEdit;
    DsGridCoins: TDataSource;
    Grid_Coins: TDBGrid;
    ClientDataSet: TClientDataSet;
    DataSetProvider: TDataSetProvider;
    ReturnParametersProvider: TDataSetProvider;
    ReturnParametersDataSet: TClientDataSet;
    Panel4: TPanel;
    image01: TImage;
    ImageRegister: TImage;
    OpenDialog1: TOpenDialog;
    chkCoin: TCheckBox;
    chk_bill: TCheckBox;
    Label7: TLabel;
    Value_Edit: TEdit;
    lb_value: TLabel;
    BillsGrid: TDBGrid;
    DsGridBills: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure Info1Click(Sender: TObject);
    procedure SearchFieldChange(Sender: TObject);
    procedure Grid_CoinsCellClick(Column: TColumn);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BtnNewRegisterClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure chkCoinClick(Sender: TObject);
    procedure chk_billClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure RefreshImage(Field : TField; Img : TImage);
  procedure LoaderImage;
  procedure ActionsDB(TypaAction: String);
  end;

var
  FrMenu: TFrMenu;
  GlbInfoVersion : String;

implementation

uses U_DataModule,U_FrInfo;

{$R *.dfm}


procedure TFrMenu.FormCreate(Sender: TObject);
begin
  //Define Version
  GlbInfoVersion  :=  '1.0.0';


  ActiveControl   :=  pageControl;
  Self.Caption    :=  'Numismatic Pro Desktop - Vs' + GlbInfoVersion + ' - 2022';

  DsGridCoins.DataSet.Active      := False;
  ReturnParametersDataSet.Active  := False;
end;


procedure TFrMenu.Grid_CoinsCellClick(Column: TColumn);
begin
  if not DataModule1.SqlActions.active then abort;

   image01.Picture.Assign(nil);

  StatusBar_Bottom.Panels[2].Text := IntToStr(Grid_Coins.SelectedRows.Count)+ ' Moedas(s) Selecionadas';
  RefreshImage(ClientDataSet.FieldByName('Image'),image01);

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

procedure TFrMenu.Info1Click(Sender: TObject);
begin
  Application.CreateForm(TFrInfo,FrInfo);
  FrInfo.ShowModal;
end;



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

procedure TFrMenu.PageControl1Change(Sender: TObject);
begin
  if not DataModule1.SqlActions.active then abort;

  SpeedButton4Click(SpeedButton4);
end;

procedure TFrMenu.SpeedButton5Click(Sender: TObject);
begin
  LoaderImage;
end;

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

procedure TFrMenu.SearchFieldChange(Sender: TObject);
var
  TotalRegistersCoins : String;
  TotalRegistersGeneral : String;
  StringSearch : String;
begin

  TotalRegistersCoins   := '0';
  TotalRegistersGeneral := '0';
  StringSearch := '';
  if SearchField.Text <> '' then StringSearch := SearchField.Text;

  DsGridCoins.DataSet.Active      := False;
  ReturnParametersDataSet.Active  := False;


  if pageControl.ActivePage = page1 then
  begin

    if DataModule1.SqlActions.active then DataModule1.SqlActions.Close;
    if DataModule1.ReturnParameters.active then DataModule1.ReturnParameters.Close;


    With DataModule1.SqlActions do
      begin
        SQL.Clear;
        SQL.Add('SELECT * FROM CollectionTable');
        SQL.Add('WHERE Name LIKE :TextParam AND Coin = "TRUE"');
        ParambyName('TextParam').AsString :=  '%' + StringSearch  + '%';
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

    StatusBar_Bottom.Panels[1].Text := TotalRegistersCoins + '/' + TotalRegistersGeneral;

  end;

    {if pageControl.ActivePage = page2 then
    begin
      With DataModule1.SqlActions do
        begin
          SQL.Clear;
          Close;
          SQL.Add('SELECT * FROM CollectionTable WHERE Name LIKE "%'+ Text +'%" AND Bills = "TRUE"');
          Open;
      end;
    end;   }

end;



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
      end;
    end;
end;

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

  ActiveControl       := Name_Edit;
end;

procedure TFrMenu.SpeedButton1Click(Sender: TObject);
begin
    DsGridCoins.DataSet.Active      := False;

    if(ClientDataSet.FieldByName('Id').AsInteger > 0)then ActionsDB('NEW')
    else                                                  ActionsDB('UPD');
    
    DsGridCoins.DataSet.Active      := False;
  
  if pageControl.ActivePage = page1 then
  begin

    if DataModule1.SqlActions.active then DataModule1.SqlActions.Close;
    if DataModule1.ReturnParameters.active then DataModule1.ReturnParameters.Close;

    With DataModule1.SqlActions do
      begin
        SQL.Clear;
        SQL.Add('SELECT * FROM CollectionTable');
        SQL.Add('WHERE  Coin = "TRUE"');
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
        Open;
      end;
  end;  

end;

procedure TFrMenu.SpeedButton4Click(Sender: TObject);
var
  TotalRegistersCoins : String;
  TotalRegistersGeneral : String;
begin

  TotalRegistersCoins   := '0';
  TotalRegistersGeneral := '0';

  DsGridCoins.DataSet.Active      := False;
  ReturnParametersDataSet.Active  := False;


  if PageControl1.ActivePage = page1 then
  begin

    if DataModule1.SqlActions.active then DataModule1.SqlActions.Close;
    if DataModule1.ReturnParameters.active then DataModule1.ReturnParameters.Close;


    With DataModule1.SqlActions do
      begin
        SQL.Clear;
        SQL.Add('SELECT * FROM CollectionTable');
        SQL.Add('WHERE  Coin = "TRUE"');        
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

  
 if PageControl1.ActivePage = page2 then
  begin

    if DataModule1.SqlActions.active then DataModule1.SqlActions.Close;
    if DataModule1.ReturnParameters.active then DataModule1.ReturnParameters.Close;


    With DataModule1.SqlActions do
      begin
        SQL.Clear;
        SQL.Add('SELECT * FROM CollectionTable');
        SQL.Add('WHERE  Bills = "TRUE"');        
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




end.
