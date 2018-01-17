unit UAtualiza;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, IdExplicitTLSClientServerBase, IdFTP,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,IniFiles,
  Gauges, Mask, rxToolEdit, rxCurrEdit, ComCtrls, jpeg, AppEvnts, DateUtils;

type
  TFAtualiza = class(TForm)
    BAtuclientes: TBitBtn;
    Panel1: TPanel;
    IdHTTP1: TIdHTTP;
    Ftp: TIdFTP;
    BCondCpg: TBitBtn;
    BProdutos: TBitBtn;
    BCores: TBitBtn;
    BLigDerCor: TBitBtn;
    BTabPreco: TBitBtn;
    BPedidos: TBitBtn;
    ChClientes: TCheckBox;
    ChCondPgto: TCheckBox;
    ChProdutos: TCheckBox;
    ChTabPreco: TCheckBox;
    StatusClientes: TGauge;
    StatusCondPgto: TGauge;
    statusProdutos: TGauge;
    statusTabPreco: TGauge;
    statusPedidos: TGauge;
    ChPedidos: TCheckBox;
    BComandSql: TBitBtn;
    StatusBar1: TStatusBar;
    Image1: TImage;
    BAtualiza: TBitBtn;
    BTitulos: TBitBtn;
    statusTitulos: TGauge;
    ChTitulos: TCheckBox;
    btnBAtuclientes_: TBitBtn;
    btnBProdutos_: TBitBtn;
    btnBCores_: TBitBtn;
    btnBCondCpg_: TBitBtn;
    btnBTabPreco_: TBitBtn;
    btnBLigDerCor_: TBitBtn;
    btnBTitulos_: TBitBtn;
    btnPedidos: TBitBtn;
    ApplicationEvents1: TApplicationEvents;
    LStatus: TLabel;
    Label1: TLabel;
    edtFaixaPedidos: TCurrencyEdit;
    btnLigDerCorOracle: TBitBtn;
    btnProdutosOracle: TBitBtn;
    tmr1: TTimer;
    procedure BConectarClick(Sender: TObject);
    procedure EdHostExit(Sender: TObject);
    procedure EdUsuarioExit(Sender: TObject);
    procedure EdSenhaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BAtuclientesClick(Sender: TObject);
    procedure BAtualizaClick(Sender: TObject);
    procedure BCondCpgClick(Sender: TObject);
    procedure BProdutosClick(Sender: TObject);
    procedure BCoresClick(Sender: TObject);
    procedure BLigDerCorClick(Sender: TObject);
    procedure BTabPrecoClick(Sender: TObject);
    procedure BPedidosClick(Sender: TObject);
    procedure BComandSqlClick(Sender: TObject);
    procedure FtpDisconnected(Sender: TObject);
    procedure FtpStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: string);
    procedure BTitulosClick(Sender: TObject);
    procedure btnBAtuclientes_Click(Sender: TObject);
    procedure btnBProdutos_Click(Sender: TObject);
    procedure btnBCores_Click(Sender: TObject);
    procedure btnBCondCpg_Click(Sender: TObject);
    procedure btnBTabPreco_Click(Sender: TObject);
    procedure btnBLigDerCor_Click(Sender: TObject);
    procedure btnBTitulos_Click(Sender: TObject);
    procedure btnPedidosClick(Sender: TObject);
    procedure btnLigDerCorOracleClick(Sender: TObject);
    procedure btnProdutosOracleClick(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);

  private
    { Private declarations }
    vaHost, vaUsuario, vaSenha : string;
  public
    { Public declarations }
    vaAtualizar : string;
  end;

var
  FAtualiza: TFAtualiza;

implementation

uses UPrincipal, UDm1, UDmFireRep, UDmOra;

{$R *.dfm}


procedure TFAtualiza.BAtuclientesClick(Sender: TObject);
var dir,nome,destino : string;
    nome2,destino2 : string;
    linha : string;
    vaCodCli,vaNomCli,vaApecli,vaInsEst,vaCgcCpf,
    vaEndCli,vaNemCli,vaCplEnd,vaCepCli,vaBaiCli,
    vaCidCli,vaSigUfs,vaSitCli : string;

    vaCodEmp,vaCodFil,vaCodRep,vaSalDup,vaDatMac,vaVlrMac,vaDatUpe,vaVlrUpe,
    vaDatUfa,vaVlrUfa,vaDatUpg,vaVlrUpg,vaQtdPgt,vaDatMfa,vaVlrMfa,vaDatAtr,
    vaVlrAtr,vaMaiAtr,vaUltNfv,vaFonCli : string;

    vaCaracter : string;
    vnVlrDup : Currency;

    arq : TextFile;

    I : integer;

    vnQtdClientes : TStringList;
    vnQtdCli : integer;
begin
if not ftp.Connected then
  begin
    MessageDlg('Sistema desconectado..',mtWarning,[mbok],0);

  end
  else
    begin//1
   try
     StatusBar1.Panels[1].Text := 'Baixando arquivo _E085CLI..';
      dir := '/ArqAtu'; //onde esta o arquivo no servidor
      ftp.ChangeDir(dir);


      Refresh;
      Nome := IntToStr(FPrincipal.vnCodusu)+'_E085CLI.txt'; //nome do arquivo
      destino := 'C:\SysRep\ArqFtp\ArqAtu\'; //onde vai jogar o arquivo/nome_do_arquivo.extençao
      destino := destino + IntToStr(FPrincipal.vnCodusu)+'_E085CLI.txt';
      ftp.Get(Nome, destino, true);

      StatusBar1.Panels[1].Text := '';

  Except
     MessageDlg('Erro na transferência do arquivo de configuração!',mtWarning,[mbok],0);
     abort;
   end; //fim do except

  //le o arquivo recebido e grava seus dados  E085CLI
   if FileExists(destino) then
      begin//2
      //conta a quantidade de linhas do arquivo
      vnQtdClientes := TStringList.Create;
      try
        vnQtdClientes.LoadFromFile(destino);
        vnQtdCli := vnQtdClientes.Count;
      finally
         vnQtdClientes.Free;
         StatusClientes.MaxValue := vnQtdCli;
         StatusClientes.Progress := 0;
      end;
         Refresh;
         AssignFile(arq, destino);
         Reset(arq);
         While not Eof(arq) do
           begin//3
              vaCodCli := ''; vaNomCli := ''; vaApecli := ''; vaInsEst := ''; vaCgcCpf := '';
              vaEndCli := ''; vaNemCli := ''; vaCplEnd := ''; vaCepCli := ''; vaBaiCli := '';
              vaCidCli := ''; vaSigUfs := ''; vaSitCli := ''; vaCodEmp := ''; vaCodFil := '';
              vaCodRep := ''; vaSalDup := ''; vaDatMac := ''; vaVlrMac := ''; vaDatUpe := '';
              vaVlrUpe := ''; vaDatUfa := ''; vaVlrUfa := ''; vaDatUpg := ''; vaVlrUpg := '';
              vaQtdPgt := ''; vaDatMfa := ''; vaVlrMfa := ''; vaDatAtr := ''; vaVlrAtr := '';
              vaMaiAtr := ''; vaUltNfv := ''; vaFonCli := '';
              Readln(arq, linha);
              I := 1;
              while I < Length(linha) do
                begin//6
                  vaCaracter := linha[I];
                  while linha[I] <> ';' do
                    begin
                       vaCodCli := vaCodCli + linha[i];
                       I := I + 1;
                       vaCaracter := linha[I];
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                      vaNomCli := vaNomCli + linha[i];
                      I := I + 1;
                      vaCaracter := linha[I];
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                      vaApecli := vaApecli + linha[i];
                      I := I + 1;
                      vaCaracter := linha[I];
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                      vaInsEst := vaInsEst + linha[i];
                      I := I + 1;
                      vaCaracter := linha[I];
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                      vaCgcCpf := vaCgcCpf + linha[i];
                      I := I + 1;
                      vaCaracter := linha[I];
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                      vaEndCli := vaEndCli + linha[i];
                      I := I + 1;
                      vaCaracter := linha[I];
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                      vaNemCli := vaNemCli + linha[i];
                      I := I + 1;
                      vaCaracter := linha[I];
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                      vaCplEnd := vaCplEnd + linha[i];
                      I := I + 1;
                      vaCaracter := linha[I];
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                      vaCepCli := vaCepCli + linha[i];
                      I := I + 1;
                      vaCaracter := linha[I];
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                      vaBaiCli := vaBaiCli + linha[i];
                      I := I + 1;
                      vaCaracter := linha[I];
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                      vaCidCli := vaCidCli + linha[i];
                      I := I + 1;
                      vaCaracter := linha[I];
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                      vaSigUfs := vaSigUfs + linha[i];
                      I := I + 1;
                      vaCaracter := linha[I];
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                      vaFonCli := vaFonCli + linha[i];
                      I := I + 1;
                      vaCaracter := linha[I];
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                      vaSitCli := vaSitCli + linha[i];
                      I := I + 1;
                      vaCaracter := linha[I];
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                      vaCodEmp := vaCodEmp + linha[i];
                      I := I + 1;
                      vaCaracter := linha[I];
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                      vaCodFil := vaCodFil + linha[i];
                      I := I + 1;
                      vaCaracter := linha[I];
                    end;
                    I := I + 1;
                  while linha[I] <> ';' do
                    begin
                      vaCodRep := vaCodRep + linha[i];
                      I := I + 1;
                      vaCaracter := linha[I];
                    end;
                    I := I + 1;
                  while linha[I] <> ';' do
                    begin
                      vaSalDup := vaSalDup + linha[i];
                      I := I + 1;
                      vaCaracter := linha[I];
                    end;
                    I := I + 1;
                  while linha[I] <> ';' do
                    begin
                      vaDatMac := vaDatMac + linha[i];
                      I := I + 1;
                      vaCaracter := linha[I];
                    end;
                    I := I + 1;
                  while linha[I] <> ';' do
                    begin
                      vaVlrMac := vaVlrMac + linha[i];
                      I := I + 1;
                      vaCaracter := linha[I];
                    end;
                   I := I + 1;
                  while linha[I] <> ';' do
                    begin
                      vaDatUpe := vaDatUpe + linha[i];
                      I := I + 1;
                      vaCaracter := linha[I];
                    end;
                   I := I + 1;
                  while linha[I] <> ';' do
                    begin
                      vaVlrUpe := vaVlrUpe + linha[i];
                      I := I + 1;
                      vaCaracter := linha[I];
                    end;
                   I := I + 1;
                  while linha[I] <> ';' do
                    begin
                      vaDatUfa := vaDatUfa + linha[i];
                      I := I + 1;
                      vaCaracter := linha[I];
                    end;
                     I := I + 1;
                  while linha[I] <> ';' do
                    begin
                      vaVlrUfa := vaVlrUfa + linha[i];
                      I := I + 1;
                      vaCaracter := linha[I];
                    end;
                     I := I + 1;
                  while linha[I] <> ';' do
                    begin
                      vaDatUpg := vaDatUpg + linha[i];
                      I := I + 1;
                      vaCaracter := linha[I];
                    end;
                     I := I + 1;
                    while linha[I] <> ';' do
                      begin
                        vaVlrUpg := vaVlrUpg + linha[i];
                        I := I + 1;
                        vaCaracter := linha[I];
                      end;
                     I := I + 1;
                    while linha[I] <> ';' do
                      begin
                        vaQtdPgt := vaQtdPgt + linha[i];
                        I := I + 1;
                        vaCaracter := linha[I];
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                        vaDatMfa := vaDatMfa + linha[i];
                        I := I + 1;
                        vaCaracter := linha[I];
                      end;
                      I := I + 1;
                    while linha[I] <> ';' do
                      begin
                        vaVlrMfa := vaVlrMfa + linha[i];
                        I := I + 1;
                        vaCaracter := linha[I];
                      end;
                       I := I + 1;
                    while linha[I] <> ';' do
                      begin
                        vaDatAtr := vaDatAtr + linha[i];
                        I := I + 1;
                        vaCaracter := linha[I];
                      end;
                       I := I + 1;
                    while linha[I] <> ';' do
                      begin
                        vaVlrAtr := vaVlrAtr + linha[i];
                        I := I + 1;
                        vaCaracter := linha[I];
                      end;
                      I := I + 1;
                    while linha[I] <> ';' do
                      begin
                        vaMaiAtr := vaMaiAtr + linha[i];
                        I := I + 1;
                        vaCaracter := linha[I];
                      end;
                      I := I + 1;
                    while linha[I] <> ';' do
                      begin
                        vaUltNfv := vaUltNfv + linha[i];
                        I := I + 1;
                        vaCaracter := linha[I];
                      end;

                end;//6


              //grava no banco
              Dm1.CadE085Cli.Close;
              Dm1.CadE085Cli.ParamByName('codcli').Value := StrToInt(vaCodCli);
              Dm1.CadE085Cli.Open;
              if Dm1.CadE085Cli.IsEmpty then
                begin//4
                   Dm1.CadE085Cli.Insert;
                   Dm1.CadE085CliCODCLI.Value := StrToInt(TRIM(vaCodCli));
                   Dm1.CadE085CliNOMCLI.Value := TRIM(vaNomCli);
                   Dm1.CadE085CliAPECLI.Value := TRIM(vaApecli);
                   Dm1.CadE085CliINSEST.Value := TRIM(vaInsEst);
                   Dm1.CadE085CliCGCCPF.Value := TRIM(vaCgcCpf);
                   Dm1.CadE085CliENDCLI.Value := TRIM(vaEndCli);
                   Dm1.CadE085CliNENCLI.Value := TRIM(vaNemCli);
                   Dm1.CadE085CliCPLEND.Value := TRIM(vaCplEnd);
                   Dm1.CadE085CliCEPCLI.Value := TRIM(vaCepCli);
                   Dm1.CadE085CliBAICLI.Value := TRIM(vaBaiCli);
                   Dm1.CadE085CliCIDCLI.Value := TRIM(vaCidCli);
                   Dm1.CadE085CliSIGUFS.Value := TRIM(vaSigUfs);
                   Dm1.CadE085cliFONCLI.Value := TRIM(vaFonCli);
                   Dm1.CadE085CliSITCLI.Value := TRIM(vaSitCli);
                   Dm1.CadE085Cli.Post;
                   Dm1.IBDTransacao.Commit;
                end//4
              else
                begin//5
                   Dm1.CadE085Cli.Edit;
                   Dm1.CadE085CliNOMCLI.Value := TRIM(vaNomCli);
                   Dm1.CadE085CliAPECLI.Value := TRIM(vaApecli);
                   Dm1.CadE085CliINSEST.Value := TRIM(vaInsEst);
                   Dm1.CadE085CliCGCCPF.Value := TRIM(vaCgcCpf);
                   Dm1.CadE085CliENDCLI.Value := TRIM(vaEndCli);
                   Dm1.CadE085CliNENCLI.Value := TRIM(vaNemCli);
                   Dm1.CadE085CliCPLEND.Value := TRIM(vaCplEnd);
                   Dm1.CadE085CliCEPCLI.Value := TRIM(vaCepCli);
                   Dm1.CadE085CliBAICLI.Value := TRIM(vaBaiCli);
                   Dm1.CadE085CliCIDCLI.Value := TRIM(vaCidCli);
                   Dm1.CadE085CliSIGUFS.Value := TRIM(vaSigUfs);
                   Dm1.CadE085cliFONCLI.Value := TRIM(vaFonCli);
                   Dm1.CadE085CliSITCLI.Value := TRIM(vaSitCli);
                   Dm1.CadE085Cli.Post;
                   Dm1.IBDTransacao.Commit;
                end;//5

              Dm1.CadE085Hcl.Close;
              Dm1.CadE085Hcl.ParamByName('codemp').Value := StrToInt(vaCodEmp);
              Dm1.CadE085Hcl.ParamByName('codfil').Value := StrToInt(vaCodFil);
              Dm1.CadE085Hcl.ParamByName('codcli').Value := StrToInt(vaCodCli);
              Dm1.CadE085Hcl.Open;
              if Dm1.CadE085Hcl.IsEmpty then
                 begin//8
                    Dm1.CadE085Hcl.Insert;
                    Dm1.CadE085HclCODCLI.Value := StrToInt(vaCodCli);
                    Dm1.CadE085HclCODEMP.Value := StrToInt(vaCodEmp);
                    Dm1.CadE085HclCODFIL.Value := StrToInt(vaCodFil);
                    Dm1.CadE085HclCODREP.Value := StrToInt(vaCodRep);
                    Dm1.CadE085HclSALDUP.Value := StrToFloat(vaSalDup);
                    Dm1.CadE085HclDATMAC.Value := StrToDate(vaDatMac);
                    Dm1.CadE085HclVLRMAC.Value := StrToFloat(vaVlrMac);
                    Dm1.CadE085HclDATUPE.Value := StrToDate(vaDatUpe);
                    Dm1.CadE085HclVLRUPE.Value := StrToFloat(vaVlrUpe);
                    Dm1.CadE085HclDATUFA.Value := StrToDate(vaDatUfa);
                    Dm1.CadE085HclVLRUFA.Value := StrToFloat(vaVlrUfa);
                    Dm1.CadE085HclDATUPG.Value := StrToDate(vaDatUpg);
                    Dm1.CadE085HclVLRUPG.Value := StrToFloat(vaVlrUpg);
                    Dm1.CadE085HclQTDPGT.Value := StrToInt(vaQtdPgt);
                    Dm1.CadE085HclDATMFA.Value := StrToDate(vaDatMfa);
                    Dm1.CadE085HclVLRMFA.Value := StrToFloat(vaVlrMfa);
                    Dm1.CadE085HclDATATR.Value := StrToDate(vaDatAtr);
                    Dm1.CadE085HclVLRATR.Value := StrToFloat(vaVlrAtr);
                    Dm1.CadE085HclMAIATR.Value := StrToInt(vaMaiAtr);
                    Dm1.CadE085HclULTNFV.Value := StrToFloat(vaUltNfv);
                    Dm1.CadE085Hcl.Post;
                    Dm1.IBDTransacao.Commit;
                 end//8
              else
                 begin//9
                   Dm1.CadE085Hcl.Edit;
                   Dm1.CadE085HclCODREP.Value := StrToInt(vaCodRep);
                   Dm1.CadE085HclSALDUP.Value := StrToFloat(vaSalDup);
                   Dm1.CadE085HclDATMAC.Value := StrToDate(vaDatMac);
                   Dm1.CadE085HclVLRMAC.Value := StrToFloat(vaVlrMac);
                   Dm1.CadE085HclDATUPE.Value := StrToDate(vaDatUpe);
                   Dm1.CadE085HclVLRUPE.Value := StrToFloat(vaVlrUpe);
                   Dm1.CadE085HclDATUFA.Value := StrToDate(vaDatUfa);
                   Dm1.CadE085HclVLRUFA.Value := StrToFloat(vaVlrUfa);
                   Dm1.CadE085HclDATUPG.Value := StrToDate(vaDatUpg);
                   Dm1.CadE085HclVLRUPG.Value := StrToFloat(vaVlrUpg);
                   Dm1.CadE085HclQTDPGT.Value := StrToInt(vaQtdPgt);
                   Dm1.CadE085HclDATMFA.Value := StrToDate(vaDatMfa);
                   Dm1.CadE085HclVLRMFA.Value := StrToFloat(vaVlrMfa);
                   Dm1.CadE085HclDATATR.Value := StrToDate(vaDatAtr);
                   Dm1.CadE085HclVLRATR.Value := StrToFloat(vaVlrAtr);
                   Dm1.CadE085HclMAIATR.Value := StrToInt(vaMaiAtr);
                   Dm1.CadE085HclULTNFV.Value := StrToFloat(vaUltNfv);
                   Dm1.CadE085Hcl.Post;
                   Dm1.IBDTransacao.Commit;
                 end;//9;
                StatusClientes.Progress := StatusClientes.Progress + 1;

           end;//3
      end;//2
         CloseFile(arq);
         DeleteFile(destino);
         Refresh;
    end;//1

end;

procedure TFAtualiza.BComandSqlClick(Sender: TObject);
var dir,nome,destino,linha : string;
    vnQtdLin : TStringList;
    vnQtdLinha,I : integer;
    ArqE100Sql : TextFile;
    vaCodUsu,vaNumCon,vaDatGer,vaComSql : string;
begin
  if not ftp.Connected then
  begin
    MessageDlg('Sistema desconectado..',mtWarning,[mbok],0);

  end
  else
    begin//1
   try
      StatusBar1.Panels[1].Text := 'Baixando arquivo _E100SQL..';
      dir := '/ArqAtu'; //onde esta o arquivo no servidor
      ftp.ChangeDir(dir);

      Nome := IntToStr(FPrincipal.vnCodusu)+'_E100SQL.txt'; //nome do arquivo
      destino := 'C:\SysRep\ArqFtp\ArqAtu\'; //onde vai jogar o arquivo/nome_do_arquivo.extençao
      destino := destino + IntToStr(FPrincipal.vnCodusu)+'_E100SQL.txt';
      ftp.Get(Nome, destino, true);
      StatusBar1.Panels[1].Text := '';

  Except
     MessageDlg('Erro na transferência do arquivo de atualização E100Sql !',mtWarning,[mbok],0);
     abort;
   end; //fim do except
      if FileExists(destino) then
      begin//2
      //conta a quantidade de linhas do arquivo
      vnQtdLin := TStringList.Create;
      try
        vnQtdLin.LoadFromFile(destino);
        vnQtdLinha := vnQtdLin.Count;
      finally
         vnQtdLin.Free;
    //     statusPedidos.MaxValue := vnQtdLinha;
    //     statusPedidos.Progress := 0;
      end;
          StatusBar1.Panels[1].Text := 'Executando comandos SQL';
         Refresh;
         AssignFile(ArqE100Sql, destino);
         Reset(ArqE100Sql);
       While not Eof(ArqE100Sql) do
           begin//3
              vaCodUsu := '';vaNumCon := '';vaDatGer := '';vaComSql := '';

              Readln(ArqE100Sql, linha);
              I := 1;
              while I < Length(linha) do
                begin//6
                  while linha[I] <> ';' do
                    begin
                       vaCodUsu := vaCodUsu + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaNumCon := vaNumCon + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaDatGer := vaDatGer + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaComSql := vaComSql + linha[i];
                       I := I + 1;
                    end;

                end;//6
                 //executa

                   Dm1.CadE100Sql.Close;
                   Dm1.CadE100Sql.ParamByName('codusu').Value := StrToInt(vaCodUsu);
                   Dm1.CadE100Sql.ParamByName('numcon').Value := StrToInt(vaNumCon);
                   Dm1.CadE100Sql.Open;
                   if Dm1.CadE100Sql.IsEmpty then
                      begin//7
                          try
                            Dm1.ConsGeral.Close;
                            Dm1.ConsGeral.SQL.Clear;
                            Dm1.ConsGeral.SQL.Add(vaComSql);
                            Dm1.ConsGeral.Open;
                          except
                            CloseFile(ArqE100Sql);
                            DeleteFile(destino);
                            raise Exception.Create('Erro na execução do comando Sql');
                          end;

                          Dm1.CadE100Sql.Insert;
                          Dm1.CadE100SqlCODUSU.Value := StrToInt(vaCodUsu);
                          Dm1.CadE100SqlNUMCON.Value := StrToInt(vaNumCon);
                          Dm1.CadE100SqlDATGER.Value := StrToDate(vaDatGer);
                          Dm1.CadE100SqlCOMSQL.Value := vaComSql;
                          Dm1.CadE100Sql.Post;
                          Dm1.IBDTransacao.CommitRetaining;
                      end;//7

                //statusCores.Progress := statusCores.Progress + 1;
             end;//3

           CloseFile(ArqE100Sql);
         DeleteFile(destino);
         StatusBar1.Panels[1].Text := '';

    end;//2

    end;//1
end;

procedure TFAtualiza.BCondCpgClick(Sender: TObject);
var dir,nome,destino : string;
    arq : TextFile;
    linha : string;
    I : integer;
    vaCodEmp,vaCodCpg,vaCodUsu,vaDesCpg,vaAbrCpg,vaPrzMed,vaQtdPar,vaSitCpg,vaPerCom : string;

    vnQtdCpg : TStringList;
    vnQtdCpgg : integer;
begin
if not ftp.Connected then
  begin
    MessageDlg('Sistema desconectado..',mtWarning,[mbok],0);

  end
  else
    begin//1
   try
      StatusBar1.Panels[1].Text := 'Baixando arquivo _E028CPG..';
      dir := '/ArqAtu'; //onde esta o arquivo no servidor
      ftp.ChangeDir(dir);

      Refresh;
      Nome := IntToStr(FPrincipal.vnCodusu)+'_E028CPG.txt'; //nome do arquivo
      destino := 'C:\SysRep\ArqFtp\ArqAtu\'; //onde vai jogar o arquivo/nome_do_arquivo.extençao
      destino := destino + IntToStr(FPrincipal.vnCodusu)+'_E028CPG.txt';
      ftp.Get(Nome, destino, true);
      StatusBar1.Panels[1].Text := '';

  Except
     MessageDlg('Erro na transferência do arquivo de configuração!',mtWarning,[mbok],0);
     abort;
   end; //fim do except
     //le o arquivo recebido e grava seus dados  E085CLI
   if FileExists(destino) then
      begin//2
      //conta a quantidade de linhas do arquivo
      vnQtdCpg := TStringList.Create;
      try
        vnQtdCpg.LoadFromFile(destino);
        vnQtdCpgg := vnQtdCpg.Count;
      finally
         vnQtdCpg.Free;
         StatusCondPgto.MaxValue := vnQtdCpgg;
         StatusCondPgto.Progress := 0;
      end;

         Refresh;
         AssignFile(arq, destino);
         Reset(arq);
         While not Eof(arq) do
           begin//3
              vaCodEmp := '';vaCodCpg := '';vaCodUsu := '';vaDesCpg := '';vaAbrCpg := '';
              vaPrzMed := '';vaQtdPar := '';vaSitCpg := '';vaPerCom := '';

              Readln(arq, linha);
              I := 1;
              while I < Length(linha) do
                begin//6
                  while linha[I] <> ';' do
                    begin
                       vaCodEmp := vaCodEmp + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaCodCpg := vaCodCpg + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaCodUsu := vaCodUsu + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaDesCpg := vaDesCpg + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaAbrCpg := vaAbrCpg + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaPrzMed := vaPrzMed + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaQtdPar := vaQtdPar + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaSitCpg := vaSitCpg + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaPerCom := vaPerCom + linha[i];
                       I := I + 1;
                    end;

                end;//6

                //grava no banco
              Dm1.CadE028Cpg.Close;
              Dm1.CadE028Cpg.ParamByName('codemp').Value := StrToInt(vaCodEmp);
              Dm1.CadE028Cpg.ParamByName('codcpg').Value := vaCodCpg;
              Dm1.CadE028Cpg.ParamByName('codusu').Value := StrToInt(vaCodUsu);
              Dm1.CadE028Cpg.Open;
              if Dm1.CadE028Cpg.IsEmpty then
                begin//4
                   Dm1.CadE028Cpg.Insert;
                   Dm1.CadE028CpgCODEMP.Value := StrToInt(TRIM(vaCodEmp));
                   Dm1.CadE028CpgCODCPG.Value := TRIM(vaCodCpg);
                   Dm1.CadE028CpgCODUSU.Value := StrToInt(TRIM(vaCodUsu));
                   Dm1.CadE028CpgDESCPG.Value := TRIM(vaDesCpg);
                   Dm1.CadE028CpgABRCPG.Value := TRIM(vaAbrCpg);
                   Dm1.CadE028CpgPRZMED.Value := StrToInt(TRIM(vaPrzMed));
                   Dm1.CadE028CpgQTDPAR.Value := StrToInt(TRIM(vaQtdPar));
                   Dm1.CadE028CpgSITCPG.Value := TRIM(vaSitCpg);
                   Dm1.CadE028CpgPERCOM.Value := StrToFloat(vaPerCom);
                   Dm1.CadE028Cpg.Post;
                   Dm1.IBDTransacao.Commit;
                end//4
              else
                begin//5
                   Dm1.CadE028Cpg.Edit;
                   Dm1.CadE028CpgDESCPG.Value := TRIM(vaDesCpg);
                   Dm1.CadE028CpgABRCPG.Value := TRIM(vaAbrCpg);
                   Dm1.CadE028CpgPRZMED.Value := StrToInt(TRIM(vaPrzMed));
                   Dm1.CadE028CpgQTDPAR.Value := StrToInt(TRIM(vaQtdPar));
                   Dm1.CadE028CpgSITCPG.Value := TRIM(vaSitCpg);
                   Dm1.CadE028CpgPERCOM.Value := StrToFloat(vaPerCom);
                   Dm1.CadE028Cpg.Post;
                   Dm1.IBDTransacao.Commit;
                end;//5
                StatusCondPgto.Progress := StatusCondPgto.Progress + 1;
             end;//3
      end;//2
         CloseFile(arq);
         DeleteFile(destino);
         Refresh;
    end;//1


