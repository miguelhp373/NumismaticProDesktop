unit U_Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Menus, Vcl.ComCtrls, Vcl.Imaging.pngimage,
  System.ImageList, Vcl.ImgList, Vcl.Buttons, Vcl.ExtDlgs, Data.FMTBcd,
  Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient, Vcl.Mask, Vcl.DBCtrls;

type
  TFrMenu = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    pageControl: TPageControl;
    page1: TTabSheet;
    SearchField: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    MainMenu1: TMainMenu;
    Configuraes1: TMenuItem;
    StatusBar_Bottom: TStatusBar;
    Info1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    page2: TTabSheet;
    DBGrid2: TDBGrid;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    Edit6: TEdit;
    SpeedButton5: TSpeedButton;
    filePathText: TEdit;
    OpenTextFileDialog1: TOpenTextFileDialog;
    DsGridCoins: TDataSource;
    Grid_Coins: TDBGrid;
    ClientDataSet: TClientDataSet;
    DataSetProvider: TDataSetProvider;
    ReturnParametersProvider: TDataSetProvider;
    ReturnParametersDataSet: TClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure Info1Click(Sender: TObject);
    procedure SearchFieldChange(Sender: TObject);
    procedure Grid_CoinsCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
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
  StatusBar_Bottom.Panels[2].Text := IntToStr(Grid_Coins.SelectedRows.Count)+ ' Moedas(s) Selecionadas';
end;

procedure TFrMenu.Info1Click(Sender: TObject);
begin
  Application.CreateForm(TFrInfo,FrInfo);
  FrInfo.ShowModal;
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



end.
