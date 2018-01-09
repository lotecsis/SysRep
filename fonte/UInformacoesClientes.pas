unit UInformacoesClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, Mask, DBCtrls, rxToolEdit, RXDBCtrl,
  ComCtrls, Grids, DBGrids, rxCurrEdit, ImgList;

type
  TFInformacoesClientes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    EdCodCli: TEdit;
    DsConsE085cli: TDataSource;
    DBE_NOMCLI: TDBEdit;
    DBE_APECLI: TDBEdit;
    DBE_ENDCLI: TDBEdit;
    DBE_NENCLI: TDBEdit;
    DBE_BAICLI: TDBEdit;
    DBE_CEPCLI: TDBEdit;
    DBE_CIDCLI: TDBEdit;
    DBE_SIGUFS: TDBEdit;
    DBE_FONCLI: TDBEdit;
    DBE_INSEST: TDBEdit;
    DBE_CGCCPF: TDBEdit;
    BCodCli: TBitBtn;
    Panel5: TPanel;
    BMostrar: TBitBtn;
    Label1: TLabel;
    DBE_VLRUPE: TDBEdit;
    DBD_DATUPE: TDBDateEdit;
    Label2: TLabel;
    DBD_DATUFA: TDBDateEdit;
    DBE_VLRUFA: TDBEdit;
    Label3: TLabel;
    DBD_DATUPG: TDBDateEdit;
    DBE_VLRUPG: TDBEdit;
    Label4: TLabel;
    DBE_MAIATR: TDBEdit;
    Label5: TLabel;
    DBE_VLRATR: TDBEdit;
    PaginaControle: TPageControl;
    TbTitulos: TTabSheet;
    TbPedidos: TTabSheet;
    Panel6: TPanel;
    Panel7: TPanel;
    Label6: TLabel;
    DBGrid1: TDBGrid;
    DsConsE301Tcr: TDataSource;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBE_TITAVEN: TDBEdit;
    DBE_TITVEN: TDBEdit;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Label12: TLabel;
    DBGrid2: TDBGrid;
    DsConsE120PedAbe: TDataSource;
    EdVlrPedAbe: TCurrencyEdit;
    Label13: TLabel;
    tbPedidosFinalizados: TTabSheet;
    dbg1: TDBGrid;
    dsConsE120PedFinalizado: TDataSource;
    Label14: TLabel;
    ImageList1: TImageList;
    procedure BMostrarClick(Sender: TObject);
    procedure BCodCliClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure dbg1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbg1CellClick(Column: TColumn);
    procedure dbg1DblClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FInformacoesClientes: TFInformacoesClientes;

implementation

uses UDm1, UConsGeral, UPedido;

{$R *.dfm}

procedure TFInformacoesClientes.BCodCliClick(Sender: TObject);
begin
    FConsGeral := TFConsGeral.Create(Self);
    FConsGeral.vaSql := 'select e085cli.codcli,e085cli.nomcli,e085cli.apecli,e085cli.cgccpf,e085cli.insest,';
    FConsGeral.vaSql := FConsGeral.vaSql + 'e085cli.cidcli,e085cli.sigufs,e085cli.endcli,e085cli.baicli,e085cli.sitcli from e085cli';
    FConsGeral.vbWhere := false;
    FConsGeral.vaCampo := 'CodCli';
    FConsGeral.vnColuna := 1;
    FConsGeral.vaTela := 'FInformacoesClientes';
    FConsGeral.ShowModal;
    FreeAndNil(FConsGeral);

    ActiveControl := EdCodCli;
    BMostrar.Click;
end;

procedure TFInformacoesClientes.BMostrarClick(Sender: TObject);
var vnVlrPedAbe : double;
begin
if trim(EdCodCli.Text) <> '' then
   begin
      Dm1.ConsE085cli.Close;
      Dm1.ConsE085cli.ParamByName('codcli').Value := StrToInt(trim(EdCodCli.Text));
      Dm1.ConsE085cli.ParamByName('data1').Value := date;
      Dm1.ConsE085cli.ParamByName('data2').Value := date;
      Dm1.ConsE085cli.Open;

      Dm1.ConsE301Tcr.Close;
      Dm1.ConsE301Tcr.ParamByName('codcli').Value := Dm1.ConsE085cliCODCLI.Value;
      Dm1.ConsE301Tcr.Open;

      Dm1.ConsE120PedAbe.Close;
      Dm1.ConsE120PedAbe.ParamByName('codcli').Value := Dm1.ConsE085cliCODCLI.Value;
      Dm1.ConsE120PedAbe.Open;
      Dm1.ConsE120PedAbe.First;
      vnVlrPedAbe := 0;
      while not Dm1.ConsE120PedAbe.Eof do
         begin
           vnVlrPedAbe :=  vnVlrPedAbe + Dm1.ConsE120PedAbeVLRABE.Value;
           Dm1.ConsE120PedAbe.Next;
         end;
      Dm1.ConsE120PedAbe.First;

      Dm1.ConsE120PedFinalizado.Close;
      Dm1.ConsE120PedFinalizado.ParamByName('codcli').Value := Dm1.ConsE085cliCODCLI.Value;
      Dm1.ConsE120PedFinalizado.Open;

      EdVlrPedAbe.Value := vnVlrPedAbe;
   end;
end;

