unit UEnviaPedidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB, IBCustomDataSet, IBQuery,IniFiles,
  IdHTTP, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP, ComCtrls;

type
  TFEnviaPedidos = class(TForm)
    DBGrid1: TDBGrid;
    BEnviar: TBitBtn;
    ConsE120PedEnv: TIBQuery;
    ConsE120PedEnvNUMCON: TIntegerField;
    ConsE120PedEnvDATEMI: TDateField;
    DsConsE120PedEnv: TDataSource;
    Label1: TLabel;
    ConsE120PedEnvCODEMP: TIntegerField;
    ConsE120PedEnvCODFIL: TIntegerField;
    ConsE120PedEnvNUMPED: TIntegerField;
    ConsE120PedEnvCODCLI: TIntegerField;
    ConsE120PedEnvTNSPRO: TIBStringField;
    ConsE120PedEnvCODREP: TIntegerField;
    ConsE120PedEnvCODCPG: TIBStringField;
    ConsE120PedEnvQTDORI: TFloatField;
    ConsE120PedEnvQTDABE: TFloatField;
    ConsE120PedEnvVLRBIP: TFloatField;
    ConsE120PedEnvVLRIPI: TFloatField;
    ConsE120PedEnvVLRBIC: TFloatField;
    ConsE120PedEnvVLRICM: TFloatField;
    ConsE120PedEnvVLRBCO: TFloatField;
    ConsE120PedEnvVLRCOM: TFloatField;
    ConsE120PedEnvVLRLIQ: TFloatField;
    ConsE120PedEnvVLRORI: TFloatField;
    ConsE120PedEnvSITPED: TIBStringField;
    ConsE120PedEnvUSUGER: TIntegerField;
    ConsE120PedEnvDATGER: TDateField;
    ConsE120PedEnvPEDENV: TIBStringField;
    ConsE120PedEnvDATENV: TDateField;
    ConsE120PedEnvPEDCON: TIBStringField;
    ConsE120PedEnvDATCON: TDateField;
    ConsE120PedEnvUSUCON: TIntegerField;
    Ftp: TIdFTP;
    IdHTTP1: TIdHTTP;
    ConsE120PedCon: TIBQuery;
    ConsE120PedConCODEMP: TIntegerField;
    ConsE120PedConCODFIL: TIntegerField;
    ConsE120PedConNUMPED: TIntegerField;
    ConsE120PedConNUMCON: TIntegerField;
    ConsE120PedConCODCLI: TIntegerField;
    ConsE120PedConTNSPRO: TIBStringField;
    ConsE120PedConDATEMI: TDateField;
    ConsE120PedConCODREP: TIntegerField;
    ConsE120PedConCODCPG: TIBStringField;
    ConsE120PedConQTDORI: TFloatField;
    ConsE120PedConQTDABE: TFloatField;
    ConsE120PedConVLRBIP: TFloatField;
    ConsE120PedConVLRIPI: TFloatField;
    ConsE120PedConVLRBIC: TFloatField;
    ConsE120PedConVLRICM: TFloatField;
    ConsE120PedConVLRBCO: TFloatField;
    ConsE120PedConVLRCOM: TFloatField;
    ConsE120PedConVLRLIQ: TFloatField;
    ConsE120PedConVLRORI: TFloatField;
    ConsE120PedConSITPED: TIBStringField;
    ConsE120PedConUSUGER: TIntegerField;
    ConsE120PedConDATGER: TDateField;
    ConsE120PedConPEDENV: TIBStringField;
    ConsE120PedConDATENV: TDateField;
    ConsE120PedConPEDCON: TIBStringField;
    ConsE120PedConDATCON: TDateField;
    ConsE120PedConUSUCON: TIntegerField;
    DsConsE120PedCon: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure BEnviarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEnviaPedidos: TFEnviaPedidos;

implementation

uses UDm1, UPrincipal, UDmFireRep;

{$R *.dfm}

procedure TFEnviaPedidos.BEnviarClick(Sender: TObject);
var ArqE120Ped,ArqE120Ipd,ArqUsu120Ipd,ArqE120Obs : TextFile;
dir,nome,destino : string;
    ArqIni : TIniFile;
    vaHost, vaUsuario, vaSenha : string;
    vbEnviado : boolean;
    cursor : TCursor;
    vaNomArq : string;
    vnNovaFaixaNumCon : Integer;
