unit UAcompanhamentoPedidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, DB, Mask, rxToolEdit, rxCurrEdit,
  Gauges, pngimage, Buttons, ComCtrls;

type
  TFAcompanhamentoPedidos = class(TForm)
    DsConsE120PedAgdConf: TDataSource;
    DsConsE120PedSuspenso: TDataSource;
    DsConsE120PedLiberado: TDataSource;
    DsConsE120PedLiberadoEmCarga: TDataSource;
    PaginaControle: TPageControl;
    ts1: TTabSheet;
    pnl1: TPanel;
    pnl2: TPanel;
    lbl1: TLabel;
    pnl3: TPanel;
    lbl2: TLabel;
    lbl3: TLabel;
    EdVlrAgdConf: TCurrencyEdit;
    EdVolAgdConf: TCurrencyEdit;
    dbg1: TDBGrid;
    ts2: TTabSheet;
    pnl7: TPanel;
    pnl8: TPanel;
    lbl7: TLabel;
    pnl9: TPanel;
    lbl8: TLabel;
    lbl9: TLabel;
    EdVlrSuspenso: TCurrencyEdit;
    EdVolSuspenso: TCurrencyEdit;
    btnBVisuMotivoSusp: TBitBtn;
    dbg3: TDBGrid;
    ts3: TTabSheet;
    pnl10: TPanel;
    pnl11: TPanel;
    lbl10: TLabel;
    pnl12: TPanel;
    lbl11: TLabel;
    lbl12: TLabel;
    img1: TImage;
    GBau: TGauge;
    lbl13: TLabel;
    EdVlrLiberado: TCurrencyEdit;
    EdVolLiberado: TCurrencyEdit;
    dbg4: TDBGrid;
    ts4: TTabSheet;
    pnl4: TPanel;
    pnl5: TPanel;
    lbl4: TLabel;
    pnl6: TPanel;
    lbl5: TLabel;
    lbl6: TLabel;
    btnBVisuPreCargas: TSpeedButton;
    EdVlrLiberadoEmCarga: TCurrencyEdit;
    EdVolLiberadoEmCarga: TCurrencyEdit;
    dbg2: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure dbg3DblClick(Sender: TObject);
    procedure dbg4DblClick(Sender: TObject);
    procedure dbg2DblClick(Sender: TObject);
    procedure btnBVisuPreCargasClick(Sender: TObject);
    procedure btnBVisuMotivoSuspClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAcompanhamentoPedidos: TFAcompanhamentoPedidos;

implementation

uses UDm1, UPedido, UResumoPreCargas;

{$R *.dfm}

procedure TFAcompanhamentoPedidos.btnBVisuMotivoSuspClick(Sender: TObject);
var vaMensagem : string;
begin
    Dm1.ConsGeral.Close;
    Dm1.ConsGeral.SQL.Clear;
    Dm1.ConsGeral.SQL.Add('select e120obs.obsped from e120obs');
    Dm1.ConsGeral.SQL.Add(' where');
    Dm1.ConsGeral.SQL.Add('e120obs.codemp = :codemp and');
    Dm1.ConsGeral.SQL.Add('e120obs.codfil = :codfil and');
    Dm1.ConsGeral.SQL.Add('e120obs.numped = :numped and');
    Dm1.ConsGeral.SQL.Add('e120obs.codrep = :codrep and');
    Dm1.ConsGeral.SQL.Add('e120obs.obsped like ''%SUSPENSO%''');
    Dm1.ConsGeral.ParamByName('codemp').Value := Dm1.ConsE120PedSuspensoCODEMP.Value;
    Dm1.ConsGeral.ParamByName('codfil').Value := Dm1.ConsE120PedSuspensoCODFIL.Value;
    Dm1.ConsGeral.ParamByName('numped').Value := Dm1.ConsE120PedSuspensoNUMPED.Value;
    Dm1.ConsGeral.ParamByName('codrep').Value := Dm1.ConsE120PedSuspensoCODREP.Value;
    Dm1.ConsGeral.Open;
    if not Dm1.ConsGeral.IsEmpty then
       begin//1
          vaMensagem := '';
          Dm1.ConsGeral.First;
          while not Dm1.ConsGeral.Eof do
             begin//2
               vaMensagem := vaMensagem + '   '+Dm1.ConsGeral.FieldByName('OBSPED').Value;
               Dm1.ConsGeral.Next;
             end;//2

          ShowMessage(vaMensagem);
       end;//1


end;

procedure TFAcompanhamentoPedidos.btnBVisuPreCargasClick(Sender: TObject);
begin
  FResumoPreCargas := TFResumoPreCargas.Create(Self);
  FResumoPreCargas.ShowModal;
  FreeAndNil(FResumoPreCargas);
end;

procedure TFAcompanhamentoPedidos.dbg3DblClick(Sender: TObject);
begin
if not Dm1.ConsE120PedSuspenso.IsEmpty then
   begin
      FPedido := TFPedido.Create(Self);
      FPedido.vaOrigem := 'ACOMPANHAMENTO_PEDIDOS';
      FPedido.EdCodRep.Text := IntToStr(Dm1.ConsE120PedSuspensoCODREP.Value);
      FPedido.EdNumCon.Text := IntToStr(Dm1.ConsE120PedSuspensoNUMCON.Value);
      FPedido.EdNumConExit(Sender);
      FPedido.ShowModal;
      FreeAndNil(FPedido);
   end;

