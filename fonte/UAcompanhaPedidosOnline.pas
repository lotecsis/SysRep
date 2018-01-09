unit UAcompanhaPedidosOnline;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, DB, StdCtrls, Mask, DBCtrls, Buttons;

type
  TFAcompanhaPedidosOnline = class(TForm)
    pgcControle: TPageControl;
    tsSuspensos: TTabSheet;
    dbg1: TDBGrid;
    dsClientPedidosSuspensos: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    dbedtTVlrBru: TDBEdit;
    dbedtTVolume: TDBEdit;
    tsLiberadosSemCarga: TTabSheet;
    dbg2: TDBGrid;
    dsClientPedidosLiberadosSemCarga: TDataSource;
    Label3: TLabel;
    Label4: TLabel;
    dbedtTVlrBru1: TDBEdit;
    dbedtTVolume1: TDBEdit;
    btnBVisuMotivoSusp: TBitBtn;
    tsLiberadosEmCarga: TTabSheet;
    dbg3: TDBGrid;
    dsClientPedidosLiberadosEmCarga: TDataSource;
    Label5: TLabel;
    dbedtTVlrBru2: TDBEdit;
    Label6: TLabel;
    dbedtTVolume2: TDBEdit;
    btnItensPedidoSuspenso: TBitBtn;
    btn1: TBitBtn;
    btn2: TBitBtn;
    btnBVisuPreCargas: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btnBVisuMotivoSuspClick(Sender: TObject);
    procedure btnItensPedidoSuspensoClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btnBVisuPreCargasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAcompanhaPedidosOnline: TFAcompanhaPedidosOnline;

implementation

uses UDmOra, UPrincipal, UItensPedido, UResumoPreCargas;

{$R *.dfm}

procedure TFAcompanhaPedidosOnline.btn1Click(Sender: TObject);
begin
if not DmOra.ClientPedidosLiberadosSemCarga.IsEmpty then
   begin
      DmOra.ItensPedido.Close;
      DmOra.ItensPedido.Parameters.ParamByName('numped').Value := DmOra.ClientPedidosLiberadosSemCargaNUMPED.AsInteger;
      DmOra.ItensPedido.Open;
      if DmOra.ItensPedido.IsEmpty then
         DmOra.CoresPedido.Close;

      FItensPedido := TFItensPedido.Create(Self);
      FItensPedido.edtDescPedido.Text := 'PEDIDO: '+IntToStr(DmOra.ClientPedidosLiberadosSemCargaNUMPED.AsInteger)+'     CLIENTE: '+DmOra.ClientPedidosLiberadosSemCargaNOMCLI.AsString+'     VALOR: '+FormatFloat(',0.00',DmOra.ClientPedidosLiberadosSemCargaVLRBRU.AsFloat);
      FItensPedido.ShowModal;
      FreeAndNil(FItensPedido);
   end;
end;

procedure TFAcompanhaPedidosOnline.btn2Click(Sender: TObject);
begin
if not DmOra.ClientPedidosLiberadosEmCarga.IsEmpty then
   begin
      DmOra.ItensPedido.Close;
      DmOra.ItensPedido.Parameters.ParamByName('numped').Value := DmOra.ClientPedidosLiberadosEmCargaNUMPED.AsInteger;
      DmOra.ItensPedido.Open;
      if DmOra.ItensPedido.IsEmpty then
         DmOra.CoresPedido.Close;

      FItensPedido := TFItensPedido.Create(Self);
      FItensPedido.edtDescPedido.Text := 'PEDIDO: '+IntToStr(DmOra.ClientPedidosLiberadosEmCargaNUMPED.AsInteger)+'     CLIENTE: '+DmOra.ClientPedidosLiberadosEmCargaNOMCLI.AsString+'     VALOR: '+FormatFloat(',0.00',DmOra.ClientPedidosLiberadosEmCargaVLRBRU.AsFloat);
      FItensPedido.ShowModal;
      FreeAndNil(FItensPedido);
   end;
end;