begin
if not ConsE120PedEnv.IsEmpty then
   begin//1
      if Application.MessageBox('Deseja realmente enviar o(s) pedido(s)?','Confirmação',MB_ICONQUESTION+MB_YESNO) = mrYes then
        begin//2
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
              //percorre os pedidos
              ConsE120PedEnv.First;
              while not ConsE120PedEnv.Eof do
                begin
                        //consulta o pedido, dados gerais e120ped
                        Dm1.ConsE120Ped.Close;
                        Dm1.ConsE120Ped.SQL.Clear;
                        Dm1.ConsE120Ped.SQL.Add('select e120ped.* from e120ped');
                        Dm1.ConsE120Ped.SQL.Add(' where');
                        Dm1.ConsE120Ped.SQL.Add(' e120ped.codemp = 1 and');
                        Dm1.ConsE120Ped.SQL.Add(' e120ped.codfil = 1 and');
                        Dm1.ConsE120Ped.SQL.Add(' e120ped.numcon = :numcon and');
                        Dm1.ConsE120Ped.SQL.Add(' e120ped.codrep = :codrep');
                        Dm1.ConsE120Ped.ParamByName('numcon').Value := ConsE120PedEnvNUMCON.Value;
                        Dm1.ConsE120Ped.ParamByName('codrep').Value := ConsE120PedEnvCODREP.Value;
                        Dm1.ConsE120Ped.Open;

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


                       //consulta os produtos do pedido
                       Dm1.ConsE120Ipd.Close;
                       Dm1.ConsE120Ipd.ParamByName('numcon').Value := ConsE120PedEnvNUMCON.Value;
                       Dm1.ConsE120Ipd.ParamByName('codrep').Value := ConsE120PedEnvCODREP.Value;
                       Dm1.ConsE120Ipd.Open;
                       Dm1.ConsE120Ipd.First;
                       while not Dm1.ConsE120Ipd.Eof  do
                         begin//4

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


                           { Dm1.ConsUsu120Ipd.First;
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
                                         DmFireRep.CadUsu120IpdNUMPED.Value := Dm1.ConsUsu120IpdNUMPED.Value;
                                         DmFireRep.CadUsu120IpdCODFIL.Value := Dm1.ConsUsu120IpdCODFIL.Value;
                                         DmFireRep.CadUsu120IpdNUMCON.Value := Dm1.ConsUsu120IpdNUMCON.Value;
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
                         end;//4

                       //grava as observações
                       Dm1.ConsE120Obs.Close;
                       Dm1.ConsE120Obs.ParamByName('codemp').Value := ConsE120PedEnvCODEMP.Value;
                       Dm1.ConsE120Obs.ParamByName('codfil').Value := ConsE120PedEnvCODFIL.Value;
                       Dm1.ConsE120Obs.ParamByName('numcon').Value := ConsE120PedEnvNUMCON.Value;
                       Dm1.ConsE120Obs.ParamByName('codrep').Value := ConsE120PedEnvCODREP.Value;
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


                  ConsE120PedEnv.Next;
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
                            Dm1.IBDTransacao.CommitRetaining;
                          end;
                     end;
               end;


               //se os pedidos foram enviados com sucesso atualiza sua situaçao para enviado
               ConsE120PedEnv.First;
               while not ConsE120PedEnv.Eof do
                 begin//11

                        Dm1.CadE120Ped.Close;
                        Dm1.CadE120Ped.ParamByName('codemp').Value := ConsE120PedEnvCODEMP.Value;
                        Dm1.CadE120Ped.ParamByName('codfil').Value := ConsE120PedEnvCODFIL.Value;
                        Dm1.CadE120Ped.ParamByName('numcon').Value := ConsE120PedEnvNUMCON.Value;
                        Dm1.CadE120Ped.ParamByName('codrep').Value := ConsE120PedEnvCODREP.Value;
                        Dm1.CadE120Ped.Open;
                        if not Dm1.CadE120Ped.IsEmpty then
                           begin
                             Dm1.CadE120Ped.Edit;
                             Dm1.CadE120PedPEDENV.Value := 'S';
                             Dm1.CadE120PedDATENV.Value := date;

                             Dm1.CadE120Ped.Post;
                             Dm1.IBDTransacao.CommitRetaining;

                           end;


                    ConsE120PedEnv.Next;
                 end;//11
                ConsE120PedEnv.Close;
                ConsE120PedEnv.Open;

                ConsE120PedCon.Close;
                ConsE120PedCon.Open;

               DmFireRep.Banco.Connected := False;
               MessageDlg('Pedido enviado com sucesso!',mtInformation,[mbok],0);

           Screen.Cursor := cursor;
        end;//2
   end;//1

end;

procedure TFEnviaPedidos.FormShow(Sender: TObject);
begin
  ConsE120PedEnv.Close;
  ConsE120PedEnv.Open;

  ConsE120PedCon.Close;
  ConsE120PedCon.Open;
end;

end.
