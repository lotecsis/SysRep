unit UVisuTabPreco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, Buttons;

type
  TFVisuTabPreco = class(TForm)
    EdCodPro: TEdit;
    EdDesPro: TEdit;
    DBGrid1: TDBGrid;
    DsConsE081Itp: TDataSource;
    BImprimir: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    procedure EdDesProChange(Sender: TObject);
    procedure EdCodProChange(Sender: TObject);
    procedure BImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVisuTabPreco: TFVisuTabPreco;

implementation

uses UDm1, UDmRave;

{$R *.dfm}

procedure TFVisuTabPreco.BImprimirClick(Sender: TObject);
begin
    Dm1.ConsE081ItpImpressao.Close;
    Dm1.ConsE081ItpImpressao.Open;
    DmRave.RvTabelaPreco.Execute;
end;

procedure TFVisuTabPreco.EdCodProChange(Sender: TObject);
begin
    Dm1.ConsE081Itp.Close;
    Dm1.ConsE081Itp.SQL.Clear;
    Dm1.ConsE081Itp.SQL.Add('select DISTINCT(e081itp.PREBAS), e081itp.codpro, e081itp.despro');
    Dm1.ConsE081Itp.SQL.Add(' from e081itp');
    Dm1.ConsE081Itp.SQL.Add(' where');
    Dm1.ConsE081Itp.SQL.Add('E081ITP.SITREG = ''A'' AND');
    Dm1.ConsE081Itp.SQL.Add('e081itp.codpro LIKE'+QuotedStr('%'+trim(EdCodPro.Text)+'%'));
    Dm1.ConsE081Itp.SQL.Add('order by e081itp.codpro,e081itp.despro');
    Dm1.ConsE081Itp.Open;

end;

procedure TFVisuTabPreco.EdDesProChange(Sender: TObject);
begin
    Dm1.ConsE081Itp.Close;
    Dm1.ConsE081Itp.SQL.Clear;
    Dm1.ConsE081Itp.SQL.Add('select DISTINCT(e081itp.PREBAS), e081itp.codpro, e081itp.despro');
    Dm1.ConsE081Itp.SQL.Add(' from e081itp');
    Dm1.ConsE081Itp.SQL.Add(' where');
    Dm1.ConsE081Itp.SQL.Add('E081ITP.SITREG = ''A'' AND');
    Dm1.ConsE081Itp.SQL.Add('e081itp.despro LIKE'+QuotedStr('%'+EdDesPro.Text+'%'));
    Dm1.ConsE081Itp.SQL.Add('order by e081itp.codpro,e081itp.despro');
    Dm1.ConsE081Itp.Open;

end;

procedure TFVisuTabPreco.FormShow(Sender: TObject);
begin
  EdDesProChange(Sender);
end;

end.
