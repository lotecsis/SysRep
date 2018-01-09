unit UAddProdPed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, rxToolEdit, rxCurrEdit, ExtCtrls, Grids,
  DBGrids, DBCGrids, DB, ADODB, IBCustomDataSet, IBQuery, DBClient, Provider,
  IBSQL,IniFiles;

type
  TFAddProdPed = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    EdCodPro: TEdit;
    BCodPro: TBitBtn;
    Label2: TLabel;
    EdCodDer: TEdit;
    Label3: TLabel;
    EdQtdPed: TEdit;
    BCodDer: TBitBtn;
    Label4: TLabel;
    EdCodTpr: TEdit;
    Panel1: TPanel;
    Desc2: TCurrencyEdit;
    Desc6: TCurrencyEdit;
    Desc1: TCurrencyEdit;
    Desc5: TCurrencyEdit;
    Desc4: TCurrencyEdit;
    Desc3: TCurrencyEdit;
    EdTotDesc: TCurrencyEdit;
    Label6: TLabel;
    Panel4: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    Panel5: TPanel;
    BConfirma: TBitBtn;
    BitBtn4: TBitBtn;
    LDsCodPro: TLabel;
    ConsE075Pro: TIBQuery;
    ConsE075ProCODEMP: TIntegerField;
    ConsE075ProCODPRO: TIBStringField;
    ConsE075ProDESPRO: TIBStringField;
    ConsE075ProCODFAM: TIBStringField;
    ConsE075ProCODAGP: TIBStringField;
    ConsE075ProSITPRO: TIBStringField;
    ConsE075Der: TIBQuery;
    ConsE075DerCODEMP: TIntegerField;
    ConsE075DerCODPRO: TIBStringField;
    ConsE075DerCODDER: TIBStringField;
    ConsE075DerDESDER: TIBStringField;
    ConsE075DerPESBRU: TFloatField;
    ConsE075DerPESLIQ: TFloatField;
    ConsE075DerVOLDER: TFloatField;
    ConsE075DerSITDER: TIBStringField;
    ConsE075DerCORUNI: TFloatField;
    ConsE075DerCMP1BB: TFloatField;
    ConsE075DerCMP1AC: TFloatField;
    ConsE075DerCMP2BB: TFloatField;
    ConsE075DerCMP2EN: TFloatField;
    ConsE081Itp: TIBQuery;
    ConsE081ItpCODEMP: TIntegerField;
    ConsE081ItpCODTPR: TIBStringField;
    ConsE081ItpCODPRO: TIBStringField;
    ConsE081ItpCODDER: TIBStringField;
    ConsE081ItpCODUSU: TIntegerField;
    ConsE081ItpDESPRO: TIBStringField;
    ConsE081ItpPREBAS: TFloatField;
    ConsE081ItpTOLMAI: TFloatField;
    ConsE081ItpTOLMEN: TFloatField;
    ConsE081ItpVLRMAI: TFloatField;
    ConsE081ItpVLRMEN: TFloatField;
    ConsE081ItpSITREG: TIBStringField;
    ConsE081ItpDATINI: TDateField;
    ConsE081ItpDATFIM: TDateField;
    ConsE081Tab: TIBQuery;
    ConsE081TabCODEMP: TIntegerField;
    ConsE081TabCODTPR: TIBStringField;
    ConsE081TabCODUSU: TIntegerField;
    ConsE081TabDESTPR: TIBStringField;
    ConsE081TabSITTPR: TIBStringField;
    LDsCodDer: TLabel;
    E120IpdSeqIpd: TIBQuery;
    E120IpdSeqIpdULTIMO: TIntegerField;
    Usu120IpdSeqIte: TIBQuery;
    Usu120IpdSeqIteULTIMO: TIntegerField;
    ConsCorGrid: TIBQuery;
    EdVlrOri: TCurrencyEdit;
    EdPreUni: TCurrencyEdit;
    SqlAtuCorGrid: TIBSQL;
    SeExisteProDer: TIBQuery;
    SeExisteProDerNUMCON: TIntegerField;
    ConsE075ProCODAGC: TIBStringField;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BCodProClick(Sender: TObject);
    procedure EdCodProExit(Sender: TObject);
    procedure BCodDerClick(Sender: TObject);
    procedure EdCodDerExit(Sender: TObject);
    procedure EdCodProKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdCodDerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdCodTprExit(Sender: TObject);
    procedure Desc1Exit(Sender: TObject);
    procedure Desc2Exit(Sender: TObject);
    procedure Desc3Exit(Sender: TObject);
    procedure Desc4Exit(Sender: TObject);
    procedure Desc5Exit(Sender: TObject);
    procedure Desc6Exit(Sender: TObject);
    procedure EdQtdPedKeyPress(Sender: TObject; var Key: Char);
    procedure BConfirmaClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdQtdPedExit(Sender: TObject);
  private
    { Private declarations }
    vnVlrOri : Currency;
    function calcula(desc1,desc2,desc3,desc4,desc5,desc6 : Real): Real;

  public
    { Public declarations }
     vnTotDesc : real;
     vaStatus : string;
     vnCodEmp,vnCodFil,vnNumCon,vnSeqIte : integer;
  end;

