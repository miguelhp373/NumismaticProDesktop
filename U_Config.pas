unit U_Config;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TFrConfig = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    Page01: TTabSheet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrConfig: TFrConfig;

implementation

{$R *.dfm}

end.