procedure TFInformacoesClientes.dbg1CellClick(Column: TColumn);
begin
if dbg1.SelectedIndex = 0 then
   begin
      if not Dm1.ConsE120PedFinalizado.IsEmpty then
         begin
            dbg1DblClick(Self);
         end;
   end;
end;

procedure TFInformacoesClientes.dbg1DblClick(Sender: TObject);
begin
if not Dm1.ConsE120PedFinalizado.IsEmpty then
   begin
      FPedido := TFPedido.Create(Self);
      FPedido.vaOrigem := 'INFORMACOES_CLIENTE';
      FPedido.EdCodRep.Text := IntToStr(Dm1.ConsE120PedFinalizadoCODREP.Value);
      FPedido.EdNumCon.Text := IntToStr(Dm1.ConsE120PedFinalizadoNUMCON.Value);
      FPedido.EdNumConExit(Sender);
      FPedido.ShowModal;
      FreeAndNil(FPedido);
   end;
end;

procedure TFInformacoesClientes.dbg1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if Column.FieldName = 'Img' then
    begin
        dbg1.Canvas.FillRect(Rect);
        // Desenha o Quadrado
      //  ImageList1.Draw(DBGrid2.Canvas,Rect.Left+10,Rect.Top+1,0);

        // Desenha o check sobre o quadrado
        ImageList1.Draw(dbg1.Canvas,Rect.Left+6,Rect.Top+1,12);
    end;
end;

procedure TFInformacoesClientes.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if Dm1.ConsE301TcrCODTPT.AsString = 'CHD' then
   begin//1

      if (Column.Field.FieldName = 'CODTPT') then
        BEGIN//2

              DBGrid1.Canvas.Brush.Color:= clRed;
              DBGrid1.Canvas.Font.Color := clBlack;
              DBGrid1.Canvas.Font.Style := [fsBold];
              //DBGrid.DefaultDrawDataCell(Rect,DBGrid.Columns[Datacol].Field,state);
              DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
        END;//2
   end//1
ELSE
   if Dm1.ConsE301TcrCODTPT.AsString = 'CHP' then
   begin//3

      if (Column.Field.FieldName = 'CODTPT') then
        BEGIN//4

              DBGrid1.Canvas.Brush.Color:= clWhite;
              DBGrid1.Canvas.Font.Color := clGreen;
              DBGrid1.Canvas.Font.Style := [fsBold];
              //DBGrid.DefaultDrawDataCell(Rect,DBGrid.Columns[Datacol].Field,state);
              DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
        END;//4
   end//3
ELSE
   if Dm1.ConsE301TcrCODTPT.AsString = 'DPL' then
   begin//5

      if (Column.Field.FieldName = 'CODTPT') then
        BEGIN//6

              DBGrid1.Canvas.Brush.Color:= clWhite;
              DBGrid1.Canvas.Font.Color := clNavy;
              DBGrid1.Canvas.Font.Style := [fsBold];
              //DBGrid.DefaultDrawDataCell(Rect,DBGrid.Columns[Datacol].Field,state);
              DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
        END;//6
   end;//5

   if (Dm1.ConsE301TcrVCTPRO.AsDateTime < date) and not (Dm1.ConsE301Tcr.IsEmpty) then
      begin//7
        if (Column.Field.FieldName = 'VCTPRO') then
            begin
              DBGrid1.Canvas.Brush.Color:= clRed;
              DBGrid1.Canvas.Font.Color := clBlack;
              DBGrid1.Canvas.Font.Style := [fsBold];
              //DBGrid.DefaultDrawDataCell(Rect,DBGrid.Columns[Datacol].Field,state);
              DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
            end;
      end;//7

end;

procedure TFInformacoesClientes.DBGrid2CellClick(Column: TColumn);
begin
if DBGrid2.SelectedIndex = 0 then
   begin
      if not Dm1.ConsE120PedAbe.IsEmpty then
         begin
            DBGrid2DblClick(Self);
         end;
   end;
end;

procedure TFInformacoesClientes.DBGrid2DblClick(Sender: TObject);
begin
if not Dm1.ConsE120PedAbe.IsEmpty then
   begin
      FPedido := TFPedido.Create(Self);
      FPedido.vaOrigem := 'INFORMACOES_CLIENTE';
      FPedido.EdCodRep.Text := IntToStr(Dm1.ConsE120PedAbeCODREP.Value);
      FPedido.EdNumCon.Text := IntToStr(Dm1.ConsE120PedAbeNUMCON.Value);
      FPedido.EdNumConExit(Sender);
      FPedido.ShowModal;
      FreeAndNil(FPedido);
   end;
end;

procedure TFInformacoesClientes.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if Column.FieldName = 'Img' then
    begin
        DBGrid2.Canvas.FillRect(Rect);
        // Desenha o Quadrado
      //  ImageList1.Draw(DBGrid2.Canvas,Rect.Left+10,Rect.Top+1,0);

        // Desenha o check sobre o quadrado
        ImageList1.Draw(DBGrid2.Canvas,Rect.Left+6,Rect.Top+1,12);
    end;
end;

procedure TFInformacoesClientes.FormShow(Sender: TObject);
begin
    Dm1.ConsE085cli.Close;
    Dm1.ConsE301Tcr.Close;
    Dm1.ConsE120PedAbe.Close;

    PaginaControle.ActivePageIndex := 0;
end;

end.
