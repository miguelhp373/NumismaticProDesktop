unit U_DataModule;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls,
  Data.DB, Data.SqlExpr, Data.DbxSqlite, Data.FMTBcd, Datasnap.Provider,
  Datasnap.DBClient,Vcl.Dialogs,Vcl.Forms;

type
  TDataModule1 = class(TDataModule)
    ImageList1: TImageList;
    SqliteConnection: TSQLConnection;
    SqlActions: TSQLQuery;
    ReturnParameters: TSQLQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
var
  path  : String;
begin
  path := ExtractFilePath(ParamStr(0));

  try
    SqliteConnection.Params.Values['DataBase'] := path + 'database.db';

    SqliteConnection.Connected := True;
  except
    on e:exception do
    begin
      ShowMessage('Erro: 26'+#13+'Não Foi Possivel Iniciar a Aplicação.'+ #13 +'Banco de Dados Não Encontrado!'+#13+'Reinstale a Aplicação.');
      Application.Terminate()
    end;
  end;

end;

end.
