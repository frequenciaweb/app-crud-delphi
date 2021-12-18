unit UFUsuarioCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFUsuarioCadastro = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    edt_nome: TLabeledEdit;
    edt_email: TLabeledEdit;
    edt_senha: TLabeledEdit;
    cb_ativo: TCheckBox;
    fd_usuario: TFDQuery;
    lbl_aviso_senha: TLabel;
    SpeedButton3: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Validar(out msgErro: string): boolean;
  end;

var
  FUsuarioCadastro: TFUsuarioCadastro;

implementation

{$R *.dfm}

uses UDados, UFMensagem, ULog, UEmail;

procedure TFUsuarioCadastro.FormCreate(Sender: TObject);
begin
  lbl_aviso_senha.Caption := 'O sistema enviará uma senha para o e-mail de cadastro!';
end;

procedure TFUsuarioCadastro.SpeedButton1Click(Sender: TObject);
var
  msgErro, senha: string;
begin
  try

    if not Validar(msgErro) then
    begin
      TMensagem.MostrarMensagem(msgErro, tpAlerta);
      exit;
    end;

    fd_usuario.Active := false;
    fd_usuario.SQL.Clear;
    fd_usuario.SQL.Add('select * from usuarios where email ='+QuotedStr(edt_email.Text));
    fd_usuario.Active := true;

    if fd_usuario.RecordCount > 0 then
    begin
      TMensagem.MostrarMensagem('Usuário já cadastrado!', tpAlerta);
      exit;
    end;

    fd_usuario.Insert;
    fd_usuario.FieldByName('nome').Text := edt_nome.Text;
    fd_usuario.FieldByName('email').Text := edt_email.Text;
    fd_usuario.FieldByName('senha').Text := senha;

    fd_usuario.FieldByName('ativo').Text := '0';

    if cb_ativo.Checked then
      fd_usuario.FieldByName('ativo').Text := '1';

    fd_usuario.post;
    DM.Conexao.Close;

    TEmail.Enviar(edt_email.Text,'', 'Dados de Acesso do Sistema CRUD');

    edt_nome.Text := '';
    edt_email.text := '';
    edt_senha.Text := '';

    TMensagem.MostrarMensagem('Registro Salvo com Sucesso', tpSucesso);

  except
    on E: Exception do
    begin
      TLog.EscreverLog(E);
      if E.Message.Contains('Can''t connect to MySQL') then
      begin
        TMensagem.MostrarMensagem
          ('Falha ao conectar no banco de dados', tpErro);
      end;
      TMensagem.MostrarMensagem
        ('Erro interno na aplicação, tente novamente mais tarde e caso o erro persista, por favor acione o suporte',
        tpErro);
    end;
  END;
end;

procedure TFUsuarioCadastro.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

function TFUsuarioCadastro.Validar(out msgErro: string): boolean;
var
  email: string;
begin
  if Length(edt_nome.Text) < 10 then
  begin
    msgErro := 'Digite o nome completo';
    Result := false;
    exit;
  end;

  email := edt_email.Text;

  if (not email.Contains('@')) OR (Length(email) < 10) then
  begin
    msgErro := 'Digite o e-mail valido';
    Result := false;
    exit;
  end;

  if Length(edt_senha.Text) < 6 then
  begin
    msgErro := 'Digite a senha com pelomenos seis digitos';
    Result := false;
    exit;
  end;

  Result := true;

end;

end.
