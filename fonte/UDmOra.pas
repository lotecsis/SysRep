unit UDmOra;

interface

uses
  SysUtils, Classes, DB, ADODB, MIDASLIB, Provider, DBClient, DateUtils;

type
  TDmOra = class(TDataModule)
    Banco: TADOConnection;
    ConsUSU_TDERCOR: TADOQuery;
    ConsUSU_TDERCORUSU_CODEMP: TIntegerField;
    ConsUSU_TDERCORUSU_CODPRO: TStringField;
    ConsUSU_TDERCORUSU_CODDER: TStringField;
    ConsUSU_TDERCORUSU_CODTEC: TStringField;
    ConsUSU_TDERCORUSU_SITTEC: TStringField;
    ConsUSU_TDERCORUSU_DESTEC: TStringField;
    ConsE075Pro: TADOQuery;
    ConsE075ProCODEMP: TIntegerField;
    ConsE075ProCODPRO: TStringField;
    ConsE075ProDESPRO: TStringField;
    ConsE075ProCODFAM: TStringField;
    ConsE075ProSITPRO: TStringField;
    ConsE075Der: TADOQuery;
    ConsE075DerCODEMP: TIntegerField;
    ConsE075DerCODPRO: TStringField;
    ConsE075DerCODDER: TStringField;
    ConsE075DerDESDER: TStringField;
    ConsE075DerPESBRU: TFMTBCDField;
    ConsE075DerPESLIQ: TFMTBCDField;
    ConsE075DerVOLDER: TFMTBCDField;
    ConsE075DerSITDER: TStringField;
    ConsE075DerUSU_CORUNI: TBCDField;
    ConsE075DerUSU_CMP1BB: TBCDField;
    ConsE075DerUSU_CMP1AE: TBCDField;
    ConsE075DerUSU_CMP2BB: TBCDField;
    ConsE075DerUSU_CMP2EN: TBCDField;
    PedidosSuspensos: TADOQuery;
    PedidosSuspensosCODEMP: TIntegerField;
    PedidosSuspensosCODFIL: TIntegerField;
    PedidosSuspensosNUMPED: TIntegerField;
    PedidosSuspensosTNSPRO: TStringField;
    PedidosSuspensosDATEMI: TDateTimeField;
    PedidosSuspensosCODCLI: TIntegerField;
    PedidosSuspensosCODREP: TIntegerField;
    PedidosSuspensosDATGER: TDateTimeField;
    PedidosSuspensosSITPED: TIntegerField;
    PedidosSuspensosUSU_PRECAR: TIntegerField;
    PedidosSuspensosUSU_NUMCOM: TIntegerField;
    PedidosSuspensosNOMCLI: TStringField;
    PedidosSuspensosCIDCLI: TStringField;
    PedidosSuspensosSIGUFS: TStringField;
    PedidosSuspensosDESTNS: TStringField;
    PedidosSuspensosVLRBRU: TFMTBCDField;
    PedidosSuspensosVOLUME: TFMTBCDField;
    pvdPedidosSuspensos: TDataSetProvider;
    ClientPedidosSuspensos: TClientDataSet;
    ClientPedidosSuspensosCODEMP: TIntegerField;
    ClientPedidosSuspensosCODFIL: TIntegerField;
    ClientPedidosSuspensosNUMPED: TIntegerField;
    ClientPedidosSuspensosTNSPRO: TStringField;
    ClientPedidosSuspensosDATEMI: TDateTimeField;
    ClientPedidosSuspensosCODCLI: TIntegerField;
    ClientPedidosSuspensosCODREP: TIntegerField;
    ClientPedidosSuspensosDATGER: TDateTimeField;
    ClientPedidosSuspensosSITPED: TIntegerField;
    ClientPedidosSuspensosUSU_PRECAR: TIntegerField;
    ClientPedidosSuspensosUSU_NUMCOM: TIntegerField;
    ClientPedidosSuspensosNOMCLI: TStringField;
    ClientPedidosSuspensosCIDCLI: TStringField;
    ClientPedidosSuspensosSIGUFS: TStringField;
    ClientPedidosSuspensosDESTNS: TStringField;
    ClientPedidosSuspensosVLRBRU: TFMTBCDField;
    ClientPedidosSuspensosVOLUME: TFMTBCDField;
    ClientPedidosSuspensosTVlrBru: TAggregateField;
    ClientPedidosSuspensosTVolume: TAggregateField;
    PedidosLiberadosSemCarga: TADOQuery;
    PedidosLiberadosSemCargaCODEMP: TIntegerField;
    PedidosLiberadosSemCargaCODFIL: TIntegerField;
    PedidosLiberadosSemCargaNUMPED: TIntegerField;
    PedidosLiberadosSemCargaTNSPRO: TStringField;
    PedidosLiberadosSemCargaDATEMI: TDateTimeField;
    PedidosLiberadosSemCargaCODCLI: TIntegerField;
    PedidosLiberadosSemCargaCODREP: TIntegerField;
    PedidosLiberadosSemCargaDATGER: TDateTimeField;
    PedidosLiberadosSemCargaSITPED: TIntegerField;
    PedidosLiberadosSemCargaUSU_PRECAR: TIntegerField;
    PedidosLiberadosSemCargaUSU_NUMCOM: TIntegerField;
    PedidosLiberadosSemCargaNOMCLI: TStringField;
    PedidosLiberadosSemCargaCIDCLI: TStringField;
    PedidosLiberadosSemCargaSIGUFS: TStringField;
    PedidosLiberadosSemCargaDESTNS: TStringField;
    PedidosLiberadosSemCargaVLRBRU: TFMTBCDField;
    PedidosLiberadosSemCargaVOLUME: TFMTBCDField;
    pvdPedidosLiberadosSemCarga: TDataSetProvider;
    ClientPedidosLiberadosSemCarga: TClientDataSet;
    ClientPedidosLiberadosSemCargaCODEMP: TIntegerField;
    ClientPedidosLiberadosSemCargaCODFIL: TIntegerField;
    ClientPedidosLiberadosSemCargaNUMPED: TIntegerField;
    ClientPedidosLiberadosSemCargaTNSPRO: TStringField;
    ClientPedidosLiberadosSemCargaDATEMI: TDateTimeField;
    ClientPedidosLiberadosSemCargaCODCLI: TIntegerField;
    ClientPedidosLiberadosSemCargaCODREP: TIntegerField;
    ClientPedidosLiberadosSemCargaDATGER: TDateTimeField;
    ClientPedidosLiberadosSemCargaSITPED: TIntegerField;
    ClientPedidosLiberadosSemCargaUSU_PRECAR: TIntegerField;
    ClientPedidosLiberadosSemCargaUSU_NUMCOM: TIntegerField;
    ClientPedidosLiberadosSemCargaNOMCLI: TStringField;
    ClientPedidosLiberadosSemCargaCIDCLI: TStringField;
    ClientPedidosLiberadosSemCargaSIGUFS: TStringField;
    ClientPedidosLiberadosSemCargaDESTNS: TStringField;
    ClientPedidosLiberadosSemCargaVLRBRU: TFMTBCDField;
    ClientPedidosLiberadosSemCargaVOLUME: TFMTBCDField;
    ClientPedidosLiberadosSemCargaTVlrBru: TAggregateField;
    ClientPedidosLiberadosSemCargaTVolume: TAggregateField;
    ClientPedidosLiberadosSemCargavaSitPed: TStringField;
    ConsSql: TADOQuery;
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
    ItensPedido: TADOQuery;
    ItensPedidoCODEMP: TIntegerField;
    ItensPedidoCODFIL: TIntegerField;
    ItensPedidoNUMPED: TIntegerField;
    ItensPedidoSEQIPD: TIntegerField;
    ItensPedidoTNSPRO: TStringField;
    ItensPedidoCODPRO: TStringField;
    ItensPedidoCODDER: TStringField;
    ItensPedidoCPLIPD: TStringField;
    ItensPedidoQTDPED: TFMTBCDField;
    ItensPedidoQTDCAN: TFMTBCDField;
    ItensPedidoQTDFAT: TFMTBCDField;
    ItensPedidoQTDABE: TFMTBCDField;
    ItensPedidoPREUNI: TFMTBCDField;
    ItensPedidoDESDER: TStringField;
    ItensPedidovnVlrAbe: TFloatField;
    ItensPedidovnVlrPed: TFloatField;
    CoresPedido: TADOQuery;
    CoresPedidoUSU_QTDCOR: TIntegerField;
    CoresPedidoUSU_TIPCMB: TIntegerField;
    CoresPedidoUSU_COR001: TStringField;
    CoresPedidoUSU_COR002: TStringField;
    CoresPedidoUSU_QTDABE: TIntegerField;
    E301Tcr: TADOQuery;
    E301TcrCODEMP: TIntegerField;
    E301TcrCODFIL: TIntegerField;
    E301TcrNUMTIT: TStringField;
    E301TcrCODTPT: TStringField;
    E301TcrCODTNS: TStringField;
    E301TcrSITTIT: TStringField;
    E301TcrDATEMI: TDateTimeField;
    E301TcrCODCLI: TIntegerField;
    E301TcrOBSTCR: TStringField;
    E301TcrVCTORI: TDateTimeField;
    E301TcrVLRORI: TBCDField;
    E301TcrVCTPRO: TDateTimeField;
    E301TcrDATPPT: TDateTimeField;
    E301TcrVLRABE: TBCDField;
    E301TcrCODREP: TIntegerField;
    pvdE301Tcr: TDataSetProvider;
    ClientE301Tcr: TClientDataSet;
    ClientE301TcrCODEMP: TIntegerField;
    ClientE301TcrCODFIL: TIntegerField;
    ClientE301TcrNUMTIT: TStringField;
    ClientE301TcrCODTPT: TStringField;
    ClientE301TcrCODTNS: TStringField;
    ClientE301TcrSITTIT: TStringField;
    ClientE301TcrDATEMI: TDateTimeField;
    ClientE301TcrCODCLI: TIntegerField;
    ClientE301TcrOBSTCR: TStringField;
    ClientE301TcrVCTORI: TDateTimeField;
    ClientE301TcrVLRORI: TBCDField;
    ClientE301TcrVCTPRO: TDateTimeField;
    ClientE301TcrDATPPT: TDateTimeField;
    ClientE301TcrVLRABE: TBCDField;
    ClientE301TcrCODREP: TIntegerField;
    E301TcrNOMCLI: TStringField;
    E301TcrCIDCLI: TStringField;
    E301TcrSIGUFS: TStringField;
    ClientE301TcrNOMCLI: TStringField;
    ClientE301TcrCIDCLI: TStringField;
    ClientE301TcrSIGUFS: TStringField;
    ClientE301TcrTVlrAbe: TAggregateField;
    ClientE301TcrvnQtdDias: TFloatField;
    ConsE075ProCODAGC: TStringField;
    procedure ClientPedidosLiberadosSemCargaCalcFields(DataSet: TDataSet);
    procedure ItensPedidoCalcFields(DataSet: TDataSet);
    procedure ItensPedidoAfterScroll(DataSet: TDataSet);
    procedure ClientE301TcrCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmOra: TDmOra;

