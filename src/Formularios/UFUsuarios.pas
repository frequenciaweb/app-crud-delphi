unit UFUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, UDados, UFormFilho;

type
  TFUsuarios = class(TFormFilho)
    pnl_filtros: TPanel;
    pnl_botoes_acao: TPanel;
    DBGrid1: TDBGrid;
    sb_inserir: TSpeedButton;
    sb_editar: TSpeedButton;
    sb_excluir: TSpeedButton;
    sb_sair: TSpeedButton;
    FDUsuarios: TFDQuery;
    DSUsuarios: TDataSource;
    FDUsuariosid: TFDAutoIncField;
    FDUsuariosnome: TStringField;
    FDUsuariosemail: TStringField;
    FDUsuariossenha: TStringField;
    FDUsuariosativo: TIntegerField;
    sb_pesquisar: TSpeedButton;
    edt_pesquisa: TLabeledEdit;
    cb_pesquisar_por: TComboBox;
    Label1: TLabel;
    cb_situacao: TComboBox;
    Label2: TLabel;
    procedure sb_sairClick(Sender: TObject);
    procedure cb_pesquisar_porChange(Sender: TObject);
    procedure sb_pesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUsuarios: TFUsuarios;

implementation

{$R *.dfm}




procedure TFUsuarios.cb_pesquisar_porChange(Sender: TObject);
begin
  if (cb_pesquisar_por.ItemIndex = 0) then
      edt_pesquisa.EditLabel.Caption := 'Digite o Nome';

  if (cb_pesquisar_por.ItemIndex = 1) then
      edt_pesquisa.EditLabel.Caption := 'Digite o E-mail';
end;

procedure TFUsuarios.sb_pesquisarClick(Sender: TObject);
var
  sql : string;

begin
  FDUsuarios.Active:= false;
  FDUsuarios.SQL.Clear;
  FDUsuarios.SQL.Add('select * from usuarios where 1=1');

  if cb_situacao.ItemIndex = 1 then
     FDUsuarios.SQL.Add('and ativo = 1');//Ativos

  if cb_situacao.ItemIndex = 2 then
     FDUsuarios.SQL.Add('and ativo = 0');//Inativos

  if cb_pesquisar_por.ItemIndex = 0 (*Pesquisa por nome*) then
     FDUsuarios.SQL.Add('and nome like '+ QuotedStr('%'+edt_pesquisa.Text+'%'));

  if cb_pesquisar_por.ItemIndex = 1 (*Pesquisa por e-mail*) then
     FDUsuarios.SQL.Add('and email like '+ QuotedStr('%'+edt_pesquisa.Text+'%'));

   sql := FDUsuarios.SQL.Text;

  FDUsuarios.Active:= true;

end;

procedure TFUsuarios.sb_sairClick(Sender: TObject);
begin
  Fechar;
end;

end.
