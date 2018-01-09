unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls, Mask,IniFiles;

type
  TFLogin = class(TForm)
    Image1: TImage;
    Label3: TLabel;
    Label1: TLabel;
    EdLogin: TEdit;
    Label2: TLabel;
    BEntrar: TBitBtn;
    BCancela: TBitBtn;
    EdSenha: TEdit;
    LVersao: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BCancelaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BEntrarClick(Sender: TObject);
    procedure EdLoginExit(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    vaVersaoExe : string;
    fechar : boolean;
    Function VersaoExe: String;
  end;

var
  FLogin: TFLogin;

implementation

uses UDm1, UConfig, UPrincipal;

{$R *.dfm}

Function TFLogin.VersaoExe: String;  //funçao para pegar a versao do executavel
type
PFFI = ^vs_FixedFileInfo;
var
F : PFFI;
Handle : Dword;
Len : Longint;
Data : Pchar;
Buffer : Pointer;
Tamanho : Dword;
Parquivo: Pchar;
Arquivo : String;
begin
Arquivo := Application.ExeName;
Parquivo := StrAlloc(Length(Arquivo) + 1);
StrPcopy(Parquivo, Arquivo);
Len := GetFileVersionInfoSize(Parquivo, Handle);
Result := '';
if Len > 0 then
begin
Data:=StrAlloc(Len+1);
if GetFileVersionInfo(Parquivo,Handle,Len,Data) then
begin
VerQueryValue(Data, '\',Buffer,Tamanho);
F := PFFI(Buffer);
Result := Format('%d.%d.%d.%d',
[HiWord(F^.dwFileVersionMs),
LoWord(F^.dwFileVersionMs),
HiWord(F^.dwFileVersionLs),
Loword(F^.dwFileVersionLs)]
);
end;
StrDispose(Data);
end;
StrDispose(Parquivo);
end;

procedure TFLogin.BCancelaClick(Sender: TObject);
begin
  fechar := true;
  Application.Terminate;
end;

procedure TFLogin.BEntrarClick(Sender: TObject);
begin
if EdLogin.Text = '' then
    begin
      MessageDlg('Informe o Login.',mtWarning,[mbok],0);
      ActiveControl := EdLogin;
    end
  else
  if EdSenha.Text = '' then
    begin
      MessageDlg('Informe a Senha.',mtWarning,[mbok],0);
      ActiveControl := EdSenha;
    end
  else
   if (trim(EdLogin.Text) = 'CONFIG') and (trim(EdSenha.Text) = 'config')then
      begin
        //chama a tela de configuraçoes
        FConfig := TFConfig.Create(Self);
        FConfig.ShowModal;
        FreeAndNil(FConfig);
      end
   else
    begin//1
            Dm1.ConsE100Usu.Close;
            Dm1.ConsE100Usu.SQL.Clear;
            Dm1.ConsE100Usu.SQL.Add('select E100USU.* from E100USU');
            Dm1.ConsE100Usu.SQL.Add(' where logusu = :logusu and');
            Dm1.ConsE100Usu.SQL.Add(' senusu = :senusu');
            Dm1.ConsE100Usu.ParamByName('logusu').Value := trim(EdLogin.Text);
            Dm1.ConsE100Usu.ParamByName('senusu').Value := trim(EdSenha.Text);
            Dm1.ConsE100Usu.Open;
            if Dm1.ConsE100Usu.IsEmpty then
               begin//4
                  MessageDlg('Login ou senha inválido',mtWarning,[mbok],0);
                  ActiveControl := EdLogin;
               end//4
            else
               begin//5
                  if Dm1.ConsE100UsuSITUSU.Value = 'I' then
                     begin
                       MessageDlg('Usuario está inativo!',mtWarning,[mbok],0);
                       ActiveControl := EdLogin;
                     end
                  else
                    begin
                      FPrincipal.vnCodRep := Dm1.ConsE100UsuCODREP.Value;
                      FPrincipal.vnCodusu := Dm1.ConsE100UsuCODUSU.Value;
                      FPrincipal.vaVersaoExe := vaVersaoExe;
                      FPrincipal.StatusBar1.Panels[4].Text := 'Versão: '+ vaVersaoExe;
                      fechar := true;
                      Close;
                    end;
               end;//5
    end;//1

end;

procedure TFLogin.EdLoginExit(Sender: TObject);
var ArqIni : TInifile;
begin
      ArqIni := TIniFile.Create('C:\SysRep\conf\conf.ini');
      ArqIni.WriteString('TELA_LOGIN','LOGIN',trim(EdLogin.Text));
      ArqIni.Free;
end;

procedure TFLogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if fechar = false then
  begin
    CanClose := False;
  end
else
  begin
     CanClose := true;
  end;
end;

procedure TFLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = VK_UP then
    SelectNext(ActiveControl,false,true);
  if key = VK_DOWN then
    SelectNext(ActiveControl, true, true);
end;

procedure TFLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
    begin
      key := #0;
      Perform (Wm_NextDlgCtl,0,0);
    end;
end;

procedure TFLogin.FormShow(Sender: TObject);
var ArqIni : TInifile;
    vaLogin : string;
    vaCaminhoBanco : string;
begin

  fechar := false;
  vaVersaoExe := VersaoExe;
  LVersao.Caption := 'VERSÃO: '+vaVersaoExe;

  //consulta se existe registro na tabela de usuario
      Dm1.ConsE100Usu.Close;
      Dm1.ConsE100Usu.SQL.Clear;
      Dm1.ConsE100Usu.SQL.Add('select E100USU.* from E100USU');
      Dm1.ConsE100Usu.Open;
      if Dm1.ConsE100Usu.IsEmpty then
         begin
            //chama a tela de configuraçoes
            FConfig := TFConfig.Create(Self);
            FConfig.ShowModal;
            FreeAndNil(FConfig);
         end
      else
         begin
            //le o arquivo para carregar o login
            if FileExists('C:\SysRep\conf\conf.ini') then
               begin
                  ArqIni := TIniFile.Create('C:\SysRep\conf\conf.ini');
                  vaLogin := ArqIni.ReadString('TELA_LOGIN','LOGIN',vaLogin);
                  vaCaminhoBanco := ArqIni.ReadString('CAMINHO_BANCO_WEB','CAMINHO',vaCaminhoBanco);
                  FPrincipal.vaCaminhoBancoWeb := vaCaminhoBanco;
                  ArqIni.Free;

                  EdLogin.Text := vaLogin;
               end
            else
               begin
                 Application.MessageBox('Não foi encontrado o arquivo de configuração, entre em contato com o suporte','Aviso',MB_ICONWARNING+MB_OK);
                 Application.Terminate;
               end;
         end;
end;

end.
