unit UObsPed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, DB;

type
  TFObsPed = class(TForm)
    EdSeqObs: TEdit;
    Label1: TLabel;
    EdObsPed: TMemo;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    BConfirma: TBitBtn;
    BNovo: TBitBtn;
    DsCadE120Obs: TDataSource;
    BAlterar: TBitBtn;
    DsConsE120Obs: TDataSource;
    procedure EdSeqObsKeyPress(Sender: TObject; var Key: Char);
    procedure DsCadE120ObsStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BConfirmaClick(Sender: TObject);
    procedure BNovoClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BAlterarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EdObsPedKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FObsPed: TFObsPed;

implementation

uses UDm1, UPrincipal;

{$R *.dfm}

procedure TFObsPed.BAlterarClick(Sender: TObject);
begin
    if (BConfirma.Enabled = false) and not (Dm1.CadE120Obs.IsEmpty) then
       begin//1
          if Dm1.ConsE120PedPEDENV.Value = 'S' then
             begin
                Application.MessageBox('O pedido já foi enviado e por isso não pode ser alterado observações!' +#13 +'Entre em contato com a empresa!','Aviso',MB_ICONWARNING+MB_OK);
             end
           else
             begin//2
                    Dm1.CadE120Obs.Edit;
             end;//2

       end;//1

end;

procedure TFObsPed.BConfirmaClick(Sender: TObject);
begin

if trim(EdObsPed.Text) = '' then
    begin
      Application.MessageBox('Informe a Observação!','Aviso',MB_ICONWARNING+MB_OK);
      ActiveControl := EdObsPed;
    end
else
  begin

    Dm1.CadE120ObsOBSPED.Value := trim(EdObsPed.Text);
    

    Dm1.CadE120Obs.Post;
    Dm1.IBDTransacao.CommitRetaining;

    Dm1.ConsE120Obs.Close;
    Dm1.ConsE120Obs.ParamByName('codemp').Value := Dm1.ConsE120PedCODEMP.Value;
    Dm1.ConsE120Obs.ParamByName('codfil').Value := Dm1.ConsE120PedCODFIL.Value;
    Dm1.ConsE120Obs.ParamByName('numcon').Value := Dm1.ConsE120PedNUMCON.Value;
    Dm1.ConsE120Obs.ParamByName('codrep').Value := Dm1.ConsE120PedCODREP.Value;
    Dm1.ConsE120Obs.Open;
  end;

end;

procedure TFObsPed.BNovoClick(Sender: TObject);
begin
if Dm1.ConsE120PedPEDENV.Value = 'S' then
   begin
      Application.MessageBox('O pedido já foi enviado e por isso não pode ser incluido observações!' +#13 +'Entre em contato com a empresa!','Aviso',MB_ICONWARNING+MB_OK);
   end
else
 begin//01

    Dm1.CadE120Obs.Open;
    Dm1.CadE120Obs.Insert;
    Dm1.CadE120ObsNUMPED.Value := 0;
    Dm1.CadE120ObsCODEMP.Value := Dm1.ConsE120PedCODEMP.Value;
    Dm1.CadE120ObsCODFIL.Value := Dm1.ConsE120PedCODFIL.Value;
    Dm1.CadE120ObsNUMCON.Value := Dm1.ConsE120PedNUMCON.Value;
    Dm1.CadE120ObsCODREP.Value := Dm1.ConsE120PedCODREP.Value;

    Dm1.E120ObsSeqObs.Close;
    Dm1.E120ObsSeqObs.ParamByName('codemp').Value := Dm1.ConsE120PedCODEMP.Value;
    Dm1.E120ObsSeqObs.ParamByName('codfil').Value := Dm1.ConsE120PedCODFIL.Value;
    Dm1.E120ObsSeqObs.ParamByName('numcon').Value := Dm1.ConsE120PedNUMCON.Value;
    Dm1.E120ObsSeqObs.ParamByName('codrep').Value := Dm1.ConsE120PedCODREP.Value;

    Dm1.E120ObsSeqObs.Open;
    if Dm1.E120ObsSeqObs.IsEmpty then
       Dm1.CadE120ObsSEQOBS.Value := 1
    else
       Dm1.CadE120ObsSEQOBS.Value := Dm1.E120ObsSeqObsULTIMO.Value + 1;

    EdSeqObs.Text := IntToStr(Dm1.CadE120ObsSEQOBS.Value);

    Dm1.CadE120ObsSITOBS.Value := 'G';
    Dm1.CadE120ObsOBSUSU.Value := FPrincipal.vnCodusu;
    Dm1.CadE120ObsOBSDAT.Value := date;

    EdSeqObs.Clear;
    EdObsPed.Clear;
    ActiveControl := EdObsPed;

 end;//01

end;

procedure TFObsPed.DBGrid1CellClick(Column: TColumn);
begin
    if (BConfirma.Enabled = false) and not (Dm1.ConsE120Obs.IsEmpty) then
       begin
         EdSeqObs.Text := IntToStr(Dm1.ConsE120ObsSEQOBS.Value);
         EdObsPed.Text := Dm1.ConsE120ObsOBSPED.Value;

         Dm1.CadE120Obs.Close;
         Dm1.CadE120Obs.ParamByName('codemp').Value := Dm1.ConsE120ObsCODEMP.Value;
         Dm1.CadE120Obs.ParamByName('codfil').Value := Dm1.ConsE120ObsCODFIL.Value;
         Dm1.CadE120Obs.ParamByName('numcon').Value := Dm1.ConsE120ObsNUMCON.Value;
         Dm1.CadE120Obs.ParamByName('seqobs').Value := Dm1.ConsE120ObsSEQOBS.Value;
         Dm1.CadE120Obs.ParamByName('codrep').Value := Dm1.ConsE120ObsCODREP.Value;
         Dm1.CadE120Obs.Open;

       end;

end;

procedure TFObsPed.DsCadE120ObsStateChange(Sender: TObject);
begin
    if Dm1.CadE120Obs.State in [dsinsert,dsedit] then
       begin
         BNovo.Enabled := false;
         BConfirma.Enabled := true;
         EdObsPed.ReadOnly := false;
         BAlterar.Enabled := false;
       end
    else
      begin
        BNovo.Enabled := true;
        BConfirma.Enabled := false;
        EdObsPed.ReadOnly := true;
        BAlterar.Enabled := true;
      end;

end;

procedure TFObsPed.EdObsPedKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
    key := #0;

if key = ';' then
   key := #0;
end;

procedure TFObsPed.EdSeqObsKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in [#48..#57]) and not (key in [#8])
      and not (key in [#240]) then
      key := #0;
end;

procedure TFObsPed.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
canClose := False;
with application do
 if Dm1.CadE120Obs.State in [dsinsert,dsedit] then
    begin
     if Application.MessageBox('Esta sendo incluido ou alterado um registro, se realmente sair sem gravar perdera oque foi feito, Deseja realmente sair','Confirmação',MB_ICONQUESTION+MB_YESNO) = mrYes then
        begin//1
           Dm1.CadE120Obs.Cancel;
           CanClose := true;
        end;//1
    end
  else
    CanClose := true;
end;

procedure TFObsPed.FormShow(Sender: TObject);
begin
    Dm1.CadE120Obs.Open;
    EdObsPed.Clear;

    Dm1.ConsE120Obs.Close;
    Dm1.ConsE120Obs.ParamByName('codemp').Value := Dm1.ConsE120PedCODEMP.Value;
    Dm1.ConsE120Obs.ParamByName('codfil').Value := Dm1.ConsE120PedCODFIL.Value;
    Dm1.ConsE120Obs.ParamByName('numcon').Value := Dm1.ConsE120PedNUMCON.Value;
    Dm1.ConsE120Obs.ParamByName('codrep').Value := Dm1.ConsE120PedCODREP.Value;
    Dm1.ConsE120Obs.Open;
end;

end.
