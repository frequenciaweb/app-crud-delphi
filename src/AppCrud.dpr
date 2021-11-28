program AppCrud;

uses
  Vcl.Forms,
  UFPrincipal in 'Formularios\UFPrincipal.pas' {FPrincipal},
  UFUsuarios in 'Formularios\UFUsuarios.pas' {FUsuarios};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.Run;
end.