procedure TFAcompanhaPedidosOnline.btnBVisuMotivoSuspClick(Sender: TObject);
var vaMensagem : string;
begin
    DmOra.ConsSql.Close;
    DmOra.ConsSql.SQL.Clear;
    DmOra.ConsSql.SQL.Add('select e120obs.obsped from e120obs');
    DmOra.ConsSql.SQL.Add(' where');
    DmOra.ConsSql.SQL.Add('e120obs.codemp = :codemp and');
    DmOra.ConsSql.SQL.Add('e120obs.codfil = :codfil and');
    DmOra.ConsSql.SQL.Add('e120obs.numped = :numped and');
    DmOra.ConsSql.SQL.Add('e120obs.obsped like ''%SUSPENSO%''');
    DmOra.ConsSql.Parameters.ParamByName('codemp').Value := DmOra.ClientPedidosSuspensosCODEMP.Value;
    DmOra.ConsSql.Parameters.ParamByName('codfil').Value := DmOra.ClientPedidosSuspensosCODFIL.Value;
    DmOra.ConsSql.Parameters.ParamByName('numped').Value := DmOra.ClientPedidosSuspensosNUMPED.Value;
    DmOra.ConsSql.Open;
    if not DmOra.ConsSql.IsEmpty then
       begin
          vaMensagem := '';
          DmOra.ConsSql.First;
          while not DmOra.ConsSql.Eof do
             begin
               vaMensagem := vaMensagem + '   '+DmOra.ConsSql.FieldByName('OBSPED').Value;
               DmOra.ConsSql.Next;
             end;

          ShowMessage(vaMensagem);
       end;

end;

procedure TFAcompanhaPedidosOnline.btnBVisuPreCargasClick(Sender: TObject);
begin
  FResumoPreCargas := TFResumoPreCargas.Create(Self);
  FResumoPreCargas.ShowModal;
  FreeAndNil(FResumoPreCargas);
end;

procedure TFAcompanhaPedidosOnline.btnItensPedidoSuspensoClick(Sender: TObject);
begin
if not DmOra.ClientPedidosSuspensos.IsEmpty then
   begin
      DmOra.ItensPedido.Close;
      DmOra.ItensPedido.Parameters.ParamByName('numped').Value := DmOra.ClientPedidosSuspensosNUMPED.AsInteger;
      DmOra.ItensPedido.Open;
      if DmOra.ItensPedido.IsEmpty then
         DmOra.CoresPedido.Close;

      FItensPedido := TFItensPedido.Create(Self);
      FItensPedido.edtDescPedido.Text := 'PEDIDO: '+IntToStr(DmOra.ClientPedidosSuspensosNUMPED.AsInteger)+'     CLIENTE: '+DmOra.ClientPedidosSuspensosNOMCLI.AsString+'     VALOR: '+FormatFloat(',0.00',DmOra.ClientPedidosSuspensosVLRBRU.AsFloat);
      FItensPedido.ShowModal;
      FreeAndNil(FItensPedido);
   end;
end;

procedure TFAcompanhaPedidosOnline.FormShow(Sender: TObject);
begin
  try
      //conecta com o banco oracle
      DmOra := TDmOra.Create(Self);
      DmOra.Banco.Connected := True;
  except
       Application.MessageBox('Não foi possível conectar com WebService Oracle, verifique sua conexão com a internet!!','Atenção', MB_ICONWARNING+MB_OK);
       Abort;
  end;

  DmOra.ClientPedidosSuspensos.Close;
  DmOra.PedidosSuspensos.Close;
  DmOra.PedidosSuspensos.Parameters.ParamByName('codrep').Value := FPrincipal.vnCodRep;
  DmOra.PedidosSuspensos.Open;
  DmOra.ClientPedidosSuspensos.Open;

  DmOra.ClientPedidosLiberadosSemCarga.Close;
  DmOra.PedidosLiberadosSemCarga.Close;
  DmOra.PedidosLiberadosSemCarga.Parameters.ParamByName('codrep').Value := FPrincipal.vnCodRep;
  DmOra.PedidosLiberadosSemCarga.Open;
  DmOra.ClientPedidosLiberadosSemCarga.Open;

  DmOra.ClientPedidosLiberadosEmCarga.Close;
  DmOra.PedidosLiberadosEmCarga.Close;
  DmOra.PedidosLiberadosEmCarga.Parameters.ParamByName('codrep').Value := FPrincipal.vnCodRep;
  DmOra.PedidosLiberadosEmCarga.Open;
  DmOra.ClientPedidosLiberadosEmCarga.Open;

end;

end.
