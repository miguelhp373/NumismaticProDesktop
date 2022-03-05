unit U_Config;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Data.DB, Datasnap.DBClient, Datasnap.Provider;

type
  TFrConfig = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    Page01: TTabSheet;
    SaveBackupButton: TSpeedButton;
    pathBackup: TEdit;
    SaveDialog1: TSaveDialog;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure SaveBackupButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SearchFilePathInDatabase(tip: String);
  end;

var
  FrConfig: TFrConfig;
  PathDatabaseDefault : String;

implementation

{$R *.dfm}

uses U_DataModule;

procedure TFrConfig.FormCreate(Sender: TObject);
begin
  PathDatabaseDefault := ExtractFilePath(ParamStr(0));
  SearchFilePathInDatabase('Search');
end;

procedure TFrConfig.SaveBackupButtonClick(Sender: TObject);
var
  loadFilePath  : String;
  saveFilePath  : String;
begin
  loadFilePath := PathDatabaseDefault + 'database.db';

  if SaveDialog1.Execute() then
  begin
      saveFilePath := SaveDialog1.FileName;
      copyfile(pchar(loadFilePath),pchar(saveFilePath),false);

      pathBackup.Text :=  saveFilePath;
  end;

  showmessage(SaveDialog1.FileName);

    SearchFilePathInDatabase('File');
end;

procedure TFrConfig.SearchFilePathInDatabase(tip: String);
begin

  DataModule1.SqlActions.Close;

  if tip = 'Search' then
  begin

    With DataModule1.SqlActions do
      begin
        SQL.Clear;
        SQL.Add('SELECT DatabaseBackupPath FROM ConfigTable');
        Open();  

        if FieldByName('DatabaseBackupPath').AsString <> '' then  pathBackup.Text :=  FieldByName('DatabaseBackupPath').AsString;
        abort;
    end;
    
  end;

  if tip = 'File' then
  begin
      With DataModule1.SqlActions do
    begin
      SQL.Clear;
      SQL.Add('SELECT DatabaseBackupPath FROM ConfigTable');
      Open();

      if FieldByName('DatabaseBackupPath').AsString = '' then
      begin

          With DataModule1.SqlActions do
            begin
              SQL.Clear;
              SQL.Add('INSERT INTO  ConfigTable');
              SQL.Add('(DatabaseBackupPath, BackupDate)VALUES(:path, :dateBackup)');
              ParamByName('path'      ).AsString  := pathBackup.Text;
              ParamByName('dateBackup').AsString  := DatetimeToStr(now());

              ExecSQL();

              ShowMessage('Backup Salvo Com Sucesso!');
              abort;
          end;
          
      end
      else
      begin
            With DataModule1.SqlActions do
            begin
              SQL.Clear;
              SQL.Add('UPDATE ConfigTable SET');
              SQL.Add('DatabaseBackupPath =  :path, BackupDate = :dateBackup');
              ParamByName('path'      ).AsString  := pathBackup.Text;
              ParamByName('dateBackup').AsString  := DatetimeToStr(now());

              ExecSQL();

              ShowMessage('Backup Salvo Com Sucesso!');
              abort;              
          end;
      end;

  end;
  end;
  

end;

end.
