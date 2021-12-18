unit UEmail;

interface

type TEmail = class
  public
    class function Enviar(destinatario, mensagem, assunto: string):Boolean;
end;

implementation

{ TEmail }

class function TEmail.Enviar(destinatario, mensagem, assunto: string): Boolean;
begin

end;

end.
