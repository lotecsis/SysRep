unit UConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Keyboard, StdCtrls, IdExplicitTLSClientServerBase, IdFTP,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Buttons,
  ExtCtrls,IniFiles, DB, IBCustomDataSet, IBQuery;

type
  TFConfig = class(TForm)
    IdHTTP1: TIdHTTP;
    Ftp: TIdFTP;
    Panel2: TPanel;
    Label4: TLabel;
    EdChave: TEdit;
    EdUsuarioLogin: TEdit;
    EdSenhaLogin: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    EdDatCad: TEdit;
    EdSitUsu: TEdit;
    EdCodUsu: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    LNomUsu: TLabel;
    Label12: TLabel;
    LDesRep: TLabel;
    btnLimparBase: TBitBtn;
    btnBAtualizar: TBitBtn;
    edtNumPedIni: TEdit;
    edtNumPedFim: TEdit;
    edtNumPedAtu: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure EdHostExit(Sender: TObject);
    procedure EdUsuarioExit(Sender: TObject);
    procedure btnBAtualizarClick(Sender: TObject);
    procedure EdSenhaExit(Sender: TObject);
    procedure btnLimparBaseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConfig: TFConfig;

implementation

uses UDm1, UDmFireRep, UPrincipal;

{$R *.dfm}

procedure TFConfig.btnBAtualizarClick(Sender: TObject);
var dir,nome,destino : string;
    linha : string;
    vaCodUsu,vaLogUsu,vaSenUsu,vaDatCad,vaSitUsu,vaChave,vaNomUsu,vaCodRep,vaNomRep,vaAtuUsu,vaUsuAdm : string;
    arq : TextFile;
    I : integer;
    vaCaracter : string;
begin

  if trim(EdChave.Text) = '' then
     begin
       MessageDlg('Informe o numero de chave',mtWarning,[mbok],0);
       ActiveControl := EdChave;
     end
  else
    begin

        try
          //conecta com o banco
          DmFireRep.Banco.DatabaseName := FPrincipal.vaCaminhoBancoWeb;
          DmFireRep.Banco.Connected := True;
        except
           Application.MessageBox('Não foi possível conectar com WebService, verifique sua conexão com a internet!!','Atenção', MB_ICONWARNING+MB_OK);
           Abort;
        end;

         DmFireRep.ConsE100usu.Close;
         DmFireRep.ConsE100usu.ParamByName('CHAVE').Value := EdChave.Text;
         DmFireRep.ConsE100usu.Open;
         if DmFireRep.ConsE100usu.IsEmpty then
            begin
               Application.MessageBox('Não foi encontrado usuário com esta chave!','Atenção', MB_ICONWARNING+MB_OK);
               Abort;
            end;

         EdCodUsu.Text := IntToStr(DmFireRep.ConsE100usuCODUSU.AsInteger);
         EdUsuarioLogin.Text := DmFireRep.ConsE100usuLOGUSU.Value;
         EdSenhaLogin.Text := DmFireRep.ConsE100usuSENUSU.Value;
         EdDatCad.Text := DateToStr(DmFireRep.ConsE100usuDATCAD.AsDateTime);
         EdChave.Text := DmFireRep.ConsE100usuCHAVE.Value;
         LNomUsu.Caption := DmFireRep.ConsE100usuNOMUSU.Value;
         LDesRep.Caption := IntToStr(DmFireRep.ConsE100usuCODREP.AsInteger)+ ' - ' + DmFireRep.ConsE100usuNOMREP.Value;
         vaSitUsu := DmFireRep.ConsE100usuSITUSU.Value;
         if vaSitUsu = 'A' then
            EdSitUsu.Text := 'Ativo'
         else if vaSitUsu = 'I' then
                 EdSitUsu.Text := 'Inativo';

         edtNumPedIni.Text := IntToStr(DmFireRep.ConsE100usuNCIE.Value);
         edtNumPedFim.Text := IntToStr(DmFireRep.ConsE100usuNCFE.Value);
         edtNumPedAtu.Text := IntToStr(DmFireRep.ConsE100usuNCAE.Value);

         //grava no banco
         Dm1.CadE100Usu.Close;
         Dm1.CadE100Usu.ParamByName('codusu').Value := DmFireRep.ConsE100usuCODUSU.Value;
         Dm1.CadE100Usu.Open;
         if Dm1.CadE100Usu.IsEmpty then
           begin//3
             Dm1.CadE100Usu.Insert;
             Dm1.CadE100UsuCODUSU.Value := DmFireRep.ConsE100usuCODUSU.Value;
             Dm1.CadE100UsuLOGUSU.Value := DmFireRep.ConsE100usuLOGUSU.Value;
             Dm1.CadE100UsuSENUSU.Value := DmFireRep.ConsE100usuSENUSU.Value;
             Dm1.CadE100UsuDATCAD.Value := DmFireRep.ConsE100usuDATCAD.Value;
             Dm1.CadE100UsuSITUSU.Value := DmFireRep.ConsE100usuSITUSU.Value;
             Dm1.CadE100UsuCHAVE.Value := DmFireRep.ConsE100usuCHAVE.Value;
             Dm1.CadE100UsuNOMUSU.Value := DmFireRep.ConsE100usuNOMUSU.Value;
             Dm1.CadE100UsuCODREP.Value := DmFireRep.ConsE100usuCODREP.Value;
             Dm1.CadE100UsuNOMREP.Value := DmFireRep.ConsE100usuNOMREP.Value;

             Dm1.CadE100UsuNUMPEDINI.Value := DmFireRep.ConsE100usuNCIE.Value;
             Dm1.CadE100UsuNUMPEDFIM.Value := DmFireRep.ConsE100usuNCFE.Value;
             Dm1.CadE100UsuNUMPEDATU.Value := DmFireRep.ConsE100usuNCAE.Value;
             Dm1.CadE100UsuNUMFAIXA.Value := 0;

             Dm1.CadE100Usu.Post;
             Dm1.IBDTransacao.Commit;
           end//3
         else
           begin//4
             Dm1.CadE100Usu.Edit;
             Dm1.CadE100UsuLOGUSU.Value := DmFireRep.ConsE100usuLOGUSU.Value;
             Dm1.CadE100UsuSENUSU.Value := DmFireRep.ConsE100usuSENUSU.Value;
             Dm1.CadE100UsuDATCAD.Value := DmFireRep.ConsE100usuDATCAD.Value;
             Dm1.CadE100UsuSITUSU.Value := DmFireRep.ConsE100usuSITUSU.Value;
             Dm1.CadE100UsuCHAVE.Value := DmFireRep.ConsE100usuCHAVE.Value;
             Dm1.CadE100UsuNOMUSU.Value := DmFireRep.ConsE100usuNOMUSU.Value;
             Dm1.CadE100UsuCODREP.Value := DmFireRep.ConsE100usuCODREP.Value;
             Dm1.CadE100UsuNOMREP.Value := DmFireRep.ConsE100usuNOMREP.Value;

             Dm1.CadE100UsuNUMPEDINI.Value := DmFireRep.ConsE100usuNCIE.Value;
             Dm1.CadE100UsuNUMPEDFIM.Value := DmFireRep.ConsE100usuNCFE.Value;
             Dm1.CadE100UsuNUMPEDATU.Value := DmFireRep.ConsE100usuNCAE.Value;
             Dm1.CadE100UsuNUMFAIXA.Value := 0;

             Dm1.CadE100Usu.Post;
             Dm1.IBDTransacao.Commit;
           end;//4
           DmFireRep.Banco.Connected := False;
    end;//2



