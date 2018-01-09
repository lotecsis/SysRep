unit UConsultaPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Tabs, StdCtrls, CheckLst, Buttons, Grids, DBGrids, DB,
  IBCustomDataSet, IBQuery;

type

  TFConsultaPedido = class(TForm)
    Label1: TLabel;
    CbCampo: TComboBox;
    Label3: TLabel;
    EdPesquisa: TEdit;
    BPesquisar: TBitBtn;
    DBGrid: TDBGrid;
    ConsPedido: TIBQuery;
    ConsPedidoCODEMP: TIntegerField;
    ConsPedidoCODFIL: TIntegerField;
    ConsPedidoNUMPED: TIntegerField;
    ConsPedidoNUMCON: TIntegerField;
    ConsPedidoCODCLI: TIntegerField;
    ConsPedidoTNSPRO: TIBStringField;
    ConsPedidoDATEMI: TDateField;
    ConsPedidoCODREP: TIntegerField;
    ConsPedidoCODCPG: TIBStringField;
    ConsPedidoQTDORI: TFloatField;
    ConsPedidoQTDABE: TFloatField;
    ConsPedidoVLRBIP: TFloatField;
    ConsPedidoVLRIPI: TFloatField;
    ConsPedidoVLRBIC: TFloatField;
    ConsPedidoVLRICM: TFloatField;
    ConsPedidoVLRBCO: TFloatField;
    ConsPedidoVLRCOM: TFloatField;
    ConsPedidoVLRLIQ: TFloatField;
    ConsPedidoVLRORI: TFloatField;
    ConsPedidoSITPED: TIBStringField;
    ConsPedidoUSUGER: TIntegerField;
    ConsPedidoDATGER: TDateField;
    ConsPedidoPEDENV: TIBStringField;
    ConsPedidoDATENV: TDateField;
    ConsPedidoPEDCON: TIBStringField;
    ConsPedidoDATCON: TDateField;
    ConsPedidoUSUCON: TIntegerField;
    ConsPedidoCODCLI1: TIntegerField;
    ConsPedidoNOMCLI: TIBStringField;
    ConsPedidoAPECLI: TIBStringField;
    ConsPedidoINSEST: TIBStringField;
    ConsPedidoENDCLI: TIBStringField;
    ConsPedidoNENCLI: TIBStringField;
    ConsPedidoCPLEND: TIBStringField;
    ConsPedidoCEPCLI: TIBStringField;
    ConsPedidoBAICLI: TIBStringField;
    ConsPedidoCIDCLI: TIBStringField;
    ConsPedidoSIGUFS: TIBStringField;
    ConsPedidoSITCLI: TIBStringField;
    ConsPedidoCGCCPF: TIBStringField;
    ConsPedidoFONCLI: TIBStringField;
    DsConsPedido: TDataSource;
    procedure BPesquisarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridDblClick(Sender: TObject);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEnter(Sender: TObject);
    procedure DBGridExit(Sender: TObject);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }


  public
    { Public declarations }
  end;

var
  FConsultaPedido: TFConsultaPedido;

implementation

uses UDm1, UPedido;

{$R *.dfm}

procedure TFConsultaPedido.BPesquisarClick(Sender: TObject);
var vaCond,vaSql : string;
begin

   ConsPedido.Close;
   ConsPedido.SQL.Clear;
   ConsPedido.SQL.Add('select e120ped.*,e085cli.* from e120ped');
   ConsPedido.SQL.Add('inner join e085cli on e085cli.codcli = e120ped.codcli');

   if CbCampo.ItemIndex = 0 then
      begin//1
        ConsPedido.SQL.Add('where');
        ConsPedido.SQL.Add('e085cli.nomcli LIKE'+QuotedStr('%'+trim(EdPesquisa.Text) +'%') );
      end//1
   else
     if CbCampo.ItemIndex = 1 then
        begin//2
          ConsPedido.SQL.Add('where');
          ConsPedido.SQL.Add('e085cli.apecli LIKE'+QuotedStr('%'+trim(EdPesquisa.Text) +'%') );
        end//2
     else
       if CbCampo.ItemIndex = 2 then
          begin//3
            ConsPedido.SQL.Add('where');
            ConsPedido.SQL.Add('e120ped.codcli LIKE'+QuotedStr('%'+trim(EdPesquisa.Text) +'%') );
          end//3
       else
         if CbCampo.ItemIndex = 3 then
            begin//4
              ConsPedido.SQL.Add('where');
              ConsPedido.SQL.Add('e085cli.cgccpf LIKE'+QuotedStr('%'+trim(EdPesquisa.Text) +'%') );
            end//4
         else
           if CbCampo.ItemIndex = 4 then
              begin//5
                ConsPedido.SQL.Add('where');
                ConsPedido.SQL.Add('e085cli.cidcli LIKE'+QuotedStr('%'+trim(EdPesquisa.Text) +'%') );
              end//5
           else
             if CbCampo.ItemIndex = 5 then
                begin//6
                  ConsPedido.SQL.Add('where');
                  ConsPedido.SQL.Add('e120ped.numped LIKE'+QuotedStr('%'+trim(EdPesquisa.Text) +'%') );
                end//6
             else
               if CbCampo.ItemIndex = 6 then
                  begin//7
                    ConsPedido.SQL.Add('where');
                    ConsPedido.SQL.Add('e120ped.numcon LIKE'+QuotedStr('%'+trim(EdPesquisa.Text) +'%') );
                  end;//7


   ConsPedido.SQL.Add('order by e120ped.numcon');

   ConsPedido.Open;
end;

procedure TFConsultaPedido.DBGridDblClick(Sender: TObject);
begin
 if not ConsPedido.IsEmpty then
    begin
      FPedido.EdNumCon.Text := IntToStr(ConsPedidoNUMCON.Value);
      FPedido.EdNumPed.Text := IntToStr(ConsPedidoNUMPED.Value);
      Close;
    end;
end;

procedure TFConsultaPedido.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if (Column.Field.FieldName = 'NUMCON')  then
  BEGIN

    if DBGrid.DataSource.DataSet.FieldByName('CODCLI').Value > 2000 THEN
       BEGIN
        DBGrid.Canvas.Brush.Color:=$00DDFFFF;
        //DBGrid.DefaultDrawDataCell(Rect,DBGrid.Columns[Datacol].Field,state);
        DBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
       END
    ELSE
    if DBGrid.DataSource.DataSet.FieldByName('CODCLI').Value < 2000 THEN
       BEGIN
        DBGrid.Canvas.Brush.Color:=$00F1E9E0;
        //DBGrid.DefaultDrawDataCell(Rect,DBGrid.Columns[Datacol].Field,state);
        DBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
       END
  END;

end;

procedure TFConsultaPedido.DBGridEnter(Sender: TObject);
begin
  KeyPreview := false;
end;

procedure TFConsultaPedido.DBGridExit(Sender: TObject);
begin
  KeyPreview := true;
end;

procedure TFConsultaPedido.DBGridKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
     begin
       DBGridDblClick(Sender);
     end;

end;

procedure TFConsultaPedido.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
    begin
      key := #0;
      Perform (Wm_NextDlgCtl,0,0);
    end;
end;



end.
