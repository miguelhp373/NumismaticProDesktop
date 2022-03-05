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
    procedure ConnectionExecute(pathFile : String);
  end;

var
  DataModule1 : TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses U_SelectDatabase, U_Menu;

procedure TDataModule1.ConnectionExecute(pathFile : String);
begin
    SqliteConnection.Params.Values['DataBase'] := pathFile + 'database.db';
    SqliteConnection.Connected := True;
end;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
var
  error : boolean;
  path  : String;
begin
  path := ExtractFilePath(ParamStr(0));

  try
    ConnectionExecute(path);
  except
    on e:exception do
    begin
      Connected_Validation := False;

      Application.CreateForm(TFrSelectDatabase,FrSelectDatabase);
      FrSelectDatabase.ShowModal;

      if Connected_Validation = True then
      begin
        ConnectionExecute(path);
        FrSelectDatabase.Free;
        Application.CreateForm(TFrMenu,FrMenu);
        FrMenu.ShowModal;
      end;

    end;
  end;

end;

end.
