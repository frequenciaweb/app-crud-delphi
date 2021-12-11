unit UFMensagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

// Enumerador
type
  TTipoMensagem = (tpAlerta, tpErro, tpSucesso, tpInformacao);

type
  TMensagem = class(TForm)
    Panel1: TPanel;
    btn_fechar: TButton;
    Panel2: TPanel;
    img_informacao: TImage;
    lbl_mensagem: TLabel;
    img_sucesso: TImage;
    img_erro: TImage;
    img_alerta: TImage;
    procedure btn_fecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure MostrarMensagem(texto: string; tipo: TTipoMensagem);
  end;

var
  Mensagem: TMensagem;

implementation

{$R *.dfm}

procedure TMensagem.btn_fecharClick(Sender: TObject);
begin
  close;
end;

class procedure TMensagem.MostrarMensagem(texto: string;
  tipo: TTipoMensagem);
begin
  Mensagem := TMensagem.Create(nil);
  Mensagem.Caption := '';
  Mensagem.lbl_mensagem.Caption := texto;

  case tipo of
    tpAlerta:
     begin
       Mensagem.img_alerta.Visible := true;
       Mensagem.Caption := 'Alerta!';
     end;
    tpErro:
     begin
       Mensagem.img_erro.Visible := true;
       Mensagem.Caption := 'Erro!';
     end;
    tpSucesso:
     begin
       Mensagem.img_sucesso.Visible := true;
       Mensagem.Caption := 'Operação Concluída com sucesso';
     end;
    tpInformacao:
     begin
       Mensagem.img_informacao.Visible := true;
       Mensagem.Caption := 'Informação!';
     end;
  end;

  Mensagem.ShowModal;
end;

end.
