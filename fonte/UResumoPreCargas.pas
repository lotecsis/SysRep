unit UResumoPreCargas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, IBCustomDataSet, IBQuery, StdCtrls, Mask,
  rxToolEdit, rxCurrEdit, ADODB, DBClient, Provider, DBCtrls;

type
  TFResumoPreCargas = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DsConsCargas: TDataSource;
    dsClientPedidosLiberadosEmCarga: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Cargas: TADOQuery;
    CargasUSU_PRECAR: TIntegerField;
    PedidosLiberadosEmCarga: TADOQuery;
    PedidosLiberadosEmCargaCODEMP: TIntegerField;
    PedidosLiberadosEmCargaCODFIL: TIntegerField;
    PedidosLiberadosEmCargaNUMPED: TIntegerField;
    PedidosLiberadosEmCargaTNSPRO: TStringField;
    PedidosLiberadosEmCargaDATEMI: TDateTimeField;
    PedidosLiberadosEmCargaCODCLI: TIntegerField;
    PedidosLiberadosEmCargaCODREP: TIntegerField;
    PedidosLiberadosEmCargaDATGER: TDateTimeField;
    PedidosLiberadosEmCargaSITPED: TIntegerField;
    PedidosLiberadosEmCargaUSU_PRECAR: TIntegerField;
    PedidosLiberadosEmCargaUSU_NUMCOM: TIntegerField;
    PedidosLiberadosEmCargaNOMCLI: TStringField;
    PedidosLiberadosEmCargaCIDCLI: TStringField;
    PedidosLiberadosEmCargaSIGUFS: TStringField;
    PedidosLiberadosEmCargaDESTNS: TStringField;
    PedidosLiberadosEmCargaVLRBRU: TFMTBCDField;
    PedidosLiberadosEmCargaVOLUME: TFMTBCDField;
    pvdPedidosLiberadosEmCarga: TDataSetProvider;
    ClientPedidosLiberadosEmCarga: TClientDataSet;
    ClientPedidosLiberadosEmCargaCODEMP: TIntegerField;
    ClientPedidosLiberadosEmCargaCODFIL: TIntegerField;
    ClientPedidosLiberadosEmCargaNUMPED: TIntegerField;
    ClientPedidosLiberadosEmCargaTNSPRO: TStringField;
    ClientPedidosLiberadosEmCargaDATEMI: TDateTimeField;
    ClientPedidosLiberadosEmCargaCODCLI: TIntegerField;
    ClientPedidosLiberadosEmCargaCODREP: TIntegerField;
    ClientPedidosLiberadosEmCargaDATGER: TDateTimeField;
    ClientPedidosLiberadosEmCargaSITPED: TIntegerField;
    ClientPedidosLiberadosEmCargaUSU_PRECAR: TIntegerField;
    ClientPedidosLiberadosEmCargaUSU_NUMCOM: TIntegerField;
    ClientPedidosLiberadosEmCargaNOMCLI: TStringField;
    ClientPedidosLiberadosEmCargaCIDCLI: TStringField;
    ClientPedidosLiberadosEmCargaSIGUFS: TStringField;
    ClientPedidosLiberadosEmCargaDESTNS: TStringField;
    ClientPedidosLiberadosEmCargaVLRBRU: TFMTBCDField;
    ClientPedidosLiberadosEmCargaVOLUME: TFMTBCDField;
    ClientPedidosLiberadosEmCargaTVlrBru: TAggregateField;
    ClientPedidosLiberadosEmCargaTVolume: TAggregateField;
    dbedtTVlrBru2: TDBEdit;
    dbedtTVolume2: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure CargasAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    vnVolPed,vnVlrBru : double;
  public
    { Public declarations }
  end;

var
  FResumoPreCargas: TFResumoPreCargas;

implementation

uses UDm1, UDmOra, UPrincipal;

{$R *.dfm}

procedure TFResumoPreCargas.CargasAfterScroll(DataSet: TDataSet);
begin
    ClientPedidosLiberadosEmCarga.Close;
    PedidosLiberadosEmCarga.Close;
    PedidosLiberadosEmCarga.Parameters.ParamByName('CODREP').Value := FPrincipal.vnCodRep;
    PedidosLiberadosEmCarga.Parameters.ParamByName('PRECAR').Value := CargasUSU_PRECAR.AsInteger;
    PedidosLiberadosEmCarga.Open;
    ClientPedidosLiberadosEmCarga.Open;
end;

procedure TFResumoPreCargas.FormShow(Sender: TObject);
begin
Cargas.Close;
Cargas.Parameters.ParamByName('CODREP').Value := FPrincipal.vnCodRep;
Cargas.Open;
if Cargas.IsEmpty then
   begin
     PedidosLiberadosEmCarga.Close;
     ClientPedidosLiberadosEmCarga.Close;
   end;

end;

end.
