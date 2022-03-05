unit U_SelectDatabase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrSelectDatabase = class(TForm)
    Panel1: TPanel;
    PathDisplay: TEdit;
    Label1: TLabel;
    ButtonSelectFile: TSpeedButton;
    ButtonConnectionDataBase: TSpeedButton;
    OpenFile: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure ButtonConnectionDataBaseClick(Sender: TObject);
    procedure ButtonSelectFileClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrSelectDatabase: TFrSelectDatabase;
  Connected_Validation : boolean;
  FileDirectory : String;

implementation

uses U_DataModule;

{$R *.dfm}

procedure TFrSelectDatabase.FormCreate(Sender: TObject);
begin
ShowMessage(
             'Erro: 26'+#13+'Não Foi Possivel Iniciar a Aplicação.'+ #13 +
             'Selecione Um Banco de Dados.'
           );

  self.Height := 162;
  self.Width  := 315;
  Connected_Validation := False;

end;

procedure TFrSelectDatabase.ButtonSelectFileClick(Sender: TObject);
begin

  if  OpenFile.Execute() then
  begin
    FileDirectory := OpenFile.FileName;
    if FileDirectory  <>  ''  then
    begin
      PathDisplay.Text                  := FileDirectory;
      ButtonConnectionDataBase.Enabled  := True;
    end;
  end;
  
end;

procedure TFrSelectDatabase.ButtonConnectionDataBaseClick(Sender: TObject);
var
  path : String;
begin

  if FileDirectory = '' then abort();

  path := ExtractFilePath(ParamStr(0)) + 'database.db';

  if ((Trim(PathDisplay.Text) <> '') and (ExtractFileExt(PathDisplay.Text) = '.db')) then
  begin
    if  copyfile(pchar(FileDirectory),pchar(path),false) then
    begin
      Connected_Validation := True;
      close;
    end
    else showMessage('Não Foi Possivel Conectar o Banco de Dados, Tente Novamente.');

    end
  else showMessage('Não Foi Possivel Conectar o Banco de Dados, Tente Novamente.');


  
end;

end.