end;

procedure TFAcompanhamentoPedidos.dbg4DblClick(Sender: TObject);
begin
if not Dm1.ConsE120PedLiberado.IsEmpty then
   begin
      FPedido := TFPedido.Create(Self);
      FPedido.vaOrigem := 'ACOMPANHAMENTO_PEDIDOS';
      FPedido.EdCodRep.Text := IntToStr(Dm1.ConsE120PedLiberadoCODREP.Value);
      FPedido.EdNumCon.Text := IntToStr(Dm1.ConsE120PedLiberadoNUMCON.Value);
      FPedido.EdNumConExit(Sender);
      FPedido.ShowModal;
      FreeAndNil(FPedido);
   end;
end;

procedure TFAcompanhamentoPedidos.dbg2DblClick(Sender: TObject);
begin
if not Dm1.ConsE120PedLiberadoEmCarga.IsEmpty then
   begin
      FPedido := TFPedido.Create(Self);
      FPedido.vaOrigem := 'ACOMPANHAMENTO_PEDIDOS';
      FPedido.EdCodRep.Text := IntToStr(Dm1.ConsE120PedLiberadoEmCargaCODREP.Value);
      FPedido.EdNumCon.Text := IntToStr(Dm1.ConsE120PedLiberadoEmCargaNUMCON.Value);
      FPedido.EdNumConExit(Sender);
      FPedido.ShowModal;
      FreeAndNil(FPedido);
   end;
end;

procedure TFAcompanhamentoPedidos.FormShow(Sender: TObject);
var vnVlrAgdConf,vnVlrSuspenso,vnVlrLiberado,vnVlrLiberadoEmCarga,
    vnVolAgdConf,vnVolSuspenso,vnVolLiberado,vnVolLiberadoEmCarga : double;
    vnVolume : integer;
begin
    vnVlrAgdConf := 0;
    vnVlrSuspenso := 0;
    vnVlrLiberado := 0;
    vnVlrLiberadoEmCarga := 0;
    vnVolAgdConf := 0;
    vnVolSuspenso := 0;
    vnVolLiberado := 0;
    vnVolLiberadoEmCarga := 0;
    GBau.MaxValue := 78;

    Dm1.ConsE120PedAgdConf.Close;
    Dm1.ConsE120PedAgdConf.Open;
    Dm1.ConsE120PedAgdConf.First;
    while not Dm1.ConsE120PedAgdConf.Eof do
       begin
         vnVlrAgdConf := vnVlrAgdConf + Dm1.ConsE120PedAgdConfVLRBRU.Value;
         vnVolAgdConf := vnVolAgdConf + Dm1.ConsE120PedAgdConfVOLUME.Value;
         Dm1.ConsE120PedAgdConf.Next;
       end;
    Dm1.ConsE120PedAgdConf.First;

    Dm1.ConsE120PedSuspenso.Close;
    Dm1.ConsE120PedSuspenso.Open;
    Dm1.ConsE120PedSuspenso.First;
    while not Dm1.ConsE120PedSuspenso.Eof do
       begin
         vnVlrSuspenso := vnVlrSuspenso + Dm1.ConsE120PedSuspensoVLRBRU.Value;
         vnVolSuspenso := vnVolSuspenso + Dm1.ConsE120PedSuspensoVOLUME.Value;
         Dm1.ConsE120PedSuspenso.Next;
       end;
    Dm1.ConsE120PedSuspenso.First;

    Dm1.ConsE120PedLiberado.Close;
    Dm1.ConsE120PedLiberado.Open;
    Dm1.ConsE120PedLiberado.First;
    while not Dm1.ConsE120PedLiberado.Eof do
       begin
         vnVlrLiberado := vnVlrLiberado + Dm1.ConsE120PedLiberadoVLRBRU.Value;
         vnVolLiberado := vnVolLiberado + Dm1.ConsE120PedLiberadoVOLUME.Value;

         Dm1.ConsE120PedLiberado.Next;
       end;
    Dm1.ConsE120PedLiberado.First;

    Dm1.ConsE120PedLiberadoEmCarga.Close;
    Dm1.ConsE120PedLiberadoEmCarga.Open;
    Dm1.ConsE120PedLiberadoEmCarga.First;
    while not Dm1.ConsE120PedLiberadoEmCarga.Eof do
       begin
         vnVlrLiberadoEmCarga := vnVlrLiberadoEmCarga + Dm1.ConsE120PedLiberadoEmCargaVLRBRU.Value;
         vnVolLiberadoEmCarga := vnVolLiberadoEmCarga + Dm1.ConsE120PedLiberadoEmCargaVOLUME.Value;
         Dm1.ConsE120PedLiberadoEmCarga.Next;
       end;
    Dm1.ConsE120PedLiberadoEmCarga.First;

    EdVlrAgdConf.Value := vnVlrAgdConf;
    EdVlrSuspenso.Value := vnVlrSuspenso;
    EdVlrLiberado.Value := vnVlrLiberado;
    EdVlrLiberadoEmCarga.Value := vnVlrLiberadoEmCarga;

    EdVolAgdConf.Value := vnVolAgdConf;
    EdVolSuspenso.Value := vnVolSuspenso;
    EdVolLiberado.Value := vnVolLiberado;
    EdVolLiberadoEmCarga.Value := vnVolLiberadoEmCarga;
    vnVolume := trunc(vnVolLiberado);
    GBau.Progress := vnVolume;



end;

end.