var
  FAddProdPed: TFAddProdPed;

implementation

uses UConsGeral, UDm1, UConsDerivacao, UPedido, UPrincipal, UAddCorProdPed;

{$R *.dfm}

function TFAddProdPed.calcula(desc1,desc2,desc3,desc4,desc5,desc6 : Real): Real;
var vnValor, vnTotal: Real;
begin
    vnValor := 100;
    vnValor := vnValor - (vnValor * desc1);
    vnValor := vnValor - (vnValor * desc2);
    vnValor := vnValor - (vnValor * desc3);
    vnValor := vnValor - (vnValor * desc4);
    vnValor := vnValor - (vnValor * desc5);
    vnValor := vnValor - (vnValor * desc6);
    vnTotal := 100 - vnValor;

        Result := vnTotal;
end;

procedure TFAddProdPed.Desc1Exit(Sender: TObject);
var ArqIni : TIniFile;
begin
   vnTotDesc := calcula(Desc1.Value/100,Desc2.Value/100,Desc3.Value/100,Desc4.Value/100,Desc5.Value/100,Desc6.Value/100);
    EdTotDesc.Value := vnTotDesc;
    EdPreUni.Value := (ConsE081ItpPREBAS.Value - (ConsE081ItpPREBAS.Value * EdTotDesc.Value / 100));

    ArqIni := TIniFile.Create('C:\SysRep\conf\conf.ini');
    ArqIni.WriteString('DESCONTOS_PED', 'DESC1', CurrToStr(Desc1.Value));
    ArqIni.WriteString('DESCONTOS_PED', 'TOT_DESC', CurrToStr(vnTotDesc));
    ArqIni.Free;
end;

procedure TFAddProdPed.Desc2Exit(Sender: TObject);
var ArqIni : TInifile;
begin
  vnTotDesc := calcula(Desc1.Value/100,Desc2.Value/100,Desc3.Value/100,Desc4.Value/100,Desc5.Value/100,Desc6.Value/100);
  EdTotDesc.Value := vnTotDesc;
  EdPreUni.Value := (ConsE081ItpPREBAS.Value - (ConsE081ItpPREBAS.Value * EdTotDesc.Value / 100) );

  ArqIni := TIniFile.Create('C:\SysRep\conf\conf.ini');
  ArqIni.WriteString('DESCONTOS_PED', 'DESC2', CurrToStr(Desc2.Value));
  ArqIni.WriteString('DESCONTOS_PED', 'TOT_DESC', CurrToStr(vnTotDesc));
  ArqIni.Free;
end;

procedure TFAddProdPed.Desc3Exit(Sender: TObject);
var ArqIni : TInifile;
begin
  vnTotDesc := calcula(Desc1.Value/100,Desc2.Value/100,Desc3.Value/100,Desc4.Value/100,Desc5.Value/100,Desc6.Value/100);
  EdTotDesc.Value := vnTotDesc;
  EdPreUni.Value := (ConsE081ItpPREBAS.Value - (ConsE081ItpPREBAS.Value * EdTotDesc.Value / 100)) ;

  ArqIni := TIniFile.Create('C:\SysRep\conf\conf.ini');
  ArqIni.WriteString('DESCONTOS_PED', 'DESC3', CurrToStr(Desc3.Value));
  ArqIni.WriteString('DESCONTOS_PED', 'TOT_DESC', CurrToStr(vnTotDesc));
  ArqIni.Free;
end;