end;

procedure TFAtualiza.BConectarClick(Sender: TObject);
begin
{Ftp.Disconnect;
ftp.Host:= trim(vaHost);
Ftp.Username:= trim(vaUsuario);
ftp.Password:= trim(vaSenha);
  try
    Ftp.Connect;
    StatusBar1.Panels[0].Text := 'Sistema Conectado!';
   Except
      StatusBar1.Panels[0].Text := 'Erro na conexção FTP';
      MessageDlg('Erro na conexção FTP',mtWarning,[mbok],0);

  end;}

    try
      //conecta com o banco
      DmFireRep.Banco.Connected := False;
      DmFireRep.Banco.Connected := True;
    except
       Application.MessageBox('Não foi possível conectar com WebService, verifique sua conexão com a internet!!','Atenção', MB_ICONWARNING+MB_OK);
       StatusBar1.Panels[0].Text := 'Erro ao conectar com WebService';
       Abort;
    end;
    StatusBar1.Panels[0].Text := 'Sistema Conectado!';
end;

procedure TFAtualiza.BCoresClick(Sender: TObject);
var dir,nome,destino : string;
    arq : TextFile;
    linha : string;
    I : integer;
    vaCodEmp,vaCodPro,vaDesPro,vaSitPro : string;

    vnQtdProd : TStringList;
    vnQtdProdutos : integer;
begin
if not ftp.Connected then
  begin
    MessageDlg('Sistema desconectado..',mtWarning,[mbok],0);

  end
  else
    begin//1
   try
      StatusBar1.Panels[1].Text := 'Baixando arquivo E075COR..';
      dir := '/ArqAtu'; //onde esta o arquivo no servidor
      ftp.ChangeDir(dir);

      Refresh;

      Nome := 'E075COR.txt'; //nome do arquivo
      destino := 'C:\SysRep\ArqFtp\ArqAtu\'; //onde vai jogar o arquivo/nome_do_arquivo.extençao
      destino := destino +'E075COR.txt';
      ftp.Get(Nome, destino, true);
      StatusBar1.Panels[1].Text := '';

  Except
     MessageDlg('Erro na transferência do arquivo de configuração!',mtWarning,[mbok],0);
     abort;
   end; //fim do except
     //le o arquivo recebido e grava seus dados  E075COR
   if FileExists(destino) then
      begin//2
      //conta a quantidade de linhas do arquivo
      vnQtdProd := TStringList.Create;
      try
        vnQtdProd.LoadFromFile(destino);
        vnQtdProdutos := vnQtdProd.Count;
      finally
         vnQtdProd.Free;
         
      end;

         Refresh;

         AssignFile(arq, destino);
         Reset(arq);
       While not Eof(arq) do
           begin//3
              vaCodEmp := '';vaCodPro := '';vaDesPro := '';vaSitPro := '';

              Readln(arq, linha);
              I := 1;
              while I < Length(linha) do
                begin//6
                  while linha[I] <> ';' do
                    begin
                       vaCodEmp := vaCodEmp + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaCodPro := vaCodPro + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaDesPro := vaDesPro + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaSitPro := vaSitPro + linha[i];
                       I := I + 1;
                    end;
                end;//6
                 //grava no banco
              Dm1.CadE075Cor.Close;
              Dm1.CadE075Cor.ParamByName('codemp').Value := StrToInt(vaCodEmp);
              Dm1.CadE075Cor.ParamByName('codpro').Value := vaCodPro;
              Dm1.CadE075Cor.Open;
              if Dm1.CadE075Cor.IsEmpty then
                begin//4
                   Dm1.CadE075Cor.Insert;
                   Dm1.CadE075CorCODEMP.Value := StrToInt(TRIM(vaCodEmp));
                   Dm1.CadE075CorCODPRO.Value := TRIM(vaCodPro);
                   Dm1.CadE075CorDESPRO.Value := TRIM(vaDesPro);
                   Dm1.CadE075CorSITPRO.Value := TRIM(vaSitPro);
                   Dm1.CadE075Cor.Post;
                   Dm1.IBDTransacao.Commit;
                end//4
              else
                begin//5
                   Dm1.CadE075Cor.Edit;
                   Dm1.CadE075CorDESPRO.Value := TRIM(vaDesPro);
                   Dm1.CadE075CorSITPRO.Value := TRIM(vaSitPro);
                   Dm1.CadE075Cor.Post;
                   Dm1.IBDTransacao.Commit;
                end;//5

             end;//3

           end;
           CloseFile(arq);
         DeleteFile(destino);
    end;//2


end;

procedure TFAtualiza.BLigDerCorClick(Sender: TObject);
var dir,nome,destino : string;
    arq : TextFile;
    linha : string;
    I : integer;
    vaCodEmp,vaCodPro,vaCodDer,vaCodTec,vaDesTec,vaSitPro : string;
    vaNumMov,vaDatMov,vaTipMov : string;

    vnQtdCpg : TStringList;
    vnQtdCpgg : integer;
begin
if not ftp.Connected then
  begin
    MessageDlg('Sistema desconectado..',mtWarning,[mbok],0);

  end
  else
  begin//1
    Dm1.ConsE075Ldc.Close;
    Dm1.ConsE075Ldc.SQL.Clear;
    Dm1.ConsE075Ldc.SQL.Add('select * from e075ldc');
    Dm1.ConsE075Ldc.Open;
  if Dm1.ConsE075Ldc.IsEmpty then
   begin//100 atualiza a base inteira

   try
      StatusBar1.Panels[1].Text := 'Baixando arquivo E075LDC..';
      dir := '/ArqAtu'; //onde esta o arquivo no servidor
      ftp.ChangeDir(dir);

      Refresh;
      Nome := 'E075LDC.txt'; //nome do arquivo
      destino := 'C:\SysRep\ArqFtp\ArqAtu\'; //onde vai jogar o arquivo/nome_do_arquivo.extençao
      destino := destino + 'E075LDC.txt';
      ftp.Get(Nome, destino, true);
      StatusBar1.Panels[1].Text := '';
  Except
     MessageDlg('Erro na transferência do arquivo de configuração!',mtWarning,[mbok],0);
     abort;
   end; //fim do except
     //le o arquivo recebido e grava seus dados  E075LDC
   if FileExists(destino) then
      begin//2

       Dm1.ApagaE075Ldc.Close;
       Dm1.ApagaE075Ldc.Open;//apaga todas os registros da tabela
        Dm1.IBDTransacao.CommitRetaining;

      //conta a quantidade de linhas do arquivo
      vnQtdCpg := TStringList.Create;
      try
        vnQtdCpg.LoadFromFile(destino);
        vnQtdCpgg := vnQtdCpg.Count;
      finally
         vnQtdCpg.Free;
      end;

         Refresh;
         AssignFile(arq, destino);
         Reset(arq);
         While not Eof(arq) do
           begin//3
              vaCodEmp := '';vaCodPro := '';vaCodDer := '';vaCodTec := '';vaDesTec := '';vaSitPro := '';

              Readln(arq, linha);
              I := 1;
              while I < Length(linha) do
                begin//6
                  while linha[I] <> ';' do
                    begin
                       vaCodEmp := vaCodEmp + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaCodPro := vaCodPro + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaCodDer := vaCodDer + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaCodTec := vaCodTec + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaDesTec := vaDesTec + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaSitPro := vaSitPro + linha[i];
                       I := I + 1;
                    end;

                end;//6

                   Dm1.CadE075Ldc.Open;
                   Dm1.CadE075Ldc.Insert;
                   Dm1.CadE075LdcCODEMP.Value := StrToInt(vaCodEmp);
                   Dm1.CadE075LdcCODPRO.Value := vaCodPro;
                   Dm1.CadE075LdcCODDER.Value := vaCodDer;
                   Dm1.CadE075LdcCODTEC.Value := vaCodTec;
                   Dm1.CadE075LdcDESTEC.Value := vaDesTec;
                   Dm1.CadE075LdcSITLIG.Value := vaSitPro;
                   Dm1.CadE075Ldc.Post;

                   Dm1.IBDTransacao.Commit;
             end;//3
      end;//2
         CloseFile(arq);
         DeleteFile(destino);
         Refresh;
    end//100
    else
      begin//101 atualiza pelos logs de ligaçoes
        try
          dir := '/ArqAtu'; //onde esta o arquivo no servidor
          ftp.ChangeDir(dir);
          Refresh;

          Nome := IntToStr(FPrincipal.vnCodusu)+'_E075LLDC.txt'; //nome do arquivo
          destino := 'C:\SysRep\ArqFtp\ArqAtu\'; //onde vai jogar o arquivo/nome_do_arquivo.extençao
          destino := destino + IntToStr(FPrincipal.vnCodusu)+'_E075LLDC.txt';
          ftp.Get(Nome, destino, true);

        Except
          MessageDlg('Erro na transferência do arquivo de configuração!',mtWarning,[mbok],0);
          abort;
       end; //fim do except

         if FileExists(destino) then
            begin//102

            //conta a quantidade de linhas do arquivo
            vnQtdCpg := TStringList.Create;
            try
              vnQtdCpg.LoadFromFile(destino);
              vnQtdCpgg := vnQtdCpg.Count;
            finally
               vnQtdCpg.Free;
              
            end;

               Refresh;
               AssignFile(arq, destino);
               Reset(arq);
               While not Eof(arq) do
                 begin//103
                   vaNumMov := '';vaCodEmp := '';vaCodPro := '';vaCodDer := '';vaCodTec := '';
                   vaDatMov := '';vaTipMov := '';

                    Readln(arq, linha);
                    I := 1;
                    while I < Length(linha) do
                      begin//106
                        while linha[I] <> ';' do
                          begin
                             vaNumMov := vaNumMov + linha[i];
                             I := I + 1;
                          end;
                        I := I + 1;
                        while linha[I] <> ';' do
                          begin
                             vaCodEmp := vaCodEmp + linha[i];
                             I := I + 1;
                          end;
                        I := I + 1;
                        while linha[I] <> ';' do
                          begin
                             vaCodPro := vaCodPro + linha[i];
                             I := I + 1;
                          end;
                        I := I + 1;
                        while linha[I] <> ';' do
                          begin
                             vaCodDer := vaCodDer + linha[i];
                             I := I + 1;
                          end;
                        I := I + 1;
                        while linha[I] <> ';' do
                          begin
                             vaCodTec := vaCodTec + linha[i];
                             I := I + 1;
                          end;
                        I := I + 1;
                        while linha[I] <> ';' do
                          begin
                             vaDatMov := vaDatMov + linha[i];
                             I := I + 1;
                          end;
                        I := I + 1;
                        while linha[I] <> ';' do
                          begin
                             vaTipMov := vaTipMov + linha[i];
                             I := I + 1;
                          end;
                      end;//106

                      if vaTipMov = 'L' then  //log de ligação de cores
                         begin//107
                            Dm1.CadE075Ldc.Close;
                            Dm1.CadE075Ldc.ParamByName('codemp').value := StrToInt(vaCodEmp);
                            Dm1.CadE075Ldc.ParamByName('codpro').value := vaCodPro;
                            Dm1.CadE075Ldc.ParamByName('codder').value := vaCodDer;
                            Dm1.CadE075Ldc.ParamByName('codtec').value := vaCodTec;
                            Dm1.CadE075Ldc.Open;
                            if Dm1.CadE075Ldc.IsEmpty then
                               begin//108
                                 Dm1.CadE075Ldc.Insert;
                                 Dm1.CadE075LdcCODEMP.Value := StrToInt(vaCodEmp);
                                 Dm1.CadE075LdcCODPRO.Value := vaCodPro;
                                 Dm1.CadE075LdcCODDER.Value := vaCodDer;
                                 Dm1.CadE075LdcCODTEC.Value := vaCodTec;
                                 Dm1.CadE075LdcDESTEC.Value := 'Ligado por log de atualizacao';
                                 Dm1.CadE075LdcSITLIG.Value := 'A';
                                 Dm1.CadE075Ldc.Post;
                                 Dm1.IBDTransacao.CommitRetaining;
                               end;//108
                         end//107
                      else if vaTipMov = 'D' then
                              begin//109
                                Dm1.CadE075Ldc.Close;
                                Dm1.CadE075Ldc.ParamByName('codemp').value := StrToInt(vaCodEmp);
                                Dm1.CadE075Ldc.ParamByName('codpro').value := vaCodPro;
                                Dm1.CadE075Ldc.ParamByName('codder').value := vaCodDer;
                                Dm1.CadE075Ldc.ParamByName('codtec').value := vaCodTec;
                                Dm1.CadE075Ldc.Open;
                                if not Dm1.CadE075Ldc.IsEmpty then
                                   begin//110
                                      Dm1.CadE075Ldc.Delete;
                                      Dm1.IBDTransacao.CommitRetaining;
                                   end;//110

                              end;//109



                   end;//103
            end;//102
         CloseFile(arq);
         DeleteFile(destino);
         Refresh;



      end;//101

   end;//1

end;

procedure TFAtualiza.BPedidosClick(Sender: TObject);
var dir,nome,destino : string;
    nome2,destino2,nome3,destino3,nome4,destino4 : string;
    linha : string;
    I, vnQtdLinha : integer;
    vnQtdLin : TStringList;
    arqE120Ped,arqE120Ipd,arqUsu120Ipd,arqE120Obs : TextFile;
    vaCodEmp,vaCodFil,vaNumped,vaCodRep,vaNumCom,vaTnsPro,vaDatEmi,vaHorEmi,
    vaCodCli,vaCodCpg,vaQtdAbe,vaVlrBco,vaVlrCom,vaVlrLiq,vaQtdOri,vaVlrOri,
    vaSitPed,vaUsuger,vaDatGer,vaUsuFec,vaDatFec : string;

    vaSeqIpd,vaCodPro,vaCodDer,vaCodFam,vaQtdPed,vaQtdFat,vaQtdCan,vaUniMed,vaCodTpr,
    vaPreUni,vaPerCom,vaVlrBru,vaVlrLpr,vaSitIpd,vaTotDsc : string;

    vaSeqIte,vaQtdCor,vaTipCmb,vaCor001,vaCor002,vaTecTra,vaPreCar : string;

    vaSeqObs,vaTipObs,vaObsPed,vaObsUsu,vaObsDat,vaSitObs : string;
