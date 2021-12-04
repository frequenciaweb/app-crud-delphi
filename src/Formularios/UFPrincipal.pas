unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Data.Win.ADODB, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons, UFormFilho;

type
  TFPrincipal = class(TForm)
    StatusBar1: TStatusBar;
    tm_principal: TTimer;
    pnl_menu: TPanel;
    sb_usuarios: TSpeedButton;
    sb_perfil: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure tm_principalTimer(Sender: TObject);
    procedure sb_usuariosClick(Sender: TObject);
    procedure sb_perfilClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AbrirFormulariosFilhos(classeForm: TComponentClass; titulo: string);
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.dfm}

uses UFUsuarios, UFPerfis;

procedure TFPrincipal.AbrirFormulariosFilhos(classeForm: TComponentClass;
  titulo: string);
begin

   if Assigned(FormularioFilho) then
      FormularioFilho.Fechar;


  Application.CreateForm(classeForm, FormularioFilho);
  FormularioFilho.WindowState := wsMaximized;
  FormularioFilho.FormStyle := fsMDIChild;
  FormularioFilho.Caption := titulo;
  FormularioFilho.Show;

end;

procedure TFPrincipal.FormCreate(Sender: TObject);
begin
  Caption := 'Meu Sistema de Crud';
  StatusBar1.Panels[0].Text := 'Usuário: Stephanie';
  StatusBar1.Panels[1].Text := 'versão 1.0';
end;

procedure TFPrincipal.sb_perfilClick(Sender: TObject);
begin
  AbrirFormulariosFilhos(TFPerfis, 'Cadastro de Perfis');
end;

procedure TFPrincipal.sb_usuariosClick(Sender: TObject);
begin
  AbrirFormulariosFilhos(TFUsuarios, 'Cadastro de Usuários');
end;

procedure TFPrincipal.tm_principalTimer(Sender: TObject);
begin
  StatusBar1.Panels[2].Text := DateTimeToStr(now);
end;

end.