procedure TFAddProdPed.Desc4Exit(Sender: TObject);
var ArqIni : TInifile;
begin
  vnTotDesc := calcula(Desc1.Value/100,Desc2.Value/100,Desc3.Value/100,Desc4.Value/100,Desc5.Value/100,Desc6.Value/100);
  EdTotDesc.Value := vnTotDesc;
  EdPreUni.Value := (ConsE081ItpPREBAS.Value - (ConsE081ItpPREBAS.Value * EdTotDesc.Value / 100)) ;

  ArqIni := TIniFile.Create('C:\SysRep\conf\conf.ini');
  ArqIni.WriteString('DESCONTOS_PED', 'DESC4', CurrToStr(Desc4.Value));
  ArqIni.WriteString('DESCONTOS_PED', 'TOT_DESC', CurrToStr(vnTotDesc));
  ArqIni.Free;
end;

procedure TFAddProdPed.Desc5Exit(Sender: TObject);
var ArqIni : TInifile;
begin
  vnTotDesc := calcula(Desc1.Value/100,Desc2.Value/100,Desc3.Value/100,Desc4.Value/100,Desc5.Value/100,Desc6.Value/100);
  EdTotDesc.Value := vnTotDesc;
  EdPreUni.Value := (ConsE081ItpPREBAS.Value - (ConsE081ItpPREBAS.Value * EdTotDesc.Value / 100)) ;

  ArqIni := TIniFile.Create('C:\SysRep\conf\conf.ini');
  ArqIni.WriteString('DESCONTOS_PED', 'DESC5', CurrToStr(Desc5.Value));
  ArqIni.WriteString('DESCONTOS_PED', 'TOT_DESC', CurrToStr(vnTotDesc));
  ArqIni.Free;
end;

procedure TFAddProdPed.Desc6Exit(Sender: TObject);
var ArqIni : TInifile;
begin
  vnTotDesc := calcula(Desc1.Value/100,Desc2.Value/100,Desc3.Value/100,Desc4.Value/100,Desc5.Value/100,Desc6.Value/100);
  EdTotDesc.Value := vnTotDesc;
  EdPreUni.Value := (ConsE081ItpPREBAS.Value - (ConsE081ItpPREBAS.Value * EdTotDesc.Value / 100));

  ArqIni := TIniFile.Create('C:\SysRep\conf\conf.ini');
  ArqIni.WriteString('DESCONTOS_PED', 'DESC6', CurrToStr(Desc6.Value));
  ArqIni.WriteString('DESCONTOS_PED', 'TOT_DESC', CurrToStr(vnTotDesc));
  ArqIni.Free;
end;

procedure TFAddProdPed.BCodDerClick(Sender: TObject);
begin
  if (trim(EdCodPro.Text) <> '') then
     begin//1
        FConsDerivacao := TFConsDerivacao.Create(Self);
        FConsDerivacao.vaCodPro := EdCodPro.Text;

        if FConsDerivacao.ShowModal = mrOk then
           begin
              EdCodDer.Text := FConsDerivacao.ConsE075DerCODDER.Value;
              ActiveControl := EdCodDer;
           end;
         FreeAndNil(FConsDerivacao);

     end;//1

end;

procedure TFAddProdPed.BCodProClick(Sender: TObject);
begin
FConsGeral := TFConsGeral.Create(Self);
    FConsGeral.vaSql := 'select codpro,despro from e075pro where sitpro = ''A''';
    FConsGeral.vbWhere := true;
    FConsGeral.vaCampo := 'CodPro';
    FConsGeral.vnColuna := 1;
    FConsGeral.vaTela := 'FAddProdPed';
    FConsGeral.ShowModal;
    FreeAndNil(FConsGeral);

    ActiveControl := EdCodPro;
end;

procedure TFAddProdPed.BConfirmaClick(Sender: TObject);
var vbCorExiste, vbContinua : Boolean;
    vnQtdCor : integer;
    vaSqlCorGrid,vaSqlUpdate : string;
    vaCor,vaCorGrid : string;