begin
if not ftp.Connected then
  begin
    MessageDlg('Sistema desconectado..',mtWarning,[mbok],0);

  end
  else
    begin//1
      try
      StatusBar1.Panels[1].Text := 'Baixando arquivos de pedidos..';

      dir := '/ArqAtu'; //onde esta o arquivo no servidor

      Refresh;

      Nome := IntToStr(FPrincipal.vnCodusu)+'_E120PED.txt'; //nome do arquivo
      destino := 'C:\SysRep\ArqFtp\ArqAtu\'; //onde vai jogar o arquivo/nome_do_arquivo.extençao
      destino := destino + IntToStr(FPrincipal.vnCodusu)+'_E120PED.txt';
      ftp.Get(Nome, destino, true);

      Nome2 := IntToStr(FPrincipal.vnCodusu)+'_E120IPD.txt'; //nome do arquivo
      destino2 := 'C:\SysRep\ArqFtp\ArqAtu\'; //onde vai jogar o arquivo/nome_do_arquivo.extençao
      destino2 := destino2 + IntToStr(FPrincipal.vnCodusu)+'_E120IPD.txt';
      ftp.Get(Nome2, destino2, true);

      Nome3 := IntToStr(FPrincipal.vnCodusu)+'_USU120IPD.txt'; //nome do arquivo
      destino3 := 'C:\SysRep\ArqFtp\ArqAtu\'; //onde vai jogar o arquivo/nome_do_arquivo.extençao
      destino3 := destino3 + IntToStr(FPrincipal.vnCodusu)+'_USU120IPD.txt';
      ftp.Get(Nome3, destino3, true);

      Nome4 := IntToStr(FPrincipal.vnCodusu)+'_E120OBS.txt'; //nome do arquivo
      destino4 := 'C:\SysRep\ArqFtp\ArqAtu\'; //onde vai jogar o arquivo/nome_do_arquivo.extençao
      destino4 := destino4 + IntToStr(FPrincipal.vnCodusu)+'_E120OBS.txt';
      ftp.Get(Nome4, destino4, true);

      StatusBar1.Panels[1].Text := '';
  Except
     MessageDlg('Erro na transferência dos arquivos!',mtWarning,[mbok],0);
     abort;
   end; //fim do except

      //le o arquivo recebido e grava seus dados  E120PED
   if FileExists(destino) then
      begin//2

      //conta a quantidade de linhas do arquivo
      vnQtdLin := TStringList.Create;
      try
        vnQtdLin.LoadFromFile(destino);
        vnQtdLinha := vnQtdLin.Count;
      finally
         vnQtdLin.Free;
         statusPedidos.MaxValue := vnQtdLinha;
         statusPedidos.Progress := 0;
      end;

       { Dm1.ConsGeral.Close;
        Dm1.ConsGeral.SQL.Clear;
        Dm1.ConsGeral.SQL.Add('delete from e120ipd');
        Dm1.ConsGeral.Open;
        Dm1.IBDTransacao.CommitRetaining; }

         Refresh;
         AssignFile(arqE120Ped, destino);
         Reset(arqE120Ped);
         While not Eof(arqE120Ped) do
           begin
              vaCodEmp := '';vaCodFil := '';vaNumped := '';vaCodRep := '';vaNumCom := '';vaTnsPro := '';
              vaDatEmi := '';vaHorEmi := '';vaCodCli := '';vaCodCpg := '';vaQtdAbe := '';vaVlrBco := '';
              vaVlrCom := '';vaVlrLiq := '';vaQtdOri := '';vaVlrOri := '';vaSitPed := '';vaUsuger := '';
              vaDatGer := '';vaUsuFec := '';vaDatFec := '';vaPreCar := '';

              Readln(arqE120Ped, linha);
              I := 1;
              while I < Length(linha) do
                begin
                  while linha[I] <> ';' do
                    begin
                       vaCodEmp := vaCodEmp + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaCodFil := vaCodFil + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaNumPed := vaNumPed + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaCodRep := vaCodRep + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaNumCom := vaNumCom + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaTnsPro := vaTnsPro + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaDatEmi := vaDatEmi + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaHorEmi := vaHorEmi + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaCodCli := vaCodCli + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaCodCpg := vaCodCpg + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaQtdAbe := vaQtdAbe + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaVlrBco := vaVlrBco + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaVlrCom := vaVlrCom + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaVlrLiq := vaVlrLiq + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaQtdOri := vaQtdOri + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaVlrOri := vaVlrOri + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaSitPed := vaSitPed + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaUsuGer := vaUsuGer + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaDatGer := vaDatGer + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaUsufec := vaUsuFec + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaDatFec := vaDatFec + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaPreCar := vaPreCar + linha[i];
                       I := I + 1;
                    end;
                end;

                     Dm1.ConsGeral.Close;
                     Dm1.ConsGeral.SQL.Clear;
                     Dm1.ConsGeral.SQL.Add('select e120ped.* from e120ped');
                     Dm1.ConsGeral.SQL.Add('where');
                     Dm1.ConsGeral.SQL.Add('e120ped.codemp = :codemp and');
                     Dm1.ConsGeral.SQL.Add('e120ped.codfil = :codfil and');
                     Dm1.ConsGeral.SQL.Add('e120ped.numped = :numped and');
                     Dm1.ConsGeral.SQL.Add('e120ped.codrep = :codrep');
                     Dm1.ConsGeral.ParamByName('codemp').Value := StrToInt(vaCodEmp);
                     Dm1.ConsGeral.ParamByName('codfil').Value := StrToInt(vaCodFil);
                     Dm1.ConsGeral.ParamByName('numped').Value := StrToInt(vaNumped);
                     Dm1.ConsGeral.ParamByName('codrep').Value := StrToInt(vaCodRep);
                     Dm1.ConsGeral.Open;
                     if Dm1.ConsGeral.IsEmpty then
                        begin
                          if vaNumCom = '0' then //o pedido foi cadastrado direto na empresa
                             begin
                                 Dm1.CadE120Ped.Open;
                                 Dm1.CadE120Ped.Insert;
                                 Dm1.CadE120PedCODEMP.Value := StrToInt(vaCodEmp);
                                 Dm1.CadE120PedCODFIL.Value := StrToInt(vaCodFil);
                                 Dm1.CadE120PedNUMPED.Value := StrToInt(vaNumped);
                                 Dm1.CadE120PedCODCLI.Value := StrToInt(vaCodCli);
                                 Dm1.CadE120PedTNSPRO.Value := vaTnsPro;
                                 Dm1.CadE120PedDATEMI.Value := StrToDate(vaDatEmi);
                                 Dm1.CadE120PedCODREP.Value := StrToInt(vaCodRep);
                                 Dm1.CadE120PedCODCPG.Value := vaCodCpg;
                                 Dm1.CadE120PedQTDORI.Value := StrToInt(vaQtdOri);
                                 Dm1.CadE120PedQTDABE.Value := StrToInt(vaQtdAbe);
                                 Dm1.CadE120PedVLRBCO.Value := StrToCurr(vaVlrBco);
                                 Dm1.CadE120PedVLRCOM.Value := StrToCurr(vaVlrCom);
                                 Dm1.CadE120PedVLRLIQ.Value := StrToCurr(vaVlrLiq);
                                 Dm1.CadE120PedVLRORI.Value := StrToCurr(vaVlrOri);
                                 Dm1.CadE120PedSITPED.Value := vaSitPed;
                                 Dm1.CadE120PedUSUGER.Value := StrToInt(vaUsuger);
                                 Dm1.CadE120PedDATGER.Value := StrToDate(vaDatGer);
                                 Dm1.CadE120PedPEDENV.Value := 'S';
                                 Dm1.CadE120PedPEDCON.Value := 'S';
                                 Dm1.CadE120PedDATCON.Value := StrToDate(vaDatFec);
                                 Dm1.CadE120PedUSUCON.Value := StrToInt(vaUsuFec);
                                 Dm1.CadE120PedPRECAR.Value := StrToInt(vaPreCar);


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
                                       Application.MessageBox('Entre em contato com a empresa e solicite uma nova faixa de numeração','ERRO', MB_ICONERROR+MB_OK);
                                       Abort;
                                     end
                                  else
                                     begin
                                       Dm1.CadE120PedNUMCON.Value := Dm1.ConsGeral.FieldByName('NUMPEDATU').AsInteger + 1;
                                     end;

                                 Dm1.CadE120Ped.Post;

                                 Dm1.CadE100Usu.Close;
                                 Dm1.CadE100Usu.ParamByName('CODUSU').Value := FPrincipal.vnCodusu;
                                 Dm1.CadE100Usu.Open;
                                 if not Dm1.CadE100Usu.IsEmpty then
                                   begin
                                     Dm1.CadE100Usu.Edit;
                                     Dm1.CadE100UsuNUMPEDATU.Value := Dm1.CadE120PedNUMCON.Value;
                                     Dm1.CadE100Usu.Post;
                                   end;

                                 Dm1.IBDTransacao.CommitRetaining;
                             end//8
                          else
                             begin//9 procura o pedido pelo numero de controle
                                Dm1.CadE120Ped.Close;
                                Dm1.CadE120Ped.ParamByName('codemp').Value := StrToInt(vaCodEmp);
                                Dm1.CadE120Ped.ParamByName('codfil').Value := StrToInt(vaCodFil);
                                Dm1.CadE120Ped.ParamByName('numcon').Value := StrToInt(vaNumCom);
                                Dm1.CadE120Ped.ParamByName('codrep').Value := StrToInt(vaCodRep);
                                Dm1.CadE120Ped.Open;
                                if not Dm1.CadE120Ped.IsEmpty then
                                   begin//10
                                     Dm1.CadE120Ped.Edit;
                                     Dm1.CadE120PedNUMPED.Value := StrToInt(vaNumped);
                                     Dm1.CadE120PedCODCLI.Value := StrToInt(vaCodCli);
                                     Dm1.CadE120PedTNSPRO.Value := vaTnsPro;
                                     Dm1.CadE120PedDATEMI.Value := StrToDate(vaDatEmi);
                                     Dm1.CadE120PedCODCPG.Value := vaCodCpg;
                                     Dm1.CadE120PedQTDORI.Value := StrToInt(vaQtdOri);
                                     Dm1.CadE120PedQTDABE.Value := StrToInt(vaQtdAbe);
                                     Dm1.CadE120PedVLRBCO.Value := StrToCurr(vaVlrBco);
                                     Dm1.CadE120PedVLRCOM.Value := StrToCurr(vaVlrCom);
                                     Dm1.CadE120PedVLRLIQ.Value := StrToCurr(vaVlrLiq);
                                     Dm1.CadE120PedVLRORI.Value := StrToCurr(vaVlrOri);
                                     Dm1.CadE120PedSITPED.Value := vaSitPed;
                                     Dm1.CadE120PedUSUGER.Value := StrToInt(vaUsuger);
                                     Dm1.CadE120PedDATGER.Value := StrToDate(vaDatGer);
                                     Dm1.CadE120PedPEDENV.Value := 'S';
                                     Dm1.CadE120PedPEDCON.Value := 'S';
                                     Dm1.CadE120PedDATCON.Value := StrToDate(vaDatFec);
                                     Dm1.CadE120PedUSUCON.Value := StrToInt(vaUsuFec);
                                     Dm1.CadE120PedPRECAR.Value := StrToInt(vaPreCar);
                                     Dm1.CadE120Ped.Post;
                                     Dm1.IBDTransacao.CommitRetaining;
                                   end;//10
                             end;//9
                        end//7
                     else
                        begin//12
                          Dm1.CadE120Ped.Close;
                          Dm1.CadE120Ped.ParamByName('codemp').Value := Dm1.ConsGeral.FieldByName('CODEMP').AsInteger;
                          Dm1.CadE120Ped.ParamByName('codfil').Value := Dm1.ConsGeral.FieldByName('CODFIL').AsInteger;
                          Dm1.CadE120Ped.ParamByName('numcon').Value := Dm1.ConsGeral.FieldByName('NUMCON').AsInteger;
                          Dm1.CadE120Ped.ParamByName('codrep').Value := Dm1.ConsGeral.FieldByName('CODREP').AsInteger;
                          Dm1.CadE120Ped.Open;
                          if not Dm1.CadE120Ped.IsEmpty then
                             begin//13
                                Dm1.CadE120Ped.Edit;
                                Dm1.CadE120PedCODCLI.Value := StrToInt(vaCodCli);
                                Dm1.CadE120PedTNSPRO.Value := vaTnsPro;
                                Dm1.CadE120PedCODCPG.Value := vaCodCpg;
                                Dm1.CadE120PedQTDORI.Value := StrToInt(vaQtdOri);
                                Dm1.CadE120PedQTDABE.Value := StrToInt(vaQtdAbe);
                                Dm1.CadE120PedVLRBCO.Value := StrToCurr(vaVlrBco);
                                Dm1.CadE120PedVLRCOM.Value := StrToCurr(vaVlrCom);
                                Dm1.CadE120PedVLRLIQ.Value := StrToCurr(vaVlrLiq);
                                Dm1.CadE120PedVLRORI.Value := StrToCurr(vaVlrOri);
                                Dm1.CadE120PedSITPED.Value := vaSitPed;
                                Dm1.CadE120PedUSUGER.Value := StrToInt(vaUsuger);
                                Dm1.CadE120PedDATGER.Value := StrToDate(vaDatGer);
                                Dm1.CadE120PedPEDENV.Value := 'S';
                                Dm1.CadE120PedPEDCON.Value := 'S';
                                Dm1.CadE120PedDATCON.Value := StrToDate(vaDatFec);
                                Dm1.CadE120PedUSUCON.Value := StrToInt(vaUsuFec);
                                Dm1.CadE120PedPRECAR.Value := StrToInt(vaPreCar);
                                Dm1.CadE120Ped.Post;
                                Dm1.IBDTransacao.CommitRetaining;
                             end;//13
                        end;//12
                statusPedidos.Progress := statusPedidos.Progress + 1;
             end;//3
      end;//2 fim da atualização dos dados gerais do pedido
         CloseFile(arqE120Ped);
         DeleteFile(destino);
         Refresh;

         //atualiza o numero de controle usado por ultimo

         Dm1.UltNumConE120Ped.Close;
         Dm1.UltNumConE120Ped.Open;

         Dm1.CadE100Usu.Close;
         Dm1.CadE100Usu.ParamByName('CODUSU').Value := FPrincipal.vnCodusu;
         Dm1.CadE100Usu.Open;
         if not Dm1.CadE100Usu.IsEmpty then
           begin
             Dm1.CadE100Usu.Edit;
             Dm1.CadE100UsuNUMPEDATU.Value := Dm1.UltNumConE120PedULTIMO.AsInteger;
             Dm1.CadE100Usu.Post;
           end;

    //le o arquivo recebido e grava seus dados  E120ipd
    if FileExists(destino2) then
      begin//14

          //conta a quantidade de linhas do arquivo
          vnQtdLin := TStringList.Create;
          try
            vnQtdLin.LoadFromFile(destino2);
            vnQtdLinha := vnQtdLin.Count;
          finally
             vnQtdLin.Free;
             statusPedidos.MaxValue := vnQtdLinha;
             statusPedidos.Progress := 0;
          end;


           Refresh;
           AssignFile(arqE120Ipd, destino2);
           Reset(arqE120Ipd);
           While not Eof(arqE120Ipd) do
             begin//15
                vaCodEmp := '';vaCodFil := '';vaNumped := '';vaNumCom := '';vaTnsPro := '';vaCodFam := '';
                vaQtdAbe := '';vaVlrBco := '';vaVlrCom := '';vaVlrLiq := '';vaVlrOri := '';vaPreUni := '';
                vaUsuger := '';vaDatGer := '';vaSeqIpd := '';vaCodPro := '';vaCodDer := '';vaCodRep := '';
                vaQtdPed := '';vaQtdFat := '';vaQtdCan := '';vaUniMed := '';vaCodTpr := '';
                vaPerCom := '';vaVlrBru := '';vaVlrLpr := '';vaSitIpd := '';vaTotDsc := '';

                Readln(arqE120Ipd, linha);
                I := 1;
                while I < Length(linha) do
                  begin//16
                    while linha[I] <> ';' do
                      begin
                         vaCodEmp := vaCodEmp + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaCodFil := vaCodFil + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaNumPed := vaNumPed + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaSeqIpd := vaSeqIpd + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaNumCom := vaNumCom + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaCodRep := vaCodRep + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaTnsPro := vaTnsPro + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaCodPro := vaCodPro + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaCodDer := vaCodDer + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaCodFam := vaCodFam + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaQtdPed := vaQtdPed + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaQtdFat := vaQtdFat + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaQtdCan := vaQtdCan + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaQtdAbe := vaQtdAbe + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaUniMed := vaUniMed + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaCodTpr := vaCodTpr + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaPreUni := vaPreUni + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaPerCom := vaPerCom + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaVlrBru := vaVlrBru + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaVlrBco := vaVlrBco + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaVlrCom := vaVlrCom + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaVlrLpr := vaVlrLpr + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaVlrLiq := vaVlrLiq + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaSitIpd := vaSitIpd + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaUsuGer := vaUsuGer + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaDatGer := vaDatGer + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaTotDsc := vaTotDsc + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaVlrOri := vaVlrOri + linha[i];
                         I := I + 1;
                      end;

                  end;//16

             if vaNumCom = '0' then
                begin//17
                  Dm1.ConsGeral.Close;
                  Dm1.ConsGeral.SQL.Clear;
                  Dm1.ConsGeral.SQL.Add('select e120ipd.* from e120ipd');
                  Dm1.ConsGeral.SQL.Add('where');
                  Dm1.ConsGeral.SQL.Add('e120ipd.codemp = :codemp and');
                  Dm1.ConsGeral.SQL.Add('e120ipd.codfil = :codfil and');
                  Dm1.ConsGeral.SQL.Add('e120ipd.numped = :numped and');
                  Dm1.ConsGeral.SQL.Add('e120ipd.codrep = :codrep and');
                  Dm1.ConsGeral.SQL.Add('e120ipd.seqipd = :seqipd');
                  Dm1.ConsGeral.ParamByName('codemp').Value := StrToInt(vaCodEmp);
                  Dm1.ConsGeral.ParamByName('codfil').Value := StrToInt(vaCodFil);
                  Dm1.ConsGeral.ParamByName('numped').Value := StrToInt(vaNumPed);
                  Dm1.ConsGeral.ParamByName('codrep').Value := StrToInt(vaCodRep);
                  Dm1.ConsGeral.ParamByName('seqipd').Value := StrToInt(vaSeqIpd);
                  Dm1.ConsGeral.Open;
                  if Dm1.ConsGeral.IsEmpty then
                     begin//18
                             Dm1.CadE120Ipd.Open;
                             Dm1.CadE120Ipd.Insert;
                             Dm1.CadE120IpdCODEMP.Value := StrToInt(vaCodEmp);
                             Dm1.CadE120IpdCODFIL.Value := StrToInt(vaCodFil);
                             Dm1.CadE120IpdNUMPED.Value := StrToInt(vaNumped);
                             Dm1.CadE120IpdCODREP.Value := StrToInt(vaCodRep);
                             Dm1.CadE120IpdSEQIPD.Value := StrToInt(vaSeqIpd);
                             Dm1.CadE120IpdTNSPRO.Value := vaTnsPro;
                             Dm1.CadE120IpdCODPRO.Value := vaCodPro;
                             Dm1.CadE120IpdCODDER.Value := vaCodDer;
                             Dm1.CadE120IpdCODFAM.Value := vaCodFam;
                             Dm1.CadE120IpdQTDPED.Value := StrToInt(vaQtdPed);
                             Dm1.CadE120IpdQTDFAT.Value := StrToInt(vaQtdFat);
                             Dm1.CadE120IpdQTDCAN.Value := StrToInt(vaQtdCan);
                             Dm1.CadE120IpdQTDABE.Value := StrToInt(vaQtdAbe);
                             Dm1.CadE120IpdUNIMED.Value := vaUniMed;
                             Dm1.CadE120IpdCODTPR.Value := vaCodTpr;
                             Dm1.CadE120IpdPREUNI.Value := StrToCurr(vaPreUni);
                             Dm1.CadE120IpdPERCOM.Value := StrToFloat(vaPerCom);
                             Dm1.CadE120IpdVLRBRU.Value := StrToCurr(vaVlrBru);
                             Dm1.CadE120IpdVLRBCO.Value := StrToCurr(vaVlrBco);
                             Dm1.CadE120IpdVLRCOM.Value := StrToCurr(vaVlrCom);
                             Dm1.CadE120IpdVLRLPR.Value := StrToCurr(vaVlrLpr);
                             Dm1.CadE120IpdVLRLIQ.Value := StrToCurr(vaVlrLiq);
                             Dm1.CadE120IpdSITIPD.Value := vaSitIpd;
                             Dm1.CadE120IpdUSUGER.Value := StrToInt(vaUsuger);
                             Dm1.CadE120IpdDATGER.Value := StrToDate(vaDatGer);
                             Dm1.CadE120IpdTOTDESC.Value := StrToCurr(vaTotDsc);
                             Dm1.CadE120IpdVLRORI.Value := StrToCurr(vaVlrOri);
                             Dm1.CadE120IpdDATEMI.Value := StrToDate(vaDatEmi);
                             Dm1.CadE120IpdCORGRID.Value := '$00DDFFFF';
                             Dm1.ConsGeral.Close;
                             Dm1.ConsGeral.SQL.Clear;
                             Dm1.ConsGeral.SQL.Add('select e120ped.numcon from e120ped');
                             Dm1.ConsGeral.SQL.Add('where');
                             Dm1.ConsGeral.SQL.Add('e120ped.codemp = :codemp and');
                             Dm1.ConsGeral.SQL.Add('e120ped.codfil = :codfil and');
                             Dm1.ConsGeral.SQL.Add('e120ped.numped = :numped and');
                             Dm1.ConsGeral.SQL.Add('e120ped.codrep = :codrep ');
                             Dm1.ConsGeral.ParamByName('codemp').Value := StrToInt(vaCodEmp);
                             Dm1.ConsGeral.ParamByName('codfil').Value := StrToInt(vaCodFil);
                             Dm1.ConsGeral.ParamByName('numped').Value := StrToInt(vaNumped);
                             Dm1.ConsGeral.ParamByName('codrep').Value := StrToInt(vaCodRep);
                             Dm1.ConsGeral.Open;
                             if Dm1.ConsGeral.IsEmpty then
                                Dm1.CadE120Ipd.Cancel
                             else
                                begin
                                  Dm1.CadE120IpdNUMCON.Value := Dm1.ConsGeral.FieldByName('NUMCON').Value;
                                  Dm1.CadE120Ipd.Post;
                                  Dm1.IBDTransacao.CommitRetaining;
                                end;
                     end//18
                  else
                     begin//19
                       Dm1.CadE120Ipd.Close;
                       Dm1.CadE120Ipd.ParamByName('codemp').Value := Dm1.ConsGeral.FieldByName('CODEMP').Value;
                       Dm1.CadE120Ipd.ParamByName('codfil').Value := Dm1.ConsGeral.FieldByName('CODFIL').Value;
                       Dm1.CadE120Ipd.ParamByName('numcon').Value := Dm1.ConsGeral.FieldByName('NUMCON').Value;
                       Dm1.CadE120Ipd.ParamByName('codrep').Value := Dm1.ConsGeral.FieldByName('CODREP').Value;
                       Dm1.CadE120Ipd.ParamByName('seqipd').Value := Dm1.ConsGeral.FieldByName('SEQIPD').Value;
                       Dm1.CadE120Ipd.Open;
                        if not Dm1.CadE120Ipd.IsEmpty then
                           begin//20
                              Dm1.CadE120Ipd.Edit;
                              Dm1.CadE120IpdNUMPED.Value := StrToInt(vaNumped);
                              Dm1.CadE120IpdTNSPRO.Value := vaTnsPro;
                              Dm1.CadE120IpdCODPRO.Value := vaCodPro;
                              Dm1.CadE120IpdCODDER.Value := vaCodDer;
                              Dm1.CadE120IpdCODFAM.Value := vaCodFam;
                              Dm1.CadE120IpdQTDPED.Value := StrToInt(vaQtdPed);
                              Dm1.CadE120IpdQTDFAT.Value := StrToInt(vaQtdFat);
                              Dm1.CadE120IpdQTDCAN.Value := StrToInt(vaQtdCan);
                              Dm1.CadE120IpdQTDABE.Value := StrToInt(vaQtdAbe);
                              Dm1.CadE120IpdUNIMED.Value := vaUniMed;
                              Dm1.CadE120IpdCODTPR.Value := vaCodTpr;
                              Dm1.CadE120IpdPREUNI.Value := StrToCurr(vaPreUni);
                              Dm1.CadE120IpdPERCOM.Value := StrToFloat(vaPerCom);
                              Dm1.CadE120IpdVLRBRU.Value := StrToCurr(vaVlrBru);
                              Dm1.CadE120IpdVLRBCO.Value := StrToCurr(vaVlrBco);
                              Dm1.CadE120IpdVLRCOM.Value := StrToCurr(vaVlrCom);
                              Dm1.CadE120IpdVLRLPR.Value := StrToCurr(vaVlrLpr);
                              Dm1.CadE120IpdVLRLIQ.Value := StrToCurr(vaVlrLiq);
                              Dm1.CadE120IpdSITIPD.Value := vaSitIpd;
                              Dm1.CadE120IpdUSUGER.Value := StrToInt(vaUsuger);
                              Dm1.CadE120IpdDATGER.Value := StrToDate(vaDatGer);
                              Dm1.CadE120IpdTOTDESC.Value := StrToCurr(vaTotDsc);
                              Dm1.CadE120IpdVLRORI.Value := StrToCurr(vaVlrOri);
                              Dm1.CadE120IpdDATEMI.Value := StrToDate(vaDatEmi);
                              Dm1.CadE120Ipd.Post;
                              Dm1.IBDTransacao.CommitRetaining;
                           end;//20
                     end;//19
                end//17
             else
                begin//21
                  Dm1.CadE120Ipd.Close;
                  Dm1.CadE120Ipd.ParamByName('codemp').Value := StrToInt(vaCodEmp);
                  Dm1.CadE120Ipd.ParamByName('codfil').Value := StrToInt(vaCodFil);
                  Dm1.CadE120Ipd.ParamByName('numcon').Value := StrToInt(vaNumCom);
                  Dm1.CadE120Ipd.ParamByName('codrep').Value := StrToInt(vaCodRep);
                  Dm1.CadE120Ipd.ParamByName('seqipd').Value := StrToInt(vaSeqIpd);
                  Dm1.CadE120Ipd.Open;
                  if not Dm1.CadE120Ipd.IsEmpty then
                     begin//22
                       Dm1.CadE120Ipd.Edit;
                       Dm1.CadE120IpdNUMPED.Value := StrToInt(vaNumped);
                       Dm1.CadE120IpdTNSPRO.Value := vaTnsPro;
                       Dm1.CadE120IpdCODPRO.Value := vaCodPro;
                       Dm1.CadE120IpdCODDER.Value := vaCodDer;
                       Dm1.CadE120IpdCODFAM.Value := vaCodFam;
                       Dm1.CadE120IpdQTDPED.Value := StrToInt(vaQtdPed);
                       Dm1.CadE120IpdQTDFAT.Value := StrToInt(vaQtdFat);
                       Dm1.CadE120IpdQTDCAN.Value := StrToInt(vaQtdCan);
                       Dm1.CadE120IpdQTDABE.Value := StrToInt(vaQtdAbe);
                       Dm1.CadE120IpdUNIMED.Value := vaUniMed;
                       Dm1.CadE120IpdCODTPR.Value := vaCodTpr;
                       Dm1.CadE120IpdPREUNI.Value := StrToCurr(vaPreUni);
                       Dm1.CadE120IpdPERCOM.Value := StrToFloat(vaPerCom);
                       Dm1.CadE120IpdVLRBRU.Value := StrToCurr(vaVlrBru);
                       Dm1.CadE120IpdVLRBCO.Value := StrToCurr(vaVlrBco);
                       Dm1.CadE120IpdVLRCOM.Value := StrToCurr(vaVlrCom);
                       Dm1.CadE120IpdVLRLPR.Value := StrToCurr(vaVlrLpr);
                       Dm1.CadE120IpdVLRLIQ.Value := StrToCurr(vaVlrLiq);
                       Dm1.CadE120IpdSITIPD.Value := vaSitIpd;
                       Dm1.CadE120IpdUSUGER.Value := StrToInt(vaUsuger);
                       Dm1.CadE120IpdDATGER.Value := StrToDate(vaDatGer);
                       Dm1.CadE120IpdTOTDESC.Value := StrToCurr(vaTotDsc);
                       Dm1.CadE120IpdVLRORI.Value := StrToCurr(vaVlrOri);
                       Dm1.CadE120IpdDATEMI.Value := StrToDate(vaDatEmi);
                       Dm1.CadE120Ipd.Post;
                       Dm1.IBDTransacao.CommitRetaining;
                     end//22
                  else
                     begin//22a
                        Dm1.CadE120Ipd.Insert;
                        Dm1.CadE120IpdCODEMP.Value := StrToInt(vaCodEmp);
                        Dm1.CadE120IpdCODFIL.Value := StrToInt(vaCodFil);
                        Dm1.CadE120IpdNUMPED.Value := StrToInt(vaNumped);
                        Dm1.CadE120IpdNUMCON.Value := StrToInt(vaNumCom);
                        Dm1.CadE120IpdCODREP.Value := StrToInt(vaCodRep);
                        Dm1.CadE120IpdSEQIPD.Value := StrToInt(vaSeqIpd);
                        Dm1.CadE120IpdTNSPRO.Value := vaTnsPro;
                        Dm1.CadE120IpdCODPRO.Value := vaCodPro;
                        Dm1.CadE120IpdCODDER.Value := vaCodDer;
                        Dm1.CadE120IpdCODFAM.Value := vaCodFam;
                        Dm1.CadE120IpdQTDPED.Value := StrToInt(vaQtdPed);
                        Dm1.CadE120IpdQTDFAT.Value := StrToInt(vaQtdFat);
                        Dm1.CadE120IpdQTDCAN.Value := StrToInt(vaQtdCan);
                        Dm1.CadE120IpdQTDABE.Value := StrToInt(vaQtdAbe);
                        Dm1.CadE120IpdUNIMED.Value := vaUniMed;
                        Dm1.CadE120IpdCODTPR.Value := vaCodTpr;
                        Dm1.CadE120IpdPREUNI.Value := StrToCurr(vaPreUni);
                        Dm1.CadE120IpdPERCOM.Value := StrToFloat(vaPerCom);
                        Dm1.CadE120IpdVLRBRU.Value := StrToCurr(vaVlrBru);
                        Dm1.CadE120IpdVLRBCO.Value := StrToCurr(vaVlrBco);
                        Dm1.CadE120IpdVLRCOM.Value := StrToCurr(vaVlrCom);
                        Dm1.CadE120IpdVLRLPR.Value := StrToCurr(vaVlrLpr);
                        Dm1.CadE120IpdVLRLIQ.Value := StrToCurr(vaVlrLiq);
                        Dm1.CadE120IpdSITIPD.Value := vaSitIpd;
                        Dm1.CadE120IpdUSUGER.Value := StrToInt(vaUsuger);
                        Dm1.CadE120IpdDATGER.Value := StrToDate(vaDatGer);
                        Dm1.CadE120IpdTOTDESC.Value := StrToCurr(vaTotDsc);
                        Dm1.CadE120IpdVLRORI.Value := StrToCurr(vaVlrOri);
                        Dm1.CadE120IpdDATEMI.Value := StrToDate(vaDatEmi);
                        Dm1.CadE120IpdCORGRID.Value := '$00DDFFFF';
                        Dm1.CadE120Ipd.Post;
                        Dm1.IBDTransacao.CommitRetaining;
                     end;//22a


                end;//21
                  statusPedidos.Progress := statusPedidos.Progress + 1;
               end;//15
        CloseFile(arqE120Ipd);
        DeleteFile(destino2);
        Refresh;
      end;//14 //fim dos produtos dos pedidos


     //le o arquivo recebido e grava seus dados  Usu120Ipd
    if FileExists(destino3) then
       begin//23

          //conta a quantidade de linhas do arquivo
          vnQtdLin := TStringList.Create;
          try
            vnQtdLin.LoadFromFile(destino3);
            vnQtdLinha := vnQtdLin.Count;
          finally
             vnQtdLin.Free;
             statusPedidos.MaxValue := vnQtdLinha;
             statusPedidos.Progress := 0;
          end;


           Refresh;
           AssignFile(arqUsu120Ipd, destino3);
           Reset(arqUsu120Ipd);
           While not Eof(arqUsu120Ipd) do
             begin//24
                vaCodEmp := '';vaCodFil := '';vaNumped := '';vaNumCom := '';vaSeqIpd := '';vaSeqIte := '';
                vaQtdCor := '';vaTipCmb := '';vaCor001 := '';vaCor002 := '';vaCodPro := '';vaCodder := '';
                vaTecTra := '';vaQtdAbe := '';vaQtdCan := '';vaPreCar := '';vaCodRep := '';

                Readln(arqUsu120Ipd, linha);
                I := 1;
                while I < Length(linha) do
                  begin//25
                    while linha[I] <> ';' do
                      begin
                         vaCodEmp := vaCodEmp + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaCodFil := vaCodFil + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaNumped := vaNumped + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaCodRep := vaCodRep + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaSeqIpd := vaSeqIpd + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaSeqIte := vaSeqIte + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaNumCom := vaNumCom + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaQtdCor := vaQtdCor + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaTipCmb := vaTipCmb + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaCor001 := vaCor001 + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaCor002 := vaCor002 + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaCodPro := vaCodPro + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaCodDer := vaCodDer + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaTecTra := vaTecTra + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaQtdAbe := vaQtdAbe + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaQtdCan := vaQtdCan + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaPreCar := vaPreCar + linha[i];
                         I := I + 1;
                      end;
                  end;//25

                  //grava no banco
                  if vaNumCom = '0' then
                     begin//26
                       Dm1.ConsGeral.Close;
                       Dm1.ConsGeral.SQL.Clear;
                       Dm1.ConsGeral.SQL.Add('select usu120ipd.* from usu120ipd');
                       Dm1.ConsGeral.SQL.Add('where');
                       Dm1.ConsGeral.SQL.Add('usu120ipd.codemp = :codemp and');
                       Dm1.ConsGeral.SQL.Add('usu120ipd.codfil = :codfil and');
                       Dm1.ConsGeral.SQL.Add('usu120ipd.codrep = :codrep and');
                       Dm1.ConsGeral.SQL.Add('usu120ipd.seqipd = :seqipd and');
                       Dm1.ConsGeral.SQL.Add('usu120ipd.seqite = :seqite and');
                       Dm1.ConsGeral.SQL.Add('usu120ipd.numped = :numped');
                       Dm1.ConsGeral.ParamByName('codemp').Value := StrToInt(vaCodEmp);
                       Dm1.ConsGeral.ParamByName('codfil').Value := StrToInt(vaCodFil);
                       Dm1.ConsGeral.ParamByName('codrep').Value := StrToInt(vaCodRep);
                       Dm1.ConsGeral.ParamByName('seqipd').Value := StrToInt(vaSeqIpd);
                       Dm1.ConsGeral.ParamByName('seqite').Value := StrToInt(vaSeqIte);
                       Dm1.ConsGeral.ParamByName('numped').Value := StrToInt(vaNumped);
                       Dm1.ConsGeral.Open;
                       if Dm1.ConsGeral.IsEmpty then
                          begin//27
                             Dm1.CadUsu120Ipd.Open;
                             Dm1.CadUsu120Ipd.Insert;
                             Dm1.CadUsu120IpdCODEMP.Value := StrToInt(vaCodEmp);
                             Dm1.CadUsu120IpdCODFIL.Value := StrToInt(vaCodFil);
                             Dm1.CadUsu120IpdSEQIPD.Value := StrToInt(vaSeqIpd);
                             Dm1.CadUsu120IpdSEQITE.Value := StrToInt(vaSeqIte);
                             Dm1.CadUsu120IpdNUMPED.Value := StrToInt(vaNumped);
                             Dm1.CadUsu120IpdQTDCOR.Value := StrToInt(vaQtdCor);
                             Dm1.CadUsu120IpdQTDABE.Value := StrToInt(vaQtdAbe);
                             Dm1.CadUsu120IpdQTDCAN.Value := StrToInt(vaQtdCan);
                             Dm1.CadUsu120IpdTIPCMB.Value := StrToInt(vaTipCmb);
                             Dm1.CadUsu120IpdCOR001.Value := vaCor001;
                             Dm1.CadUsu120IpdCOR002.Value := vaCor002;
                             Dm1.CadUsu120IpdCODPRO.Value := vaCodPro;
                             Dm1.CadUsu120IpdCODDER.Value := vaCodDer;
                             Dm1.CadUsu120IpdTECTRA.Value := vaTecTra;
                             Dm1.CadUsu120IpdPRECAR.Value := StrToInt(vaPreCar);
                             Dm1.CadUsu120IpdCODREP.Value := StrToInt(vaCodRep);

                             Dm1.ConsGeral.Close;
                             Dm1.ConsGeral.SQL.Clear;
                             Dm1.ConsGeral.SQL.Add('select e120ped.* from e120ped');
                             Dm1.ConsGeral.SQL.Add('where');
                             Dm1.ConsGeral.SQL.Add('e120ped.codemp = :codemp and');
                             Dm1.ConsGeral.SQL.Add('e120ped.codfil = :codfil and');
                             Dm1.ConsGeral.SQL.Add('e120ped.numped = :numped and');
                             Dm1.ConsGeral.SQL.Add('e120ped.codrep = :codrep ');
                             Dm1.ConsGeral.ParamByName('codemp').Value := StrToInt(vaCodEmp);
                             Dm1.ConsGeral.ParamByName('codfil').Value := StrToInt(vaCodFil);
                             Dm1.ConsGeral.ParamByName('numped').Value := StrToInt(vaNumped);
                             Dm1.ConsGeral.ParamByName('codrep').Value := StrToInt(vaCodRep);
                             Dm1.ConsGeral.Open;
                             if Dm1.ConsGeral.IsEmpty then
                                Dm1.CadUsu120Ipd.Cancel
                             else
                                begin
                                  Dm1.CadUsu120IpdNUMCON.Value := Dm1.ConsGeral.FieldByName('NUMCON').Value;
                                  Dm1.CadUsu120Ipd.Post;
                                  Dm1.IBDTransacao.CommitRetaining;
                                end;
                          end//27
                       else
                          begin//28
                             Dm1.CadUsu120Ipd.Close;
                             Dm1.CadUsu120Ipd.ParamByName('codemp').Value := Dm1.ConsGeral.FieldByName('CODEMP').Value;
                             Dm1.CadUsu120Ipd.ParamByName('codfil').Value := Dm1.ConsGeral.FieldByName('CODFIL').Value;
                             Dm1.CadUsu120Ipd.ParamByName('codrep').Value := Dm1.ConsGeral.FieldByName('CODREP').Value;
                             Dm1.CadUsu120Ipd.ParamByName('numcon').Value := Dm1.ConsGeral.FieldByName('NUMCON').Value;
                             Dm1.CadUsu120Ipd.ParamByName('seqipd').Value := Dm1.ConsGeral.FieldByName('SEQIPD').Value;
                             Dm1.CadUsu120Ipd.ParamByName('seqite').Value := Dm1.ConsGeral.FieldByName('SEQITE').Value;
                             Dm1.CadUsu120Ipd.Open;
                             if not Dm1.CadUsu120Ipd.IsEmpty then
                                begin //29
                                  Dm1.CadUsu120Ipd.Edit;
                                  Dm1.CadUsu120IpdNUMPED.Value := StrToInt(vaNumped);
                                  Dm1.CadUsu120IpdQTDCOR.Value := StrToInt(vaQtdCor);
                                  Dm1.CadUsu120IpdQTDABE.Value := StrToInt(vaQtdAbe);
                                  Dm1.CadUsu120IpdQTDCAN.Value := StrToInt(vaQtdCan);
                                  Dm1.CadUsu120IpdTIPCMB.Value := StrToInt(vaTipCmb);
                                  Dm1.CadUsu120IpdCOR001.Value := vaCor001;
                                  Dm1.CadUsu120IpdCOR002.Value := vaCor002;
                                  Dm1.CadUsu120IpdCODPRO.Value := vaCodPro;
                                  Dm1.CadUsu120IpdCODDER.Value := vaCodDer;
                                  Dm1.CadUsu120IpdTECTRA.Value := vaTecTra;
                                  Dm1.CadUsu120IpdPRECAR.Value := StrToInt(vaPreCar);
                                  Dm1.CadUsu120Ipd.Post;
                                  Dm1.IBDTransacao.CommitRetaining;
                                end;//29
                          end;//28
                     end//26
                  else
                     begin//30
                        Dm1.CadUsu120Ipd.Close;
                        Dm1.CadUsu120Ipd.ParamByName('codemp').Value := StrToInt(vaCodEmp);
                        Dm1.CadUsu120Ipd.ParamByName('codfil').Value := StrToInt(vaCodFil);
                        Dm1.CadUsu120Ipd.ParamByName('codrep').Value := StrToInt(vaCodRep);
                        Dm1.CadUsu120Ipd.ParamByName('numcon').Value := StrToInt(vaNumCom);
                        Dm1.CadUsu120Ipd.ParamByName('seqipd').Value := StrToInt(vaSeqIpd);
                        Dm1.CadUsu120Ipd.ParamByName('seqite').Value := StrToInt(vaSeqIte);
                        Dm1.CadUsu120Ipd.Open;
                        if not Dm1.CadUsu120Ipd.IsEmpty then
                           begin //31
                             Dm1.CadUsu120Ipd.Edit;
                             Dm1.CadUsu120IpdNUMPED.Value := StrToInt(vaNumped);
                             Dm1.CadUsu120IpdQTDCOR.Value := StrToInt(vaQtdCor);
                             Dm1.CadUsu120IpdQTDABE.Value := StrToInt(vaQtdAbe);
                             Dm1.CadUsu120IpdQTDCAN.Value := StrToInt(vaQtdCan);
                             Dm1.CadUsu120IpdTIPCMB.Value := StrToInt(vaTipCmb);
                             Dm1.CadUsu120IpdCOR001.Value := vaCor001;
                             Dm1.CadUsu120IpdCOR002.Value := vaCor002;
                             Dm1.CadUsu120IpdCODPRO.Value := vaCodPro;
                             Dm1.CadUsu120IpdCODDER.Value := vaCodDer;
                             Dm1.CadUsu120IpdTECTRA.Value := vaTecTra;
                             Dm1.CadUsu120IpdPRECAR.Value := StrToInt(vaPreCar);
                             Dm1.CadUsu120Ipd.Post;
                             Dm1.IBDTransacao.CommitRetaining;
                           end//31
                        else
                           begin//31a
                              Dm1.CadUsu120Ipd.Insert;
                             Dm1.CadUsu120IpdCODEMP.Value := StrToInt(vaCodEmp);
                             Dm1.CadUsu120IpdCODFIL.Value := StrToInt(vaCodFil);
                             Dm1.CadUsu120IpdSEQIPD.Value := StrToInt(vaSeqIpd);
                             Dm1.CadUsu120IpdSEQITE.Value := StrToInt(vaSeqIte);
                             Dm1.CadUsu120IpdNUMPED.Value := StrToInt(vaNumped);
                             Dm1.CadUsu120IpdNUMCON.Value := StrToInt(vaNumCom);
                             Dm1.CadUsu120IpdQTDCOR.Value := StrToInt(vaQtdCor);
                             Dm1.CadUsu120IpdQTDABE.Value := StrToInt(vaQtdAbe);
                             Dm1.CadUsu120IpdQTDCAN.Value := StrToInt(vaQtdCan);
                             Dm1.CadUsu120IpdTIPCMB.Value := StrToInt(vaTipCmb);
                             Dm1.CadUsu120IpdCOR001.Value := vaCor001;
                             Dm1.CadUsu120IpdCOR002.Value := vaCor002;
                             Dm1.CadUsu120IpdCODPRO.Value := vaCodPro;
                             Dm1.CadUsu120IpdCODDER.Value := vaCodDer;
                             Dm1.CadUsu120IpdTECTRA.Value := vaTecTra;
                             Dm1.CadUsu120IpdPRECAR.Value := StrToInt(vaPreCar);
                             Dm1.CadUsu120IpdCODREP.Value := StrToInt(vaCodRep);
                             Dm1.CadUsu120Ipd.Post;
                             Dm1.IBDTransacao.CommitRetaining;
                           end;//31a
                     end;//30
                     statusPedidos.Progress := statusPedidos.Progress + 1;
             end;//24
        CloseFile(arqUsu120Ipd);
        DeleteFile(destino3);
        Refresh;
       end;//23

        //le o arquivo recebido e grava seus dados  E120Obs
       if FileExists(destino4) then
       begin//32
           //conta a quantidade de linhas do arquivo
           vnQtdLin := TStringList.Create;
           try
             vnQtdLin.LoadFromFile(destino4);
             vnQtdLinha := vnQtdLin.Count;
           finally
              vnQtdLin.Free;
              statusPedidos.MaxValue := vnQtdLinha;
              statusPedidos.Progress := 0;
          end;

           Refresh;
           AssignFile(arqE120Obs, destino4);
           Reset(arqE120Obs);
           While not Eof(arqE120Obs) do
             begin//33
                vaCodEmp := '';vaCodFil := '';vaNumped := '';vaNumCom := '';vaCodRep := '';
                vaSeqObs := '';vaTipObs := '';vaObsPed := '';vaObsUsu := '';vaObsDat := '';
                vaSitObs := '';

                Readln(arqE120Obs, linha);
                I := 1;
                while I < Length(linha) do
                  begin//34
                    while linha[I] <> ';' do
                      begin
                         vaCodEmp := vaCodEmp + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaCodFil := vaCodFil + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaNumped := vaNumped + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaNumCom := vaNumCom + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaCodRep := vaCodRep + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaSeqObs := vaSeqObs + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaTipObs := vaTipObs + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaObsPed := vaObsPed + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaObsUsu := vaObsUsu + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaObsDat := vaObsDat + linha[i];
                         I := I + 1;
                      end;
                    I := I + 1;
                    while linha[I] <> ';' do
                      begin
                         vaSitObs := vaSitObs + linha[i];
                         I := I + 1;
                      end;

                  end;//34

                  //grava no banco
                  if vaNumCom = '0' then
                     begin//35
                        Dm1.ConsGeral.Close;
                        Dm1.ConsGeral.SQL.Clear;
                        Dm1.ConsGeral.SQL.Add('select e120obs.* from e120obs');
                        Dm1.ConsGeral.SQL.Add('where');
                        Dm1.ConsGeral.SQL.Add('e120obs.codemp = :codemp and');
                        Dm1.ConsGeral.SQL.Add('e120obs.codfil = :codfil and');
                        Dm1.ConsGeral.SQL.Add('e120obs.numped = :numped and');
                        Dm1.ConsGeral.SQL.Add('e120obs.codrep = :codrep and');
                        Dm1.ConsGeral.SQL.Add('e120obs.seqobs = :seqobs');
                        Dm1.ConsGeral.ParamByName('codemp').Value := StrToInt(vaCodEmp);
                        Dm1.ConsGeral.ParamByName('codfil').Value := StrToInt(vaCodFil);
                        Dm1.ConsGeral.ParamByName('numped').Value := StrToInt(vaNumped);
                        Dm1.ConsGeral.ParamByName('codrep').Value := StrToInt(vaCodRep);
                        Dm1.ConsGeral.ParamByName('seqobs').Value := StrToInt(vaSeqObs);
                        Dm1.ConsGeral.Open;
                        if Dm1.ConsGeral.IsEmpty then
                           begin//36
                              Dm1.CadE120Obs.Open;
                              Dm1.CadE120Obs.Insert;
                              Dm1.CadE120ObsCODEMP.Value := StrToInt(vaCodEmp);
                              Dm1.CadE120ObsCODFIL.Value := StrToInt(vaCodFil);
                              Dm1.CadE120ObsSEQOBS.Value := StrToInt(vaSeqObs);
                              Dm1.CadE120ObsNUMPED.Value := StrToInt(vaNumped);
                              Dm1.CadE120ObsOBSPED.Value := vaObsPed;
                              Dm1.CadE120ObsSITOBS.Value := vaSitObs;
                              Dm1.CadE120ObsOBSUSU.Value := StrToInt(vaObsUsu);
                              Dm1.CadE120ObsOBSDAT.Value := StrToDate(vaObsDat);
                              Dm1.CadE120ObsCODREP.Value := StrToInt(vaCodRep);

                              Dm1.ConsGeral.Close;
                              Dm1.ConsGeral.SQL.Clear;
                              Dm1.ConsGeral.SQL.Add('select e120ped.* from e120ped');
                              Dm1.ConsGeral.SQL.Add('where');
                              Dm1.ConsGeral.SQL.Add('e120ped.codemp = :codemp and');
                              Dm1.ConsGeral.SQL.Add('e120ped.codfil = :codfil and');
                              Dm1.ConsGeral.SQL.Add('e120ped.numped = :numped and');
                              Dm1.ConsGeral.SQL.Add('e120ped.codrep = :codrep ');
                              Dm1.ConsGeral.ParamByName('codemp').Value := StrToInt(vaCodEmp);
                              Dm1.ConsGeral.ParamByName('codfil').Value := StrToInt(vaCodFil);
                              Dm1.ConsGeral.ParamByName('numped').Value := StrToInt(vaNumped);
                              Dm1.ConsGeral.ParamByName('codrep').Value := StrToInt(vaCodRep);
                              Dm1.ConsGeral.Open;
                              if Dm1.ConsGeral.IsEmpty then
                                 Dm1.CadE120Obs.Cancel
                              else
                                 begin
                                   Dm1.CadE120ObsNUMCON.Value := Dm1.ConsGeral.FieldByName('NUMCON').Value;
                                   Dm1.CadE120Obs.Post;
                                   Dm1.IBDTransacao.CommitRetaining;
                                 end;
                           end//36
                        else
                           begin//37
                              Dm1.CadE120Obs.Close;
                              Dm1.CadE120Obs.ParamByName('codemp').Value := Dm1.ConsGeral.FieldByName('CODEMP').Value;
                              Dm1.CadE120Obs.ParamByName('codfil').Value := Dm1.ConsGeral.FieldByName('CODFIL').Value;
                              Dm1.CadE120Obs.ParamByName('numcon').Value := Dm1.ConsGeral.FieldByName('NUMCON').Value;
                              Dm1.CadE120Obs.ParamByName('codrep').Value := Dm1.ConsGeral.FieldByName('CODREP').Value;
                              Dm1.CadE120Obs.ParamByName('seqobs').Value := Dm1.ConsGeral.FieldByName('SEQOBS').Value;
                              Dm1.CadE120Obs.Open;
                              if not Dm1.CadE120Obs.IsEmpty then
                                 begin//38
                                   Dm1.CadE120Obs.Edit;
                                   Dm1.CadE120ObsOBSPED.Value := vaObsPed;
                                   Dm1.CadE120ObsSITOBS.Value := vaSitObs;
                                   Dm1.CadE120ObsOBSUSU.Value := StrToInt(vaObsUsu);
                                   Dm1.CadE120ObsOBSDAT.Value := StrToDate(vaObsDat);
                                   Dm1.CadE120Obs.Post;
                                   Dm1.IBDTransacao.CommitRetaining;
                                 end;//38
                           end;//37

                     end//35
                  else
                     begin//39
                         Dm1.CadE120Obs.Close;
                         Dm1.CadE120Obs.ParamByName('codemp').Value := StrToInt(vaCodEmp);
                         Dm1.CadE120Obs.ParamByName('codfil').Value := StrToInt(vaCodFil);
                         Dm1.CadE120Obs.ParamByName('numcon').Value := StrToInt(vaNumCom);
                         Dm1.CadE120Obs.ParamByName('codrep').Value := StrToInt(vaCodRep);
                         Dm1.CadE120Obs.ParamByName('seqobs').Value := StrToInt(vaSeqObs);
                         Dm1.CadE120Obs.Open;
                         if not Dm1.CadE120Obs.IsEmpty then
                            begin//40
                               Dm1.CadE120Obs.Edit;
                               Dm1.CadE120ObsOBSPED.Value := vaObsPed;
                               Dm1.CadE120ObsSITOBS.Value := vaSitObs;
                               Dm1.CadE120ObsOBSUSU.Value := StrToInt(vaObsUsu);
                               Dm1.CadE120ObsOBSDAT.Value := StrToDate(vaObsDat);
                               Dm1.CadE120Obs.Post;
                               Dm1.IBDTransacao.CommitRetaining;
                            end//40
                         else
                            begin//41
                              Dm1.CadE120Obs.Open;
                              Dm1.CadE120Obs.Insert;
                              Dm1.CadE120ObsCODEMP.Value := StrToInt(vaCodEmp);
                              Dm1.CadE120ObsCODFIL.Value := StrToInt(vaCodFil);
                              Dm1.CadE120ObsSEQOBS.Value := StrToInt(vaSeqObs);
                              Dm1.CadE120ObsNUMPED.Value := StrToInt(vaNumped);
                              Dm1.CadE120ObsNUMCON.Value := StrToInt(vaNumCom);
                              Dm1.CadE120ObsOBSPED.Value := vaObsPed;
                              Dm1.CadE120ObsSITOBS.Value := vaSitObs;
                              Dm1.CadE120ObsOBSUSU.Value := StrToInt(vaObsUsu);
                              Dm1.CadE120ObsOBSDAT.Value := StrToDate(vaObsDat);
                              Dm1.CadE120ObsCODREP.Value := StrToInt(vaCodRep);
                              Dm1.CadE120Obs.Post;
                              Dm1.IBDTransacao.CommitRetaining;
                            end;//41
                     end;//39

                     statusPedidos.Progress := statusPedidos.Progress + 1;
             end;//33
        CloseFile(arqE120Obs);
        DeleteFile(destino4);
        Refresh;

       end;//32

    end;//1

