unit UFPerfis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormFilho, Vcl.StdCtrls;

type
  TFPerfis = class(TFormFilho)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPerfis: TFPerfis;

implementation

{$R *.dfm}

procedure TFPerfis.Button1Click(Sender: TObject);
begin
  Fechar;
end;

end.
