unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Data.Win.ADODB, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFPrincipal = class(TForm)
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.dfm}

uses UFUsuarios;

procedure TFPrincipal.FormCreate(Sender: TObject);
begin
  Caption := 'Meu Sistema de Crud';
  StatusBar1.Panels[0].Text := 'Usuário: Stephanie';
  StatusBar1.Panels[1].Text := 'versão 1.0';
end;

procedure TFPrincipal.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(TFUsuarios, FUsuarios);
  FUsuarios.WindowState := wsMaximized;
  FUsuarios.Caption := 'Cadastro de Usuários';
  FUsuarios.Show;
end;

procedure TFPrincipal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[2].Text := DateTimeToStr(now);
end;

end.