end;

procedure TFAtualiza.BProdutosClick(Sender: TObject);
var dir,nome,nome2,destino2,destino : string;
    arq,arq2 : TextFile;
    linha : string;
    I : integer;
    vaCodEmp,vaCodPro,vaDesPro,vaCodFam,vaCodAgp,vaSitPro : string;
    vaCodDer,vaDesDer,vaPesBru,vaPesLiq,vaVolDer,vaSitDer,vaCorUni,vaCmp1bb,
    vaCmp1Ac,vaCmp2bb,vaCmp2En : string;
    vnQtdProd : TStringList;
    vnQtdProdutos : integer;
begin
if not ftp.Connected then
  begin
    MessageDlg('Sistema desconectado..',mtWarning,[mbok],0);

  end
  else
    begin//1
   try
      StatusBar1.Panels[1].Text := 'Baixando arquivo de peodutos';
      dir := '/ArqAtu'; //onde esta o arquivo no servidor
      ftp.ChangeDir(dir);
      Refresh;

      Nome := 'E075PRO.txt'; //nome do arquivo
      destino := 'C:\SysRep\ArqFtp\ArqAtu\'; //onde vai jogar o arquivo/nome_do_arquivo.extençao
      destino := destino +'E075PRO.txt';
      ftp.Get(Nome, destino, true);

      nome2 := 'E075DER.txt'; //nome do arquivo
      destino2 := 'C:\SysRep\ArqFtp\ArqAtu\'; //onde vai jogar o arquivo/nome_do_arquivo.extençao
      destino2 := destino2 +'E075DER.txt';
      ftp.Get(nome2, destino2, true);

      StatusBar1.Panels[1].Text := '';
  Except
     MessageDlg('Erro na transferência do arquivo de configuração!',mtWarning,[mbok],0);
     abort;
   end; //fim do except
     //le o arquivo recebido e grava seus dados  E075PRO
   if FileExists(destino) then
      begin//2
      //conta a quantidade de linhas do arquivo
      vnQtdProd := TStringList.Create;
      try
        vnQtdProd.LoadFromFile(destino);
        vnQtdProdutos := vnQtdProd.Count;
      finally
         vnQtdProd.Free;
         statusProdutos.MaxValue := vnQtdProdutos;
         statusProdutos.Progress := 0;
      end;

         Refresh;

         AssignFile(arq, destino);
         Reset(arq);
         While not Eof(arq) do
           begin//3
              vaCodEmp := '';vaCodPro := '';vaDesPro := '';
              vaCodFam := '';vaCodAgp := '';vaSitPro := '';

              Readln(arq, linha);
              I := 1;
              while I < Length(linha) do
                begin//6
                  while linha[I] <> ';' do
                    begin
                       vaCodEmp := vaCodEmp + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaCodPro := vaCodPro + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaDesPro := vaDesPro + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaCodFam := vaCodFam + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaCodAgp := vaCodAgp + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaSitPro := vaSitPro + linha[i];
                       I := I + 1;
                    end;


                end;//6

                //grava no banco
              Dm1.CadE075Pro.Close;
              Dm1.CadE075Pro.ParamByName('codemp').Value := StrToInt(vaCodEmp);
              Dm1.CadE075Pro.ParamByName('codpro').Value := vaCodPro;
              Dm1.CadE075Pro.Open;
              if Dm1.CadE075Pro.IsEmpty then
                begin//4
                   Dm1.CadE075Pro.Insert;
                   Dm1.CadE075ProCODEMP.Value := StrToInt(TRIM(vaCodEmp));
                   Dm1.CadE075ProCODPRO.Value := TRIM(vaCodPro);
                   Dm1.CadE075ProDESPRO.Value := TRIM(vaDesPro);
                   Dm1.CadE075ProCODFAM.Value := TRIM(vaCodFam);
                   Dm1.CadE075ProCODAGP.Value := TRIM(vaCodAgp);
                   Dm1.CadE075ProSITPRO.Value := TRIM(vaSitPro);

                   Dm1.CadE075Pro.Post;
                   Dm1.IBDTransacao.Commit;
                end//4
              else
                begin//5
                   Dm1.CadE075Pro.Edit;
                   Dm1.CadE075ProDESPRO.Value := TRIM(vaDesPro);
                   Dm1.CadE075ProCODFAM.Value := TRIM(vaCodFam);
                   Dm1.CadE075ProCODAGP.Value := TRIM(vaCodAgp);
                   Dm1.CadE075ProSITPRO.Value := TRIM(vaSitPro);

                   Dm1.CadE075Pro.Post;
                   Dm1.IBDTransacao.Commit;
                end;//5
                statusProdutos.Progress := statusProdutos.Progress + 1;
             end;//3
      end;//2
         CloseFile(arq);
         DeleteFile(destino);

         if FileExists(destino2) then
      begin//7
      //conta a quantidade de linhas do arquivo
      vnQtdProd := TStringList.Create;
      try
        vnQtdProd.LoadFromFile(destino2);
        vnQtdProdutos := vnQtdProd.Count;
      finally
         vnQtdProd.Free;
         statusProdutos.MaxValue := vnQtdProdutos;
         statusProdutos.Progress := 0;
      end;
         Refresh;

         AssignFile(arq2, destino2);
         Reset(arq2);
         While not Eof(arq2) do
           begin//8
              vaCodEmp := '';vaCodPro := '';vaCodDer := '';vaDesDer := '';
              vaPesBru := '';vaPesLiq := '';vaVolDer := '';vaSitDer := '';
              vaCorUni := '';vaCmp1bb := '';vaCmp1Ac := '';vaCmp2bb := '';
              vaCmp2En := '';

              Readln(arq2, linha);
              I := 1;
              while I < Length(linha) do
                begin//9
                  while linha[I] <> ';' do
                    begin
                       vaCodEmp := vaCodEmp + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaCodPro := vaCodPro + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaCodDer := vaCodDer + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaDesDer := vaDesDer + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaPesBru := vaPesBru + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaPesLiq := vaPesLiq + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaVolDer := vaVolDer + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaSitDer := vaSitDer + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaCorUni := vaCorUni + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaCmp1bb := vaCmp1bb + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaCmp1Ac := vaCmp1Ac + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaCmp2bb := vaCmp2bb + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaCmp2En := vaCmp2En + linha[i];
                       I := I + 1;
                    end;

                end;//9

                //grava no banco
              Dm1.CadE075Der.Close;
              Dm1.CadE075Der.ParamByName('codemp').Value := StrToInt(vaCodEmp);
              Dm1.CadE075Der.ParamByName('codpro').Value := vaCodPro;
              Dm1.CadE075Der.ParamByName('codder').Value := vaCodDer;
              Dm1.CadE075Der.Open;
              if Dm1.CadE075Der.IsEmpty then
                begin//10
                   Dm1.CadE075Der.Insert;
                   Dm1.CadE075DerCODEMP.Value := StrToInt(TRIM(vaCodEmp));
                   Dm1.CadE075DerCODPRO.Value := TRIM(vaCodPro);
                   Dm1.CadE075DerCODDER.Value := TRIM(vaCodDer);
                   Dm1.CadE075DerDESDER.Value := TRIM(vaDesDer);
                   Dm1.CadE075DerPESBRU.Value := StrToFloat(vaPesBru);
                   Dm1.CadE075DerPESLIQ.Value := StrToFloat(vaPesLiq);
                   Dm1.CadE075DerVOLDER.Value := StrToFloat(vaVolDer);
                   Dm1.CadE075DerSITDER.Value := vaSitDer;
                   Dm1.CadE075DerCORUNI.Value := StrToFloat(vaCorUni);
                   Dm1.CadE075DerCMP1BB.Value := StrToFloat(vaCmp1bb);
                   Dm1.CadE075DerCMP1AC.Value := StrToFloat(vaCmp1Ac);
                   Dm1.CadE075DerCMP2BB.Value := StrToFloat(vaCmp2bb);
                   Dm1.CadE075DerCMP2EN.Value := StrToFloat(vaCmp2En);

                   Dm1.CadE075Der.Post;
                   Dm1.IBDTransacao.Commit;
                end//10
              else
                begin//11
                   Dm1.CadE075Der.Edit;
                   Dm1.CadE075DerDESDER.Value := TRIM(vaDesDer);
                   Dm1.CadE075DerPESBRU.Value := StrToFloat(vaPesBru);
                   Dm1.CadE075DerPESLIQ.Value := StrToFloat(vaPesLiq);
                   Dm1.CadE075DerVOLDER.Value := StrToFloat(vaVolDer);
                   Dm1.CadE075DerSITDER.Value := vaSitDer;
                   Dm1.CadE075DerCORUNI.Value := StrToFloat(vaCorUni);
                   Dm1.CadE075DerCMP1BB.Value := StrToFloat(vaCmp1bb);
                   Dm1.CadE075DerCMP1AC.Value := StrToFloat(vaCmp1Ac);
                   Dm1.CadE075DerCMP2BB.Value := StrToFloat(vaCmp2bb);
                   Dm1.CadE075DerCMP2EN.Value := StrToFloat(vaCmp2En);

                   Dm1.CadE075Der.Post;
                   Dm1.IBDTransacao.Commit;
                end;//11
                statusProdutos.Progress := statusProdutos.Progress + 1;
             end;//8
      end;//7
         CloseFile(arq2);
         DeleteFile(destino2);
    end;//1

end;

procedure TFAtualiza.BTabPrecoClick(Sender: TObject);
var dir,nome,nomeTab,destino,destinoTab : string;
    arq,arqTab : TextFile;
    linha,linhaTab : string;
    I : integer;

    vaCodEmp,vaCodTpr,vaCodPro,vaCodDer,vaCodUsu,vaDesPro,vaPreBas,vaTolMai,
    vaTolMen,vaVlrMai,vaVlrMen,vaSitReg,vaDatIni,vaDatFim : string;

    vaCodEmpTab,vaCodTprTab,vaCodUsuTab,vaDesTprTab,vaSitTprTab : string;

    vnQtdCpg : TStringList;
    vnQtdCpgg : integer;