begin
    if trim(EdCodPro.Text) = '' then
       begin
         MessageDlg('Informe o codigo do produto!',mtWarning,[mbOK],0);
         ActiveControl := EdCodPro;
       end
    else
    if trim(EdCodDer.Text) = '' then
       begin
         MessageDlg('Informe a derivação',mtWarning,[mbOK],0);
         ActiveControl := EdCodDer;
       end
    else
    if trim(EdQtdPed.Text) = '' then
       begin
         MessageDlg('Informe a quantidade pedida',mtWarning,[mbOK],0);
         ActiveControl := EdQtdPed;
       end
    else
    if EdPreUni.Value = 0 then
       begin
         MessageDlg('O produto não tem valor informado!',mtWarning,[mbOK],0);
         ActiveControl := EdCodPro;
       end
    else
     if EdTotDesc.Value > ConsE081ItpTOLMEN.Value then  //valida o total de desconto
      begin
        MessageDlg('O desconto informado é maior do que o permitido para o produto!',mtWarning,[mbOK],0);
        ActiveControl := EdTotDesc;
      end
     else
       begin

             if vaStatus = 'INSERINDO' then
                begin
                   Dm1.CadE120IpdCODEMP.Value := 1;
                   Dm1.CadE120IpdCODFIL.Value := 1;
                   Dm1.CadE120IpdNUMPED.Value := 0;
                   Dm1.CadE120IpdNUMCON.Value := StrToInt(FPedido.EdNumCon.Text);
                   Dm1.CadE120IpdCODREP.Value := Dm1.ValidaE085CliCODREP.Value;

                   if ConsE075ProCODAGC.Value = 'ESTOF' then
                      begin
                        Dm1.CadE120IpdTNSPRO.Value := '90100';
                        Dm1.CadE120IpdCODDEP.Value := '01001'
                      end
                   else
                   if ConsE075ProCODAGC.Value = 'COLCH' then
                      begin
                        Dm1.CadE120IpdTNSPRO.Value := '90106';
                        Dm1.CadE120IpdCODDEP.Value := '01002'
                      end;

                   Dm1.CadE120IpdCODPRO.Value := trim(EdCodPro.Text);
                   Dm1.CadE120IpdCODDER.Value := trim(EdCodDer.Text);
                   Dm1.CadE120IpdCODFAM.Value := ConsE075ProCODFAM.Value;
                   Dm1.CadE120IpdQTDPED.Value := StrToInt(trim(EdQtdPed.Text));
                   Dm1.CadE120IpdQTDFAT.Value := 0;
                   Dm1.CadE120IpdQTDCAN.Value := 0;
                   Dm1.CadE120IpdQTDABE.Value := StrToInt(trim(EdQtdPed.Text));
                   Dm1.CadE120IpdUNIMED.Value := 'PC';

                   Dm1.CadE120IpdCODTPR.Value := trim(EdCodTpr.Text);

                   //VALIDA SE FOR OS REPRESENTANES 4 E 6 PARA TABELA 0008
                   {if (FPrincipal.vnCodRep = 4) or (FPrincipal.vnCodRep = 6)  then
                      begin
                        Dm1.CadE120IpdCODTPR.Value := '0008';
                      end;}

                   Dm1.CadE120IpdPREUNI.Value := EdPreUni.Value;
                   Dm1.CadE120IpdVLRORI.Value := EdVlrOri.Value;
                   Dm1.CadE120IpdVLRBRU.Value := Dm1.CadE120IpdPREUNI.Value * Dm1.CadE120IpdQTDPED.Value;
                   Dm1.CadE120IpdTOTDESC.Value := EdTotDesc.Value;
                   Dm1.CadE120IpdVLRBCO.Value := Dm1.CadE120IpdVLRBRU.Value;
                   Dm1.CadE120IpdPERCOM.Value := Dm1.ValidaE028CpgPERCOM.Value;
                   Dm1.CadE120IpdVLRCOM.Value := Dm1.CadE120IpdVLRBRU.Value * Dm1.CadE120IpdPERCOM.Value / 100;
                   Dm1.CadE120IpdSITIPD.Value := '9';
                   Dm1.CadE120IpdUSUGER.Value := FPrincipal.vnCodusu;
                   Dm1.CadE120IpdDATEMI.Value := Dm1.ConsE120PedDATEMI.Value;
                   Dm1.CadE120IpdDATENT.Value := Dm1.ConsE120PedDATEMI.Value;
                   Dm1.CadE120IpdDATGER.Value := date;
                   Dm1.CadE120Ipd.Post;

                   //faz o tratamento das cores dos produtos na grid de pedidos
                   vaSqlCorGrid := 'select distinct(e120ipd.codpro) from e120ipd  where ';
                   vaSqlCorGrid := vaSqlCorGrid + '     e120ipd.codemp = '+ IntToStr(Dm1.CadE120IpdCODEMP.Value);
                   vaSqlCorGrid := vaSqlCorGrid + ' and e120ipd.codfil = '+ IntToStr(Dm1.CadE120IpdCODFIL.Value);
                   vaSqlCorGrid := vaSqlCorGrid + ' and e120ipd.numcon = '+ IntToStr(Dm1.CadE120IpdNUMCON.Value);
                   vaSqlCorGrid := vaSqlCorGrid + ' and e120ipd.codrep = '+ IntToStr(Dm1.ValidaE085CliCODREP.Value);
                   vaSqlCorGrid := vaSqlCorGrid + ' order by e120ipd.codpro';
                   ConsCorGrid.Close;
                   ConsCorGrid.SQL.Clear;
                   ConsCorGrid.SQL.Add(vaSqlCorGrid);
                   ConsCorGrid.Open;
                   ConsCorGrid.First;
                   vaCor := '1';
                   while not ConsCorGrid.Eof do
                      begin
                        if vaCor = '1' then
                           begin
                             vaCorGrid := '$00DDFFFF';
                             vaCor := '2';
                           end
                        else
                           begin
                             vaCorGrid := '$00F1E9E0';
                             vaCor := '1';

                           end;

                         vaSqlUpdate := 'update e120ipd set corgrid = '+QuotedStr(vaCorGrid);
                         vaSqlUpdate := vaSqlUpdate +'where';
                         vaSqlUpdate := vaSqlUpdate + ' e120ipd.codemp = '+ IntToStr(Dm1.CadE120IpdCODEMP.Value);
                         vaSqlUpdate := vaSqlUpdate + ' and e120ipd.codfil = '+ IntToStr(Dm1.CadE120IpdCODFIL.Value);
                         vaSqlUpdate := vaSqlUpdate + ' and e120ipd.numcon = '+ IntToStr(Dm1.CadE120IpdNUMCON.Value);
                         vaSqlUpdate := vaSqlUpdate + ' and e120ipd.codrep = '+ IntToStr(Dm1.ValidaE085CliCODREP.Value);
                         vaSqlUpdate := vaSqlUpdate + ' and e120ipd.codpro = '+ QuotedStr(ConsCorGrid.FieldByName('CODPRO').Value);
                         SqlAtuCorGrid.Close;
                         SqlAtuCorGrid.SQL.Clear;
                         SqlAtuCorGrid.SQL.Add(vaSqlUpdate);
                         SqlAtuCorGrid.ExecQuery;

                         ConsCorGrid.Next;
                      end;

                   Dm1.IBDTransacao.CommitRetaining;
                   close;

                end
             else
                 if vaStatus = 'ALTERANDO' then
                    begin

                       Dm1.CadE120IpdQTDPED.Value := StrToInt(trim(EdQtdPed.Text));
                       Dm1.CadE120IpdQTDFAT.Value := 0;
                       Dm1.CadE120IpdQTDCAN.Value := 0;
                       Dm1.CadE120IpdQTDABE.Value := StrToInt(trim(EdQtdPed.Text));
                       Dm1.CadE120IpdCODTPR.Value := trim(EdCodTpr.Text);
                       Dm1.CadE120IpdPREUNI.Value := EdPreUni.Value;
                       Dm1.CadE120IpdVLRORI.Value := EdVlrOri.Value;
                       Dm1.CadE120IpdVLRBRU.Value := Dm1.CadE120IpdPREUNI.Value * Dm1.CadE120IpdQTDPED.Value;
                       Dm1.CadE120IpdTOTDESC.Value := EdTotDesc.Value;
                       Dm1.CadE120IpdVLRBCO.Value := Dm1.CadE120IpdVLRBRU.Value;
                       Dm1.CadE120IpdPERCOM.Value := Dm1.ValidaE028CpgPERCOM.Value;
                       Dm1.CadE120IpdVLRCOM.Value := Dm1.CadE120IpdVLRBRU.Value * Dm1.CadE120IpdPERCOM.Value / 100;
                       Dm1.CadE120IpdSITIPD.Value := '9';
                       Dm1.CadE120IpdUSUGER.Value := FPrincipal.vnCodusu;
                       Dm1.CadE120IpdDATGER.Value := date;
                       Dm1.CadE120Ipd.Post;

                       Dm1.IBDTransacao.CommitRetaining;
                       close;
                    end;
       end;