end;

procedure TFConfig.btnLimparBaseClick(Sender: TObject);
begin
if Application.MessageBox('Deseja realmente excluir o registro?','Confirmação',MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2) = mrYes then
  begin
    Dm1.ConsSql.Close;
    Dm1.ConsSql.SQL.Clear;
    Dm1.ConsSql.SQL.Add('delete from e028cpg');
    Dm1.ConsSql.ExecSQL;

    Dm1.ConsSql.Close;
    Dm1.ConsSql.SQL.Clear;
    Dm1.ConsSql.SQL.Add('delete from e075cor');
    Dm1.ConsSql.ExecSQL;

    Dm1.ConsSql.Close;
    Dm1.ConsSql.SQL.Clear;
    Dm1.ConsSql.SQL.Add('delete from e075der');
    Dm1.ConsSql.ExecSQL;

    Dm1.ConsSql.Close;
    Dm1.ConsSql.SQL.Clear;
    Dm1.ConsSql.SQL.Add('delete from e075ldc');
    Dm1.ConsSql.ExecSQL;

    Dm1.ConsSql.Close;
    Dm1.ConsSql.SQL.Clear;
    Dm1.ConsSql.SQL.Add('delete from e075pro');
    Dm1.ConsSql.ExecSQL;

    Dm1.ConsSql.Close;
    Dm1.ConsSql.SQL.Clear;
    Dm1.ConsSql.SQL.Add('delete from e081itp');
    Dm1.ConsSql.ExecSQL;

    Dm1.ConsSql.Close;
    Dm1.ConsSql.SQL.Clear;
    Dm1.ConsSql.SQL.Add('delete from e081tab');
    Dm1.ConsSql.ExecSQL;

    Dm1.ConsSql.Close;
    Dm1.ConsSql.SQL.Clear;
    Dm1.ConsSql.SQL.Add('delete from e085hcl');
    Dm1.ConsSql.ExecSQL;

    Dm1.ConsSql.Close;
    Dm1.ConsSql.SQL.Clear;
    Dm1.ConsSql.SQL.Add('delete from e085cli');
    Dm1.ConsSql.ExecSQL;

    Dm1.ConsSql.Close;
    Dm1.ConsSql.SQL.Clear;
    Dm1.ConsSql.SQL.Add('delete from e100sql');
    Dm1.ConsSql.ExecSQL;

    Dm1.ConsSql.Close;
    Dm1.ConsSql.SQL.Clear;
    Dm1.ConsSql.SQL.Add('delete from e120cgp');
    Dm1.ConsSql.ExecSQL;

    Dm1.ConsSql.Close;
    Dm1.ConsSql.SQL.Clear;
    Dm1.ConsSql.SQL.Add('delete from e120ipd');
    Dm1.ConsSql.ExecSQL;

    Dm1.ConsSql.Close;
    Dm1.ConsSql.SQL.Clear;
    Dm1.ConsSql.SQL.Add('delete from e120obs');
    Dm1.ConsSql.ExecSQL;

    Dm1.ConsSql.Close;
    Dm1.ConsSql.SQL.Clear;
    Dm1.ConsSql.SQL.Add('delete from e120ped');
    Dm1.ConsSql.ExecSQL;

    Dm1.ConsSql.Close;
    Dm1.ConsSql.SQL.Clear;
    Dm1.ConsSql.SQL.Add('delete from e301tcr');
    Dm1.ConsSql.ExecSQL;

    Dm1.ConsSql.Close;
    Dm1.ConsSql.SQL.Clear;
    Dm1.ConsSql.SQL.Add('delete from usu120ipd');
    Dm1.ConsSql.ExecSQL;

    Dm1.ConsSql.Close;
    Dm1.ConsSql.SQL.Clear;
    Dm1.ConsSql.SQL.Add('delete from e100usu');
    Dm1.ConsSql.ExecSQL;

    Dm1.ConsSql.Close;
    Dm1.ConsSql.SQL.Clear;
    Dm1.ConsSql.SQL.Add('delete from e100atu');
    Dm1.ConsSql.ExecSQL;

    Dm1.IBDTransacao.CommitRetaining;

    FConfig.FormShow(Sender);
  end;
