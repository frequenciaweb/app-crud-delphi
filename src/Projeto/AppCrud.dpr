program AppCrud;

uses
  Vcl.Forms,
  UFPrincipal in '..\Formularios\UFPrincipal.pas' {FPrincipal},
  UFUsuarios in '..\Formularios\UFUsuarios.pas' {FUsuarios},
  UDados in '..\Dados\UDados.pas' {DM: TDataModule},
  UFPerfis in '..\Formularios\UFPerfis.pas' {FPerfis},
  UFormFilho in '..\Utilitarios\UFormFilho.pas',
  UFMensagem in '..\Formularios\UFMensagem.pas' {Mensagem},
  ULog in '..\Utilitarios\ULog.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
