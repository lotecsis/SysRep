unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, RibbonLunaStyleActnCtrls, Ribbon, ToolWin,
  ActnMan, ActnCtrls, ActnList, ImgList, pngimage, AppEvnts,
  RibbonObsidianStyleActnCtrls, StdCtrls, Buttons, OleCtrls, SHDocVw, JPEG, WinInet, DateUtils,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient;

type
  TFPrincipal = class(TForm)
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Ribbon1: TRibbon;
    PgVendas: TRibbonPage;
    RibbonGroup1: TRibbonGroup;
    ActionManager1: TActionManager;
    AcCadPedido: TAction;
    AcEnviaPedido: TAction;
    ImageList1: TImageList;
    ImageList2: TImageList;
    AcAtualiza: TAction;
    RibbonGroup4: TRibbonGroup;
    AcAcompanhamentoPedidos: TAction;
    AcInformacoesclientes: TAction;
    RibbonGroup2: TRibbonGroup;
    AcRelacaoCobranca: TAction;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    AcVisuTabPreco: TAction;
    RibbonGroup3: TRibbonGroup;
    ApplicationEvents1: TApplicationEvents;
    btnVerificaConNet: TBitBtn;
    tmrAtualiza: TTimer;
    IdTCPClient1: TIdTCPClient;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure AcCadPedidoExecute(Sender: TObject);
    procedure AcEnviaPedidoExecute(Sender: TObject);
    procedure AcAtualizaExecute(Sender: TObject);
    procedure AcPedidoExecute(Sender: TObject);
    procedure AcAcompanhamentoPedidosExecute(Sender: TObject);
    procedure AcInformacoesclientesExecute(Sender: TObject);
    procedure AcRelacaoCobrancaExecute(Sender: TObject);
    procedure AcVisuTabPrecoExecute(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure CONECTADO;
    procedure btnVerificaConNetClick(Sender: TObject);
    procedure tmrAtualizaTimer(Sender: TObject);//procedimento para verificar conexao com a internet
  private
    { Private declarations }

  public
    { Public declarations }
    vnCodRep : integer;
    vnCodusu : integer;
    vaVersaoExe : string;
    vaCaminhoBancoWeb : string;
  end;

var
  FPrincipal: TFPrincipal;
  IsGlobalOffline : Boolean;

implementation

uses UDm1, ULogin, UAtualiza, UPedido, UEnviaPedidos, UAcompanhamentoPedidos,
  UInformacoesClientes, URelacaoCobranca, UVisuTabPreco,
  UAcompanhaPedidosOnline, UDmOra;

{$R *.dfm}

procedure TFPrincipal.CONECTADO;
var estado : Dword;
begin
  if not InternetGetConnectedState(@estado, 0) then
     IsGlobalOffline := False
  else
   begin
    if (estado and INTERNET_CONNECTION_LAN <> 0) OR (estado and INTERNET_CONNECTION_MODEM <> 0) or (Estado and INTERNET_CONNECTION_PROXY <> 0) then
       IsGlobalOffline := True;
   end;
end;

procedure TFPrincipal.AcAcompanhamentoPedidosExecute(Sender: TObject);
begin
  try
    IdTCPClient1.ReadTimeout:=2000;
    IdTCPClient1.ConnectTimeout:=2000;
    IdTCPClient1.Port:=80;
    IdTCPClient1.Host:='www.google.com';
    IdTCPClient1.Connect;
    IdTCPClient1.Disconnect;
  except
     Application.MessageBox('Sem conexão com a internet','Aviso',MB_ICONWARNING+MB_OK);
     Abort;
  end;

  FAcompanhaPedidosOnline := TFAcompanhaPedidosOnline.Create(Self);
  FAcompanhaPedidosOnline.ShowModal;
  FreeAndNil(FAcompanhaPedidosOnline);
end;

procedure TFPrincipal.AcAtualizaExecute(Sender: TObject);
begin
  FAtualiza := TFAtualiza.Create(Self);
  FAtualiza.ShowModal;
  FreeAndNil(FAtualiza);

end;

procedure TFPrincipal.AcCadPedidoExecute(Sender: TObject);
begin
   FPedido := TFPedido.Create(Self);
   FPedido.vaOrigem := 'MENU';
   FPedido.ShowModal;
   FreeAndNil(FPedido);
end;

procedure TFPrincipal.AcEnviaPedidoExecute(Sender: TObject);
begin
  FEnviaPedidos := TFEnviaPedidos.Create(Self);
  FEnviaPedidos.ShowModal;
  FreeAndNil(FEnviaPedidos);
end;

procedure TFPrincipal.AcInformacoesclientesExecute(Sender: TObject);
begin
  FInformacoesClientes := TFInformacoesClientes.Create(Self);
  FInformacoesClientes.ShowModal;
  FreeAndNil(FInformacoesClientes);
end;

procedure TFPrincipal.AcPedidoExecute(Sender: TObject);
begin
   FPedido := TFPedido.Create(Self);
   FPedido.ShowModal;
   FreeAndNil(FPedido);

end;

procedure TFPrincipal.AcRelacaoCobrancaExecute(Sender: TObject);
begin
  try
    IdTCPClient1.ReadTimeout:=2000;
    IdTCPClient1.ConnectTimeout:=2000;
    IdTCPClient1.Port:=80;
    IdTCPClient1.Host:='www.google.com';
    IdTCPClient1.Connect;
    IdTCPClient1.Disconnect;
  except
     Application.MessageBox('Sem conexão com a internet','Aviso',MB_ICONWARNING+MB_OK);
     Abort;
  end;

  FRelacaoCobranca := TFRelacaoCobranca.Create(Self);
  FRelacaoCobranca.ShowModal;
  FreeAndNil(FRelacaoCobranca);
end;

procedure TFPrincipal.AcVisuTabPrecoExecute(Sender: TObject);
begin
  FVisuTabPreco := TFVisuTabPreco.Create(Self);
  FVisuTabPreco.ShowModal;
  FreeAndNil(FVisuTabPreco);
end;

procedure TFPrincipal.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
  var Msg : string;
begin

  if Pos(UpperCase('is not a valid date'), UpperCase(E.Message)) <> 0 then
     begin
       Msg:='A Data informada é inválida';
       Application.MessageBox(PChar(Msg), 'Atenção', MB_ICONWARNING+MB_OK);
     end;

  if Pos(UpperCase('MySQL server has gone away'), UpperCase(E.Message)) <> 0 then
     begin
       Msg:='Falha na conexão com WebService';
       Application.MessageBox(PChar(Msg), 'Atenção', MB_ICONWARNING+MB_OK);
     end;

  if Pos(UpperCase('invalid input value'), UpperCase(E.Message)) <> 0 then
     begin
       Msg:='Valor informado inválido';
       Application.MessageBox(PChar(Msg), 'Atenção', MB_ICONWARNING+MB_OK);
     end;

  if Pos(UpperCase('is not a valid time'), UpperCase(E.Message)) <> 0 then
     begin
       Msg:='Hora informada inválida';
       Application.MessageBox(PChar(Msg), 'Atenção', MB_ICONWARNING+MB_OK);
     end;

  if Pos(UpperCase('violation of foreign key'), UpperCase(E.Message)) <> 0 then
     begin
       Msg:='Este registro está sendo referênciado por outro lançamento e não poderá ser excluído';
       Application.MessageBox(PChar(Msg), 'Atenção', MB_ICONWARNING+MB_OK);
     end;

  if Pos(UpperCase('is not a valid integer value'), UpperCase(E.Message)) <> 0 then
     begin
       Msg:='Este não é um valor válido';
       Application.MessageBox(PChar(Msg), 'Atenção', MB_ICONWARNING+MB_OK);
     end;

end;

procedure TFPrincipal.btnVerificaConNetClick(Sender: TObject);
var estado : Dword;
begin
  CONECTADO;

 { if IsGlobalOffline = False then
     BEGIN
       //ShowMessage('Você não está conectado à Internet.')
     end;}

  if IsGlobalOffline = TRUE then
     BEGIN
       Application.ProcessMessages;
       FAtualiza := TFAtualiza.Create(Self);
       FAtualiza.ChProdutos.Checked := True;
       FAtualiza.ChCondPgto.Checked := True;
       FAtualiza.ChClientes.Checked := false;
       FAtualiza.ChTabPreco.Checked := false;
       FAtualiza.ChPedidos.Checked := False;
       FAtualiza.ChTitulos.Checked := False;
       FAtualiza.vaAtualizar := 'S';
       FAtualiza.ShowModal;
       Application.ProcessMessages;
       FreeAndNil(FAtualiza);
     end;

end;

procedure TFPrincipal.FormShow(Sender: TObject);
begin

if not (FileExists('C:\SysRep\banco\BANCO.fdb')) then
      begin
        ShowMessage('Banco nao encontrado');
         Application.Terminate;
      end
    else
      begin
          Dm1.IBDBanco.Connected := true;
          Dm1.IBDTransacao.Active := true;


          FLogin := TFLogin.Create(Self);
          FLogin.ShowModal;
          FreeAndNil(FLogin);
      end;

    tmrAtualiza.Enabled := True;
end;

procedure TFPrincipal.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  if Panel.Index = 0 then
   begin
      StatusBar.Canvas.Font.Color := clBlack;
      StatusBar.Canvas.brush.Color:=$D1D1D1;
      StatusBar.Canvas.FillRect(Rect);
      StatusBar.Canvas.TextOut(Rect.left+2, Rect.top+1, Panel.Text);
   end;

   if Panel.Index = 1 then
   begin
      StatusBar.Canvas.Font.Color := clBlack;
      StatusBar.Canvas.brush.Color:=$D1D1D1;
      StatusBar.Canvas.FillRect(Rect);
      StatusBar.Canvas.TextOut(Rect.left+2, Rect.top+1, Panel.Text);
   end;
   if Panel.Index = 2 then
   begin
      StatusBar.Canvas.Font.Color := clBlack;
      StatusBar.Canvas.brush.Color:=$D1D1D1;
      StatusBar.Canvas.FillRect(Rect);
      StatusBar.Canvas.TextOut(Rect.left+2, Rect.top+1, Panel.Text);
   end;

   if Panel.Index = 3 then
   begin
      StatusBar.Canvas.Font.Color := clBlack;
      StatusBar.Canvas.brush.Color:=$D1D1D1;
      StatusBar.Canvas.FillRect(Rect);
      StatusBar.Canvas.TextOut(Rect.left+2, Rect.top+1, Panel.Text);
   end;

   if Panel.Index = 4 then
   begin
      StatusBar.Canvas.Font.Color := clBlack;
      StatusBar.Canvas.brush.Color:=$D1D1D1;
      StatusBar.Canvas.FillRect(Rect);
      StatusBar.Canvas.TextOut(Rect.left+2, Rect.top+1, Panel.Text);
   end;

   if Panel.Index = 5 then
   begin
      StatusBar.Canvas.Font.Color := clBlack;
      StatusBar.Canvas.brush.Color:=$D1D1D1;
      StatusBar.Canvas.FillRect(Rect);
      StatusBar.Canvas.TextOut(Rect.left+2, Rect.top+1, Panel.Text);
   end;

end;

procedure TFPrincipal.Timer1Timer(Sender: TObject);
var variavel_string : string;
begin

case DayOfWeek( Date ) of
  1: variavel_string := 'Domingo';
  2: variavel_string := 'Segunda-Feira';
  3: variavel_string := 'Terça-Feira';
  4: variavel_string := 'Quarta-Feira';
  5: variavel_string := 'Quinta-Feira';
  6: variavel_string := 'Sexta-Feira';
  7: variavel_string := 'Sábado';
end;

StatusBar1.Panels[1].Text := variavel_string;
StatusBar1.Panels[2].Text := DateToStr(Date);
StatusBar1.Panels[3].Text := TimeToStr(time);

end;

procedure TFPrincipal.tmrAtualizaTimer(Sender: TObject);
var vnQtdDia : Integer;
begin
  tmrAtualiza.Enabled := False;

  //verifica quanto tempo faz da ultima atualização para forçar uma nova
  Dm1.ConsSql.Close;
  Dm1.ConsSql.SQL.Clear;
  Dm1.ConsSql.SQL.Add('SELECT MAX(DATATU) AS DATATU FROM E100ATU');
  Dm1.ConsSql.Open;
  if not Dm1.ConsSql.IsEmpty then
    begin
      vnQtdDia := DaysBetween(Date,Dm1.ConsSql.FieldByName('DATATU').AsDateTime);
      if vnQtdDia >= 3 then
         begin
            btnVerificaConNet.Click;
         end;
    end;


end;

end.
