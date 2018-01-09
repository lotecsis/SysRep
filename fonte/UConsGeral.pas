unit UConsGeral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, StdCtrls;

type
  TFConsGeral = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid: TDBGrid;
    DsConsGeral: TDataSource;
    Label2: TLabel;
    EdFiltro: TEdit;
    EdValor: TEdit;
    Label1: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure DBGridTitleClick(Column: TColumn);
    procedure EdValorChange(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    vaCampo, vaTela, vaSql : string;
    vbWhere : Boolean;
    vnColuna : Integer;
  end;

var
  FConsGeral: TFConsGeral;

implementation
uses  UPedido, UDm1, UAddProdPed, UInformacoesClientes;

{$R *.dfm}

procedure TFConsGeral.DBGridDblClick(Sender: TObject);
begin
    if (vaCampo = 'CodCli') and (vaTela = 'FPedido') then
      begin
        FPedido.EdCodCli.Text := IntToStr(DBGrid.DataSource.DataSet.FieldByName('CODCLI').Value);
        FPedido.ActiveControl := FPedido.EdCodCli;
        Close;
      end
    else
    if (vaCampo = 'CodCpg') and (vaTela = 'FPedido') then
      begin
        FPedido.EdCodCpg.Text := DBGrid.DataSource.DataSet.FieldByName('CODCPG').Value;
        FPedido.ActiveControl := FPedido.EdCodCpg;
        Close;
      end
    else
    if (vaCampo = 'CodPro') and (vaTela = 'FAddProdPed') then
      begin
        FAddProdPed.EdCodPro.Text := DBGrid.DataSource.DataSet.FieldByName('CODPRO').Value;
        FAddProdPed.ActiveControl := FAddProdPed.EdCodPro;
        Close;
      end
    else
    if (vaCampo = 'CodCli') and (vaTela = 'FInformacoesClientes') then
      begin
        FInformacoesClientes.EdCodCli.Text := IntToStr(DBGrid.DataSource.DataSet.FieldByName('CODCLI').Value);
        Close;
      end;



end;

procedure TFConsGeral.DBGridKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      DBGridDblClick(Sender);
    end;
end;

procedure TFConsGeral.DBGridTitleClick(Column: TColumn);
var vaSql2 : string;
begin

  EdFiltro.Text := Column.FieldName;

  vaSql2 := vaSql + ' order by '+Column.FieldName;

    Dm1.ConsGeral.Close;
    Dm1.ConsGeral.SQL.Clear;
    Dm1.ConsGeral.SQL.Add(vaSql2);
    Dm1.ConsGeral.Open;

    ActiveControl := EdValor;
    //EdValor.Clear;

end;

procedure TFConsGeral.EdValorChange(Sender: TObject);
var vaSql3 : string;
begin
if trim(EdFiltro.Text) <> '' then
  begin
   if vbWhere = false then//se o vbWhere for falso é pq nao existe nenhum where no sql se for true é pq ja existe
      vaSql3 := vaSql + ' where '+EdFiltro.Text+ ' like ''%'+EdValor.Text+'%'''
   else
      vaSql3 := vaSql + ' and '+EdFiltro.Text+ ' like ''%'+EdValor.Text+'%''';

    Dm1.ConsGeral.Close;
    Dm1.ConsGeral.SQL.Clear;
    Dm1.ConsGeral.SQL.Add(vaSql3);
    Dm1.ConsGeral.Open;
  end;
end;

procedure TFConsGeral.FormActivate(Sender: TObject);
var vcColuna : TColumn;
begin
    Dm1.ConsGeral.Close;
    Dm1.ConsGeral.SQL.Clear;
    Dm1.ConsGeral.SQL.Add(vaSql);
    Dm1.ConsGeral.Open;

    //para simular o clique na coluna
    if vnColuna <> 999999 then
      begin
         vcColuna := DBGrid.Columns[vnColuna];
         DBGridTitleClick(vcColuna);
      end;


end;

end.