end;

procedure TFAddProdPed.BitBtn4Click(Sender: TObject);
begin
  Dm1.CadE120Ipd.Cancel;
  Close;
end;

procedure TFAddProdPed.EdCodDerExit(Sender: TObject);
var vaProLib : string;
begin

  if trim(EdCodPro.Text) = '' then
     begin//1
       MessageDlg('Primeiro informe o codigo do produto!',mtWarning,[mbOK],0);
       EdCodDer.Clear;
       LDsCodDer.Caption := '';
       EdVlrOri.Clear;
       EdPreUni.Clear;


       ActiveControl := EdCodPro;
     end//1
  else
     begin//2
        if (trim(EdCodDer.Text) <> '') then
           begin//3
             ConsE075Der.Close;
             ConsE075Der.ParamByName('codpro').Value := trim(EdCodPro.Text);
             ConsE075Der.ParamByName('codder').Value := trim(EdCodDer.Text);
             ConsE075Der.Open;
             if ConsE075Der.IsEmpty then
                begin//4
                   MessageDlg('Derivação não encontrada!',mtWarning,[mbOK],0);
                   EdCodDer.Clear;
                   LDsCodDer.Caption := '';
                   EdVlrOri.Clear;
                   EdPreUni.Clear;
                   ActiveControl := EdCodDer;
                end//4
              else
                begin//6
                //VALIDA SE NAO EXISTE PRODUTO/DERIVAÇAO NO PEDIDO
                if vaStatus = 'INSERINDO' then
                   begin//a2
                      SeExisteProDer.Close;
                      SeExisteProDer.ParamByName('codemp').Value := Dm1.ConsE120PedCODEMP.Value;
                      SeExisteProDer.ParamByName('codfil').Value := Dm1.ConsE120PedCODFIL.Value;
                      SeExisteProDer.ParamByName('numcon').Value := Dm1.ConsE120PedNUMCON.Value;
                      SeExisteProDer.ParamByName('codpro').Value := trim(EdCodPro.Text);
                      SeExisteProDer.ParamByName('codder').Value := trim(EdCodDer.Text);
                      SeExisteProDer.Open;
                      if not SeExisteProDer.IsEmpty then
                         begin//a
                           vaProLib := 'N';
                           MessageDlg('Já existe produto com essa derivação cadastrado neste pedido!',mtWarning,[mbOK],0);
                           ActiveControl := EdCodDer;
                         end//a
                      else
                         begin//a1
                            vaProLib := 'S';
                         end;//a1
                   end//a2
                else
                   begin//a3
                       vaProLib := 'S';
                   end;//a3

                   if vaProLib = 'S' then
                      begin//100

                         LDsCodDer.Caption := ConsE075DerDESDER.Value;

                         if trim(EdCodTpr.Text) <> '' then
                            begin//7
                                ConsE081Itp.Close;
                                ConsE081Itp.ParamByName('codtpr').Value := trim(EdCodTpr.Text);
                                ConsE081Itp.ParamByName('codpro').Value := trim(EdCodPro.Text);
                                ConsE081Itp.ParamByName('codder').Value := trim(EdCodDer.Text);
                                ConsE081Itp.Open;
                                if ConsE081Itp.IsEmpty then
                                   begin//8
                                      MessageDlg('Produto não encontrado na tabela de preço!',mtWarning,[mbOK],0);
                                      EdVlrOri.Clear;
                                      EdPreUni.Clear;
                                      ActiveControl := EdCodPro;
                                   end//8
                                else
                                  begin//9

                                     EdVlrOri.Value := ConsE081ItpPREBAS.Value;
                                    // LVlrOri.Caption := formatcurr('###,###,##0.00',ConsE081ItpPREBAS.Value);

                                     if EdTotDesc.Value = 0 then
                                        begin//11
                                          EdPreUni.Value := ConsE081ItpPREBAS.Value;
                                        end//11
                                     else
                                        begin//12

                                          EdPreUni.Value := ConsE081ItpPREBAS.Value - (ConsE081ItpPREBAS.Value * EdTotDesc.Value / 100);
                                        end;//12
                                  end;//9
                            end;//7
                      end;//100
                end;//6
           end//3
        else
          begin//10
             LDsCodDer.Caption := '';
             EdVlrOri.Clear;
             EdPreUni.Clear;
          end;//10
     end;//2



