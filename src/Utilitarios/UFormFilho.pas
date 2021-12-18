unit UFormFilho;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, UDados;

type
  TFormFilho = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Fechar();
    procedure AbrirFormulariosCadastro(classeForm: TComponentClass; titulo: string);
  end;

var
 FormularioFilho : TFormFilho;

implementation



{ TFormFilho }

procedure TFormFilho.AbrirFormulariosCadastro(classeForm: TComponentClass;
  titulo: string);
var form : Tform;
begin
  Application.CreateForm(classeForm, form);
  form.Caption := titulo;
  form.Position := poScreenCenter;
  form.BorderIcons:= [];
  form.ShowModal;
end;

procedure TFormFilho.Fechar;
begin
  close;
  FreeAndNil(FormularioFilho);
end;

end.
