unit UPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, rxToolEdit, Buttons, Grids, DBGrids, DB,
  DBCtrls, rxCurrEdit, IdHTTP, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdFTP,IniFiles, IBCustomDataSet,
  IBQuery, RpBase, RpSystem, RpDefine, RpRave, RpCon, RpConDS;

type
  TFPedido = class(TForm)
    Panel1: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EdNumCon: TEdit;
    EdDatEmi: TDateEdit;
    EdCodCli: TEdit;
    EdCodCpg: TEdit;
    BNumCon: TBitBtn;
    BCodCli: TBitBtn;
    BCodCpg: TBitBtn;
    Label5: TLabel;
    EdNumPed: TEdit;
    BNumPed: TBitBtn;
    Label6: TLabel;
    Panel6: TPanel;
    Panel9: TPanel;
    DBGrid2: TDBGrid;
    Panel10: TPanel;
    BInserir: TBitBtn;
    BAlterar: TBitBtn;
    LDsCodCli: TLabel;
    LEndCli: TLabel;
    LDsCodCpg: TLabel;
    LDsSitPed: TLabel;
    DsE120Ped: TDataSource;
    DsConsE120Ipd: TDataSource;
    DBDsPro: TDBText;
    DBDSDer: TDBText;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edVolAbe: TCurrencyEdit;
    EdVlrBru: TCurrencyEdit;
    edVlrLiq: TCurrencyEdit;
    EdVolPed: TCurrencyEdit;
    BExcluir: TBitBtn;
    BCancelar: TBitBtn;
    BSair: TBitBtn;
    BEnviar: TBitBtn;
    BImprimir: TBitBtn;
    BObs: TBitBtn;
    Ftp: TIdFTP;
    IdHTTP1: TIdHTTP;
    LPedEnv: TLabel;
    LPedCon: TLabel;
    ConsNumPedEmp: TIBQuery;
    ConsNumPedEmpCODEMP: TIntegerField;
    ConsNumPedEmpCODFIL: TIntegerField;
    ConsNumPedEmpNUMPED: TIntegerField;
    ConsNumPedEmpNUMCON: TIntegerField;
    ConsNumPedEmpCODCLI: TIntegerField;
    ConsNumPedEmpTNSPRO: TIBStringField;
    ConsNumPedEmpDATEMI: TDateField;
    ConsNumPedEmpCODREP: TIntegerField;
    ConsNumPedEmpCODCPG: TIBStringField;
    ConsNumPedEmpQTDORI: TFloatField;
    ConsNumPedEmpQTDABE: TFloatField;
    ConsNumPedEmpVLRBIP: TFloatField;
    ConsNumPedEmpVLRIPI: TFloatField;
    ConsNumPedEmpVLRBIC: TFloatField;
    ConsNumPedEmpVLRICM: TFloatField;
    ConsNumPedEmpVLRBCO: TFloatField;
    ConsNumPedEmpVLRCOM: TFloatField;
    ConsNumPedEmpVLRLIQ: TFloatField;
    ConsNumPedEmpVLRORI: TFloatField;
    ConsNumPedEmpSITPED: TIBStringField;
    ConsNumPedEmpUSUGER: TIntegerField;
    ConsNumPedEmpDATGER: TDateField;
    ConsNumPedEmpPEDENV: TIBStringField;
    ConsNumPedEmpDATENV: TDateField;
    ConsNumPedEmpPEDCON: TIBStringField;
    ConsNumPedEmpDATCON: TDateField;
    ConsNumPedEmpUSUCON: TIntegerField;
    Panel12: TPanel;
    Panel13: TPanel;
    BAddProd: TBitBtn;
    BExcluiProd: TBitBtn;
    BAltProd: TBitBtn;
    LCodRep: TLabel;
    EdCodRep: TEdit;
    Label13: TLabel;
    EdVlrCom: TCurrencyEdit;
    procedure EdNumConExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BCodCpgClick(Sender: TObject);
    procedure BCodCliClick(Sender: TObject);
    procedure EdCodCliExit(Sender: TObject);
    procedure EdCodCpgExit(Sender: TObject);
    procedure EdCodCliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdCodCpgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdCodCliKeyPress(Sender: TObject; var Key: Char);
    procedure EdCodCpgKeyPress(Sender: TObject; var Key: Char);
    procedure BInserirClick(Sender: TObject);
    procedure DsE120PedStateChange(Sender: TObject);
    procedure BAddProdClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdDatEmiExit(Sender: TObject);
    procedure BExcluiProdClick(Sender: TObject);
    procedure BExcluirClick(Sender: TObject);
    procedure BAlterarClick(Sender: TObject);
    procedure Panel4Exit(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BAltProdClick(Sender: TObject);
    procedure BSairClick(Sender: TObject);
    procedure DBGrid2Enter(Sender: TObject);
    procedure DBGrid2Exit(Sender: TObject);
    procedure DBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure BObsClick(Sender: TObject);
    procedure BEnviarClick(Sender: TObject);
    procedure BNumConClick(Sender: TObject);
    procedure EdNumConKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdNumPedExit(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdCodRepExit(Sender: TObject);
    procedure BImprimirClick(Sender: TObject);
  private
    { Private declarations }
    vaStatusE120Ped : TDataSetState;
  public
    { Public declarations }
    vnVolPed, vnVolAbe, vnVlrBru, vnVlrLiq, vnVlrCom: Currency;
    vaDatEmi, vaCodCli,vaCodCpg,vaAlteracao : string;
    vaOrigem : string;
    function AnalizaAlteracao : string;
  end;

var
  FPedido: TFPedido;

implementation

uses UConsGeral, UDm1, UPrincipal, UAddProdPed, UObsPed, UConsultaPedido,
  UDmRave, UDmFireRep;

{$R *.dfm}

function TFPedido.AnalizaAlteracao : string;
begin


   if (vaDatEmi = DateToStr(EdDatEmi.Date)) and  (vaCodCli = EdCodCli.Text) and
      (vaCodCpg = EdCodCpg.Text) then
         result := 'N'
   else
         Result := 'S';
end;

procedure TFPedido.BAddProdClick(Sender: TObject);
begin
if Dm1.ConsE120PedPEDENV.Value = 'S' then
   begin
      Application.MessageBox('O pedido já foi enviado e por isso não pode ser alterado!' +#13 +'Entre em contato com a empresa!','Aviso',MB_ICONWARNING+MB_OK);
   end
else
 begin//01
    FAddProdPed := TFAddProdPed.Create(Self);
    FAddProdPed.vnCodEmp := Dm1.ConsE120PedCODEMP.Value;
    FAddProdPed.vnCodFil := Dm1.ConsE120PedCODFIL.Value;
    FAddProdPed.vnNumCon := Dm1.ConsE120PedNUMCON.Value;

    Dm1.CadE120Ipd.Open;
    Dm1.CadE120Ipd.Insert;
    FAddProdPed.E120IpdSeqIpd.Close;//busca a sequencia para o item
    FAddProdPed.E120IpdSeqIpd.ParamByName('numcon').Value := StrToInt(EdNumCon.Text);
    FAddProdPed.E120IpdSeqIpd.ParamByName('codrep').Value := Dm1.ValidaE085CliCODREP.Value;
    FAddProdPed.E120IpdSeqIpd.Open;
    if FAddProdPed.E120IpdSeqIpd.IsEmpty then
       Dm1.CadE120IpdSEQIPD.Value := 1
    else
       Dm1.CadE120IpdSEQIPD.Value := FAddProdPed.E120IpdSeqIpdULTIMO.Value + 1;

    FAddProdPed.vaStatus := 'INSERINDO';
    FAddProdPed.ShowModal;
    FreeAndNil(FAddProdPed);


    EdNumConExit(Sender);
 end;//01

end;

procedure TFPedido.BAlterarClick(Sender: TObject);
begin
   if not Dm1.ConsE120Ped.IsEmpty then
      begin
         if LPedEnv.Caption = 'ENVIADO' then
             begin
                Application.MessageBox('O pedido já foi enviado e por isso não pode ser alterado!' +#13 +'Entre em contato com a empresa!','Aviso',MB_ICONWARNING+MB_OK);
                Abort;
             end;

         Dm1.CadE120Ped.Close;
         Dm1.CadE120Ped.ParamByName('codemp').Value := Dm1.ConsE120PedCODEMP.Value;
         Dm1.CadE120Ped.ParamByName('codfil').Value := Dm1.ConsE120PedCODFIL.Value;
         Dm1.CadE120Ped.ParamByName('numcon').Value := Dm1.ConsE120PedNUMCON.Value;
         Dm1.CadE120Ped.ParamByName('codrep').Value := Dm1.ConsE120PedCODREP.Value;
         Dm1.CadE120Ped.Open;
         if not Dm1.CadE120Ped.IsEmpty then
            begin
              Dm1.CadE120Ped.Edit;
              Dm1.CadE120PedCODCLI.Value := Dm1.ValidaE085CliCODCLI.Value;
              Dm1.CadE120PedDATEMI.Value := EdDatEmi.Date;
              Dm1.CadE120PedCODCPG.Value := Dm1.ValidaE028CpgCODCPG.Value;
              Dm1.CadE120Ped.Post;
              Dm1.IBDTransacao.CommitRetaining;

              BAlterar.Enabled := false;
              vaDatEmi := DateToStr(EdDatEmi.Date);
              vaCodCli := EdCodCli.Text;
              vaCodCpg := EdCodCpg.Text;

              EdNumConExit(Sender);
            end;

      end;

end;

procedure TFPedido.BAltProdClick(Sender: TObject);
begin
if Dm1.ConsE120PedPEDENV.Value = 'S' then
   begin
      Application.MessageBox('O pedido já foi enviado e por isso não pode ser alterado!' +#13 +'Entre em contato com a empresa!','Aviso',MB_ICONWARNING+MB_OK);
   end
else
 begin

    FAddProdPed := TFAddProdPed.Create(Self);
    FAddProdPed.vnCodEmp := Dm1.ConsE120PedCODEMP.Value;
    FAddProdPed.vnCodFil := Dm1.ConsE120PedCODFIL.Value;
    FAddProdPed.vnNumCon := Dm1.ConsE120PedNUMCON.Value;

    Dm1.CadE120Ipd.Close;
    Dm1.CadE120Ipd.ParamByName('codemp').Value := Dm1.ConsE120IpdCODEMP.Value;
    Dm1.CadE120Ipd.ParamByName('codfil').Value := Dm1.ConsE120IpdCODFIL.Value;
    Dm1.CadE120Ipd.ParamByName('numcon').Value := Dm1.ConsE120IpdNUMCON.Value;
    Dm1.CadE120Ipd.ParamByName('codrep').Value := Dm1.ConsE120IpdCODREP.Value;
    Dm1.CadE120Ipd.ParamByName('seqipd').Value := Dm1.ConsE120IpdSEQIPD.Value;
    Dm1.CadE120Ipd.Open;
    if not Dm1.CadE120Ipd.IsEmpty then
       begin
          Dm1.CadE120Ipd.Edit;


          FAddProdPed.vaStatus := 'ALTERANDO';
          FAddProdPed.ShowModal;
          FreeAndNil(FAddProdPed);

          EdNumConExit(Sender);
       end;

 end;

end;

procedure TFPedido.BCancelarClick(Sender: TObject);
begin

  EdNumCon.Clear;
  EdNumConExit(Sender);

end;

procedure TFPedido.BCodCliClick(Sender: TObject);
begin
    FConsGeral := TFConsGeral.Create(Self);
    FConsGeral.vaSql := 'select e085cli.codcli,e085cli.nomcli,e085cli.apecli,e085cli.cgccpf,e085cli.insest,';
    FConsGeral.vaSql := FConsGeral.vaSql + 'e085cli.cidcli,e085cli.sigufs,e085cli.endcli,e085cli.baicli,e085cli.sitcli from e085cli';
    FConsGeral.vaSql := FConsGeral.vaSql + ' where e085cli.sitcli = ''A''';
    FConsGeral.vbWhere := True;
    FConsGeral.vaCampo := 'CodCli';
    FConsGeral.vnColuna := 1;
    FConsGeral.vaTela := 'FPedido';
    FConsGeral.ShowModal;
    FreeAndNil(FConsGeral);

    ActiveControl := EdCodCli;
end;

procedure TFPedido.BCodCpgClick(Sender: TObject);
begin
    FConsGeral := TFConsGeral.Create(Self);
    FConsGeral.vaSql := 'select e028cpg.codcpg,e028cpg.descpg,e028cpg.abrcpg,e028cpg.przmed,e028cpg.qtdpar from e028cpg';

    FConsGeral.vbWhere := false;
    FConsGeral.vaCampo := 'CodCpg';
    FConsGeral.vnColuna := 0;
    FConsGeral.vaTela := 'FPedido';
    FConsGeral.ShowModal;
    FreeAndNil(FConsGeral);

    ActiveControl := EdCodCpg;
end;

procedure TFPedido.BEnviarClick(Sender: TObject);
var ArqE120Ped,ArqE120Ipd,ArqUsu120Ipd,ArqE120Obs : TextFile;
    dir,nome,destino : string;
    ArqIni : TIniFile;
    vaHost, vaUsuario, vaSenha : string;
    vbEnviado : boolean;
    cursor : TCursor;
    vnNovaFaixaNumCon,vnNumConAtu : Integer;
begin
if Dm1.ConsE120PedPEDENV.Value = 'N' then
  begin//1
      try
        //conecta com o banco
        DmFireRep.Banco.Connected := False;
        DmFireRep.Banco.DatabaseName := FPrincipal.vaCaminhoBancoWeb;
        DmFireRep.Banco.Connected := True;
      except
         Application.MessageBox('Não foi possível conectar com WebService, verifique sua conexão com a internet!!','Atenção', MB_ICONWARNING+MB_OK);
         Abort;
      end;

      cursor := Screen.Cursor;
      Screen.Cursor := crSQLWait;

      try
         {*****************************************
         gera-envia o arquivo dos dados gerais do pedido
         ******************************************}
         DmFireRep.CadE120Ped.Close;
         DmFireRep.CadE120Ped.ParamByName('CODEMP').Value := Dm1.ConsE120PedCODEMP.Value;
         DmFireRep.CadE120Ped.ParamByName('CODFIL').Value := Dm1.ConsE120PedCODFIL.Value;
         DmFireRep.CadE120Ped.ParamByName('NUMCON').Value := Dm1.ConsE120PedNUMCON.Value;
         DmFireRep.CadE120Ped.ParamByName('CODREP').Value := Dm1.ConsE120PedCODREP.Value;
         DmFireRep.CadE120Ped.Open;
         if DmFireRep.CadE120Ped.IsEmpty then
            begin
               DmFireRep.CadE120Ped.Insert;
               DmFireRep.CadE120PedCODEMP.Value := Dm1.ConsE120PedCODEMP.Value;
               DmFireRep.CadE120PedCODFIL.Value := Dm1.ConsE120PedCODFIL.Value;
               DmFireRep.CadE120PedNUMCON.Value := Dm1.ConsE120PedNUMCON.Value;
               DmFireRep.CadE120PedNUMPED.Value := Dm1.ConsE120PedNUMPED.Value;
               DmFireRep.CadE120PedCODREP.Value := Dm1.ConsE120PedCODREP.Value;
               DmFireRep.CadE120PedCODCLI.Value := Dm1.ConsE120PedCODCLI.Value;
               DmFireRep.CadE120PedTNSPRO.Value := Dm1.ConsE120PedTNSPRO.Value;
               DmFireRep.CadE120PedDATEMI.Value := Dm1.ConsE120PedDATEMI.Value;
               DmFireRep.CadE120PedCODCPG.Value := Dm1.ConsE120PedCODCPG.Value;
               DmFireRep.CadE120PedSITPED.Value := Dm1.ConsE120PedSITPED.Value;
               DmFireRep.CadE120PedUSUGER.Value := Dm1.ConsE120PedUSUGER.Value;
               DmFireRep.CadE120PedDATGER.Value := Dm1.ConsE120PedDATGER.Value;
               DmFireRep.CadE120PedPEDENV.Value := 'S';
               DmFireRep.CadE120PedDATENV.Value := Date;
               DmFireRep.CadE120PedPEDCON.Value := 'N';
               DmFireRep.CadE120PedPEDPRO.Value := 'N';
               DmFireRep.CadE120Ped.Post;

            end;

         Application.ProcessMessages;

          //GRAVA-ENVIA OS ITENS DO PEDIDO
          Dm1.ConsE120Ipd.First;
          while not Dm1.ConsE120Ipd.Eof do
            begin
               DmFireRep.CadE120Ipd.Close;
               DmFireRep.CadE120Ipd.ParamByName('CODEMP').Value := Dm1.ConsE120IpdCODEMP.Value;
               DmFireRep.CadE120Ipd.ParamByName('CODFIL').Value := Dm1.ConsE120IpdCODFIL.Value;
               DmFireRep.CadE120Ipd.ParamByName('NUMCON').Value := Dm1.ConsE120IpdNUMCON.Value;
               DmFireRep.CadE120Ipd.ParamByName('CODREP').Value := Dm1.ConsE120IpdCODREP.Value;
               DmFireRep.CadE120Ipd.ParamByName('SEQIPD').Value := Dm1.ConsE120IpdSEQIPD.Value;
               DmFireRep.CadE120Ipd.Open;
               if DmFireRep.CadE120Ipd.IsEmpty then
                  begin
                     DmFireRep.CadE120Ipd.Insert;
                     DmFireRep.CadE120IpdCODEMP.Value := Dm1.ConsE120IpdCODEMP.Value;
                     DmFireRep.CadE120IpdCODFIL.Value := Dm1.ConsE120IpdCODFIL.Value;
                     DmFireRep.CadE120IpdNUMCON.Value := Dm1.ConsE120IpdNUMCON.Value;
                     DmFireRep.CadE120IpdNUMPED.Value := Dm1.ConsE120IpdNUMPED.Value;
                     DmFireRep.CadE120IpdCODREP.Value := Dm1.ConsE120IpdCODREP.Value;
                     DmFireRep.CadE120IpdSEQIPD.Value := Dm1.ConsE120IpdSEQIPD.Value;
                     DmFireRep.CadE120IpdTNSPRO.Value := Dm1.ConsE120IpdTNSPRO.Value;
                     DmFireRep.CadE120IpdCODPRO.Value := Dm1.ConsE120IpdCODPRO.Value;
                     DmFireRep.CadE120IpdCODDER.Value := Dm1.ConsE120IpdCODDER.Value;
                     DmFireRep.CadE120IpdCODFAM.Value := Dm1.ConsE120IpdCODFAM.Value;
                     DmFireRep.CadE120IpdCODDEP.Value := Dm1.ConsE120IpdCODDEP.Value;
                     DmFireRep.CadE120IpdQTDPED.Value := Dm1.ConsE120IpdQTDPED.Value;
                     DmFireRep.CadE120IpdQTDABE.Value := Dm1.ConsE120IpdQTDABE.Value;
                     DmFireRep.CadE120IpdCODTPR.Value := Dm1.ConsE120IpdCODTPR.Value;
                     DmFireRep.CadE120IpdPREUNI.Value := Dm1.ConsE120IpdPREUNI.Value;
                     DmFireRep.CadE120IpdVLRBRU.Value := Dm1.ConsE120IpdVLRBRU.Value;
                     DmFireRep.CadE120IpdSITIPD.Value := Dm1.ConsE120IpdSITIPD.Value;
                     DmFireRep.CadE120IpdTOTDESC.Value := Dm1.ConsE120IpdTOTDESC.Value;
                     DmFireRep.CadE120IpdVLRORI.Value := Dm1.ConsE120IpdVLRORI.Value;
                     DmFireRep.CadE120IpdCORGRID.Value := Dm1.ConsE120IpdCORGRID.Value;
                     DmFireRep.CadE120IpdDATGER.Value := Dm1.ConsE120IpdDATGER.Value;
                     DmFireRep.CadE120IpdUNIMED.Value := Dm1.ConsE120IpdUNIMED.Value;
                     DmFireRep.CadE120IpdUSUGER.Value := Dm1.ConsE120IpdUSUGER.Value;
                     DmFireRep.CadE120Ipd.Post;
                  end;

               Application.ProcessMessages;

               //gera-ENVIA as cores dos produtos usu120ipd
               {Dm1.ConsUsu120Ipd.First;
               while not Dm1.ConsUsu120Ipd.Eof do
                  begin
                     DmFireRep.CadUsu120Ipd.Close;
                     DmFireRep.CadUsu120Ipd.ParamByName('CODEMP').Value := Dm1.ConsUsu120IpdCODEMP.Value;
                     DmFireRep.CadUsu120Ipd.ParamByName('CODFIL').Value := Dm1.ConsUsu120IpdCODFIL.Value;
                     DmFireRep.CadUsu120Ipd.ParamByName('NUMCON').Value := Dm1.ConsUsu120IpdNUMCON.Value;
                     DmFireRep.CadUsu120Ipd.ParamByName('CODREP').Value := Dm1.ConsUsu120IpdCODREP.Value;
                     DmFireRep.CadUsu120Ipd.ParamByName('SEQIPD').Value := Dm1.ConsUsu120IpdSEQIPD.Value;
                     DmFireRep.CadUsu120Ipd.ParamByName('SEQITE').Value := Dm1.ConsUsu120IpdSEQITE.Value;
                     DmFireRep.CadUsu120Ipd.Open;
                     if DmFireRep.CadUsu120Ipd.IsEmpty then
                        begin
                           DmFireRep.CadUsu120Ipd.Insert;
                           DmFireRep.CadUsu120IpdCODEMP.Value := Dm1.ConsUsu120IpdCODEMP.Value;
                           DmFireRep.CadUsu120IpdCODFIL.Value := Dm1.ConsUsu120IpdCODFIL.Value;
                           DmFireRep.CadUsu120IpdNUMCON.Value := Dm1.ConsUsu120IpdNUMCON.Value;
                           DmFireRep.CadUsu120IpdNUMPED.Value := Dm1.ConsUsu120IpdNUMPED.Value;
                           DmFireRep.CadUsu120IpdCODREP.Value := Dm1.ConsUsu120IpdCODREP.Value;
                           DmFireRep.CadUsu120IpdSEQIPD.Value := Dm1.ConsUsu120IpdSEQIPD.Value;
                           DmFireRep.CadUsu120IpdSEQITE.Value := Dm1.ConsUsu120IpdSEQITE.Value;
                           DmFireRep.CadUsu120IpdQTDCOR.Value := Dm1.ConsUsu120IpdQTDCOR.Value;
                           DmFireRep.CadUsu120IpdTIPCMB.Value := Dm1.ConsUsu120IpdTIPCMB.Value;
                           DmFireRep.CadUsu120IpdCOR001.Value := Dm1.ConsUsu120IpdCOR001.Value;
                           DmFireRep.CadUsu120IpdCOR002.Value := Dm1.ConsUsu120IpdCOR002.Value;
                           DmFireRep.CadUsu120IpdCODPRO.Value := Dm1.ConsUsu120IpdCODPRO.Value;
                           DmFireRep.CadUsu120IpdCODDER.Value := Dm1.ConsUsu120IpdCODDER.Value;
                           DmFireRep.CadUsu120Ipd.Post;
                        end;

                    Dm1.ConsUsu120Ipd.Next;
                  end;}


               Dm1.ConsE120Ipd.Next;
            end;


            //gera-ENVIA as observaçoes do pedido
           Dm1.ConsE120Obs.Close;
           Dm1.ConsE120Obs.ParamByName('codemp').Value := Dm1.ConsE120PedCODEMP.Value;
           Dm1.ConsE120Obs.ParamByName('codfil').Value := Dm1.ConsE120PedCODFIL.Value;
           Dm1.ConsE120Obs.ParamByName('numcon').Value := Dm1.ConsE120PedNUMCON.Value;
           Dm1.ConsE120Obs.ParamByName('codrep').Value := Dm1.ConsE120PedCODREP.Value;
           Dm1.ConsE120Obs.Open;
           Dm1.ConsE120Obs.First;
           while not Dm1.ConsE120Obs.Eof do
             begin
               DmFireRep.CadE120Obs.Close;
               DmFireRep.CadE120Obs.ParamByName('CODEMP').Value := Dm1.ConsE120ObsCODEMP.Value;
               DmFireRep.CadE120Obs.ParamByName('CODFIL').Value := Dm1.ConsE120ObsCODFIL.Value;
               DmFireRep.CadE120Obs.ParamByName('NUMCON').Value := Dm1.ConsE120ObsNUMCON.Value;
               DmFireRep.CadE120Obs.ParamByName('CODREP').Value := Dm1.ConsE120ObsCODREP.Value;
               DmFireRep.CadE120Obs.ParamByName('SEQOBS').Value := Dm1.ConsE120ObsSEQOBS.Value;
               DmFireRep.CadE120Obs.Open;
               if DmFireRep.CadE120Obs.IsEmpty then
                  begin
                     DmFireRep.CadE120Obs.Insert;
                     DmFireRep.CadE120ObsCODEMP.Value := Dm1.ConsE120ObsCODEMP.Value;
                     DmFireRep.CadE120ObsCODFIL.Value := Dm1.ConsE120ObsCODFIL.Value;
                     DmFireRep.CadE120ObsNUMCON.Value := Dm1.ConsE120ObsNUMCON.Value;
                     DmFireRep.CadE120ObsNUMPED.Value := Dm1.ConsE120ObsNUMPED.Value;
                     DmFireRep.CadE120ObsCODREP.Value := Dm1.ConsE120ObsCODREP.Value;
                     DmFireRep.CadE120ObsSEQOBS.Value := Dm1.ConsE120ObsSEQOBS.Value;
                     DmFireRep.CadE120ObsOBSPED.Value := Dm1.ConsE120ObsOBSPED.Value;
                     DmFireRep.CadE120ObsSITOBS.Value := Dm1.ConsE120ObsSITOBS.Value;
                     DmFireRep.CadE120ObsOBSUSU.Value := Dm1.ConsE120ObsOBSUSU.Value;
                     DmFireRep.CadE120ObsOBSDAT.Value := Dm1.ConsE120ObsOBSDAT.Value;
                     DmFireRep.CadE120Obs.Post;
                  end;

               Dm1.ConsE120Obs.Next;
             end;
             DmFireRep.ibtTransacao.CommitRetaining;

      except
        DmFireRep.ibtTransacao.RollbackRetaining;
        Application.MessageBox('Erro ao enviar pedido','Atenção', MB_ICONWARNING+MB_OK);
        Screen.Cursor := cursor;
        Abort;
      end;

      //ATUALIZA O NUMERO DE CONTROLE QUE ESTA SENDO USADO
      Dm1.ConsGeral.Close;
      Dm1.ConsGeral.SQL.Clear;
      Dm1.ConsGeral.SQL.Add('select e100usu.numpedatu,e100usu.numpedfim');
      Dm1.ConsGeral.SQL.Add(' from e100usu');
      Dm1.ConsGeral.SQL.Add(' where codusu = :CODUSU');
      Dm1.ConsGeral.ParamByName('CODUSU').Value := FPrincipal.vnCodusu;
      Dm1.ConsGeral.Open;

      if Dm1.ConsGeral.FieldByName('NUMPEDATU').AsInteger = Dm1.ConsGeral.FieldByName('NUMPEDFIM').AsInteger then //BUSCA UMA NOVA FAIXA DE NUMEROS
         begin
           DmFireRep.UltimaFaixaNumCon.Close;
           DmFireRep.UltimaFaixaNumCon.Open;
           if DmFireRep.UltimaFaixaNumConULTIMA_I.Value > DmFireRep.UltimaFaixaNumConULTIMA_E.Value then
              begin
                vnNovaFaixaNumCon := DmFireRep.UltimaFaixaNumConULTIMA_I.Value + 1;
              end
           else
           if DmFireRep.UltimaFaixaNumConULTIMA_E.Value > DmFireRep.UltimaFaixaNumConULTIMA_I.Value then
              begin
                vnNovaFaixaNumCon := DmFireRep.UltimaFaixaNumConULTIMA_E.Value + 1;
              end;


            DmFireRep.CadE100Usu.Close;
            DmFireRep.CadE100Usu.ParamByName('CODUSU').Value := FPrincipal.vnCodusu;
            DmFireRep.CadE100Usu.Open;
            DmFireRep.CadE100Usu.Edit;
            DmFireRep.CadE100UsuNCIE.Value := vnNovaFaixaNumCon;
            DmFireRep.CadE100UsuNCFE.AsInteger := vnNovaFaixaNumCon + 500;
            DmFireRep.CadE100UsuNCAE.Value := vnNovaFaixaNumCon;
            DmFireRep.CadE100Usu.Post;
            DmFireRep.ibtTransacao.CommitRetaining;

             Dm1.CadE100Usu.Close;
             Dm1.CadE100Usu.ParamByName('CODUSU').Value := FPrincipal.vnCodusu;
             Dm1.CadE100Usu.Open;
             if not Dm1.CadE100Usu.IsEmpty then
               begin
                 Dm1.CadE100Usu.Edit;
                 Dm1.CadE100UsuNUMPEDINI.Value := vnNovaFaixaNumCon;
                 Dm1.CadE100UsuNUMPEDFIM.Value := vnNovaFaixaNumCon + 500;
                 Dm1.CadE100UsuNUMPEDATU.Value := vnNovaFaixaNumCon;
                 Dm1.CadE100Usu.Post;
                 Dm1.IBDTransacao.CommitRetaining;
               end;
         end
      else
         begin
            DmFireRep.CadE100Usu.Close;
            DmFireRep.CadE100Usu.ParamByName('CODUSU').Value := FPrincipal.vnCodusu;
            DmFireRep.CadE100Usu.Open;
            if not DmFireRep.CadE100Usu.IsEmpty then
               begin
                 if DmFireRep.CadE100UsuNCAE.AsInteger < Dm1.ConsGeral.FieldByName('NUMPEDATU').AsInteger then
                    begin
                      DmFireRep.CadE100Usu.Edit;
                      DmFireRep.CadE100UsuNCAE.Value := Dm1.ConsGeral.FieldByName('NUMPEDATU').Value;
                      DmFireRep.CadE100Usu.Post;
                      DmFireRep.ibtTransacao.CommitRetaining;
                    end;
               end;
         end;


      Application.ProcessMessages;

     Dm1.CadE120Ped.Close;
     Dm1.CadE120Ped.ParamByName('codemp').Value := Dm1.ConsE120PedCODEMP.Value;
     Dm1.CadE120Ped.ParamByName('codfil').Value := Dm1.ConsE120PedCODFIL.Value;
     Dm1.CadE120Ped.ParamByName('numcon').Value := Dm1.ConsE120PedNUMCON.Value;
     Dm1.CadE120Ped.ParamByName('codrep').Value := Dm1.ConsE120PedCODREP.Value;
     Dm1.CadE120Ped.Open;
     if not Dm1.CadE120Ped.IsEmpty then
        begin
          Dm1.CadE120Ped.Edit;
          Dm1.CadE120PedPEDENV.Value := 'S';
          Dm1.CadE120PedDATENV.Value := date;

          Dm1.CadE120Ped.Post;
          Dm1.IBDTransacao.CommitRetaining;

          EdNumConExit(Sender);
        end;

       DmFireRep.Banco.Connected := False;
       MessageDlg('Pedido enviado com sucesso!',mtInformation,[mbok],0);



       Screen.Cursor := cursor;
  end;//1

end;

procedure TFPedido.BExcluiProdClick(Sender: TObject);
begin
if Dm1.ConsE120PedPEDENV.Value = 'S' then
   begin
      Application.MessageBox('O pedido já foi enviado e por isso não pode ser alterado!' +#13 +'Entre em contato com a empresa!','Aviso',MB_ICONWARNING+MB_OK);
   end
else
 begin
    if not Dm1.ConsE120Ipd.IsEmpty then
       begin
         if Application.MessageBox('Deseja realmente excluir o registro?','Confirmação',MB_ICONQUESTION+MB_YESNO) = mrYes then
             begin
                Dm1.CadE120Ipd.Close;
                Dm1.CadE120Ipd.ParamByName('codemp').Value := Dm1.ConsE120IpdCODEMP.Value;
                Dm1.CadE120Ipd.ParamByName('codfil').Value := Dm1.ConsE120IpdCODFIL.Value;
                Dm1.CadE120Ipd.ParamByName('numcon').Value := Dm1.ConsE120IpdNUMCON.Value;
                Dm1.CadE120Ipd.ParamByName('codrep').Value := Dm1.ConsE120IpdCODREP.Value;
                Dm1.CadE120Ipd.ParamByName('seqipd').Value := Dm1.ConsE120IpdSEQIPD.Value;
                Dm1.CadE120Ipd.Open;
                if not Dm1.CadE120Ipd.IsEmpty then
                   begin

                     Dm1.CadE120Ipd.Delete;
                     Dm1.IBDTransacao.CommitRetaining;

                      EdNumConExit(Sender);
                   end;
             end;
       end;
 end;
end;

procedure TFPedido.BExcluirClick(Sender: TObject);
begin

   if LPedEnv.Caption = 'ENVIADO' then
     begin
        Application.MessageBox('O pedido já foi enviado e por isso não pode ser alterado!' +#13 +'Entre em contato com a empresa!','Aviso',MB_ICONWARNING+MB_OK);
        Abort;
     end;

if Application.MessageBox('Deseja realmente excluir o registro?','Confirmação',MB_ICONQUESTION+MB_YESNO) = mrYes then
  begin
    if not Dm1.ConsE120Ped.IsEmpty then
        begin
          Dm1.CadE120Ped.Close;
          Dm1.CadE120Ped.ParamByName('codemp').Value := Dm1.ConsE120PedCODEMP.Value;
          Dm1.CadE120Ped.ParamByName('codfil').Value := Dm1.ConsE120PedCODFIL.Value;
          Dm1.CadE120Ped.ParamByName('numcon').Value := Dm1.ConsE120PedNUMCON.Value;
          Dm1.CadE120Ped.ParamByName('codrep').Value := Dm1.ConsE120PedCODREP.Value;
          Dm1.CadE120Ped.Open;
          if not Dm1.CadE120Ped.IsEmpty then
             begin
                //apaga os produtos do pedido
                Dm1.ConsE120Ipd.First;
                while not Dm1.ConsE120Ipd.Eof do
                   begin
                     Dm1.CadE120Ipd.Close;
                     Dm1.CadE120Ipd.ParamByName('codemp').Value := Dm1.ConsE120IpdCODEMP.Value;
                     Dm1.CadE120Ipd.ParamByName('codfil').Value := Dm1.ConsE120IpdCODFIL.Value;
                     Dm1.CadE120Ipd.ParamByName('numcon').Value := Dm1.ConsE120IpdNUMCON.Value;
                     Dm1.CadE120Ipd.ParamByName('codrep').Value := Dm1.ConsE120IpdCODREP.Value;
                     Dm1.CadE120Ipd.ParamByName('seqipd').Value := Dm1.ConsE120IpdSEQIPD.Value;
                     Dm1.CadE120Ipd.Open;
                     if not Dm1.CadE120Ipd.IsEmpty then
                        begin
                          Dm1.CadE120Ipd.Delete;
                        end;

                     Dm1.ConsE120Ipd.Next;
                   end;

                    //apaga as observaçoes do pedido
                    Dm1.ConsE120Obs.Close;
                    Dm1.ConsE120Obs.ParamByName('codemp').Value := Dm1.ConsE120PedCODEMP.Value;
                    Dm1.ConsE120Obs.ParamByName('codfil').Value := Dm1.ConsE120PedCODFIL.Value;
                    Dm1.ConsE120Obs.ParamByName('numcon').Value := Dm1.ConsE120PedNUMCON.Value;
                    Dm1.ConsE120Obs.ParamByName('codrep').Value := Dm1.ConsE120PedCODREP.Value;
                    Dm1.ConsE120Obs.Open;
                    while not Dm1.ConsE120Obs.Eof do
                       begin
                         Dm1.CadE120Obs.Close;
                         Dm1.CadE120Obs.ParamByName('codemp').Value := Dm1.ConsE120ObsCODEMP.Value;
                         Dm1.CadE120Obs.ParamByName('codfil').Value := Dm1.ConsE120ObsCODFIL.Value;
                         Dm1.CadE120Obs.ParamByName('numcon').Value := Dm1.ConsE120ObsNUMCON.Value;
                         Dm1.CadE120Obs.ParamByName('seqobs').Value := Dm1.ConsE120ObsSEQOBS.Value;
                         Dm1.CadE120Obs.ParamByName('codrep').Value := Dm1.ConsE120ObsCODREP.Value;

                         Dm1.CadE120Obs.Open;
                         if not Dm1.CadE120Obs.IsEmpty then
                            Dm1.CadE120Obs.Delete;

                         Dm1.ConsE120Obs.Next;
                       end;

                   Dm1.CadE120Ped.Delete;
                   Dm1.IBDTransacao.CommitRetaining;
                   EdNumConExit(Sender);
                   EdNumCon.Clear;
             end;

        end;

 end;
end;

procedure TFPedido.BImprimirClick(Sender: TObject);
begin
  if not Dm1.ConsE120Ped.IsEmpty then
     begin
        DmRave.ConsE120Ped.Close;
        DmRave.ConsE120Ped.ParamByName('codemp').Value := Dm1.ConsE120PedCODEMP.Value;
        DmRave.ConsE120Ped.ParamByName('codfil').Value := Dm1.ConsE120PedCODFIL.Value;
        DmRave.ConsE120Ped.ParamByName('numcon').Value := Dm1.ConsE120PedNUMCON.Value;
        DmRave.ConsE120Ped.ParamByName('codrep').Value := Dm1.ConsE120PedCODREP.Value;
        DmRave.ConsE120Ped.Open;

        DmRave.ConsE120Ipd.Close;
        DmRave.ClientConsE120Ipd.Close;
        DmRave.ConsE120Ipd.ParamByName('codemp').Value := Dm1.ConsE120PedCODEMP.Value;
        DmRave.ConsE120Ipd.ParamByName('codfil').Value := Dm1.ConsE120PedCODFIL.Value;
        DmRave.ConsE120Ipd.ParamByName('numcon').Value := Dm1.ConsE120PedNUMCON.Value;
        DmRave.ConsE120Ipd.ParamByName('codrep').Value := Dm1.ConsE120PedCODREP.Value;
        DmRave.ConsE120Ipd.Open;
        DmRave.ClientConsE120Ipd.Open;
        DmRave.ClientConsE120Ipd.First;
        while not DmRave.ClientConsE120Ipd.Eof do
           begin//1
             DmRave.ConsUsu120Ipd.Close;
             DmRave.ConsUsu120Ipd.ParamByName('codemp').Value := DmRave.ClientConsE120IpdCODEMP.Value;
             DmRave.ConsUsu120Ipd.ParamByName('codfil').Value := DmRave.ClientConsE120IpdCODFIL.Value;
             DmRave.ConsUsu120Ipd.ParamByName('numcon').Value := DmRave.ClientConsE120IpdNUMCON.Value;
             DmRave.ConsUsu120Ipd.ParamByName('codrep').Value := DmRave.ClientConsE120IpdCODREP.Value;
             DmRave.ConsUsu120Ipd.ParamByName('seqipd').Value := DmRave.ClientConsE120IpdSEQIPD.Value;
             DmRave.ConsUsu120Ipd.Open;
             DmRave.ConsUsu120Ipd.First;
             DmRave.ClientConsE120Ipd.Edit;
             DmRave.ClientConsE120IpdCORES.Value := '';
              while not DmRave.ConsUsu120Ipd.Eof do
                 begin//2
                   if DmRave.ConsUsu120IpdTIPCMB.Value = 1 then
                      begin//3
                        if DmRave.ClientConsE120IpdCORES.Value = '' then
                           DmRave.ClientConsE120IpdCORES.AsString := IntToStr(DmRave.ConsUsu120IpdQTDCOR.AsInteger)+' - '+DmRave.ConsUsu120IpdCOR001.AsString
                        else
                           DmRave.ClientConsE120IpdCORES.AsString := DmRave.ClientConsE120IpdCORES.AsString +' || '+ IntToStr(DmRave.ConsUsu120IpdQTDCOR.AsInteger)+' - '+DmRave.ConsUsu120IpdCOR001.AsString;
                      end//3
                   else
                      begin//4
                        if DmRave.ClientConsE120IpdCORES.Value = '' then
                           DmRave.ClientConsE120IpdCORES.AsString := IntToStr(DmRave.ConsUsu120IpdQTDCOR.AsInteger)+' - '+DmRave.ConsUsu120IpdCOR001.AsString+'/'+DmRave.ConsUsu120IpdCOR002.AsString
                        else
                           DmRave.ClientConsE120IpdCORES.AsString := DmRave.ClientConsE120IpdCORES.AsString +' || '+ IntToStr(DmRave.ConsUsu120IpdQTDCOR.AsInteger)+' - '+DmRave.ConsUsu120IpdCOR001.AsString+'/'+DmRave.ConsUsu120IpdCOR002.AsString;
                      end;//4
                   DmRave.ConsUsu120Ipd.Next;
                 end;//2
                 DmRave.ClientConsE120Ipd.Post;

             DmRave.ClientConsE120Ipd.Next;
           end;//1
           DmRave.ClientConsE120Ipd.First;

        DmRave.RvImpressaoPedido.Execute;

     end;

end;

procedure TFPedido.BInserirClick(Sender: TObject);
begin
if EdDatEmi.Date = 0 then
   begin
     MessageDlg('Informe a Data de Emissão',mtWarning,[mbOK],0);
     ActiveControl := EdDatEmi;
   end
 else
     if trim(EdCodCli.Text) = '' then
        begin
           MessageDlg('Informe o Código do Cliente',mtWarning,[mbOK],0);
           ActiveControl := EdCodCli;
         end
     else
          if trim(EdCodCpg.Text) = '' then
             begin
               MessageDlg('Informe a Condição de Pagamento',mtWarning,[mbOK],0);
               ActiveControl := EdCodCpg;
             end
          else
            begin//1
              Dm1.CadE120PedCODEMP.Value := 1;
              Dm1.CadE120PedCODFIL.Value := 1;
              Dm1.CadE120PedNUMPED.Value := 0;
              Dm1.CadE120PedCODCLI.Value := Dm1.ValidaE085CliCODCLI.Value;
              Dm1.CadE120PedTNSPRO.Value := '90110';
              Dm1.CadE120PedDATEMI.Value := EdDatEmi.Date;
              Dm1.CadE120PedCODCPG.Value := Dm1.ValidaE028CpgCODCPG.Value;
              Dm1.CadE120PedCODREP.Value := Dm1.ValidaE085CliCODREP.Value;
              Dm1.CadE120PedSITPED.Value := '9';
              Dm1.CadE120PedUSUGER.Value := FPrincipal.vnCodusu;
              Dm1.CadE120PedDATGER.Value := date;
              Dm1.CadE120PedPEDENV.Value := 'N';
              Dm1.CadE120PedPEDCON.Value := 'N';
              Dm1.CadE120PedPRECAR.Value := 0;

              //se tiver inserindo ataliza o numero de controle que esta sendo usado
              if vaStatusE120Ped in [dsInsert] then
                 begin
                   Dm1.CadE100Usu.Close;
                   Dm1.CadE100Usu.ParamByName('CODUSU').Value := FPrincipal.vnCodusu;
                   Dm1.CadE100Usu.Open;
                   if not Dm1.CadE100Usu.IsEmpty then
                     begin
                       Dm1.CadE100Usu.Edit;
                       Dm1.CadE100UsuNUMPEDATU.Value := Dm1.CadE120PedNUMCON.Value;
                       Dm1.CadE100Usu.Post;
                     end;
                 end;

              Dm1.CadE120Ped.Post;
              Dm1.IBDTransacao.CommitRetaining;

              BInserir.Enabled := false;
              BCancelar.Enabled := false;
              BExcluir.Enabled := true;

              vaDatEmi := DateToStr(EdDatEmi.Date);
              vaCodCli := EdCodCli.Text;
              vaCodCpg := EdCodCpg.Text;
              EdNumConExit(Sender);
              ActiveControl := BAddProd;

            end;//1


end;

procedure TFPedido.BitBtn1Click(Sender: TObject);
begin
EdNumCon.Clear;
  EdNumConExit(Sender);
end;

procedure TFPedido.BNumConClick(Sender: TObject);
begin
   FConsultaPedido := TFConsultaPedido.Create(Self);
   FConsultaPedido.ShowModal;
   FreeAndNil(FConsultaPedido);
   ActiveControl := EdNumCon;
end;

procedure TFPedido.BObsClick(Sender: TObject);
begin

    if not Dm1.ConsE120Ped.IsEmpty then
       begin
          FObsPed := TFObsPed.Create(Self);
          FObsPed.ShowModal;
          FreeAndNil(FObsPed);
       end;

end;

procedure TFPedido.BSairClick(Sender: TObject);
begin
Close;
end;

procedure TFPedido.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
VAR cor : TColor;
begin
if not dm1.ConsE120Ipd.IsEmpty then
   begin//1

      if ((Column.Field.FieldName = 'CODPRO') or (Column.Field.FieldName = 'CODDER'))  then
        BEGIN//2
              cor := StringToColor(Dm1.ConsE120IpdCORGRID.AsString);
              DBGrid2.Canvas.Brush.Color:= cor;
              DBGrid2.Canvas.Font.Color := clBlack;
              DBGrid2.Canvas.Font.Style := [fsBold];
              //DBGrid.DefaultDrawDataCell(Rect,DBGrid.Columns[Datacol].Field,state);
              DBGrid2.DefaultDrawColumnCell(Rect, DataCol, Column, State);
        END;//2
   end;//1

     {  if (gdselected in State) then
    begin
      DBGrid2.Canvas.Font.Style  := [fsBold];
      DBGrid2.Canvas.FillRect(Rect);
    DBGrid2.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;}

end;




procedure TFPedido.DBGrid2Enter(Sender: TObject);
begin
KeyPreview := false;
end;

procedure TFPedido.DBGrid2Exit(Sender: TObject);
begin
KeyPreview := true;
end;

procedure TFPedido.DBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
  if (key = '+') and (BAddProd.Enabled = true) then
     begin
       BAddProd.Click;
     end
  else
   if (key = '-') and (BExcluiProd.Enabled = true) then
     begin
       BExcluiProd.Click;
     end;

end;

procedure TFPedido.DsE120PedStateChange(Sender: TObject);
begin
  if Dm1.CadE120Ped.State in [dsinsert,dsedit] then
     begin
       EdNumPed.Enabled := false;
       BNumPed.Enabled := false;
       BNumCon.Enabled := false;
       BAddProd.Enabled := false;
       BAltProd.Enabled := false;
       BExcluiProd.Enabled := false;
       BImprimir.Enabled := False;
     end
  else
     begin
       EdNumPed.Enabled := true;
       BNumPed.Enabled := true;
       BNumCon.Enabled := true;
       BImprimir.Enabled := True;
     end;

     //BImprimir.Enabled := Dm1.CadE120Ped.IsEmpty <> True;
     vaStatusE120Ped := Dm1.CadE120Ped.State;
end;

procedure TFPedido.EdCodCliExit(Sender: TObject);
var vaEndCli : string;
begin
if EdCodCli.Text <> '' then
      begin
         Dm1.ValidaE085Cli.Close;
         Dm1.ValidaE085Cli.ParamByName('codcli').Value := StrToInt(EdCodCli.Text);
         Dm1.ValidaE085Cli.Open;
         if Dm1.ValidaE085Cli.IsEmpty then
            begin
               Application.MessageBox('Cliente não encontrado','ERRO', MB_ICONERROR+MB_OK);
               EdCodCli.Clear;
               ActiveControl := EdCodCli;
               LCodRep.Caption := '';
            end
         else
            begin
              LDsCodCli.Caption := Dm1.ValidaE085CliNOMCLI.Value;
              vaEndCli := Dm1.ValidaE085CliAPECLI.Value +'  -  '+
              Dm1.ValidaE085CliENDCLI.Value+'  -  '+
              Dm1.ValidaE085CliNENCLI.Value+'  -  '+
              Dm1.ValidaE085CliBAICLI.Value+'  -  '+
              Dm1.ValidaE085CliCIDCLI.Value+'  -  '+
              Dm1.ValidaE085CliSIGUFS.Value+'  -  '+
              Dm1.ValidaE085CliFONCLI.Value;
              LEndCli.Caption := vaEndCli;
              EdCodRep.Text := IntToStr(Dm1.ValidaE085CliCODREP.Value);



              //verifica se houve alterações
              if (BInserir.Enabled <> true) and (trim(EdNumCon.Text) <> '') and not (Dm1.ConsE120Ped.IsEmpty) then
                 begin
                   vaAlteracao := FPedido.AnalizaAlteracao;
                   if vaAlteracao = 'S' then
                      BAlterar.Enabled := true
                   else
                      BAlterar.Enabled := false;
                 end;



            end;

      end;
end;

procedure TFPedido.EdCodCliKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_F3 then
       begin
         BCodCli.Click;
       end;
end;

procedure TFPedido.EdCodCliKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in [#48..#57]) and not (key in [#8])
      and not (key in [#240]) then
      key := #0;
end;

procedure TFPedido.EdCodCpgExit(Sender: TObject);
begin
  if trim(EdCodCpg.Text) <> '' then
     begin
        Dm1.ValidaE028Cpg.Close;
        Dm1.ValidaE028Cpg.ParamByName('codcpg').Value := trim(EdCodCpg.Text);
        Dm1.ValidaE028Cpg.ParamByName('codusu').Value := FPrincipal.vnCodusu;
        Dm1.ValidaE028Cpg.Open;
        if (Dm1.ValidaE028Cpg.IsEmpty) and (vaOrigem = 'MENU') then
           begin
              Application.MessageBox('Condição de pagamento não encontrada ou inativada!','ERRO', MB_ICONERROR+MB_OK);
              ActiveControl := EdCodCpg;
              EdCodCpg.Clear;
              LDsCodCpg.Caption := '';
           end
        else
          if (Dm1.ValidaE028CpgSITCPG.Value = 'I') and (vaOrigem = 'MENU') then
             begin
               Application.MessageBox('Condição de pagamento não encontrada ou inativada!','ERRO', MB_ICONWARNING+MB_OK);
               ActiveControl := EdCodCpg;
               EdCodCpg.Clear;
               LDsCodCpg.Caption := '';
             end
          else
            begin
              LDsCodCpg.Caption := Dm1.ValidaE028CpgDESCPG.Value;

              //verifica se houve alterações
            if (BInserir.Enabled <> true) and (trim(EdNumCon.Text) <> '') and not (Dm1.ConsE120Ped.IsEmpty) then
              begin
              vaAlteracao := FPedido.AnalizaAlteracao;
              if vaAlteracao = 'S' then
                 BAlterar.Enabled := true
              else
                BAlterar.Enabled := false;
              end;
            
            end;

          

     end;

end;

procedure TFPedido.EdCodCpgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_F3 then
       begin
         BCodCpg.Click;
       end;
end;

procedure TFPedido.EdCodCpgKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in [#48..#57]) and not (key in [#8])
      and not (key in [#240]) then
      key := #0;
end;

procedure TFPedido.EdCodRepExit(Sender: TObject);
begin
  ActiveControl := EdNumCon;
end;

procedure TFPedido.EdDatEmiExit(Sender: TObject);
begin

//verifica se houve alterações
if (BInserir.Enabled <> true) and (trim(EdNumCon.Text) <> '') and not (Dm1.ConsE120Ped.IsEmpty) then
   begin
     vaAlteracao := FPedido.AnalizaAlteracao;
     if vaAlteracao = 'S' then
        BAlterar.Enabled := true
     else
        BAlterar.Enabled := false;
   end;

end;

procedure TFPedido.EdNumConExit(Sender: TObject);
begin
  if trim(EdNumCon.Text) <> '' then
    begin//1
      if trim(EdNumCon.Text) = '0' then
         begin//2
           EdDatEmi.Date := date;
           BInserir.Enabled := true;
           BCancelar.Enabled := true;
           BAlterar.Enabled := false;
           BExcluir.Enabled := false;
           LDsSitPed.Caption := '9 - Não Fechado';
           EdCodCli.Clear;
           LDsCodCli.Caption := '';
           LEndCli.Caption := '';
           EdCodCpg.Clear;
           LDsCodCpg.Caption := '';
           edVolAbe.Clear;
           EdVolPed.Clear;
           EdVlrBru.Clear;
           edVlrLiq.Clear;
           EdVlrCom.Clear;
           LPedEnv.Caption := '';
           LPedCon.Caption := '';
           BEnviar.Enabled := false;
           {if FPrincipal.vnCodRep <> 0 then
              EdCodRep.Clear;}


            Dm1.CadE120Ped.Open;
            Dm1.CadE120Ped.Insert;

            //busca o ultimo numero de controle
            Dm1.ConsGeral.Close;
            Dm1.ConsGeral.SQL.Clear;
            Dm1.ConsGeral.SQL.Add('select e100usu.numpedatu');
            Dm1.ConsGeral.SQL.Add(' from e100usu');
            Dm1.ConsGeral.SQL.Add(' where codusu = :CODUSU');
            Dm1.ConsGeral.SQL.Add(' and numpedatu < numpedfim');
            Dm1.ConsGeral.ParamByName('CODUSU').Value := FPrincipal.vnCodusu;
            Dm1.ConsGeral.Open;
            if Dm1.ConsGeral.IsEmpty then
               begin
                 Application.MessageBox('entre em contato com a empresa e solicite uma nova faixa de numeração','ERRO', MB_ICONERROR+MB_OK);
                 Abort;
               end
            else
               begin
                 Dm1.CadE120PedNUMCON.Value := Dm1.ConsGeral.FieldByName('NUMPEDATU').AsInteger + 1;
               end;

            {Dm1.UltNumConE120Ped.Close;
            Dm1.UltNumConE120Ped.Open;
            if Dm1.UltNumConE120Ped.IsEmpty then
                 Dm1.CadE120PedNUMCON.Value := 1
            else
               Dm1.CadE120PedNUMCON.Value := Dm1.UltNumConE120PedULTIMO.Value + 1;}


            EdNumCon.Text := IntToStr(Dm1.CadE120PedNUMCON.Value);

            //consulta os produtos do pedido para limpar a grid
            Dm1.ConsE120Ipd.Close;
            Dm1.ConsE120Ipd.ParamByName('numcon').Value := 9999999;
            Dm1.ConsE120Ipd.ParamByName('codrep').Value := 9999999;
            Dm1.ConsE120Ipd.Open;

            //consulta as cores dos produtos para limpar a grid
            dm1.ConsUsu120Ipd.Close;
            dm1.ConsUsu120Ipd.ParamByName('codemp').Value := dm1.ConsE120IpdCODEMP.Value;
            dm1.ConsUsu120Ipd.ParamByName('codfil').Value := dm1.ConsE120IpdCODFIL.Value;
            dm1.ConsUsu120Ipd.ParamByName('numcon').Value := dm1.ConsE120IpdNUMCON.Value;
            dm1.ConsUsu120Ipd.ParamByName('codrep').Value := dm1.ConsE120IpdCODREP.Value;
            dm1.ConsUsu120Ipd.ParamByName('seqipd').Value := dm1.ConsE120IpdSEQIPD.Value;
            dm1.ConsUsu120Ipd.Open;

            BAddProd.Enabled := false;
            BAltProd.Enabled := false;
            BExcluiProd.Enabled := false;
            BObs.Enabled := false;

         end//2
      else
         begin//3
            if BInserir.Enabled = true then
               begin
                  Dm1.CadE120Ped.Cancel;
                  BInserir.Enabled := false;
                  BCancelar.Enabled := false;

               end;

             //consulta o pedido
             Dm1.ConsE120Ped.Close;
             Dm1.ConsE120Ped.SQL.Clear;
             Dm1.ConsE120Ped.SQL.Add('select e120ped.* from e120ped');
             Dm1.ConsE120Ped.SQL.Add(' where');
             Dm1.ConsE120Ped.SQL.Add(' e120ped.codemp = 1 and');
             Dm1.ConsE120Ped.SQL.Add(' e120ped.codfil = 1 and');
             Dm1.ConsE120Ped.SQL.Add(' e120ped.numcon = :numcon and');
             Dm1.ConsE120Ped.SQL.Add(' e120ped.codrep = :codrep');
             Dm1.ConsE120Ped.ParamByName('numcon').Value := StrToInt(trim(EdNumCon.Text));

             if FPrincipal.vnCodRep <> 0 then
                Dm1.ConsE120Ped.ParamByName('codrep').Value := FPrincipal.vnCodRep
             else
                begin
                  if trim(EdCodRep.Text) = ''  then
                     begin
                       ShowMessage('Informe o Representante');
                       ActiveControl := EdCodRep;
                       abort;
                     end
                  else
                    Dm1.ConsE120Ped.ParamByName('codrep').Value := StrToInt(trim(EdCodRep.Text));
                end;

             Dm1.ConsE120Ped.Open;
             if not Dm1.ConsE120Ped.IsEmpty then
                begin//4
                  EdNumPed.Text := IntToStr(Dm1.ConsE120PedNUMPED.Value);
                  EdDatEmi.Date := Dm1.ConsE120PedDATEMI.Value;
                  EdCodCli.Text := IntToStr(Dm1.ConsE120PedCODCLI.Value);
                  EdCodCliExit(Sender);
                  EdCodCpg.Text := Dm1.ConsE120PedCODCPG.Value;
                  EdCodCpgExit(Sender);
                  if Dm1.ConsE120PedSITPED.Value = '1' then
                     LDsSitPed.Caption := '1 - Aberto Total'
                  else if Dm1.ConsE120PedSITPED.Value = '2' then
                          LDsSitPed.Caption := 'Aberto Parcial'
                       else if Dm1.ConsE120PedSITPED.Value = '3' then
                               LDsSitPed.Caption := 'Suspenso'
                            else if Dm1.ConsE120PedSITPED.Value = '4' then
                                    LDsSitPed.Caption := 'Liquidado'
                                  else if Dm1.ConsE120PedSITPED.Value = '5' then
                                          LDsSitPed.Caption := 'Cancelado'
                                       else if Dm1.ConsE120PedSITPED.Value = '8' then
                                               LDsSitPed.Caption := 'Preparação Analise ou Nf'
                                            else if Dm1.ConsE120PedSITPED.Value = '9' then
                                                    LDsSitPed.Caption := 'Não Fechado';

                //consulta os produtos do pedido
                Dm1.ConsE120Ipd.Close;
                Dm1.ConsE120Ipd.ParamByName('numcon').Value := Dm1.ConsE120PedNUMCON.Value;
                Dm1.ConsE120Ipd.ParamByName('codrep').Value := Dm1.ConsE120PedCODREP.Value;
                Dm1.ConsE120Ipd.Open;
                Dm1.ConsE120Ipd.First;
                vnVolPed := 0;
                vnVolAbe := 0;
                vnVlrBru := 0;
                vnVlrLiq := 0;
                vnVlrCom := 0;
                while not Dm1.ConsE120Ipd.Eof do
                   begin
                     vnVolPed := vnVolPed + (Dm1.ConsE120IpdQTDPED.Value * Dm1.ConsE120IpdVOLDER.Value);
                     vnVolAbe := vnVolAbe + (Dm1.ConsE120IpdQTDABE.Value * Dm1.ConsE120IpdVOLDER.Value);
                     vnVlrBru := vnVlrBru + Dm1.ConsE120IpdVLRBRU.Value;
                     vnVlrLiq := vnVlrLiq + Dm1.ConsE120IpdVLRLIQ.Value;
                     vnVlrCom := vnVlrCom + Dm1.ConsE120IpdVLRCOM.Value;
                     Dm1.ConsE120Ipd.Next;
                   end;
                    EdVolPed.Value := vnVolPed;
                    edVolAbe.Value := vnVolAbe;
                    EdVlrBru.Value := vnVlrBru;
                    edVlrLiq.Value := vnVlrLiq;
                    EdVlrCom.Value := vnVlrCom;

                vaDatEmi := DateToStr(EdDatEmi.Date);
                vaCodCli := EdCodCli.Text;
                vaCodCpg := EdCodCpg.Text;
                BAlterar.Enabled := false;
                BExcluir.Enabled := true;

                BAddProd.Enabled := true;
                BAltProd.Enabled := true;
                BExcluiProd.Enabled := true;
                BObs.Enabled := true;

                if Dm1.ConsE120PedPEDENV.Value = 'N' then
                   begin
                     LPedEnv.Caption := '';
                     BEnviar.Enabled := true;
                   end
                else
                   begin
                     LPedEnv.Caption := 'ENVIADO';
                     BEnviar.Enabled := false;
                   end;

                if Dm1.ConsE120PedPEDCON.Value = 'N' then
                   LPedCon.Caption := ''
                else
                   LPedCon.Caption := 'LIBERADO';


                end//4
             else
                begin//5
                  EdNumPed.Clear;
                  EdDatEmi.Date := 0;
                  EdCodCli.Clear;
                  LDsCodCli.Caption := '';
                  EdCodCpg.Clear;
                  LDsCodCpg.Caption := '';
                  LDsSitPed.Caption := '';
                  LEndCli.Caption := '';
                  BAlterar.Enabled := false;
                  BExcluir.Enabled := false;
                  BObs.Enabled := false;
                  //consulta os produtos do pedido
                  Dm1.ConsE120Ipd.Close;
                  Dm1.ConsE120Ipd.ParamByName('numcon').Value := 9999999;
                  Dm1.ConsE120Ipd.ParamByName('codrep').Value := 9999999;
                  Dm1.ConsE120Ipd.Open;

                  //consulta as cores dos produtos para limpar a grid
                  dm1.ConsUsu120Ipd.Close;
                  dm1.ConsUsu120Ipd.ParamByName('codemp').Value := dm1.ConsE120IpdCODEMP.Value;
                  dm1.ConsUsu120Ipd.ParamByName('codfil').Value := dm1.ConsE120IpdCODFIL.Value;
                  dm1.ConsUsu120Ipd.ParamByName('numcon').Value := dm1.ConsE120IpdNUMCON.Value;
                  dm1.ConsUsu120Ipd.ParamByName('codrep').Value := dm1.ConsE120IpdCODREP.Value;
                  dm1.ConsUsu120Ipd.ParamByName('seqipd').Value := dm1.ConsE120IpdSEQIPD.Value;
                  dm1.ConsUsu120Ipd.Open;

                  EdVolPed.Clear;
                  edVolAbe.Clear;
                  EdVlrBru.Clear;
                  edVlrLiq.Clear;
                  EdVlrCom.Clear;

                  BAddProd.Enabled := false;
                  BAltProd.Enabled := false;
                  BExcluiProd.Enabled := false;

                  LPedEnv.Caption := '';
                  LPedCon.Caption := '';
                  BEnviar.Enabled := false;
                end;//5
             BInserir.Enabled := false;
             BCancelar.Enabled := false;

         end;//3
    end//1
  else
    begin//6
      EdNumPed.Clear;
      EdDatEmi.Date := 0;
      EdCodCli.Clear;
      LDsCodCli.Caption := '';
      EdCodCpg.Clear;
      LDsCodCpg.Caption := '';
      LDsSitPed.Caption := '';
      LEndCli.Caption := '';

      //consulta os produtos do pedido
      Dm1.ConsE120Ipd.Close;
      Dm1.ConsE120Ipd.ParamByName('numcon').Value := 9999999;
      Dm1.ConsE120Ipd.ParamByName('codrep').Value := 9999999;
      Dm1.ConsE120Ipd.Open;

      //consulta as cores dos produtos para limpar a grid
      dm1.ConsUsu120Ipd.Close;
      dm1.ConsUsu120Ipd.ParamByName('codemp').Value := dm1.ConsE120IpdCODEMP.Value;
      dm1.ConsUsu120Ipd.ParamByName('codfil').Value := dm1.ConsE120IpdCODFIL.Value;
      dm1.ConsUsu120Ipd.ParamByName('numcon').Value := dm1.ConsE120IpdNUMCON.Value;
      dm1.ConsUsu120Ipd.ParamByName('codrep').Value := dm1.ConsE120IpdCODREP.Value;
      dm1.ConsUsu120Ipd.ParamByName('seqipd').Value := dm1.ConsE120IpdSEQIPD.Value;
      dm1.ConsUsu120Ipd.Open;

      EdVolPed.Clear;
      edVolAbe.Clear;
      EdVlrBru.Clear;
      edVlrLiq.Clear;
      EdVlrCom.Clear;

      BInserir.Enabled := false;
      BCancelar.Enabled := false;
      BAlterar.Enabled := false;
      BExcluir.Enabled := false;
      BObs.Enabled := false;

      Dm1.CadE120Ped.Cancel;

      BAddProd.Enabled := false;
      BAltProd.Enabled := false;
      BExcluiProd.Enabled := false;

      LPedEnv.Caption := '';
      LPedCon.Caption := '';
      BEnviar.Enabled := false;
    end;//6


end;

procedure TFPedido.EdNumConKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

if (key = vk_F3) and (BNumCon.Enabled = true) then
       begin
         BNumCon.Click;
       end;
end;

procedure TFPedido.EdNumPedExit(Sender: TObject);
begin
    if (trim(EdNumPed.Text) <> '') and (trim(EdNumPed.Text) <> '0') then
       begin//1
          ConsNumPedEmp.Close;
          ConsNumPedEmp.ParamByName('numped').Value := StrToInt(Trim(EdNumPed.Text));
          ConsNumPedEmp.Open;
          if not ConsNumPedEmp.IsEmpty then
             begin
               EdNumCon.Text := IntToStr(ConsNumPedEmpNUMCON.Value);
               EdNumConExit(Sender);
             end
          else
            begin
               Application.MessageBox('Pedido não encontrado!','ERRO', MB_ICONWARNING+MB_OK);
               ActiveControl := EdNumPed;
               EdNumPed.Clear;
            end;


       end;//1
end;

procedure TFPedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = VK_UP then
    SelectNext(ActiveControl,false,true);
  if key = VK_DOWN then
    SelectNext(ActiveControl, true, true);
end;

procedure TFPedido.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
    begin
      key := #0;
      Perform (Wm_NextDlgCtl,0,0);
    end;

    if (key = '+') and (BAddProd.Enabled = true) then
     begin
       BAddProd.Click;
     end
  else
   if (key = '-') and (BExcluiProd.Enabled = true) then
     begin
       BExcluiProd.Click;
     end;
end;

procedure TFPedido.FormShow(Sender: TObject);
begin
{esta tela pode ser chamada do menu ou da tela de acompanhamento dos pedidos}
if vaOrigem = 'MENU' then
  begin//1
    vnVolPed := 0;
    vnVolAbe := 0;
    vnVlrBru := 0;
    vnVlrLiq := 0;
    vnVlrCom := 0;

    if FPrincipal.vnCodRep <> 0 then
       EdCodRep.Text := IntToStr(FPrincipal.vnCodRep)
    else
       EdCodRep.Clear;

    EdNumCon.Clear;
    EdNumConExit(Sender);

    Dm1.CadE120Ped.Open;
    ActiveControl := EdNumCon;
  end
else
  begin
    EdNumCon.Enabled := False;
    EdNumPed.Enabled := False;
    EdCodCli.Enabled := False;
    EdCodCpg.Enabled := False;
    EdCodRep.Enabled := false;
    EdDatEmi.Enabled := False;
    BNumCon.Enabled := False;
    BNumPed.Enabled := false;
    BCodCli.Enabled := False;
    BCodCpg.Enabled := False;
  end;

end;

procedure TFPedido.Panel4Exit(Sender: TObject);
begin
  ActiveControl := Panel2;
end;

end.