end;

procedure TFAddProdPed.EdCodDerKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_f3 then
     begin
       BCodDer.Click;
     end;
end;

procedure TFAddProdPed.EdCodProExit(Sender: TObject);
begin
   if trim(EdCodPro.Text) <> '' then
      begin//1

         ConsE075Pro.Close;
         ConsE075Pro.ParamByName('codpro').Value := trim(EdCodPro.Text);
         ConsE075Pro.Open;
         if ConsE075Pro.IsEmpty then
            begin//2
               MessageDlg('Produto não encontrado!',mtWarning,[mbOK],0);
               ActiveControl := EdCodPro;
               EdCodPro.Clear;
               LDsCodPro.Caption := '';
               EdCodDer.Clear;
               LDsCodDer.Caption := '';
               EdVlrOri.Clear;
               EdPreUni.Clear;
            end//2
         else
            begin//3
               LDsCodPro.Caption := ConsE075ProDESPRO.Value;

            end;//3

      end//1
   else
     begin
        LDsCodPro.Caption := '';
        EdCodDer.Clear;
        LDsCodDer.Caption := '';
        EdVlrOri.Clear;
        EdPreUni.Clear;
     end;

end;

procedure TFAddProdPed.EdCodProKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_f3 then
     begin
       BCodPro.Click;
     end;