end;

procedure TFConfig.EdHostExit(Sender: TObject);
var ArqIni : TIniFile;
begin


end;

procedure TFConfig.EdSenhaExit(Sender: TObject);
var ArqIni : TIniFile;
begin


end;

procedure TFConfig.EdUsuarioExit(Sender: TObject);
var ArqIni : TIniFile;
begin


end;

procedure TFConfig.FormShow(Sender: TObject);
var ArqIni : TIniFile;
    vaHost, vaUsuario, vaSenha : string;
    vaCaminhoBanco : string;
begin


  //se nao existir cria o arquivo de configuracao ftp
  if not FileExists('C:\SysRep\conf\conf.ini') then
   begin
      Application.MessageBox('Não foi encontrado o arquivo de configuração, entre em contato com o suporte','Aviso',MB_ICONWARNING+MB_OK);
      Application.Terminate;
     {ArqIni := TIniFile.Create('C:\SysRep\conf\conf.ini');
     ArqIni.WriteString('FTP', 'HOST', '192.168.10.44');
     ArqIni.Free;}
   end;

  //le o arquivo para carregar as configuraçoes
  ArqIni := TIniFile.Create('C:\SysRep\conf\conf.ini');
         vaHost := ArqIni.ReadString('FTP', 'HOST',vaHost);
         vaUsuario := ArqIni.ReadString('FTP', 'USUARIO',vaUsuario);
         vaSenha := ArqIni.ReadString('FTP', 'SENHA',vaSenha);
         vaCaminhoBanco := ArqIni.ReadString('CAMINHO_BANCO_WEB','CAMINHO',vaCaminhoBanco);
         FPrincipal.vaCaminhoBancoWeb := vaCaminhoBanco;


   //consulta se existe usuario cadastrado
   Dm1.ConsE100Usu.Close;
   Dm1.ConsE100Usu.SQL.Clear;
   Dm1.ConsE100Usu.SQL.Add('select E100USU.* from E100USU');
   Dm1.ConsE100Usu.Open;
   if not Dm1.ConsE100Usu.IsEmpty then
      begin
        EdUsuarioLogin.Text := Dm1.ConsE100UsuLOGUSU.Value;
        EdSenhaLogin.Text := Dm1.ConsE100UsuSENUSU.Value;
        EdChave.Text := Dm1.ConsE100UsuCHAVE.Value;
        EdCodUsu.Text := IntToStr(Dm1.ConsE100UsuCODUSU.Value);
        EdDatCad.Text := DateToStr(Dm1.ConsE100UsuDATCAD.Value);
        LNomUsu.Caption := Dm1.ConsE100UsuNOMUSU.Value;
        LDesRep.Caption := IntToStr(Dm1.ConsE100UsuCODREP.Value) + ' - '+Dm1.ConsE100UsuNOMREP.Value;
        if Dm1.ConsE100UsuSITUSU.Value = 'A' then
           EdSitUsu.Text := 'Ativo'
        else if Dm1.ConsE100UsuSITUSU.Value = 'I' then
                  EdSitUsu.Text := 'I';

        edtNumPedIni.Text := IntToStr(Dm1.ConsE100UsuNUMPEDINI.AsInteger);
        edtNumPedFim.Text := IntToStr(Dm1.ConsE100UsuNUMPEDFIM.AsInteger);
        edtNumPedAtu.Text := IntToStr(Dm1.ConsE100UsuNUMPEDATU.AsInteger);

      end;

end;

end.