implementation

{$R *.dfm}

procedure TDmOra.ClientE301TcrCalcFields(DataSet: TDataSet);
begin
ClientE301TcrvnQtdDias.AsFloat := DaysBetween(ClientE301TcrVCTPRO.AsDateTime,Date);
end;

procedure TDmOra.ClientPedidosLiberadosSemCargaCalcFields(DataSet: TDataSet);
begin
  if ClientPedidosLiberadosSemCargaSITPED.AsInteger = 1 then
     ClientPedidosLiberadosSemCargavaSitPed.AsString := 'ABERTO'
  else
  if ClientPedidosLiberadosSemCargaSITPED.AsInteger = 2 then
     ClientPedidosLiberadosSemCargavaSitPed.AsString := 'ABERTO PARCIAL'
end;

procedure TDmOra.ItensPedidoAfterScroll(DataSet: TDataSet);
begin
  CoresPedido.Close;
  CoresPedido.Parameters.ParamByName('NUMPED').Value := ItensPedidoNUMPED.AsInteger;
  CoresPedido.Parameters.ParamByName('SEQIPD').Value := ItensPedidoSEQIPD.AsInteger;
  CoresPedido.Open;
end;

procedure TDmOra.ItensPedidoCalcFields(DataSet: TDataSet);
begin
  ItensPedidovnVlrAbe.AsFloat := ItensPedidoQTDABE.AsFloat * ItensPedidoPREUNI.AsFloat;
  ItensPedidovnVlrPed.AsFloat := ItensPedidoQTDPED.AsFloat * ItensPedidoPREUNI.AsFloat;
end;

end.
