unit U_FrInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrInfo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label4: TLabel;
    Panel6: TPanel;
    versionInfo: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrInfo: TFrInfo;

implementation

uses U_Menu;

{$R *.dfm}

procedure TFrInfo.FormCreate(Sender: TObject);
begin
  versionInfo.Caption := 'Versão - ' + GlbInfoVersion + ' Português Brazil';
end;

end.
