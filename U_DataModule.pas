unit U_DataModule;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls,
  Data.DB, Data.SqlExpr, Data.DbxSqlite, Data.FMTBcd, Datasnap.Provider,
  Datasnap.DBClient;

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
begin
  SqliteConnection.Params.Values['DriverID'] := 'SQLite';
  SqliteConnection.LoginPrompt := False;

  {$IF DEFINED (MSWINDOWS)}
    SqliteConnection.Params.Values['DataBase'] := '${\database\database.db}';
  {$ENDIF}
 SqliteConnection.Connected := True;
end;

end.
