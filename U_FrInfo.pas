unit U_FrInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,ShellApi;

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
    Image1: TImage;
    Panel7: TPanel;
    Label6: TLabel;
    LinkLabel1: TLinkLabel;
    procedure FormCreate(Sender: TObject);
    procedure LinkLabel1MouseEnter(Sender: TObject);
    procedure LinkLabel1MouseLeave(Sender: TObject);
    procedure LinkLabel1LinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
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

  LinkLabel1.Caption := '<a href="https://icons8.com.br/icon/set/popular-icons/color">Icons8 - Popular Icons | Colors</a>'
end;


procedure TFrInfo.LinkLabel1LinkClick(Sender: TObject; const Link: string;
  LinkType: TSysLinkType);
begin
  ShellExecute(0, nil, PChar(Link), nil, nil, 1);
end;

procedure TFrInfo.LinkLabel1MouseEnter(Sender: TObject);
begin
  TLabel(Sender).Font.Color := clBlue;
  TLabel(Sender).Font.Style := [fsUnderline];
  Screen.Cursor := crHandPoint;
end;

procedure TFrInfo.LinkLabel1MouseLeave(Sender: TObject);
begin
  TLabel(Sender).Font.Color := clBlack;
  TLabel(Sender).Font.Style := [];
  Screen.Cursor := crDefault;
end;

end.