begin
if not ftp.Connected then
  begin
    MessageDlg('Sistema desconectado..',mtWarning,[mbok],0);

  end
  else
    begin//1
   try
      StatusBar1.Panels[1].Text := 'Baixando arquivo _E081TAB';
      dir := '/ArqAtu'; //onde esta o arquivo no servidor
      ftp.ChangeDir(dir);
      Refresh;
      nomeTab := IntToStr(FPrincipal.vnCodusu)+'_E081TAB.txt'; //nome do arquivo
      destinoTab := 'C:\SysRep\ArqFtp\ArqAtu\'; //onde vai jogar o arquivo/nome_do_arquivo.extençao
      destinoTab := destinoTab + IntToStr(FPrincipal.vnCodusu)+'_E081TAB.txt';
      ftp.Get(nomeTab, destinoTab, true);

      Nome := IntToStr(FPrincipal.vnCodusu)+'_E081ITP.txt'; //nome do arquivo
      destino := 'C:\SysRep\ArqFtp\ArqAtu\'; //onde vai jogar o arquivo/nome_do_arquivo.extençao
      destino := destino + IntToStr(FPrincipal.vnCodusu)+'_E081ITP.txt';
      ftp.Get(Nome, destino, true);
      StatusBar1.Panels[1].Text := '';

  Except
     MessageDlg('Erro na transferência do arquivo de configuração!',mtWarning,[mbok],0);
     Abort;
   end; //fim do except
     //le o arquivo recebido e grava seus dados  E081TAB
   if FileExists(destino) then
      begin//2
      //conta a quantidade de linhas do arquivo
      vnQtdCpg := TStringList.Create;
      try
        vnQtdCpg.LoadFromFile(destino);
        vnQtdCpgg := vnQtdCpg.Count;
      finally
         vnQtdCpg.Free;
         statusTabPreco.MaxValue := vnQtdCpgg;
         statusTabPreco.Progress := 0;
      end;

         Refresh;

         AssignFile(arqTab, destinoTab);
         Reset(arqTab);
         While not Eof(arqTab) do
           begin//3
             vaCodEmpTab := '';vaCodTprTab := '';vaCodUsuTab := '';vaDesTprTab := ''; vaSitTprTab := '';

              Readln(arqTab, linhaTab);
              I := 1;
              while I < Length(linhaTab) do
                begin//6
                  while linhaTab[I] <> ';' do
                    begin
                       vaCodEmpTab := vaCodEmpTab + linhaTab[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linhaTab[I] <> ';' do
                    begin
                       vaCodTprTab := vaCodTprTab + linhaTab[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linhaTab[I] <> ';' do
                    begin
                       vaCodUsuTab := vaCodUsuTab + linhaTab[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linhaTab[I] <> ';' do
                    begin
                       vaDesTprTab := vaDesTprTab + linhaTab[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linhaTab[I] <> ';' do
                    begin
                       vaSitTprTab := vaSitTprTab + linhaTab[i];
                       I := I + 1;
                    end;

                end;//6

                //grava no banco
                Dm1.CadE081Tab.Close;
                Dm1.CadE081Tab.ParamByName('codemp').Value := StrToInt(vaCodEmpTab);
                Dm1.CadE081Tab.ParamByName('codtpr').Value := vaCodTprTab;
                Dm1.CadE081Tab.ParamByName('codusu').Value := StrToInt(vaCodUsuTab);
                Dm1.CadE081Tab.Open;
                if Dm1.CadE081Tab.IsEmpty then
                   begin//7
                      Dm1.CadE081Tab.Insert;
                      Dm1.CadE081TabCODEMP.Value := StrToInt(vaCodEmpTab);
                      Dm1.CadE081TabCODTPR.Value := vaCodTprTab;
                      Dm1.CadE081TabCODUSU.Value := StrToInt(vaCodUsuTab);
                      Dm1.CadE081TabDESTPR.Value := vaDesTprTab;
                      Dm1.CadE081TabSITTPR.Value := vaSitTprTab;
                      Dm1.CadE081Tab.Post;
                      Dm1.IBDTransacao.CommitRetaining;
                   end//7
                else
                  begin//8
                      Dm1.CadE081Tab.Edit;
                      Dm1.CadE081TabDESTPR.Value := vaDesTprTab;
                      Dm1.CadE081TabSITTPR.Value := vaSitTprTab;
                      Dm1.CadE081Tab.Post;
                      Dm1.IBDTransacao.CommitRetaining;
                  end;//8
                  statusTabPreco.Progress := statusTabPreco.Progress + 1;

             end;//3

             {*******************************************************
                       grava os produtos da tabela de preço
             ********************************************************}
             //conta a quantidade de linhas do arquivo
              vnQtdCpg := TStringList.Create;
              try
                vnQtdCpg.LoadFromFile(destino);
                vnQtdCpgg := vnQtdCpg.Count;
              finally
                 vnQtdCpg.Free;
                 statusTabPreco.MaxValue := vnQtdCpgg;
                 statusTabPreco.Progress := 0;
              end;
                 Refresh;

              AssignFile(arq, destino);
              Reset(arq);
               While not Eof(arq) do
                 begin//10

                    vaCodEmp := '';vaCodTpr := '';vaCodPro := '';vaCodDer := '';vaCodUsu := '';
                    vaDesPro := '';vaPreBas := '';vaTolMai := '';vaTolMen := '';vaVlrMai := '';
                    vaVlrMen := '';vaSitReg := '';vaDatIni := '';vaDatFim := '';

                    Readln(arq, linha);
                    I := 1;
                    while I < Length(linha) do
                      begin//9
                        while linha[I] <> ';' do
                          begin
                             vaCodEmp := vaCodEmp + linha[i];
                             I := I + 1;
                          end;
                        I := I + 1;
                        while linha[I] <> ';' do
                          begin
                             vaCodTpr := vaCodTpr + linha[i];
                             I := I + 1;
                          end;
                        I := I + 1;
                        while linha[I] <> ';' do
                          begin
                             vaCodPro := vaCodPro + linha[i];
                             I := I + 1;
                          end;
                        I := I + 1;
                        while linha[I] <> ';' do
                          begin
                             vaCodDer := vaCodDer + linha[i];
                             I := I + 1;
                          end;
                        I := I + 1;
                        while linha[I] <> ';' do
                          begin
                             vaCodUsu := vaCodUsu + linha[i];
                             I := I + 1;
                          end;
                        I := I + 1;
                        while linha[I] <> ';' do
                          begin
                             vaDesPro := vaDesPro + linha[i];
                             I := I + 1;
                          end;
                        I := I + 1;
                        while linha[I] <> ';' do
                          begin
                             vaPreBas := vaPreBas + linha[i];
                             I := I + 1;
                          end;
                        I := I + 1;
                        while linha[I] <> ';' do
                          begin
                             vaTolMai := vaTolMai + linha[i];
                             I := I + 1;
                          end;
                        I := I + 1;
                        while linha[I] <> ';' do
                          begin
                             vaTolMen := vaTolMen + linha[i];
                             I := I + 1;
                          end;
                        I := I + 1;
                        while linha[I] <> ';' do
                          begin
                             vaVlrMai := vaVlrMai + linha[i];
                             I := I + 1;
                          end;
                        I := I + 1;
                        while linha[I] <> ';' do
                          begin
                             vaVlrMen := vaVlrMen + linha[i];
                             I := I + 1;
                          end;
                        I := I + 1;
                        while linha[I] <> ';' do
                          begin
                             vaSitReg := vaSitReg + linha[i];
                             I := I + 1;
                          end;
                        I := I + 1;
                        while linha[I] <> ';' do
                          begin
                             vaDatIni := vaDatIni + linha[i];
                             I := I + 1;
                          end;
                        I := I + 1;
                        while linha[I] <> ';' do
                          begin
                             vaDatFim := vaDatFim + linha[i];
                             I := I + 1;
                          end;
                      end;//9

                      Dm1.CadE081Itp.Close;
                      Dm1.CadE081Itp.ParamByName('codemp').Value := StrToInt(vaCodEmp);
                      Dm1.CadE081Itp.ParamByName('codtpr').Value := vaCodTpr;
                      Dm1.CadE081Itp.ParamByName('codpro').Value := vaCodPro;
                      Dm1.CadE081Itp.ParamByName('codder').Value := vaCodDer;
                      Dm1.CadE081Itp.ParamByName('codusu').Value := StrToInt(vaCodUsu);
                      Dm1.CadE081Itp.Open;
                      if Dm1.CadE081Itp.IsEmpty then
                        begin//11
                          Dm1.CadE081Itp.Insert;
                          Dm1.CadE081ItpCODEMP.Value := StrToInt(vaCodEmp);
                          Dm1.CadE081ItpCODTPR.Value := vaCodTpr;
                          Dm1.CadE081ItpCODPRO.Value := vaCodPro;
                          Dm1.CadE081ItpCODDER.AsString := vaCodDer;
                          Dm1.CadE081ItpCODUSU.Value := StrToInt(vaCodUsu);
                          Dm1.CadE081ItpDESPRO.Value := vaDesPro;
                          Dm1.CadE081ItpPREBAS.Value := StrToCurr(vaPreBas);
                          Dm1.CadE081ItpTOLMAI.Value := StrToFloat(vaTolMai);
                          Dm1.CadE081ItpTOLMEN.Value := StrToFloat(vaTolMen);
                          Dm1.CadE081ItpVLRMAI.Value := StrToCurr(vaVlrMai);
                          Dm1.CadE081ItpVLRMEN.Value := StrToCurr(vaVlrMen);
                          Dm1.CadE081ItpSITREG.Value := vaSitReg;
                          Dm1.CadE081ItpDATINI.Value := StrToDate(vaDatIni);
                          Dm1.CadE081ItpDATFIM.Value := StrToDate(vaDatFim);
                          Dm1.CadE081Itp.Post;
                          Dm1.IBDTransacao.CommitRetaining;
                        end//11
                      else
                        begin//2
                          Dm1.CadE081Itp.Edit;
                          Dm1.CadE081ItpDESPRO.Value := vaDesPro;
                          Dm1.CadE081ItpPREBAS.Value := StrToCurr(vaPreBas);
                          Dm1.CadE081ItpTOLMAI.Value := StrToFloat(vaTolMai);
                          Dm1.CadE081ItpTOLMEN.Value := StrToFloat(vaTolMen);
                          Dm1.CadE081ItpVLRMAI.Value := StrToCurr(vaVlrMai);
                          Dm1.CadE081ItpVLRMEN.Value := StrToCurr(vaVlrMen);
                          Dm1.CadE081ItpSITREG.Value := vaSitReg;
                          Dm1.CadE081ItpDATINI.Value := StrToDate(vaDatIni);
                          Dm1.CadE081ItpDATFIM.Value := StrToDate(vaDatFim);
                          Dm1.CadE081Itp.Post;
                          Dm1.IBDTransacao.CommitRetaining;
                        end;//12

                     statusTabPreco.Progress := statusTabPreco.Progress + 1;
                 end;//10

      end;//2
         CloseFile(arqTab);
         DeleteFile(destinoTab);
         CloseFile(arq);
         DeleteFile(destino);
         Refresh;
    end;//1

end;

procedure TFAtualiza.BTitulosClick(Sender: TObject);
var dir,nome,destino : string;
    arq : TextFile;
    linha : string;
    I : integer;
    vnQtdCpg : TStringList;
    vnQtdCpgg : integer;
    vaCodEmp,vaCodFil,vaNumTit,vaCodTpt,vaCodTns,vaSitTit,vaDatEmi,vaCodCli,vaVctOri,
    vaVlrOri,vaVctPro,vaDatPpt,vaVlrAbe : string;
begin
if not ftp.Connected then
  begin
    MessageDlg('Sistema desconectado..',mtWarning,[mbok],0);

  end
  else
    begin//1
   try
      StatusBar1.Panels[1].Text := 'Baixando arquivo _E301TCR..';
      dir := '/ArqAtu'; //onde esta o arquivo no servidor
      ftp.ChangeDir(dir);

      Refresh;
      Nome := IntToStr(FPrincipal.vnCodusu)+'_E301TCR.txt'; //nome do arquivo
      destino := 'C:\SysRep\ArqFtp\ArqAtu\'; //onde vai jogar o arquivo/nome_do_arquivo.extençao
      destino := destino + IntToStr(FPrincipal.vnCodusu)+'_E301TCR.txt';
      ftp.Get(Nome, destino, true);
      StatusBar1.Panels[1].Text := '';

  Except
     MessageDlg('Erro na transferência do arquivo de configuração!',mtWarning,[mbok],0);
     abort;
   end; //fim do except

   //apaga todos os registros da tabela
   Dm1.ApagaE301Tcr.Close;
   Dm1.ApagaE301Tcr.Open;
   Dm1.IBDTransacao.CommitRetaining;

   //le o arquivo recebido e grava seus dados  E301TCR
   if FileExists(destino) then
      begin//2
      //conta a quantidade de linhas do arquivo
      vnQtdCpg := TStringList.Create;
      try
        vnQtdCpg.LoadFromFile(destino);
        vnQtdCpgg := vnQtdCpg.Count;
      finally
         vnQtdCpg.Free;
         statusTitulos.MaxValue := vnQtdCpgg;
         statusTitulos.Progress := 0;
      end;

         Refresh;
         AssignFile(arq, destino);
         Reset(arq);
         While not Eof(arq) do
           begin//3
              vaCodEmp := '';vaCodFil := '';vaNumTit := '';vaCodTpt := '';vaCodTns := '';
              vaSitTit := '';vaDatEmi := '';vaCodCli := '';vaVctOri := '';vaVlrOri := '';
              vaVctPro := '';vaDatPpt := '';vaVlrAbe := '';

              Readln(arq, linha);
              I := 1;
              while I < Length(linha) do
                begin//6
                  while linha[I] <> ';' do
                    begin
                       vaCodEmp := vaCodEmp + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaCodFil := vaCodFil + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaNumTit := vaNumTit + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaCodTpt := vaCodTpt + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaCodTns := vaCodTns + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaSitTit := vaSitTit + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaDatEmi := vaDatEmi + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaCodCli := vaCodCli + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaVctOri := vaVctOri + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaVlrOri := vaVlrOri + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaVctPro := vaVctPro + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaDatPpt := vaDatPpt + linha[i];
                       I := I + 1;
                    end;
                  I := I + 1;
                  while linha[I] <> ';' do
                    begin
                       vaVlrAbe := vaVlrAbe + linha[i];
                       I := I + 1;
                    end;
                end;//6

                //grava no banco
                Dm1.CadE301Tcr.Open;
                Dm1.CadE301Tcr.Insert;
                Dm1.CadE301TcrCODEMP.Value := StrToInt(vaCodEmp);
                Dm1.CadE301TcrCODFIL.Value := StrToInt(vaCodFil);
                Dm1.CadE301TcrNUMTIT.Value := vaNumTit;
                Dm1.CadE301TcrCODTPT.Value := vaCodTpt;
                Dm1.CadE301TcrCODTNS.Value := vaCodTns;
                Dm1.CadE301TcrSITTIT.Value := vaSitTit;
                Dm1.CadE301TcrDATEMI.Value := StrToDate(vaDatEmi);
                Dm1.CadE301TcrCODCLI.Value := StrToInt(vaCodCli);
                Dm1.CadE301TcrVCTORI.Value := StrToDate(vaVctOri);
                Dm1.CadE301TcrVLRORI.Value := StrToFloat(vaVlrOri);
                Dm1.CadE301TcrVCTPRO.Value := StrToDate(vaVctPro);
                Dm1.CadE301TcrDATPPT.Value := StrToDate(vaDatPpt);
                Dm1.CadE301TcrVLRABE.Value := StrToFloat(vaVlrAbe);
                Dm1.CadE301Tcr.Post;
                Dm1.IBDTransacao.CommitRetaining;

                statusTitulos.Progress := statusTitulos.Progress + 1;
             end;//3
      end;//2
         CloseFile(arq);
         DeleteFile(destino);
         Refresh;

    end;//1
end;

procedure TFAtualiza.btnLigDerCorOracleClick(Sender: TObject);
var vnQtdReg : Integer;
begin

   Dm1.ApagaE075Ldc.Close;
   Dm1.ApagaE075Ldc.Open;//apaga todas os registros da tabela
   Dm1.IBDTransacao.CommitRetaining;

   //BUSCA TODAS AS LIGAÇÕES DE PRODUTO-DERIVAÇÃO/COR
   StatusBar1.Panels[1].Text := 'Consultando Ligações Produtos/Cores...';
   Application.ProcessMessages;

   DmOra.ConsUSU_TDERCOR.Close;
   DmOra.ConsUSU_TDERCOR.Open;

   StatusBar1.Panels[1].Text := '';
   Application.ProcessMessages;

   DmOra.ConsUSU_TDERCOR.Last;
   DmOra.ConsUSU_TDERCOR.First;
   vnQtdReg := DmOra.ConsUSU_TDERCOR.RecordCount;

   while not DmOra.ConsUSU_TDERCOR.Eof do
     begin
       Dm1.CadE075Ldc.Open;
       Dm1.CadE075Ldc.Insert;
       Dm1.CadE075LdcCODEMP.Value := DmOra.ConsUSU_TDERCORUSU_CODEMP.Value;
       Dm1.CadE075LdcCODPRO.Value := DmOra.ConsUSU_TDERCORUSU_CODPRO.Value;
       Dm1.CadE075LdcCODDER.Value := DmOra.ConsUSU_TDERCORUSU_CODDER.Value;
       Dm1.CadE075LdcCODTEC.Value := DmOra.ConsUSU_TDERCORUSU_CODTEC.Value;
       Dm1.CadE075LdcDESTEC.Value := DmOra.ConsUSU_TDERCORUSU_DESTEC.Value;
       Dm1.CadE075LdcSITLIG.Value := DmOra.ConsUSU_TDERCORUSU_SITTEC.Value;
       Dm1.CadE075Ldc.Post;

       DmOra.ConsUSU_TDERCOR.Next;

       Application.ProcessMessages;
     end;

     Dm1.IBDTransacao.CommitRetaining;

end;

procedure TFAtualiza.btnProdutosOracleClick(Sender: TObject);
var vdData : TDateTime;
    vnQtdReg : Integer;
begin

   {*******ATUALIZA OS PRODUTOS E075PRO**********}
    Dm1.ConsSql.Close;
    Dm1.ConsSql.SQL.Clear;
    Dm1.ConsSql.SQL.Add('SELECT E075PRO.CODPRO');
    Dm1.ConsSql.SQL.Add('  FROM E075PRO');
    Dm1.ConsSql.Open;
    if Dm1.ConsSql.IsEmpty then
       begin
         //busca todos os produtos ativos
         StatusBar1.Panels[1].Text := 'Consultado produtos...';
         Application.ProcessMessages;

         DmOra.ConsE075Pro.Close;
         DmOra.ConsE075Pro.SQL.Clear;
         DmOra.ConsE075Pro.SQL.Add('select e075pro.codemp,e075pro.codpro,e075pro.despro,e075pro.codfam,e075pro.codagc,e075pro.sitpro');
         DmOra.ConsE075Pro.SQL.Add('                   from e075pro');
         DmOra.ConsE075Pro.SQL.Add('                   where codori IN (''1'',''2'') AND');
         DmOra.ConsE075Pro.SQL.Add('                         e075pro.sitpro = ''A'' and');
         DmOra.ConsE075Pro.SQL.Add('                         CODAGC IN (''ESTOF'',''COLCH'')');
         DmOra.ConsE075Pro.SQL.Add('                   order by codfam,codpro');
         DmOra.ConsE075Pro.Open;

         StatusBar1.Panels[1].Text := '';
         Application.ProcessMessages;

         DmOra.ConsE075Pro.Last;
         DmOra.ConsE075Pro.First;
         vnQtdReg := DmOra.ConsE075Pro.RecordCount;
         statusProdutos.MaxValue := vnQtdReg;
         statusProdutos.Progress := 0;
         Application.ProcessMessages;

         Dm1.CadE075Pro.Open;
         while not DmOra.ConsE075Pro.Eof do
            begin
               Dm1.CadE075Pro.Insert;
               Dm1.CadE075ProCODEMP.Value := DmOra.ConsE075ProCODEMP.Value;
               Dm1.CadE075ProCODPRO.Value := DmOra.ConsE075ProCODPRO.Value;
               Dm1.CadE075ProDESPRO.Value := DmOra.ConsE075ProDESPRO.Value;
               Dm1.CadE075ProCODFAM.Value := DmOra.ConsE075ProCODFAM.Value;
               Dm1.CadE075ProCODAGC.Value := DmOra.ConsE075ProCODAGC.Value;
               Dm1.CadE075ProSITPRO.Value := DmOra.ConsE075ProSITPRO.Value;
               Dm1.CadE075Pro.Post;


              DmOra.ConsE075Pro.Next;
              statusProdutos.Progress := statusProdutos.Progress + 1;
              Application.ProcessMessages;
            end;
       end
    else
       begin
         vdData := IncDay(Date,-90);

         //busca apenas os que tiveram alterações dentro de 3 meses
         StatusBar1.Panels[1].Text := 'Consultado produtos...';
         Application.ProcessMessages;
         DmOra.ConsE075Pro.Close;
         DmOra.ConsE075Pro.SQL.Clear;
         DmOra.ConsE075Pro.SQL.Add('select e075pro.codemp,e075pro.codpro,e075pro.despro,e075pro.codfam,e075pro.codagc,e075pro.sitpro');
         DmOra.ConsE075Pro.SQL.Add('                   from e075pro');
         DmOra.ConsE075Pro.SQL.Add('                   where codori IN (''1'',''2'') AND');
         DmOra.ConsE075Pro.SQL.Add('                  ((DATALT >= :DATALT) OR (datger >= :DATGER)) AND');
         DmOra.ConsE075Pro.SQL.Add('                         CODAGC IN (''ESTOF'',''COLCH'')');
         DmOra.ConsE075Pro.SQL.Add('                   order by codfam,codpro');
         DmOra.ConsE075Pro.Parameters.ParamByName('DATGER').Value := vdData;
         DmOra.ConsE075Pro.Parameters.ParamByName('DATALT').Value := vdData;
         DmOra.ConsE075Pro.Open;
         StatusBar1.Panels[1].Text := '';
         Application.ProcessMessages;

         DmOra.ConsE075Pro.Last;
         DmOra.ConsE075Pro.First;
         vnQtdReg := DmOra.ConsE075Pro.RecordCount;
         statusProdutos.MaxValue := vnQtdReg;
         statusProdutos.Progress := 0;
         Application.ProcessMessages;

         while not DmOra.ConsE075Pro.Eof do
            begin
              Dm1.CadE075Pro.Close;
              Dm1.CadE075Pro.ParamByName('codemp').Value := DmOra.ConsE075ProCODEMP.Value;
              Dm1.CadE075Pro.ParamByName('codpro').Value := DmOra.ConsE075ProCODPRO.Value;
              Dm1.CadE075Pro.Open;
              if not Dm1.CadE075Pro.IsEmpty then
                 begin
                    Dm1.CadE075Pro.Edit;
                    Dm1.CadE075ProDESPRO.Value := DmOra.ConsE075ProDESPRO.Value;
                    Dm1.CadE075ProCODFAM.Value := DmOra.ConsE075ProCODFAM.Value;
                    Dm1.CadE075ProCODAGC.Value := DmOra.ConsE075ProCODAGC.Value;
                    Dm1.CadE075ProSITPRO.Value := DmOra.ConsE075ProSITPRO.Value;
                    Dm1.CadE075Pro.Post;
                 end
              else
                 begin
                     Dm1.CadE075Pro.Insert;
                     Dm1.CadE075ProCODEMP.Value := DmOra.ConsE075ProCODEMP.Value;
                     Dm1.CadE075ProCODPRO.Value := DmOra.ConsE075ProCODPRO.Value;
                     Dm1.CadE075ProDESPRO.Value := DmOra.ConsE075ProDESPRO.Value;
                     Dm1.CadE075ProCODFAM.Value := DmOra.ConsE075ProCODFAM.Value;
                     Dm1.CadE075ProCODAGC.Value := DmOra.ConsE075ProCODAGC.Value;
                     Dm1.CadE075ProSITPRO.Value := DmOra.ConsE075ProSITPRO.Value;
                     Dm1.CadE075Pro.Post;
                 end;

              DmOra.ConsE075Pro.Next;
              statusProdutos.Progress := statusProdutos.Progress + 1;
              Application.ProcessMessages;
            end;

       end;
       Dm1.IBDTransacao.CommitRetaining;

       {*******ATUALIZA AS DERIVAÇÕES**********}
    Dm1.ConsSql.Close;
    Dm1.ConsSql.SQL.Clear;
    Dm1.ConsSql.SQL.Add('SELECT E075DER.CODPRO');
    Dm1.ConsSql.SQL.Add('  FROM E075DER');
    Dm1.ConsSql.Open;
    if Dm1.ConsSql.IsEmpty then
       begin
         //busca todos as derivações ativos
         StatusBar1.Panels[1].Text := 'Consultando derivações...';
         Application.ProcessMessages;

         DmOra.ConsE075Der.Close;
         DmOra.ConsE075Der.SQL.Clear;

         DmOra.ConsE075Der.SQL.Add('         select e075der.codemp,e075der.codpro,e075der.codder,e075der.desder,e075der.pesbru,e075der.pesliq,');
         DmOra.ConsE075Der.SQL.Add('       e075der.volder,e075der.sitder,e075der.usu_coruni,e075der.usu_cmp1bb,e075der.usu_cmp1ae,');
         DmOra.ConsE075Der.SQL.Add('       e075der.usu_cmp2bb,e075der.usu_cmp2en');
         DmOra.ConsE075Der.SQL.Add('       from e075der');
         DmOra.ConsE075Der.SQL.Add('inner join e075pro on e075pro.codemp = e075der.codemp and');
         DmOra.ConsE075Der.SQL.Add('                      e075pro.codpro = e075der.codpro and');
         DmOra.ConsE075Der.SQL.Add('              e075pro.codori in (''1'',''2'') and');
         DmOra.ConsE075Der.SQL.Add('              e075pro.CODAGC IN (''ESTOF'',''COLCH'') and');
         DmOra.ConsE075Der.SQL.Add('              e075der.sitder = ''A''');
         DmOra.ConsE075Der.SQL.Add('              order by e075pro.codfam,e075der.codpro');
         DmOra.ConsE075Der.Open;

         StatusBar1.Panels[1].Text := '';
         Application.ProcessMessages;

         DmOra.ConsE075Der.Last;
         DmOra.ConsE075Der.First;
         vnQtdReg := DmOra.ConsE075Der.RecordCount;
         statusProdutos.MaxValue := vnQtdReg;
         statusProdutos.Progress := 0;
         Application.ProcessMessages;

         Dm1.CadE075Der.Open;
         while not DmOra.ConsE075Der.Eof do
            begin
                 Dm1.CadE075Der.Insert;
                 Dm1.CadE075DerCODEMP.Value := DmOra.ConsE075DerCODEMP.Value;
                 Dm1.CadE075DerCODPRO.Value := DmOra.ConsE075DerCODPRO.Value;
                 Dm1.CadE075DerCODDER.Value := DmOra.ConsE075DerCODDER.Value;
                 Dm1.CadE075DerDESDER.Value := DmOra.ConsE075DerDESDER.Value;
                 Dm1.CadE075DerPESBRU.Value := DmOra.ConsE075DerPESBRU.AsFloat;
                 Dm1.CadE075DerPESLIQ.Value := DmOra.ConsE075DerPESLIQ.AsFloat;
                 Dm1.CadE075DerVOLDER.Value := DmOra.ConsE075DerVOLDER.AsFloat;
                 Dm1.CadE075DerSITDER.Value := DmOra.ConsE075DerSITDER.Value;
                 Dm1.CadE075DerCORUNI.Value := DmOra.ConsE075DerUSU_CORUNI.Value;
                 Dm1.CadE075DerCMP1BB.Value := DmOra.ConsE075DerUSU_CMP1BB.Value;
                 Dm1.CadE075DerCMP1AC.Value := DmOra.ConsE075DerUSU_CMP1AE.Value;
                 Dm1.CadE075DerCMP2BB.Value := DmOra.ConsE075DerUSU_CMP2BB.Value;
                 Dm1.CadE075DerCMP2EN.Value := DmOra.ConsE075DerUSU_CMP2EN.Value;
                 Dm1.CadE075Der.Post;

              DmOra.ConsE075Der.Next;
              statusProdutos.Progress := statusProdutos.Progress + 1;
              Application.ProcessMessages;
            end;
       end
    else
       begin
         vdData := IncDay(Date,-90);

         //busca apenas os que tiveram alterações dentro de 3 meses
         StatusBar1.Panels[1].Text := 'Consultado derivações...';
         Application.ProcessMessages;

         DmOra.ConsE075Der.Close;
         DmOra.ConsE075Der.SQL.Clear;
         DmOra.ConsE075Der.SQL.Add('         select e075der.codemp,e075der.codpro,e075der.codder,e075der.desder,e075der.pesbru,e075der.pesliq,');
         DmOra.ConsE075Der.SQL.Add('       e075der.volder,e075der.sitder,e075der.usu_coruni,e075der.usu_cmp1bb,e075der.usu_cmp1ae,');
         DmOra.ConsE075Der.SQL.Add('       e075der.usu_cmp2bb,e075der.usu_cmp2en');
         DmOra.ConsE075Der.SQL.Add('       from e075der');
         DmOra.ConsE075Der.SQL.Add('inner join e075pro on e075pro.codemp = e075der.codemp and');
         DmOra.ConsE075Der.SQL.Add('                      e075pro.codpro = e075der.codpro and');
         DmOra.ConsE075Der.SQL.Add('              e075pro.codori in (''1'',''2'') and');
         DmOra.ConsE075Der.SQL.Add('              e075pro.CODAGC IN (''ESTOF'',''COLCH'') and');
         DmOra.ConsE075Der.SQL.Add('             ((e075der.datger >= :datger) or (e075der.datalt >= :datalt))');
         DmOra.ConsE075Der.SQL.Add('              order by e075pro.codfam,e075der.codpro');
         DmOra.ConsE075Der.Parameters.ParamByName('DATGER').Value := vdData;
         DmOra.ConsE075Der.Parameters.ParamByName('DATALT').Value := vdData;
         DmOra.ConsE075Der.Open;

         StatusBar1.Panels[1].Text := '';
         Application.ProcessMessages;

         DmOra.ConsE075Der.Last;
         DmOra.ConsE075Der.First;
         vnQtdReg := DmOra.ConsE075Der.RecordCount;
         statusProdutos.MaxValue := vnQtdReg;
         statusProdutos.Progress := 0;
         Application.ProcessMessages;

         while not DmOra.ConsE075Der.Eof do
            begin
              Dm1.CadE075Der.Close;
              Dm1.CadE075Der.ParamByName('codemp').Value := DmOra.ConsE075DerCODEMP.Value;
              Dm1.CadE075Der.ParamByName('codpro').Value := DmOra.ConsE075DerCODPRO.Value;
              Dm1.CadE075Der.ParamByName('codder').Value := DmOra.ConsE075DerCODDER.Value;
              Dm1.CadE075Der.Open;
              if not Dm1.CadE075Der.IsEmpty then
                 begin
                     Dm1.CadE075Der.Edit;
                     Dm1.CadE075DerDESDER.Value := DmOra.ConsE075DerDESDER.Value;
                     Dm1.CadE075DerPESBRU.Value := DmOra.ConsE075DerPESBRU.AsFloat;
                     Dm1.CadE075DerPESLIQ.Value := DmOra.ConsE075DerPESLIQ.AsFloat;
                     Dm1.CadE075DerVOLDER.Value := DmOra.ConsE075DerVOLDER.AsFloat;
                     Dm1.CadE075DerSITDER.Value := DmOra.ConsE075DerSITDER.Value;
                     Dm1.CadE075DerCORUNI.Value := DmOra.ConsE075DerUSU_CORUNI.Value;
                     Dm1.CadE075DerCMP1BB.Value := DmOra.ConsE075DerUSU_CMP1BB.Value;
                     Dm1.CadE075DerCMP1AC.Value := DmOra.ConsE075DerUSU_CMP1AE.Value;
                     Dm1.CadE075DerCMP2BB.Value := DmOra.ConsE075DerUSU_CMP2BB.Value;
                     Dm1.CadE075DerCMP2EN.Value := DmOra.ConsE075DerUSU_CMP2EN.Value;
                     Dm1.CadE075Der.Post;
                 end
              else
                 begin
                     Dm1.CadE075Der.Insert;
                     Dm1.CadE075DerCODEMP.Value := DmOra.ConsE075DerCODEMP.Value;
                     Dm1.CadE075DerCODPRO.Value := DmOra.ConsE075DerCODPRO.Value;
                     Dm1.CadE075DerCODDER.Value := DmOra.ConsE075DerCODDER.Value;
                     Dm1.CadE075DerDESDER.Value := DmOra.ConsE075DerDESDER.Value;
                     Dm1.CadE075DerPESBRU.Value := DmOra.ConsE075DerPESBRU.AsFloat;
                     Dm1.CadE075DerPESLIQ.Value := DmOra.ConsE075DerPESLIQ.AsFloat;
                     Dm1.CadE075DerVOLDER.Value := DmOra.ConsE075DerVOLDER.AsFloat;
                     Dm1.CadE075DerSITDER.Value := DmOra.ConsE075DerSITDER.Value;
                     Dm1.CadE075DerCORUNI.Value := DmOra.ConsE075DerUSU_CORUNI.Value;
                     Dm1.CadE075DerCMP1BB.Value := DmOra.ConsE075DerUSU_CMP1BB.Value;
                     Dm1.CadE075DerCMP1AC.Value := DmOra.ConsE075DerUSU_CMP1AE.Value;
                     Dm1.CadE075DerCMP2BB.Value := DmOra.ConsE075DerUSU_CMP2BB.Value;
                     Dm1.CadE075DerCMP2EN.Value := DmOra.ConsE075DerUSU_CMP2EN.Value;
                     Dm1.CadE075Der.Post;
                 end;

              DmOra.ConsE075Der.Next;
              statusProdutos.Progress := statusProdutos.Progress + 1;
              Application.ProcessMessages;
            end;

       end;
       Dm1.IBDTransacao.CommitRetaining;

end;

procedure TFAtualiza.btnBAtuclientes_Click(Sender: TObject);
var
    vnQtdCli : integer;
begin


  try
     StatusBar1.Panels[1].Text := 'Consultado Clinentes..';
     LStatus.Caption := 'Aguarde, Atualizando Clientes..';
     Application.ProcessMessages;

      DmFireRep.ConsE085Cli.Close;
      DmFireRep.ConsE085Cli.ParamByName('CODREP').Value := FPrincipal.vnCodRep;
      DmFireRep.ConsE085Cli.Open;
      DmFireRep.ConsE085Cli.Prior;
      DmFireRep.ConsE085Cli.First;

      DmFireRep.ConsE085Hcl.Close;
      DmFireRep.ConsE085Hcl.ParamByName('CODREP').Value := FPrincipal.vnCodRep;
      DmFireRep.ConsE085Hcl.Open;
      DmFireRep.ConsE085Hcl.Prior;
      DmFireRep.ConsE085Hcl.First;

      StatusBar1.Panels[1].Text := '';

  Except
     MessageDlg('Erro na consulta dos clientes',mtWarning,[mbok],0);
     abort;
  end;

     vnQtdCli := DmFireRep.ConsE085Cli.RecordCount;

     StatusClientes.MaxValue := vnQtdCli;
     StatusClientes.Progress := 0;
     Application.ProcessMessages;
     while not DmFireRep.ConsE085Cli.Eof do
           begin
              //grava no banco
              Dm1.CadE085Cli.Close;
              Dm1.CadE085Cli.ParamByName('codcli').Value := DmFireRep.ConsE085CliCODCLI.Value;
              Dm1.CadE085Cli.Open;
              if Dm1.CadE085Cli.IsEmpty then
                begin//4
                   Dm1.CadE085Cli.Insert;
                   Dm1.CadE085CliCODCLI.Value := DmFireRep.ConsE085CliCODCLI.Value;
                   Dm1.CadE085CliNOMCLI.Value := DmFireRep.ConsE085CliNOMCLI.Value;
                   Dm1.CadE085CliAPECLI.Value := DmFireRep.ConsE085CliAPECLI.Value;
                   Dm1.CadE085CliINSEST.Value := DmFireRep.ConsE085CliINSEST.Value;
                   Dm1.CadE085CliCGCCPF.Value := DmFireRep.ConsE085CliCGCCPF.Value;
                   Dm1.CadE085CliENDCLI.Value := DmFireRep.ConsE085CliENDCLI.Value;
                   Dm1.CadE085CliNENCLI.Value := DmFireRep.ConsE085CliNENCLI.Value;
                   Dm1.CadE085CliCPLEND.Value := DmFireRep.ConsE085CliCPLEND.Value;
                   Dm1.CadE085CliCEPCLI.Value := DmFireRep.ConsE085CliCEPCLI.Value;
                   Dm1.CadE085CliBAICLI.Value := DmFireRep.ConsE085CliBAICLI.Value;
                   Dm1.CadE085CliCIDCLI.Value := DmFireRep.ConsE085CliCIDCLI.Value;
                   Dm1.CadE085CliSIGUFS.Value := DmFireRep.ConsE085CliSIGUFS.Value;
                   Dm1.CadE085cliFONCLI.Value := DmFireRep.ConsE085CliFONCLI.Value;
                   Dm1.CadE085CliSITCLI.Value := DmFireRep.ConsE085CliSITCLI.Value;
                   Dm1.CadE085Cli.Post;
                   Dm1.IBDTransacao.Commit;
                end//4
              else
                begin//5
                   Dm1.CadE085Cli.Edit;
                   Dm1.CadE085CliNOMCLI.Value := DmFireRep.ConsE085CliNOMCLI.Value;
                   Dm1.CadE085CliAPECLI.Value := DmFireRep.ConsE085CliAPECLI.Value;
                   Dm1.CadE085CliINSEST.Value := DmFireRep.ConsE085CliINSEST.Value;
                   Dm1.CadE085CliCGCCPF.Value := DmFireRep.ConsE085CliCGCCPF.Value;
                   Dm1.CadE085CliENDCLI.Value := DmFireRep.ConsE085CliENDCLI.Value;
                   Dm1.CadE085CliNENCLI.Value := DmFireRep.ConsE085CliNENCLI.Value;
                   Dm1.CadE085CliCPLEND.Value := DmFireRep.ConsE085CliCPLEND.Value;
                   Dm1.CadE085CliCEPCLI.Value := DmFireRep.ConsE085CliCEPCLI.Value;
                   Dm1.CadE085CliBAICLI.Value := DmFireRep.ConsE085CliBAICLI.Value;
                   Dm1.CadE085CliCIDCLI.Value := DmFireRep.ConsE085CliCIDCLI.Value;
                   Dm1.CadE085CliSIGUFS.Value := DmFireRep.ConsE085CliSIGUFS.Value;
                   Dm1.CadE085cliFONCLI.Value := DmFireRep.ConsE085CliFONCLI.Value;
                   Dm1.CadE085CliSITCLI.Value := DmFireRep.ConsE085CliSITCLI.Value;
                   Dm1.CadE085Cli.Post;
                   Dm1.IBDTransacao.Commit;
                end;//5
             DmFireRep.ConsE085Cli.Next;
             StatusClientes.Progress := StatusClientes.Progress + 1;
             Application.ProcessMessages;
           end;

           vnQtdCli := DmFireRep.ConsE085Hcl.RecordCount;
           StatusClientes.MaxValue := vnQtdCli;
           StatusClientes.Progress := 0;
           Application.ProcessMessages;

           while not DmFireRep.ConsE085Hcl.Eof do
           begin
              Dm1.CadE085Hcl.Close;
              Dm1.CadE085Hcl.ParamByName('codemp').Value := DmFireRep.ConsE085HclCODEMP.Value;
              Dm1.CadE085Hcl.ParamByName('codfil').Value := DmFireRep.ConsE085HclCODFIL.Value;
              Dm1.CadE085Hcl.ParamByName('codcli').Value := DmFireRep.ConsE085HclCODCLI.Value;
              Dm1.CadE085Hcl.Open;
              if Dm1.CadE085Hcl.IsEmpty then
                 begin//8
                    Dm1.CadE085Hcl.Insert;
                    Dm1.CadE085HclCODCLI.Value := DmFireRep.ConsE085HclCODCLI.Value;
                    Dm1.CadE085HclCODEMP.Value := DmFireRep.ConsE085HclCODEMP.Value;
                    Dm1.CadE085HclCODFIL.Value := DmFireRep.ConsE085HclCODFIL.Value;
                    Dm1.CadE085HclCODREP.Value := DmFireRep.ConsE085HclCODREP.Value;
                    Dm1.CadE085HclSALDUP.Value := DmFireRep.ConsE085HclSALDUP.Value;
                    Dm1.CadE085HclDATMAC.Value := DmFireRep.ConsE085HclDATMAC.Value;
                    Dm1.CadE085HclVLRMAC.Value := DmFireRep.ConsE085HclVLRMAC.Value;
                    Dm1.CadE085HclDATUPE.Value := DmFireRep.ConsE085HclDATUPE.Value;
                    Dm1.CadE085HclVLRUPE.Value := DmFireRep.ConsE085HclVLRUPE.Value;
                    Dm1.CadE085HclDATUFA.Value := DmFireRep.ConsE085HclDATUFA.Value;
                    Dm1.CadE085HclVLRUFA.Value := DmFireRep.ConsE085HclVLRUFA.Value;
                    Dm1.CadE085HclDATUPG.Value := DmFireRep.ConsE085HclDATUPG.Value;
                    Dm1.CadE085HclVLRUPG.Value := DmFireRep.ConsE085HclVLRUPG.Value;
                    Dm1.CadE085HclQTDPGT.Value := DmFireRep.ConsE085HclQTDPGT.Value;
                    Dm1.CadE085HclDATMFA.Value := DmFireRep.ConsE085HclDATMFA.Value;
                    Dm1.CadE085HclVLRMFA.Value := DmFireRep.ConsE085HclVLRMFA.Value;
                    Dm1.CadE085HclDATATR.Value := DmFireRep.ConsE085HclDATATR.Value;
                    Dm1.CadE085HclVLRATR.Value := DmFireRep.ConsE085HclVLRATR.Value;
                    Dm1.CadE085HclMAIATR.Value := DmFireRep.ConsE085HclMAIATR.Value;
                    Dm1.CadE085HclULTNFV.Value := DmFireRep.ConsE085HclULTNFV.Value;
                    Dm1.CadE085Hcl.Post;
                    Dm1.IBDTransacao.Commit;
                 end//8
              else
                 begin//9
                   Dm1.CadE085Hcl.Edit;
                   Dm1.CadE085HclCODREP.Value := DmFireRep.ConsE085HclCODREP.Value;
                   Dm1.CadE085HclSALDUP.Value := DmFireRep.ConsE085HclSALDUP.Value;
                   Dm1.CadE085HclDATMAC.Value := DmFireRep.ConsE085HclDATMAC.Value;
                   Dm1.CadE085HclVLRMAC.Value := DmFireRep.ConsE085HclVLRMAC.Value;
                   Dm1.CadE085HclDATUPE.Value := DmFireRep.ConsE085HclDATUPE.Value;
                   Dm1.CadE085HclVLRUPE.Value := DmFireRep.ConsE085HclVLRUPE.Value;
                   Dm1.CadE085HclDATUFA.Value := DmFireRep.ConsE085HclDATUFA.Value;
                   Dm1.CadE085HclVLRUFA.Value := DmFireRep.ConsE085HclVLRUFA.Value;
                   Dm1.CadE085HclDATUPG.Value := DmFireRep.ConsE085HclDATUPG.Value;
                   Dm1.CadE085HclVLRUPG.Value := DmFireRep.ConsE085HclVLRUPG.Value;
                   Dm1.CadE085HclQTDPGT.Value := DmFireRep.ConsE085HclQTDPGT.Value;
                   Dm1.CadE085HclDATMFA.Value := DmFireRep.ConsE085HclDATMFA.Value;
                   Dm1.CadE085HclVLRMFA.Value := DmFireRep.ConsE085HclVLRMFA.Value;
                   Dm1.CadE085HclDATATR.Value := DmFireRep.ConsE085HclDATATR.Value;
                   Dm1.CadE085HclVLRATR.Value := DmFireRep.ConsE085HclVLRATR.Value;
                   Dm1.CadE085HclMAIATR.Value := DmFireRep.ConsE085HclMAIATR.Value;
                   Dm1.CadE085HclULTNFV.Value := DmFireRep.ConsE085HclULTNFV.Value;
                   Dm1.CadE085Hcl.Post;
                   Dm1.IBDTransacao.Commit;
                 end;//9;
                StatusClientes.Progress := StatusClientes.Progress + 1;
                Application.ProcessMessages;
                DmFireRep.ConsE085Hcl.Next;
           end;






end;

procedure TFAtualiza.btnBCondCpg_Click(Sender: TObject);
var
    vnQtdCpgg : integer;
begin

  try
      StatusBar1.Panels[1].Text := 'Consultado Condições de Pagamento..';
      Application.ProcessMessages;
      DmFireRep.ConsE028Cpg.Close;
      DmFireRep.ConsE028Cpg.Open;
      DmFireRep.ConsE028Cpg.Prior;
      DmFireRep.ConsE028Cpg.First;

      StatusBar1.Panels[1].Text := '';
  Except
     MessageDlg('Erro na Consulta das Condições de Pagamento',mtWarning,[mbok],0);
     abort;
  end;

     vnQtdCpgg := DmFireRep.ConsE028Cpg.RecordCount;
     StatusCondPgto.MaxValue := vnQtdCpgg;
     StatusCondPgto.Progress := 0;
     Application.ProcessMessages;
     while not DmFireRep.ConsE028Cpg.Eof do
         begin
            //grava no banco
            Dm1.CadE028Cpg.Close;
            Dm1.CadE028Cpg.ParamByName('codemp').Value := DmFireRep.ConsE028CpgCODEMP.Value;
            Dm1.CadE028Cpg.ParamByName('codcpg').Value := DmFireRep.ConsE028CpgCODCPG.Value;
            Dm1.CadE028Cpg.ParamByName('codusu').Value := FPrincipal.vnCodusu;
            Dm1.CadE028Cpg.Open;
            if Dm1.CadE028Cpg.IsEmpty then
              begin//4
                 Dm1.CadE028Cpg.Insert;
                 Dm1.CadE028CpgCODEMP.Value := DmFireRep.ConsE028CpgCODEMP.Value;
                 Dm1.CadE028CpgCODCPG.Value := DmFireRep.ConsE028CpgCODCPG.Value;
                 Dm1.CadE028CpgCODUSU.Value := FPrincipal.vnCodusu;
                 Dm1.CadE028CpgDESCPG.Value := DmFireRep.ConsE028CpgDESCPG.Value;
                 Dm1.CadE028CpgABRCPG.Value := DmFireRep.ConsE028CpgABRCPG.Value;
                 Dm1.CadE028CpgPRZMED.Value := DmFireRep.ConsE028CpgPRZMED.Value;
                 Dm1.CadE028CpgQTDPAR.Value := DmFireRep.ConsE028CpgQTDPAR.Value;
                 Dm1.CadE028CpgSITCPG.Value := DmFireRep.ConsE028CpgSITCPG.Value;
                 Dm1.CadE028CpgPERCOM.Value := DmFireRep.ConsE028CpgPERCOM.Value;
                 Dm1.CadE028Cpg.Post;
                 Dm1.IBDTransacao.CommitRetaining;
              end//4
            else
              begin//5
                 Dm1.CadE028Cpg.Edit;
                 Dm1.CadE028CpgDESCPG.Value := DmFireRep.ConsE028CpgDESCPG.Value;
                 Dm1.CadE028CpgABRCPG.Value := DmFireRep.ConsE028CpgABRCPG.Value;
                 Dm1.CadE028CpgPRZMED.Value := DmFireRep.ConsE028CpgPRZMED.Value;
                 Dm1.CadE028CpgQTDPAR.Value := DmFireRep.ConsE028CpgQTDPAR.Value;
                 Dm1.CadE028CpgSITCPG.Value := DmFireRep.ConsE028CpgSITCPG.Value;
                 Dm1.CadE028CpgPERCOM.Value := DmFireRep.ConsE028CpgPERCOM.Value;
                 Dm1.CadE028Cpg.Post;
                 Dm1.IBDTransacao.CommitRetaining;
              end;//5
              StatusCondPgto.Progress := StatusCondPgto.Progress + 1;
              Application.ProcessMessages;
           DmFireRep.ConsE028Cpg.Next;
         end;


         //consulta as ligações cond. pgto. x representante
         Dm1.ConsSql.Close;
         Dm1.ConsSql.SQL.Clear;
         Dm1.ConsSql.SQL.Add('delete from e090rcp');
         Dm1.ConsSql.ExecSQL;
         Dm1.IBDTransacao.CommitRetaining;

         DmFireRep.ConsE090Rcp.Close;
         DmFireRep.ConsE090Rcp.ParamByName('codrep').Value := FPrincipal.vnCodRep;
         DmFireRep.ConsE090Rcp.Open;
         DmFireRep.ConsE090Rcp.First;
         while not DmFireRep.ConsE090Rcp.Eof do
            begin
               Dm1.CadE090Rcp.Open;
               Dm1.CadE090Rcp.Insert;
               Dm1.CadE090RcpCODREP.Value := DmFireRep.ConsE090RcpCODREP.Value;
               Dm1.CadE090RcpEMPCPG.Value := DmFireRep.ConsE090RcpEMPCPG.Value;
               Dm1.CadE090RcpCODCPG.Value := DmFireRep.ConsE090RcpCODCPG.Value;
               Dm1.CadE090RcpSITLRC.Value := DmFireRep.ConsE090RcpSITLRC.Value;
               Dm1.CadE090Rcp.Post;

              DmFireRep.ConsE090Rcp.Next;
            end;
          Dm1.IBDTransacao.CommitRetaining;


         Dm1.ConsSql.Close;
         Dm1.ConsSql.SQL.Clear;
         Dm1.ConsSql.SQL.Add('select * from e028cpg order by codcpg');
         Dm1.ConsSql.Open;
         Dm1.ConsSql.First;
         while not Dm1.ConsSql.Eof do
            begin
              Dm1.CadE028Cpg.Close;
              Dm1.CadE028Cpg.ParamByName('codemp').Value := Dm1.ConsSql.FieldByName('codemp').AsInteger;
              Dm1.CadE028Cpg.ParamByName('codcpg').Value := Dm1.ConsSql.FieldByName('codcpg').Value;
              Dm1.CadE028Cpg.ParamByName('codusu').Value := Dm1.ConsSql.FieldByName('codusu').Value;
              Dm1.CadE028Cpg.Open;
              if not Dm1.CadE028Cpg.IsEmpty then
                 begin
                    Dm1.ConsE090Rcp.Close;
                    Dm1.ConsE090Rcp.ParamByName('CODCPG').Value := Dm1.ConsSql.FieldByName('codcpg').Value;
                    Dm1.ConsE090Rcp.Open;
                    if Dm1.ConsE090Rcp.IsEmpty then
                       begin
                         Dm1.CadE028Cpg.Delete;
                       end
                    else
                       begin
                         if Dm1.ConsE090RcpSITLRC.Value = 'I' then
                            begin
                              Dm1.CadE028Cpg.Delete;
                            end
                         else
                            begin
                               Dm1.CadE028Cpg.Edit;
                               Dm1.CadE028CpgSITCPG.Value := Dm1.ConsE090RcpSITLRC.Value;
                               Dm1.CadE028Cpg.Post;
                            end;
                       end;
                       Dm1.IBDTransacao.CommitRetaining;
                 end;
              Dm1.ConsSql.Next;
            end;

end;

procedure TFAtualiza.btnBCores_Click(Sender: TObject);
var 
    vnQtdProdutos : integer;
begin

  LStatus.Caption := 'Aguarde, Atualizando Cores..';
  Application.ProcessMessages;

  try
      StatusBar1.Panels[1].Text := 'Consultando cores...';
      Application.ProcessMessages;

      DmFireRep.ConsE075cor.Close;
      DmFireRep.ConsE075cor.Open;
      DmFireRep.ConsE075cor.Prior;
      DmFireRep.ConsE075cor.First;

      StatusBar1.Panels[1].Text := ' ';
  Except
     MessageDlg('Erro ao consultar cores',mtWarning,[mbok],0);
     abort;
  end;


   vnQtdProdutos := DmFireRep.ConsE075cor.RecordCount;
   
   Application.ProcessMessages;
   while not DmFireRep.ConsE075cor.Eof do
        begin
          //grava no banco
          Dm1.CadE075Cor.Close;
          Dm1.CadE075Cor.ParamByName('codemp').Value := DmFireRep.ConsE075corCODEMP.Value;
          Dm1.CadE075Cor.ParamByName('codpro').Value := DmFireRep.ConsE075corCODPRO.Value;
          Dm1.CadE075Cor.Open;
          if Dm1.CadE075Cor.IsEmpty then
            begin
               Dm1.CadE075Cor.Insert;
               Dm1.CadE075CorCODEMP.Value := DmFireRep.ConsE075corCODEMP.Value;
               Dm1.CadE075CorCODPRO.Value := DmFireRep.ConsE075corCODPRO.Value;
               Dm1.CadE075CorDESPRO.Value := DmFireRep.ConsE075corDESPRO.Value;
               Dm1.CadE075CorSITPRO.Value := DmFireRep.ConsE075corSITPRO.Value;
               Dm1.CadE075Cor.Post;
               Dm1.IBDTransacao.Commit;
            end
          else
            begin
               Dm1.CadE075Cor.Edit;
               Dm1.CadE075CorDESPRO.Value := DmFireRep.ConsE075corDESPRO.Value;
               Dm1.CadE075CorSITPRO.Value := DmFireRep.ConsE075corSITPRO.Value;
               Dm1.CadE075Cor.Post;
               Dm1.IBDTransacao.Commit;
            end;

            Application.ProcessMessages;
            DmFireRep.ConsE075cor.Next;
        end;

end;

procedure TFAtualiza.btnBLigDerCor_Click(Sender: TObject);
var 
    vnQtdCpgg : integer;
begin

    Dm1.ConsE075Ldc.Close;
    Dm1.ConsE075Ldc.SQL.Clear;
    Dm1.ConsE075Ldc.SQL.Add('select * from e075ldc');
    Dm1.ConsE075Ldc.Open;
  if Dm1.ConsE075Ldc.IsEmpty then
    begin//1 atualiza a base inteira

       try
          StatusBar1.Panels[1].Text := 'Consultando Ligações Produtos/Cores...';
          Application.ProcessMessages;

          DmFireRep.ConsE075Ldc.Close;
          DmFireRep.ConsE075Ldc.Open;
          DmFireRep.ConsE075Ldc.Prior;
          DmFireRep.ConsE075Ldc.First;

          StatusBar1.Panels[1].Text := '';
       Except
         MessageDlg('Erro na consulta de Ligações Produtos/Cores',mtWarning,[mbok],0);
         abort;
       end;

       Application.ProcessMessages;

       Dm1.ApagaE075Ldc.Close;
       Dm1.ApagaE075Ldc.Open;//apaga todas os registros da tabela
       Dm1.IBDTransacao.CommitRetaining;


       vnQtdCpgg := DmFireRep.ConsE075Ldc.RecordCount;

       while not DmFireRep.ConsE075Ldc.Eof do
          begin
             Dm1.CadE075Ldc.Open;
             Dm1.CadE075Ldc.Insert;
             Dm1.CadE075LdcCODEMP.Value := DmFireRep.ConsE075LdcCODEMP.Value;
             Dm1.CadE075LdcCODPRO.Value := DmFireRep.ConsE075LdcCODPRO.Value;
             Dm1.CadE075LdcCODDER.Value := DmFireRep.ConsE075LdcCODDER.Value;
             Dm1.CadE075LdcCODTEC.Value := DmFireRep.ConsE075LdcCODTEC.Value;
             Dm1.CadE075LdcDESTEC.Value := DmFireRep.ConsE075LdcDESTEC.Value;
             Dm1.CadE075LdcSITLIG.Value := DmFireRep.ConsE075LdcSITLIG.Value;
             Dm1.CadE075Ldc.Post;

             Dm1.IBDTransacao.Commit;


              //Refresh;
              Application.ProcessMessages;
              DmFireRep.ConsE075Ldc.Next;
          end;
    end
  else
      begin//101 atualiza pelos logs de ligaçoes

         try
            StatusBar1.Panels[1].Text := 'Consultando Log de Ligações Produtos/Cores...';
            Application.ProcessMessages;

            DmFireRep.ConsE075LLdc.Close;
            DmFireRep.ConsE075LLdc.Open;
            DmFireRep.ConsE075LLdc.Prior;
            DmFireRep.ConsE075LLdc.First;

            StatusBar1.Panels[1].Text := '';
         Except
           MessageDlg('Erro na consulta dos Logs de Ligações Produtos/Cores',mtWarning,[mbok],0);
           abort;
         end;

         vnQtdCpgg := DmFireRep.ConsE075LLdc.RecordCount;
        
         Application.ProcessMessages;

         while not DmFireRep.ConsE075LLdc.Eof do
              begin
                if DmFireRep.ConsE075LLdcTIPMOV.Value = 'L' then  //log de ligação de cores
                   begin//107
                      Dm1.CadE075Ldc.Close;
                      Dm1.CadE075Ldc.ParamByName('codemp').value := DmFireRep.ConsE075LLdcCODEMP.Value;
                      Dm1.CadE075Ldc.ParamByName('codpro').value := DmFireRep.ConsE075LLdcCODPRO.Value;
                      Dm1.CadE075Ldc.ParamByName('codder').value := DmFireRep.ConsE075LLdcCODDER.Value;
                      Dm1.CadE075Ldc.ParamByName('codtec').value := DmFireRep.ConsE075LLdcCODTEC.Value;
                      Dm1.CadE075Ldc.Open;
                      if Dm1.CadE075Ldc.IsEmpty then
                         begin//108
                           Dm1.CadE075Ldc.Insert;
                           Dm1.CadE075LdcCODEMP.Value := DmFireRep.ConsE075LLdcCODEMP.Value;
                           Dm1.CadE075LdcCODPRO.Value := DmFireRep.ConsE075LLdcCODPRO.Value;
                           Dm1.CadE075LdcCODDER.Value := DmFireRep.ConsE075LLdcCODDER.Value;
                           Dm1.CadE075LdcCODTEC.Value := DmFireRep.ConsE075LLdcCODTEC.Value;
                           Dm1.CadE075LdcDESTEC.Value := 'Ligado por log de atualizacao';
                           Dm1.CadE075LdcSITLIG.Value := 'A';
                           Dm1.CadE075Ldc.Post;
                           Dm1.IBDTransacao.CommitRetaining;
                         end;//108
                   end//107
                else if DmFireRep.ConsE075LLdcTIPMOV.Value = 'D' then
                        begin//109
                          Dm1.CadE075Ldc.Close;
                          Dm1.CadE075Ldc.ParamByName('codemp').value := DmFireRep.ConsE075LLdcCODEMP.Value;
                          Dm1.CadE075Ldc.ParamByName('codpro').value := DmFireRep.ConsE075LLdcCODPRO.Value;
                          Dm1.CadE075Ldc.ParamByName('codder').value := DmFireRep.ConsE075LLdcCODDER.Value;
                          Dm1.CadE075Ldc.ParamByName('codtec').value := DmFireRep.ConsE075LLdcCODTEC.Value;
                          Dm1.CadE075Ldc.Open;
                          if not Dm1.CadE075Ldc.IsEmpty then
                             begin//110
                                Dm1.CadE075Ldc.Delete;
                                Dm1.IBDTransacao.CommitRetaining;
                             end;//110

                        end;//109


                DmFireRep.ConsE075LLdc.Next;
                //Refresh;
                Application.ProcessMessages;
              end;//102

      end;

         //Refresh;
         Application.ProcessMessages;






end;

procedure TFAtualiza.btnBProdutos_Click(Sender: TObject);
var
    vnQtdProdutos : integer;
begin

    try
      StatusBar1.Panels[1].Text := 'Consultado produtos...';
      DmFireRep.ConsE075Pro.Close;
      DmFireRep.ConsE075Pro.Open;
      DmFireRep.ConsE075Pro.Prior;
      DmFireRep.ConsE075Pro.First;

      DmFireRep.ConsE075Der.Close;
      DmFireRep.ConsE075Der.Open;
      DmFireRep.ConsE075Der.Prior;
      DmFireRep.ConsE075Der.First;


      StatusBar1.Panels[1].Text := '';
    Except
       MessageDlg('Erro na consulta de produtos!',mtWarning,[mbok],0);
       abort;
     end; //fim do except

      LStatus.Caption := 'Aguarde, Atualizando Produtos..';
      Application.ProcessMessages;
      vnQtdProdutos := DmFireRep.ConsE075Pro.RecordCount;
      statusProdutos.MaxValue := vnQtdProdutos;
      statusProdutos.Progress := 0;
      Application.ProcessMessages;

      while not DmFireRep.ConsE075Pro.Eof  do
           begin
              //grava no banco
              Dm1.CadE075Pro.Close;
              Dm1.CadE075Pro.ParamByName('codemp').Value := DmFireRep.ConsE075ProCODEMP.Value;
              Dm1.CadE075Pro.ParamByName('codpro').Value := DmFireRep.ConsE075ProCODPRO.Value;
              Dm1.CadE075Pro.Open;
              if Dm1.CadE075Pro.IsEmpty then
                begin//4
                   Dm1.CadE075Pro.Insert;
                   Dm1.CadE075ProCODEMP.Value := DmFireRep.ConsE075ProCODEMP.Value;
                   Dm1.CadE075ProCODPRO.Value := DmFireRep.ConsE075ProCODPRO.Value;
                   Dm1.CadE075ProDESPRO.Value := DmFireRep.ConsE075ProDESPRO.Value;
                   Dm1.CadE075ProCODFAM.Value := DmFireRep.ConsE075ProCODFAM.Value;
                   Dm1.CadE075ProCODAGP.Value := DmFireRep.ConsE075ProCODAGP.Value;
                   Dm1.CadE075ProSITPRO.Value := DmFireRep.ConsE075ProSITPRO.Value;

                   Dm1.CadE075Pro.Post;
                   Dm1.IBDTransacao.Commit;
                end//4
              else
                begin//5
                   Dm1.CadE075Pro.Edit;
                   Dm1.CadE075ProDESPRO.Value := DmFireRep.ConsE075ProDESPRO.Value;
                   Dm1.CadE075ProCODFAM.Value := DmFireRep.ConsE075ProCODFAM.Value;
                   Dm1.CadE075ProCODAGP.Value := DmFireRep.ConsE075ProCODAGP.Value;
                   Dm1.CadE075ProSITPRO.Value := DmFireRep.ConsE075ProSITPRO.Value;

                   Dm1.CadE075Pro.Post;
                   Dm1.IBDTransacao.Commit;
                end;//5
                statusProdutos.Progress := statusProdutos.Progress + 1;
                Application.ProcessMessages;

                DmFireRep.ConsE075Pro.Next;
           end;


       vnQtdProdutos := DmFireRep.ConsE075Der.RecordCount;
       statusProdutos.MaxValue := 2800;
       statusProdutos.Progress := 0;
       Application.ProcessMessages;
       while not DmFireRep.ConsE075Der.Eof do
          begin
            //grava no banco
            Dm1.CadE075Der.Close;
            Dm1.CadE075Der.ParamByName('codemp').Value := DmFireRep.ConsE075DerCODEMP.Value;
            Dm1.CadE075Der.ParamByName('codpro').Value := DmFireRep.ConsE075DerCODPRO.Value;
            Dm1.CadE075Der.ParamByName('codder').Value := DmFireRep.ConsE075DerCODDER.Value;
            Dm1.CadE075Der.Open;
            if Dm1.CadE075Der.IsEmpty then
              begin//10
                 Dm1.CadE075Der.Insert;
                 Dm1.CadE075DerCODEMP.Value := DmFireRep.ConsE075DerCODEMP.Value;
                 Dm1.CadE075DerCODPRO.Value := DmFireRep.ConsE075DerCODPRO.Value;
                 Dm1.CadE075DerCODDER.Value := DmFireRep.ConsE075DerCODDER.Value;
                 Dm1.CadE075DerDESDER.Value := DmFireRep.ConsE075DerDESDER.Value;
                 Dm1.CadE075DerPESBRU.Value := DmFireRep.ConsE075DerPESBRU.Value;
                 Dm1.CadE075DerPESLIQ.Value := DmFireRep.ConsE075DerPESLIQ.Value;
                 Dm1.CadE075DerVOLDER.Value := DmFireRep.ConsE075DerVOLDER.Value;
                 Dm1.CadE075DerSITDER.Value := DmFireRep.ConsE075DerSITDER.Value;
                 Dm1.CadE075DerCORUNI.Value := DmFireRep.ConsE075DerCORUNI.Value;
                 Dm1.CadE075DerCMP1BB.Value := DmFireRep.ConsE075DerCMP1BB.Value;
                 Dm1.CadE075DerCMP1AC.Value := DmFireRep.ConsE075DerCMP1AC.Value;
                 Dm1.CadE075DerCMP2BB.Value := DmFireRep.ConsE075DerCMP2BB.Value;
                 Dm1.CadE075DerCMP2EN.Value := DmFireRep.ConsE075DerCMP2EN.Value;

                 Dm1.CadE075Der.Post;
                 Dm1.IBDTransacao.Commit;
              end//10
            else
              begin//11
                 Dm1.CadE075Der.Edit;
                 Dm1.CadE075DerDESDER.Value := DmFireRep.ConsE075DerDESDER.Value;
                 Dm1.CadE075DerPESBRU.Value := DmFireRep.ConsE075DerPESBRU.Value;
                 Dm1.CadE075DerPESLIQ.Value := DmFireRep.ConsE075DerPESLIQ.Value;
                 Dm1.CadE075DerVOLDER.Value := DmFireRep.ConsE075DerVOLDER.Value;
                 Dm1.CadE075DerSITDER.Value := DmFireRep.ConsE075DerSITDER.Value;
                 Dm1.CadE075DerCORUNI.Value := DmFireRep.ConsE075DerCORUNI.Value;
                 Dm1.CadE075DerCMP1BB.Value := DmFireRep.ConsE075DerCMP1BB.Value;
                 Dm1.CadE075DerCMP1AC.Value := DmFireRep.ConsE075DerCMP1AC.Value;
                 Dm1.CadE075DerCMP2BB.Value := DmFireRep.ConsE075DerCMP2BB.Value;
                 Dm1.CadE075DerCMP2EN.Value := DmFireRep.ConsE075DerCMP2EN.Value;

                 Dm1.CadE075Der.Post;
                 Dm1.IBDTransacao.Commit;
              end;//11
              statusProdutos.Progress := statusProdutos.Progress + 1;
              Application.ProcessMessages;
             DmFireRep.ConsE075Der.Next;
          end;


end;

procedure TFAtualiza.btnBTabPreco_Click(Sender: TObject);
var 
    vnQtdCpgg : integer;
begin

   try
      StatusBar1.Panels[1].Text := 'Consultado Tabela de Preços';
      Application.ProcessMessages;
      DmFireRep.ConsE081Tab.Close;
      DmFireRep.ConsE081Tab.Open;
      DmFireRep.ConsE081Tab.Prior;
      DmFireRep.ConsE081Tab.First;

      DmFireRep.ConsE081Itp.Close;
      DmFireRep.ConsE081Itp.Open;
      DmFireRep.ConsE081Itp.Last;
      DmFireRep.ConsE081Itp.First;

      StatusBar1.Panels[1].Text := '';

   Except
     MessageDlg('Erro na consulta da Tabela de Preços',mtWarning,[mbok],0);
     Abort;
   end;

     vnQtdCpgg := DmFireRep.ConsE081Tab.RecordCount;
     statusTabPreco.MaxValue := vnQtdCpgg;
     statusTabPreco.Progress := 0;

     Application.ProcessMessages;

     while not DmFireRep.ConsE081Tab.Eof do
        begin
          //grava no banco
          Dm1.CadE081Tab.Close;
          Dm1.CadE081Tab.ParamByName('codemp').Value := DmFireRep.ConsE081TabCODEMP.Value;
          Dm1.CadE081Tab.ParamByName('codtpr').Value := DmFireRep.ConsE081TabCODTPR.Value;
          Dm1.CadE081Tab.ParamByName('codusu').Value := FPrincipal.vnCodusu;
          Dm1.CadE081Tab.Open;
          if Dm1.CadE081Tab.IsEmpty then
             begin
                Dm1.CadE081Tab.Insert;
                Dm1.CadE081TabCODEMP.Value := DmFireRep.ConsE081TabCODEMP.Value;
                Dm1.CadE081TabCODTPR.Value := DmFireRep.ConsE081TabCODTPR.Value;
                Dm1.CadE081TabCODUSU.Value := FPrincipal.vnCodusu;
                Dm1.CadE081TabDESTPR.Value := DmFireRep.ConsE081TabDESTPR.Value;
                Dm1.CadE081TabSITTPR.Value := DmFireRep.ConsE081TabSITTPR.Value;
                Dm1.CadE081Tab.Post;
                Dm1.IBDTransacao.CommitRetaining;
             end
          else
            begin
                Dm1.CadE081Tab.Edit;
                Dm1.CadE081TabDESTPR.Value := DmFireRep.ConsE081TabDESTPR.Value;
                Dm1.CadE081TabSITTPR.Value := DmFireRep.ConsE081TabSITTPR.Value;
                Dm1.CadE081Tab.Post;
                Dm1.IBDTransacao.CommitRetaining;
            end;

            statusTabPreco.Progress := statusTabPreco.Progress + 1;
            DmFireRep.ConsE081Tab.Next;
            Application.ProcessMessages;
        end;


       {*******************************************************
                 grava os produtos da tabela de preço
       ********************************************************}
       Dm1.ConsSql.Close;
       Dm1.ConsSql.SQL.Clear;
       Dm1.ConsSql.SQL.Add('delete from e081itp');
       Dm1.ConsSql.ExecSQL;

       vnQtdCpgg := DmFireRep.ConsE081Itp.RecordCount;
       statusTabPreco.MaxValue := vnQtdCpgg;
       statusTabPreco.Progress := 0;
       Dm1.CadE081Itp.Open;
       Application.ProcessMessages;
       while not DmFireRep.ConsE081Itp.Eof do
           begin

              Dm1.CadE081Itp.Insert;
              Dm1.CadE081ItpCODEMP.Value := DmFireRep.ConsE081ItpCODEMP.Value;
              Dm1.CadE081ItpCODTPR.Value := DmFireRep.ConsE081ItpCODTPR.Value;
              Dm1.CadE081ItpCODPRO.Value := DmFireRep.ConsE081ItpCODPRO.Value;
              Dm1.CadE081ItpCODDER.AsString := DmFireRep.ConsE081ItpCODDER.Value;
              Dm1.CadE081ItpCODUSU.Value := FPrincipal.vnCodusu;
              Dm1.CadE081ItpDESPRO.Value := DmFireRep.ConsE081ItpDESPRO.Value;
              Dm1.CadE081ItpPREBAS.Value := DmFireRep.ConsE081ItpPREBAS.Value;
              Dm1.CadE081ItpTOLMAI.Value := DmFireRep.ConsE081ItpTOLMAI.Value;
              Dm1.CadE081ItpTOLMEN.Value := DmFireRep.ConsE081ItpTOLMEN.Value;
              Dm1.CadE081ItpVLRMAI.Value := DmFireRep.ConsE081ItpVLRMAI.Value;
              Dm1.CadE081ItpVLRMEN.Value := DmFireRep.ConsE081ItpVLRMEN.Value;
              if (((FPrincipal.vnCodRep = 4) or (FPrincipal.vnCodRep = 6)) and (DmFireRep.ConsE081ItpCODAGC.Value = 'ESTOF')) then //se for esses representantes aumenta o valor do produto
                  begin
                    Dm1.CadE081ItpPREBAS.Value := Dm1.CadE081ItpPREBAS.Value + (Dm1.CadE081ItpPREBAS.Value * 0.0189);
                    Dm1.CadE081ItpVLRMAI.Value := Dm1.CadE081ItpVLRMAI.Value + (Dm1.CadE081ItpVLRMAI.Value * 0.0189);
                    Dm1.CadE081ItpVLRMEN.Value := Dm1.CadE081ItpVLRMEN.Value + (Dm1.CadE081ItpVLRMEN.Value * 0.0189);
                  end;
              Dm1.CadE081ItpSITREG.Value := DmFireRep.ConsE081ItpSITREG.Value;
              Dm1.CadE081ItpDATINI.Value := DmFireRep.ConsE081ItpDATINI.Value;
              Dm1.CadE081ItpDATFIM.Value := DmFireRep.ConsE081ItpDATFIM.Value;
              Dm1.CadE081Itp.Post;
              Dm1.IBDTransacao.CommitRetaining;



             statusTabPreco.Progress := statusTabPreco.Progress + 1;
             Application.ProcessMessages;
             DmFireRep.ConsE081Itp.Next;
           end;

end;

procedure TFAtualiza.btnBTitulos_Click(Sender: TObject);
var
  vnQtdCpgg : integer;
begin

   try
      StatusBar1.Panels[1].Text := 'Consultando Títulos...';
      Application.ProcessMessages;

      DmFireRep.ConsE301Tcr.Close;
      DmFireRep.ConsE301Tcr.ParamByName('CODREP').Value := FPrincipal.vnCodRep;
      DmFireRep.ConsE301Tcr.Open;
      DmFireRep.ConsE301Tcr.Prior;
      DmFireRep.ConsE301Tcr.First;

      StatusBar1.Panels[1].Text := '';

   Except
     MessageDlg('Erro na consulta dos Títulos',mtWarning,[mbok],0);
     abort;
   end;

   //apaga todos os registros da tabela
   Dm1.ApagaE301Tcr.Close;
   Dm1.ApagaE301Tcr.Open;
   Dm1.IBDTransacao.CommitRetaining;


   vnQtdCpgg := DmFireRep.ConsE301Tcr.RecordCount;
   statusTitulos.MaxValue := vnQtdCpgg;
   statusTitulos.Progress := 0;
   Application.ProcessMessages;

   while not DmFireRep.ConsE301Tcr.Eof do
       begin
          //grava no banco
          Dm1.CadE301Tcr.Open;
          Dm1.CadE301Tcr.Insert;
          Dm1.CadE301TcrCODEMP.Value := DmFireRep.ConsE301TcrCODEMP.Value;
          Dm1.CadE301TcrCODFIL.Value := DmFireRep.ConsE301TcrCODFIL.Value;
          Dm1.CadE301TcrNUMTIT.Value := DmFireRep.ConsE301TcrNUMTIT.Value;
          Dm1.CadE301TcrCODTPT.Value := DmFireRep.ConsE301TcrCODTPT.Value;
          Dm1.CadE301TcrCODTNS.Value := DmFireRep.ConsE301TcrCODTNS.Value;
          Dm1.CadE301TcrSITTIT.Value := DmFireRep.ConsE301TcrSITTIT.Value;
          Dm1.CadE301TcrDATEMI.Value := DmFireRep.ConsE301TcrDATEMI.Value;
          Dm1.CadE301TcrCODCLI.Value := DmFireRep.ConsE301TcrCODCLI.Value;
          Dm1.CadE301TcrVCTORI.Value := DmFireRep.ConsE301TcrVCTORI.Value;
          Dm1.CadE301TcrVLRORI.Value := DmFireRep.ConsE301TcrVLRORI.Value;
          Dm1.CadE301TcrVCTPRO.Value := DmFireRep.ConsE301TcrVCTPRO.Value;
          Dm1.CadE301TcrDATPPT.Value := DmFireRep.ConsE301TcrDATPPT.Value;
          Dm1.CadE301TcrVLRABE.Value := DmFireRep.ConsE301TcrVLRABE.Value;
          Dm1.CadE301Tcr.Post;
          Dm1.IBDTransacao.CommitRetaining;

          statusTitulos.Progress := statusTitulos.Progress + 1;
          Application.ProcessMessages;
          DmFireRep.ConsE301Tcr.Next;
       end;

end;

procedure TFAtualiza.btnPedidosClick(Sender: TObject);
var vnUltPed,vnPedBaseAtu, vnQtdPed : Integer;
    vaTexto : string;
    vnNovaFaixaNumCon,vnNumConAtu : Integer;
begin

  if edtFaixaPedidos.Value = 0 then
     begin
       Application.MessageBox('Informe a Faixa de Pedidos','Aviso',MB_ICONWARNING+MB_OK);
       ActiveControl := edtFaixaPedidos;
       Abort;
     end;

  DmFireRep.ConsSql.Close;
  DmFireRep.ConsSql.SQL.Clear;
  DmFireRep.ConsSql.SQL.Add('SELECT max(NUMPED) as ULTIMO_PEDIDO');
  DmFireRep.ConsSql.SQL.Add(' FROM E120PED');
  DmFireRep.ConsSql.SQL.Add(' where');
  DmFireRep.ConsSql.SQL.Add(' CODREP = :CODREP');
  DmFireRep.ConsSql.ParamByName('CODREP').Value := FPrincipal.vnCodRep;
  DmFireRep.ConsSql.Open;

  vnUltPed := DmFireRep.ConsSql.FieldByName('ULTIMO_PEDIDO').AsInteger;
  vnPedBaseAtu := vnUltPed - edtFaixaPedidos.AsInteger;


  Dm1.ConsSql.Close;
  Dm1.ConsSql.SQL.Clear;
  Dm1.ConsSql.SQL.Add('DELETE FROM E120OBS');
  Dm1.ConsSql.SQL.Add('WHERE');
  Dm1.ConsSql.SQL.Add('(NUMPED >= :NUMPED) OR (NUMPED = 0)');
  Dm1.ConsSql.ParamByName('NUMPED').Value := vnPedBaseAtu;
  Dm1.ConsSql.ExecSQL;

  Dm1.ConsSql.Close;
  Dm1.ConsSql.SQL.Clear;
  Dm1.ConsSql.SQL.Add('DELETE FROM USU120IPD');
  Dm1.ConsSql.SQL.Add('WHERE');
  Dm1.ConsSql.SQL.Add('(NUMPED >= :NUMPED) OR (NUMPED = 0)');
  Dm1.ConsSql.ParamByName('NUMPED').Value := vnPedBaseAtu;
  Dm1.ConsSql.ExecSQL;

  Dm1.ConsSql.Close;
  Dm1.ConsSql.SQL.Clear;
  Dm1.ConsSql.SQL.Add('DELETE FROM E120IPD');
  Dm1.ConsSql.SQL.Add('WHERE');
  Dm1.ConsSql.SQL.Add('(NUMPED >= :NUMPED) OR (NUMPED = 0)');
  Dm1.ConsSql.ParamByName('NUMPED').Value := vnPedBaseAtu;
  Dm1.ConsSql.ExecSQL;

  Dm1.ConsSql.Close;
  Dm1.ConsSql.SQL.Clear;
  Dm1.ConsSql.SQL.Add('DELETE FROM E120PED');
  Dm1.ConsSql.SQL.Add('WHERE');
  Dm1.ConsSql.SQL.Add('(NUMPED >= :NUMPED) OR (NUMPED = 0)');
  Dm1.ConsSql.ParamByName('NUMPED').Value := vnPedBaseAtu;
  Dm1.ConsSql.ExecSQL;

  Dm1.IBDTransacao.CommitRetaining;

  StatusBar1.Panels[1].Text := 'Consultando pedidos na base web..';
  Application.ProcessMessages;

  DmFireRep.ConsE120Ped.Close;
  DmFireRep.ConsE120Ped.SQL.Clear;
  DmFireRep.ConsE120Ped.SQL.Add('SELECT E120PED.*');
  DmFireRep.ConsE120Ped.SQL.Add(' FROM E120PED');
  DmFireRep.ConsE120Ped.SQL.Add(' WHERE');
  DmFireRep.ConsE120Ped.SQL.Add(' CODREP = :CODREP AND');
  DmFireRep.ConsE120Ped.SQL.Add(' ((NUMPED >= :NUMPED) OR (NUMPED = 0))');
  DmFireRep.ConsE120Ped.ParamByName('CODREP').Value := FPrincipal.vnCodRep;
  DmFireRep.ConsE120Ped.ParamByName('NUMPED').Value := vnPedBaseAtu;
  DmFireRep.ConsE120Ped.Open;
  DmFireRep.ConsE120Ped.Last;
  DmFireRep.ConsE120Ped.First;
  vnQtdPed := DmFireRep.ConsE120Ped.RecordCount;
  statusPedidos.MaxValue := vnQtdPed;
  statusPedidos.Progress := 0;
  StatusBar1.Panels[1].Text := '';
  while not DmFireRep.ConsE120Ped.Eof do
    begin
       Dm1.CadE120Ped.Close;
       Dm1.CadE120Ped.ParamByName('CODEMP').Value := DmFireRep.ConsE120PedCODEMP.Value;
       Dm1.CadE120Ped.ParamByName('CODFIL').Value := DmFireRep.ConsE120PedCODFIL.Value;
       Dm1.CadE120Ped.ParamByName('NUMCON').Value := DmFireRep.ConsE120PedNUMCON.Value;
       Dm1.CadE120Ped.ParamByName('CODREP').Value := DmFireRep.ConsE120PedCODREP.Value;
       Dm1.CadE120Ped.Open;
       if Dm1.CadE120Ped.IsEmpty then
          begin
             Dm1.CadE120Ped.Insert;
             Dm1.CadE120PedCODEMP.Value := DmFireRep.ConsE120PedCODEMP.Value;
             Dm1.CadE120PedCODFIL.Value := DmFireRep.ConsE120PedCODFIL.Value;
             Dm1.CadE120PedNUMPED.Value := DmFireRep.ConsE120PedNUMPED.Value;
             Dm1.CadE120PedNUMCON.Value := DmFireRep.ConsE120PedNUMCON.Value;
             Dm1.CadE120PedCODCLI.Value := DmFireRep.ConsE120PedCODCLI.Value;
             Dm1.CadE120PedTNSPRO.Value := DmFireRep.ConsE120PedTNSPRO.Value;
             Dm1.CadE120PedDATEMI.Value := DmFireRep.ConsE120PedDATEMI.Value;
             Dm1.CadE120PedCODREP.Value := DmFireRep.ConsE120PedCODREP.Value;
             Dm1.CadE120PedCODCPG.Value := DmFireRep.ConsE120PedCODCPG.Value;
             Dm1.CadE120PedQTDORI.Value := DmFireRep.ConsE120PedQTDORI.Value;
             Dm1.CadE120PedQTDABE.Value := DmFireRep.ConsE120PedQTDABE.Value;
             Dm1.CadE120PedVLRBCO.Value := DmFireRep.ConsE120PedVLRBCO.Value;
             Dm1.CadE120PedVLRCOM.Value := DmFireRep.ConsE120PedVLRCOM.Value;
             Dm1.CadE120PedVLRLIQ.Value := DmFireRep.ConsE120PedVLRLIQ.Value;
             Dm1.CadE120PedVLRORI.Value := DmFireRep.ConsE120PedVLRORI.Value;
             Dm1.CadE120PedSITPED.Value := DmFireRep.ConsE120PedSITPED.Value;
             Dm1.CadE120PedUSUGER.Value := DmFireRep.ConsE120PedUSUGER.Value;
             Dm1.CadE120PedDATGER.Value := DmFireRep.ConsE120PedDATGER.Value;
             Dm1.CadE120PedPEDENV.Value := DmFireRep.ConsE120PedPEDENV.Value;
             Dm1.CadE120PedPEDCON.Value := DmFireRep.ConsE120PedPEDCON.Value;
             Dm1.CadE120PedDATCON.Value := DmFireRep.ConsE120PedDATCON.Value;
             Dm1.CadE120PedDATENV.Value := DmFireRep.ConsE120PedDATENV.Value;
             Dm1.CadE120PedUSUCON.Value := DmFireRep.ConsE120PedUSUCON.Value;
             Dm1.CadE120PedPRECAR.Value := DmFireRep.ConsE120PedPRECAR.Value;
             Dm1.CadE120Ped.Post;
          end;

       DmFireRep.ConsE120Ipd.Close; //consulta os produtos do pedido
       DmFireRep.ConsE120Ipd.SQL.Clear;
       DmFireRep.ConsE120Ipd.SQL.Add('SELECT E120IPD.*');
       DmFireRep.ConsE120Ipd.SQL.Add(' FROM E120IPD');
       DmFireRep.ConsE120Ipd.SQL.Add(' WHERE');
       DmFireRep.ConsE120Ipd.SQL.Add(' CODREP = :CODREP AND');
       DmFireRep.ConsE120Ipd.SQL.Add(' NUMCON = :NUMCON');
       DmFireRep.ConsE120Ipd.ParamByName('CODREP').Value := DmFireRep.ConsE120PedCODREP.Value;
       DmFireRep.ConsE120Ipd.ParamByName('NUMCON').Value := DmFireRep.ConsE120PedNUMCON.Value;
       DmFireRep.ConsE120Ipd.Open;
       DmFireRep.ConsE120Ipd.Last;
       DmFireRep.ConsE120Ipd.First;
       while not DmFireRep.ConsE120Ipd.Eof do
          begin
             vaTexto := 'Inserindo PRODUTO: '+DmFireRep.ConsE120IpdCODPRO.Value+ ' DERIV: '+DmFireRep.ConsE120IpdCODDER.Value;
             Application.ProcessMessages;

             Dm1.CadE120Ipd.Close;
             Dm1.CadE120Ipd.ParamByName('CODEMP').Value := DmFireRep.ConsE120IpdCODEMP.Value;
             Dm1.CadE120Ipd.ParamByName('CODFIL').Value := DmFireRep.ConsE120IpdCODFIL.Value;
             Dm1.CadE120Ipd.ParamByName('NUMCON').Value := DmFireRep.ConsE120IpdNUMCON.Value;
             Dm1.CadE120Ipd.ParamByName('CODREP').Value := DmFireRep.ConsE120IpdCODREP.Value;
             Dm1.CadE120Ipd.ParamByName('SEQIPD').Value := DmFireRep.ConsE120IpdSEQIPD.Value;
             Dm1.CadE120Ipd.Open;
             if Dm1.CadE120Ipd.IsEmpty then
                begin
                   Dm1.CadE120Ipd.Insert;
                   Dm1.CadE120IpdCODEMP.Value := DmFireRep.ConsE120IpdCODEMP.Value;
                   Dm1.CadE120IpdCODFIL.Value := DmFireRep.ConsE120IpdCODFIL.Value;
                   Dm1.CadE120IpdNUMPED.Value := DmFireRep.ConsE120IpdNUMPED.Value;
                   Dm1.CadE120IpdNUMCON.Value := DmFireRep.ConsE120IpdNUMCON.Value;
                   Dm1.CadE120IpdCODREP.Value := DmFireRep.ConsE120IpdCODREP.Value;
                   Dm1.CadE120IpdSEQIPD.Value := DmFireRep.ConsE120IpdSEQIPD.Value;
                   Dm1.CadE120IpdTNSPRO.Value := DmFireRep.ConsE120IpdTNSPRO.Value;
                   Dm1.CadE120IpdCODPRO.Value := DmFireRep.ConsE120IpdCODPRO.Value;
                   Dm1.CadE120IpdCODDER.Value := DmFireRep.ConsE120IpdCODDER.Value;
                   Dm1.CadE120IpdCODFAM.Value := DmFireRep.ConsE120IpdCODFAM.Value;
                   Dm1.CadE120IpdQTDPED.Value := DmFireRep.ConsE120IpdQTDPED.Value;
                   Dm1.CadE120IpdQTDFAT.Value := DmFireRep.ConsE120IpdQTDFAT.Value;
                   Dm1.CadE120IpdQTDCAN.Value := DmFireRep.ConsE120IpdQTDCAN.Value;
                   Dm1.CadE120IpdQTDABE.Value := DmFireRep.ConsE120IpdQTDABE.Value;
                   Dm1.CadE120IpdUNIMED.Value := DmFireRep.ConsE120IpdUNIMED.Value;
                   Dm1.CadE120IpdCODTPR.Value := DmFireRep.ConsE120IpdCODTPR.Value;
                   Dm1.CadE120IpdPREUNI.Value := DmFireRep.ConsE120IpdPREUNI.Value;
                   Dm1.CadE120IpdPERCOM.Value := DmFireRep.ConsE120IpdPERCOM.Value;
                   Dm1.CadE120IpdVLRBRU.Value := DmFireRep.ConsE120IpdVLRBRU.Value;
                   Dm1.CadE120IpdVLRBCO.Value := DmFireRep.ConsE120IpdVLRBCO.Value;
                   Dm1.CadE120IpdVLRCOM.Value := DmFireRep.ConsE120IpdVLRCOM.Value;
                   Dm1.CadE120IpdVLRLPR.Value := DmFireRep.ConsE120IpdVLRLPR.Value;
                   Dm1.CadE120IpdVLRLIQ.Value := DmFireRep.ConsE120IpdVLRLIQ.Value;
                   Dm1.CadE120IpdSITIPD.Value := DmFireRep.ConsE120IpdSITIPD.Value;
                   Dm1.CadE120IpdUSUGER.Value := DmFireRep.ConsE120IpdUSUGER.Value;
                   Dm1.CadE120IpdDATGER.Value := DmFireRep.ConsE120IpdDATGER.Value;
                   Dm1.CadE120IpdTOTDESC.Value := DmFireRep.ConsE120IpdTOTDESC.Value;
                   Dm1.CadE120IpdVLRORI.Value := DmFireRep.ConsE120IpdVLRORI.Value;
                   Dm1.CadE120IpdDATEMI.Value := DmFireRep.ConsE120IpdDATEMI.Value;
                   if Trim(Dm1.CadE120IpdCORGRID.Value) = '' then
                      Dm1.CadE120IpdCORGRID.Value := '$00DDFFFF'
                   else
                      Dm1.CadE120IpdCORGRID.Value := DmFireRep.ConsE120IpdCORGRID.Value;

                   Dm1.CadE120Ipd.Post;
                end;


            DmFireRep.ConsE120Ipd.Next;
          end;

          Application.ProcessMessages;
          DmFireRep.ConsUsu120Ipd.Close;//CONSUTA AS CORES DOS PRODUTOS
          DmFireRep.ConsUsu120Ipd.SQL.Clear;
          DmFireRep.ConsUsu120Ipd.SQL.Add('SELECT USU120IPD.*');
          DmFireRep.ConsUsu120Ipd.SQL.Add(' FROM USU120IPD');
          DmFireRep.ConsUsu120Ipd.SQL.Add(' WHERE');
          DmFireRep.ConsUsu120Ipd.SQL.Add(' CODREP = :CODREP AND');
          DmFireRep.ConsUsu120Ipd.SQL.Add(' NUMCON = :NUMCON');
          DmFireRep.ConsUsu120Ipd.ParamByName('CODREP').Value := DmFireRep.ConsE120PedCODREP.Value;
          DmFireRep.ConsUsu120Ipd.ParamByName('NUMCON').Value := DmFireRep.ConsE120PedNUMCON.Value;
          DmFireRep.ConsUsu120Ipd.Open;
          DmFireRep.ConsUsu120Ipd.First;
          while NOT DmFireRep.ConsUsu120Ipd.Eof do
             begin
               Dm1.CadUsu120Ipd.Close;
               Dm1.CadUsu120Ipd.ParamByName('CODEMP').Value := DmFireRep.ConsUsu120IpdCODEMP.Value;
               Dm1.CadUsu120Ipd.ParamByName('CODFIL').Value := DmFireRep.ConsUsu120IpdCODFIL.Value;
               Dm1.CadUsu120Ipd.ParamByName('NUMCON').Value := DmFireRep.ConsUsu120IpdNUMCON.Value;
               Dm1.CadUsu120Ipd.ParamByName('CODREP').Value := DmFireRep.ConsUsu120IpdCODREP.Value;
               Dm1.CadUsu120Ipd.ParamByName('SEQIPD').Value := DmFireRep.ConsUsu120IpdSEQIPD.Value;
               Dm1.CadUsu120Ipd.ParamByName('SEQITE').Value := DmFireRep.ConsUsu120IpdSEQITE.Value;
               Dm1.CadUsu120Ipd.Open;
               if Dm1.CadUsu120Ipd.IsEmpty then
                  begin
                     Dm1.CadUsu120Ipd.Insert;
                     Dm1.CadUsu120IpdCODEMP.Value := DmFireRep.ConsUsu120IpdCODEMP.Value;
                     Dm1.CadUsu120IpdCODFIL.Value := DmFireRep.ConsUsu120IpdCODFIL.Value;
                     Dm1.CadUsu120IpdSEQIPD.Value := DmFireRep.ConsUsu120IpdSEQIPD.Value;
                     Dm1.CadUsu120IpdSEQITE.Value := DmFireRep.ConsUsu120IpdSEQITE.Value;
                     Dm1.CadUsu120IpdNUMPED.Value := DmFireRep.ConsUsu120IpdNUMPED.Value;
                     Dm1.CadUsu120IpdNUMCON.Value := DmFireRep.ConsUsu120IpdNUMCON.Value;
                     Dm1.CadUsu120IpdQTDCOR.Value := DmFireRep.ConsUsu120IpdQTDCOR.Value;
                     Dm1.CadUsu120IpdQTDABE.Value := DmFireRep.ConsUsu120IpdQTDABE.Value;
                     Dm1.CadUsu120IpdQTDCAN.Value := DmFireRep.ConsUsu120IpdQTDCAN.Value;
                     Dm1.CadUsu120IpdTIPCMB.Value := DmFireRep.ConsUsu120IpdTIPCMB.Value;
                     Dm1.CadUsu120IpdCOR001.Value := DmFireRep.ConsUsu120IpdCOR001.Value;
                     Dm1.CadUsu120IpdCOR002.Value := DmFireRep.ConsUsu120IpdCOR002.Value;
                     Dm1.CadUsu120IpdCODPRO.Value := DmFireRep.ConsUsu120IpdCODPRO.Value;
                     Dm1.CadUsu120IpdCODDER.Value := DmFireRep.ConsUsu120IpdCODDER.Value;
                     Dm1.CadUsu120IpdTECTRA.Value := DmFireRep.ConsUsu120IpdTECTRA.Value;
                     Dm1.CadUsu120IpdPRECAR.Value := DmFireRep.ConsUsu120IpdPRECAR.Value;
                     Dm1.CadUsu120IpdCODREP.Value := DmFireRep.ConsUsu120IpdCODREP.Value;
                     Dm1.CadUsu120Ipd.Post;
                  end;

               DmFireRep.ConsUsu120Ipd.Next;
             end;

          DmFireRep.ConsE120obs.Close; //CONSULTA AS OBSERVAÇOES
          DmFireRep.ConsE120obs.SQL.Clear;
          DmFireRep.ConsE120obs.SQL.Add('SELECT E120OBS.*');
          DmFireRep.ConsE120obs.SQL.Add(' FROM E120OBS');
          DmFireRep.ConsE120obs.SQL.Add(' WHERE');
          DmFireRep.ConsE120obs.SQL.Add(' E120OBS.CODREP = :CODREP AND');
          DmFireRep.ConsE120obs.SQL.Add(' E120OBS.NUMCON = :NUMCON');
          DmFireRep.ConsE120obs.ParamByName('CODREP').Value := DmFireRep.ConsE120PedCODREP.Value;
          DmFireRep.ConsE120obs.ParamByName('NUMCON').Value := DmFireRep.ConsE120PedNUMCON.Value;
          DmFireRep.ConsE120obs.Open;
          DmFireRep.ConsE120obs.First;
          while NOT DmFireRep.ConsE120obs.Eof do
            begin
                Dm1.CadE120Obs.Close;
                Dm1.CadE120Obs.ParamByName('CODEMP').Value := DmFireRep.ConsE120ObsCODEMP.Value;
                Dm1.CadE120Obs.ParamByName('CODFIL').Value := DmFireRep.ConsE120ObsCODFIL.Value;
                Dm1.CadE120Obs.ParamByName('NUMCON').Value := DmFireRep.ConsE120ObsNUMCON.Value;
                Dm1.CadE120Obs.ParamByName('CODREP').Value := DmFireRep.ConsE120ObsCODREP.Value;
                Dm1.CadE120Obs.ParamByName('SEQOBS').Value := DmFireRep.ConsE120ObsSEQOBS.Value;
                Dm1.CadE120Obs.Open;
                if Dm1.CadE120Obs.IsEmpty then
                   begin
                      Dm1.CadE120Obs.Insert;
                      Dm1.CadE120ObsCODEMP.Value := DmFireRep.ConsE120ObsCODEMP.Value;
                      Dm1.CadE120ObsCODFIL.Value := DmFireRep.ConsE120ObsCODFIL.Value;
                      Dm1.CadE120ObsSEQOBS.Value := DmFireRep.ConsE120ObsSEQOBS.Value;
                      Dm1.CadE120ObsNUMPED.Value := DmFireRep.ConsE120ObsNUMPED.Value;
                      Dm1.CadE120ObsNUMCON.Value := DmFireRep.ConsE120ObsNUMCON.Value;
                      Dm1.CadE120ObsOBSPED.Value := DmFireRep.ConsE120ObsOBSPED.Value;
                      Dm1.CadE120ObsSITOBS.Value := DmFireRep.ConsE120ObsSITOBS.Value;
                      Dm1.CadE120ObsOBSUSU.Value := DmFireRep.ConsE120ObsOBSUSU.Value;
                      Dm1.CadE120ObsOBSDAT.Value := DmFireRep.ConsE120ObsOBSDAT.Value;
                      Dm1.CadE120ObsCODREP.Value := DmFireRep.ConsE120ObsCODREP.Value;
                      Dm1.CadE120Obs.Post;
                   end;


               DmFireRep.ConsE120obs.Next;
            end;

      Dm1.IBDTransacao.CommitRetaining;
      DmFireRep.ConsE120Ped.Next;
      statusPedidos.Progress := statusPedidos.Progress + 1;

    end;

    //consulta os pedidos que estao aguardando aprovação para ver se nao foram descartados na liberação
    Dm1.ConsE120PedAgdConf.Close;
    Dm1.ConsE120PedAgdConf.Open;
    Dm1.ConsE120PedAgdConf.First;
    while not Dm1.ConsE120PedAgdConf.Eof do
       begin
         DmFireRep.CadE120Ped.Close;
         DmFireRep.CadE120Ped.ParamByName('CODEMP').Value := Dm1.ConsE120PedAgdConfCODEMP.Value;
         DmFireRep.CadE120Ped.ParamByName('CODFIL').Value := Dm1.ConsE120PedAgdConfCODFIL.Value;
         DmFireRep.CadE120Ped.ParamByName('NUMCON').Value := Dm1.ConsE120PedAgdConfNUMCON.Value;
         DmFireRep.CadE120Ped.ParamByName('CODREP').Value := Dm1.ConsE120PedAgdConfCODREP.Value;
         DmFireRep.CadE120Ped.Open;
         if DmFireRep.CadE120Ped.IsEmpty then
            begin
              Dm1.ConsSql.Close;
              Dm1.ConsSql.SQL.Clear;
              Dm1.ConsSql.SQL.Add('DELETE FROM E120OBS');
              Dm1.ConsSql.SQL.Add('WHERE');
              Dm1.ConsSql.SQL.Add('NUMCON = :NUMCON');
              Dm1.ConsSql.ParamByName('NUMCON').Value := DmFireRep.CadE120PedNUMCON.Value;
              Dm1.ConsSql.ExecSQL;

              Dm1.ConsSql.Close;
              Dm1.ConsSql.SQL.Clear;
              Dm1.ConsSql.SQL.Add('DELETE FROM USU120IPD');
              Dm1.ConsSql.SQL.Add('WHERE');
              Dm1.ConsSql.SQL.Add('NUMCON = :NUMCON');
              Dm1.ConsSql.ParamByName('NUMCON').Value := DmFireRep.CadE120PedNUMCON.Value;
              Dm1.ConsSql.ExecSQL;

              Dm1.ConsSql.Close;
              Dm1.ConsSql.SQL.Clear;
              Dm1.ConsSql.SQL.Add('DELETE FROM E120IPD');
              Dm1.ConsSql.SQL.Add('WHERE');
              Dm1.ConsSql.SQL.Add('NUMCON = :NUMCON');
              Dm1.ConsSql.ParamByName('NUMCON').Value := DmFireRep.CadE120PedNUMCON.Value;
              Dm1.ConsSql.ExecSQL;

              Dm1.ConsSql.Close;
              Dm1.ConsSql.SQL.Clear;
              Dm1.ConsSql.SQL.Add('DELETE FROM E120PED');
              Dm1.ConsSql.SQL.Add('WHERE');
              Dm1.ConsSql.SQL.Add('NUMCON = :NUMCON');
              Dm1.ConsSql.ParamByName('NUMCON').Value := DmFireRep.CadE120PedNUMCON.Value;
              Dm1.ConsSql.ExecSQL;

              Dm1.IBDTransacao.CommitRetaining;
            end;
         Dm1.ConsE120PedAgdConf.Next;
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

end;

procedure TFAtualiza.BAtualizaClick(Sender: TObject);
var arqDatAtu : TextFile;
    ArqIni : TIniFile;
    vaHost,vaUsuario,vaSenha,dir,Nome,destino : string;
    vbEnviado : boolean;
begin

    try
      //conecta com o banco
      DmFireRep.Banco.Connected := False;
      DmFireRep.Banco.DatabaseName := FPrincipal.vaCaminhoBancoWeb;
      DmFireRep.Banco.Connected := True;
    except
       Application.MessageBox('Não foi possível conectar com WebService, verifique sua conexão com a internet!!','Atenção', MB_ICONWARNING+MB_OK);
       StatusBar1.Panels[0].Text := 'Erro ao conectar com WebService';
       Abort;
    end;
    StatusBar1.Panels[0].Text := 'Sistema Conectado!';

    try
      //conecta com o banco oracle
      DmOra := TDmOra.Create(Self);
      DmOra.Banco.Connected := True;
    except
       Application.MessageBox('Não foi possível conectar com WebService Oracle, verifique sua conexão com a internet!!','Atenção', MB_ICONWARNING+MB_OK);
       StatusBar1.Panels[0].Text := 'Erro ao conectar com WebService Oracle';
       Abort;
    end;

       LStatus.Caption := 'Aguarde, Atualizando a Base...';
       BAtualiza.Enabled := false;
       StatusClientes.Progress := 0;
       StatusCondPgto.Progress := 0;
       statusProdutos.Progress := 0;
       statusTabPreco.Progress := 0;
       statusPedidos.Progress := 0;
       statusTitulos.Progress := 0;


           LStatus.Caption := 'Aguarde, Atualizando Clientes..';
            Application.ProcessMessages;
        if ChClientes.Checked then
           btnBAtuclientes_.Click;
           Application.ProcessMessages;

           LStatus.Caption := 'Aguarde, Atualizando Produtos..';
           Application.ProcessMessages;
        if ChProdutos.Checked then
           btnProdutosOracle.Click;
           Application.ProcessMessages;

           LStatus.Caption := 'Aguarde, Atualizando Cond.Pgto...';
           Application.ProcessMessages;
        if ChCondPgto.Checked then
           btnBCondCpg_.Click;
           Application.ProcessMessages;

           LStatus.Caption := 'Aguarde, Atualizando Tab. Preço..';
           Application.ProcessMessages;
        if ChTabPreco.Checked then
           btnBTabPreco_.Click;
           Application.ProcessMessages;

           LStatus.Caption := 'Aguarde, Atualizando Pedidos..';
           Application.ProcessMessages;
        if ChPedidos.Checked then
            btnPedidos.Click;
            Application.ProcessMessages;

           LStatus.Caption := 'Aguarde, Atualizando Títulos..';
           Application.ProcessMessages;
        if ChTitulos.Checked then
           btnBTitulos_.Click;
           Application.ProcessMessages;

        //GRAVA DATA E HORA DA ATUALIZAÇÃO
        DmFireRep.CadAtu_Realizado.Open;
        DmFireRep.CadAtu_Realizado.Insert;
        DmFireRep.CadAtu_RealizadoDATATU.Value := DATE;
        DmFireRep.CadAtu_RealizadoHORATU.Value := Time;
        DmFireRep.CadAtu_RealizadoCODUSU.Value := FPrincipal.vnCodusu;
        DmFireRep.CadAtu_RealizadoCODREP.Value := FPrincipal.vnCodRep;
        DmFireRep.CadAtu_RealizadoVERSAO.Value := FPrincipal.vaVersaoExe;
        DmFireRep.CadAtu_Realizado.Post;
        DmFireRep.ibtTransacao.CommitRetaining;

        //GRAVA DATA E HORA ATUALIZAÇÃO LOCAL
        Dm1.CadE100Atu.Open;
        Dm1.CadE100Atu.Insert;
        Dm1.CadE100AtuDATATU.AsDateTime := Date;
        Dm1.CadE100AtuHORATU.AsDateTime := Time;
        Dm1.CadE100AtuVERSIS.AsString := FPrincipal.vaVersaoExe;

        Dm1.ConsSql.Close;
        Dm1.ConsSql.SQL.Clear;
        Dm1.ConsSql.SQL.Add('SELECT MAX(IDATU) AS IDATU FROM E100ATU');
        Dm1.ConsSql.Open;
        if not Dm1.ConsSql.IsEmpty then
           begin
              Dm1.CadE100AtuIDATU.AsInteger := Dm1.ConsSql.FieldByName('IDATU').AsInteger + 1
           end
        else
           begin
              Dm1.CadE100AtuIDATU.AsInteger := 1;
           end;

        Dm1.CadE100Atu.Post;
        Dm1.IBDTransacao.CommitRetaining;

        //envia um arquivo com a data e hora da atualizãçao
        {AssignFile ( arqDatAtu,'C:\SysRep\ArqFtp\ArqAtu\'+ IntToStr(FPrincipal.vnCodusu)+'_'+'DATATU.txt');
        Rewrite ( arqDatAtu );

        Write(arqDatAtu, FormatDateTime('DD/MM/YYYY',date)+';');
        Write(arqDatAtu, TimeToStr(time)+';');
        Write(arqDatAtu, FPrincipal.vaVersaoExe+';');
        CloseFile(arqDatAtu);
        //se nao existir chama a tela de atualização
        if not FileExists('C:\SysRep\conf\conf.ini') then
         begin
          raise Exception.Create('Arquivo de configuração para conexção não encontrado!')
         end
        else
          begin//7
                 //le o arquivo para carregar as configuraçoes
                  ArqIni := TIniFile.Create('C:\SysRep\conf\conf.ini');
                   vaHost := ArqIni.ReadString('FTP', 'HOST',vaHost);
                   vaUsuario := ArqIni.ReadString('FTP', 'USUARIO',vaUsuario);
                   vaSenha := ArqIni.ReadString('FTP', 'SENHA',vaSenha);

             //faz a conexao com o servidor
             if not ftp.Connected then
                begin//8
                  Ftp.Disconnect;
                  ftp.Host:= vaHost;
                  Ftp.Username:= vaUsuario;
                  ftp.Password:= vaSenha;
                    try
                      Ftp.Connect;
                     Except
                        MessageDlg('Erro na conexção',mtWarning,[mbok],0);
                     end;
                end;//8

                if ftp.Connected then
                begin//9
                    try
                      dir := '/ArqAtu/';
                      ftp.ChangeDir(dir);
                      Nome := IntToStr(FPrincipal.vnCodusu)+'_DATATU.txt'; //nome do arquivo
                      destino := 'C:\SysRep\ArqFtp\ArqAtu\';
                      destino := destino + nome;
                      if FileExists(destino) then
                         begin
                           ftp.Put(destino, nome, true);
                           DeleteFile(destino);
                         end;

                      vbEnviado := true;
                     Except
                        vbEnviado := false;
                        MessageDlg('Erro no envio do arquivo Data/Hora!',mtWarning,[mbok],0);
                     end;
                end;//9

          end;//7 }
        LStatus.Caption := '';
        BAtualiza.Enabled := True;
        StatusBar1.Panels[1].Text := 'Atualização concluída com sucesso!!';
        DmFireRep.Banco.Connected := False;

        //desconecta com o banco oracle
        DmOra.Banco.Connected := False;
        FreeAndNil(DmOra);

        if vaAtualizar = 'S' then//se esta s é pq a tela de atualização foi chamada automaticamente
           begin
             Close;
           end
        else
           begin
             MessageDlg('Atualização concluída com sucesso!',mtInformation,[mbok],0);
           end;



end;

procedure TFAtualiza.EdHostExit(Sender: TObject);
var ArqIni : TIniFile;
begin
{if trim(EdHost.Text) <> '' then
   begin
      ArqIni := TIniFile.Create('C:\SysRep\conf\conf.ini');
      ArqIni.WriteString('FTP', 'HOST', trim(EdHost.Text));
   end;  }
end;

procedure TFAtualiza.EdSenhaExit(Sender: TObject);
var ArqIni : TIniFile;
begin
{if trim(EdUsuario.Text) <> '' then
   begin
      ArqIni := TIniFile.Create('C:\SysRep\conf\conf.ini');
      ArqIni.WriteString('FTP', 'SENHA', trim(EdUsuario.Text));
   end;}

end;

procedure TFAtualiza.EdUsuarioExit(Sender: TObject);
var ArqIni : TIniFile;
begin
{if trim(EdUsuario.Text) <> '' then
   begin
      ArqIni := TIniFile.Create('C:\SysRep\conf\conf.ini');
      ArqIni.WriteString('FTP', 'USUARIO', trim(EdUsuario.Text));
   end; }

end;

procedure TFAtualiza.FormShow(Sender: TObject);
var ArqIni : TIniFile;
begin
  StatusBar1.Panels[0].Text := '';
  //se nao existir cria o arquivo de configuracao ftp
 { if not FileExists('C:\SysRep\conf\conf.ini') then
   begin
     ArqIni := TIniFile.Create('C:\SysRep\conf\conf.ini');
     ArqIni.WriteString('FTP', 'HOST', '192.168.10.44');
     ArqIni.WriteString('FTP', 'USUARIO', 'sysven');
     ArqIni.WriteString('FTP', 'SENHA', 'liderlar');
     ArqIni.Free;
   end;

  //le o arquivo para carregar as configuraçoes
  ArqIni := TIniFile.Create('C:\SysRep\conf\conf.ini');
         vaHost := ArqIni.ReadString('FTP', 'HOST',vaHost);
         vaUsuario := ArqIni.ReadString('FTP', 'USUARIO',vaUsuario);
         vaSenha := ArqIni.ReadString('FTP', 'SENHA',vaSenha);}

   StatusBar1.Panels[1].Text := '';

   if vaAtualizar = 'S' then
      begin
        tmr1.Enabled := True;
      end;

end;

procedure TFAtualiza.FtpDisconnected(Sender: TObject);
begin
StatusBar1.Panels[0].Text := 'Sistema Desconectado!';
end;

procedure TFAtualiza.FtpStatus(ASender: TObject; const AStatus: TIdStatus;
  const AStatusText: string);
begin
{case aStatus of
   hsResolving : statusbar1.Panels[0].text:='Resolvendo..';
   hsConnecting : statusbar1.Panels[0].text:='Conectando..';
   hsConnected : statusbar1.Panels[0].text:='Conectado ao Servidor FTP! Aguarde..';
   hsDisconnecting : statusbar1.Panels[0].text:='Desconectando..';
   hsDisconnected : begin
                        statusbar1.Panels[0].text:='Desconectado!';
                    end;
   ftpTransfer : statusbar1.Panels[0].text:='Transferindo..';
   ftpReady : statusbar1.Panels[0].text:='Lendo...';
   ftpAborted : statusbar1.Panels[0].text:='Abortado!';
   else
     statusbar1.Panels[0].text:= AStatusText;
  end;//fim do case }
end;

procedure TFAtualiza.tmr1Timer(Sender: TObject);
begin
  tmr1.Enabled := False;
  BAtualiza.Click;
end;

end.