end;

procedure TFAddProdPed.EdCodTprExit(Sender: TObject);
begin
  if trim(EdCodTpr.Text) <> '' then
     begin//1
         ConsE081Tab.Close;
         ConsE081Tab.ParamByName('codtpr').Value := trim(EdCodTpr.Text);
         ConsE081Tab.Open;
         if ConsE081Tab.IsEmpty then
            begin//2
                 MessageDlg('Tabela de preço não encontrada!',mtWarning,[mbOK],0);
                 ActiveControl := EdCodTpr;
            end;//2
     end//1
  else
    begin//3
       MessageDlg('Informe a tabela de preço!',mtWarning,[mbOK],0);
       ActiveControl := EdCodTpr;
    end;//3
end;

procedure TFAddProdPed.EdQtdPedExit(Sender: TObject);
begin

     EdQtdPed.Color := clWindow;
end;

procedure TFAddProdPed.EdQtdPedKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in [#48..#57]) and not (key in [#8])
      and not (key in [#240]) then
      key := #0;
end;

procedure TFAddProdPed.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = VK_UP then
    SelectNext(ActiveControl,false,true);
  if key = VK_DOWN then
    SelectNext(ActiveControl, true, true);

if key = vk_F5 then
     begin
       BConfirma.Click;
     end;
end;

procedure TFAddProdPed.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
    begin
      key := #0;
      Perform (Wm_NextDlgCtl,0,0);
    end;

end;

procedure TFAddProdPed.FormShow(Sender: TObject);
VAR ArqIni : TIniFile;
    vnDesc1,vnDesc2,vnDesc3,vnDesc4,vnDesc5,vnDesc6,vnTotDesc : string;
begin
    if vaStatus = 'ALTERANDO' then
       begin//1
         EdCodPro.Text := Dm1.CadE120IpdCODPRO.Value;
         EdCodProExit(Sender);

         EdCodDer.Text := Dm1.CadE120IpdCODDER.Value;
         EdCodDerExit(Sender);


         EdQtdPed.Text := IntToStr(Dm1.CadE120IpdQTDPED.Value);
         Desc1.Value := Dm1.CadE120IpdTOTDESC.Value;
         EdTotDesc.Value := Dm1.CadE120IpdTOTDESC.Value;

         EdCodPro.Enabled := false;
         BCodPro.Enabled := false;

         EdCodDer.Enabled := false;
         BCodDer.Enabled := false;


         EdPreUni.Value := Dm1.CadE120IpdPREUNI.Value;

       end;//1

       //VALIDA SE FOR OS REPRESENTANES 4 E 6 PARA TABELA 0008
       {if (FPrincipal.vnCodRep = 4) or (FPrincipal.vnCodRep = 6)  then
          begin
            EdCodTpr.Text := '0008';
          end;}
end;

end.
