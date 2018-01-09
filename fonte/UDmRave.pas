unit UDmRave;

interface

uses
  SysUtils, Classes, RpDefine, RpRave, RpRenderCanvas, RpRenderPrinter,
  RpRender, RpRenderText, RpBase, RpSystem, RpCon, RpConDS, DB, IBCustomDataSet,
  IBQuery, DBClient, Provider, RpRenderPDF;

type
  TDmRave = class(TDataModule)
    RvImpressaoPedido: TRvProject;
    RVSysImpressaoPedido: TRvSystem;
    RvRenderPrinterImpressaoPedido: TRvRenderPrinter;
    RvConsE120Ped: TRvDataSetConnection;
    ConsE120Ped: TIBQuery;
    ConsE120PedCODEMP: TIntegerField;
    ConsE120PedCODFIL: TIntegerField;
    ConsE120PedNUMPED: TIntegerField;
    ConsE120PedNUMCON: TIntegerField;
    ConsE120PedCODCLI: TIntegerField;
    ConsE120PedTNSPRO: TIBStringField;
    ConsE120PedDATEMI: TDateField;
    ConsE120PedCODREP: TIntegerField;
    ConsE120PedCODCPG: TIBStringField;
    ConsE120PedQTDORI: TFloatField;
    ConsE120PedQTDABE: TFloatField;
    ConsE120PedVLRBIP: TFloatField;
    ConsE120PedVLRIPI: TFloatField;
    ConsE120PedVLRBIC: TFloatField;
    ConsE120PedVLRICM: TFloatField;
    ConsE120PedVLRBCO: TFloatField;
    ConsE120PedVLRCOM: TFloatField;
    ConsE120PedVLRLIQ: TFloatField;
    ConsE120PedVLRORI: TFloatField;
    ConsE120PedSITPED: TIBStringField;
    ConsE120PedUSUGER: TIntegerField;
    ConsE120PedDATGER: TDateField;
    ConsE120PedPEDENV: TIBStringField;
    ConsE120PedDATENV: TDateField;
    ConsE120PedPEDCON: TIBStringField;
    ConsE120PedDATCON: TDateField;
    ConsE120PedUSUCON: TIntegerField;
    ConsE120PedPRECAR: TIntegerField;
    ConsE120PedNOMCLI: TIBStringField;
    ConsE120PedAPECLI: TIBStringField;
    ConsE120PedINSEST: TIBStringField;
    ConsE120PedENDCLI: TIBStringField;
    ConsE120PedNENCLI: TIBStringField;
    ConsE120PedCPLEND: TIBStringField;
    ConsE120PedCEPCLI: TIBStringField;
    ConsE120PedBAICLI: TIBStringField;
    ConsE120PedCIDCLI: TIBStringField;
    ConsE120PedSIGUFS: TIBStringField;
    ConsE120PedCGCCPF: TIBStringField;
    ConsE120PedFONCLI: TIBStringField;
    ConsE120PedDESCPG: TIBStringField;
    ConsE120PedVLTTOT: TFloatField;
    ConsE120PedVOLTOT: TFloatField;
    ConsE120Ipd: TIBQuery;
    ConsE120IpdCODEMP: TIntegerField;
    ConsE120IpdCODFIL: TIntegerField;
    ConsE120IpdNUMPED: TIntegerField;
    ConsE120IpdNUMCON: TIntegerField;
    ConsE120IpdCODREP: TIntegerField;
    ConsE120IpdSEQIPD: TIntegerField;
    ConsE120IpdTNSPRO: TIBStringField;
    ConsE120IpdCODPRO: TIBStringField;
    ConsE120IpdCODDER: TIBStringField;
    ConsE120IpdCODFAM: TIBStringField;
    ConsE120IpdCODDEP: TIBStringField;
    ConsE120IpdQTDPED: TIntegerField;
    ConsE120IpdQTDFAT: TIntegerField;
    ConsE120IpdQTDCAN: TIntegerField;
    ConsE120IpdQTDABE: TIntegerField;
    ConsE120IpdUNIMED: TIBStringField;
    ConsE120IpdCODTPR: TIBStringField;
    ConsE120IpdPREUNI: TFloatField;
    ConsE120IpdPERIPI: TFloatField;
    ConsE120IpdPERICM: TFloatField;
    ConsE120IpdPERCOM: TFloatField;
    ConsE120IpdVLRBRU: TFloatField;
    ConsE120IpdVLRBIP: TFloatField;
    ConsE120IpdVLRIPI: TFloatField;
    ConsE120IpdVLRBIC: TFloatField;
    ConsE120IpdVLRICM: TFloatField;
    ConsE120IpdVLRBSI: TFloatField;
    ConsE120IpdVLRICS: TFloatField;
    ConsE120IpdVLRBCO: TFloatField;
    ConsE120IpdVLRCOM: TFloatField;
    ConsE120IpdVLRLPR: TFloatField;
    ConsE120IpdVLRLIQ: TFloatField;
    ConsE120IpdSITIPD: TIBStringField;
    ConsE120IpdUSUGER: TIntegerField;
    ConsE120IpdDATGER: TDateField;
    ConsE120IpdTOTDESC: TFloatField;
    ConsE120IpdVLRORI: TFloatField;
    ConsE120IpdDATEMI: TDateField;
    ConsE120IpdDATENT: TDateField;
    ConsE120IpdCORGRID: TIBStringField;
    ConsE120IpdDESPRO: TIBStringField;
    ConsE120IpdDESDER: TIBStringField;
    ProviderConsE120Ipd: TDataSetProvider;
    ClientConsE120Ipd: TClientDataSet;
    ClientConsE120IpdCODEMP: TIntegerField;
    ClientConsE120IpdCODFIL: TIntegerField;
    ClientConsE120IpdNUMPED: TIntegerField;
    ClientConsE120IpdNUMCON: TIntegerField;
    ClientConsE120IpdCODREP: TIntegerField;
    ClientConsE120IpdSEQIPD: TIntegerField;
    ClientConsE120IpdTNSPRO: TWideStringField;
    ClientConsE120IpdCODPRO: TWideStringField;
    ClientConsE120IpdCODDER: TWideStringField;
    ClientConsE120IpdCODFAM: TWideStringField;
    ClientConsE120IpdCODDEP: TWideStringField;
    ClientConsE120IpdQTDPED: TIntegerField;
    ClientConsE120IpdQTDFAT: TIntegerField;
    ClientConsE120IpdQTDCAN: TIntegerField;
    ClientConsE120IpdQTDABE: TIntegerField;
    ClientConsE120IpdUNIMED: TWideStringField;
    ClientConsE120IpdCODTPR: TWideStringField;
    ClientConsE120IpdPREUNI: TFloatField;
    ClientConsE120IpdPERIPI: TFloatField;
    ClientConsE120IpdPERICM: TFloatField;
    ClientConsE120IpdPERCOM: TFloatField;
    ClientConsE120IpdVLRBRU: TFloatField;
    ClientConsE120IpdVLRBIP: TFloatField;
    ClientConsE120IpdVLRIPI: TFloatField;
    ClientConsE120IpdVLRBIC: TFloatField;
    ClientConsE120IpdVLRICM: TFloatField;
    ClientConsE120IpdVLRBSI: TFloatField;
    ClientConsE120IpdVLRICS: TFloatField;
    ClientConsE120IpdVLRBCO: TFloatField;
    ClientConsE120IpdVLRCOM: TFloatField;
    ClientConsE120IpdVLRLPR: TFloatField;
    ClientConsE120IpdVLRLIQ: TFloatField;
    ClientConsE120IpdSITIPD: TWideStringField;
    ClientConsE120IpdUSUGER: TIntegerField;
    ClientConsE120IpdDATGER: TDateField;
    ClientConsE120IpdTOTDESC: TFloatField;
    ClientConsE120IpdVLRORI: TFloatField;
    ClientConsE120IpdDATEMI: TDateField;
    ClientConsE120IpdDATENT: TDateField;
    ClientConsE120IpdCORGRID: TWideStringField;
    ClientConsE120IpdDESPRO: TWideStringField;
    ClientConsE120IpdDESDER: TWideStringField;
    ConsE120IpdCORES: TIBStringField;
    ClientConsE120IpdCORES: TWideStringField;
    RvClientConsE120Ipd: TRvDataSetConnection;
    ConsUsu120Ipd: TIBQuery;
    ConsUsu120IpdQTDCOR: TIntegerField;
    ConsUsu120IpdTIPCMB: TIntegerField;
    ConsUsu120IpdCOR001: TIBStringField;
    ConsUsu120IpdCOR002: TIBStringField;
    RvRenderPDF1: TRvRenderPDF;
    RvRelacaoCobranca: TRvProject;
    RvSysRelacaoCobranca: TRvSystem;
    RvE085CliRelCob: TRvDataSetConnection;
    RvE301TcrRelCob: TRvDataSetConnection;
    RvTabelaPreco: TRvProject;
    RvSysTabelaPreco: TRvSystem;
    RvConsE081ItpImpressao: TRvDataSetConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmRave: TDmRave;

implementation

uses UDm1;

{$R *.dfm}

end.
