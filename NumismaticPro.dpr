program NumismaticPro;

uses
  Vcl.Forms,
  U_Menu in 'U_Menu.pas' {FrMenu},
  U_DataModule in 'U_DataModule.pas' {DataModule1: TDataModule},
  U_FrInfo in 'U_FrInfo.pas' {FrInfo},
  U_Config in 'U_Config.pas' {FrConfig};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFrMenu, FrMenu);
  Application.Run;
end.
