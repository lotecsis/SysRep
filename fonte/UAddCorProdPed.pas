unit UAddCorProdPed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, rxToolEdit, rxCurrEdit;

type
  TFAddCorProdPed = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LDsTipCmb: TLabel;
    EdTipCmb: TCurrencyEdit;
    EdCor001: TCurrencyEdit;
    EdCor002: TCurrencyEdit;
    EdQtdPed: TCurrencyEdit;
    BCor001: TBitBtn;
    BCor002: TBitBtn;
    BConfirma: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BConfirmaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BCor001Click(Sender: TObject);
    procedure BCor002Click(Sender: TObject);
    procedure EdCor001KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdCor002KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdCor001Exit(Sender: TObject);
    procedure EdCor002Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    vaStatus : string;
  end;

var
  FAddCorProdPed: TFAddCorProdPed;

implementation

uses UAddProdPed, UDm1, UConsCoresProdPed;

{$R *.dfm}

procedure TFAddCorProdPed.BConfirmaClick(Sender: TObject);
begin
if vaStatus = 'INSERINDO'  then
   begin//1
     if EdQtdPed.Value = 0 then
        begin
          Application.MessageBox('Quantidade pedida obrigatório','Aviso', MB_ICONWARNING+MB_OK);
          EdQtdPed.SetFocus;
        end
        else if EdTipCmb.Value = 0 then
                begin
                   Application.MessageBox('Tipo de combinação obrigatório','Aviso', MB_ICONWARNING+MB_OK);
                   EdTipCmb.SetFocus;
                end
                else if EdCor001.Value = 0 then
                        begin
                          Application.MessageBox('Cor 01 obrigatório','Aviso', MB_ICONWARNING+MB_OK);
                          EdCor001.SetFocus;
                        end
                        else if ((EdTipCmb.Value = 2) or (EdTipCmb.Value = 3)) and (EdCor002.Value = 0) then
                               begin
                                 Application.MessageBox('Para o tipo de combinação informado a cor 02 é obrigatório','Aviso', MB_ICONWARNING+MB_OK);
                                 EdCor002.SetFocus;
                               end
                               else if (EdTipCmb.Value = 1) and (EdCor002.Value <> 0) then
                                    begin
                                      Application.MessageBox('Para o tipo de combinação informado só é possível usar a cor 01','Aviso', MB_ICONWARNING+MB_OK);
                                      EdCor002.Clear;
                                      EdCor002.SetFocus;
                                    end
                                 else
                                    begin//3

                                       { FAddProdPed.ClientUsu120IpdCODEMP.Value := FAddProdPed.vnCodEmp;
                                        FAddProdPed.ClientUsu120IpdCODFIL.Value := FAddProdPed.vnCodFil;
                                        FAddProdPed.ClientUsu120IpdNUMCON.Value := FAddProdPed.vnNumCon;
                                        FAddProdPed.ClientUsu120IpdCODREP.Value := Dm1.ValidaE085CliCODREP.Value;
                                        FAddProdPed.ClientUsu120IpdSEQIPD.Value := Dm1.CadE120IpdSEQIPD.Value;
                                        FAddProdPed.ClientUsu120IpdTIPCMB.Value := EdTipCmb.AsInteger;
                                        FAddProdPed.ClientUsu120IpdCOR001.Value := IntToStr(EdCor001.AsInteger);
                                        FAddProdPed.ClientUsu120IpdCOR002.Value := IntToStr(EdCor002.AsInteger);
                                        FAddProdPed.ClientUsu120IpdQTDCOR.Value := EdQtdPed.AsInteger;
                                        FAddProdPed.ClientUsu120IpdQTDABE.Value := EdQtdPed.AsInteger;
                                        FAddProdPed.ClientUsu120IpdQTDCAN.Value := 0;
                                        FAddProdPed.ClientUsu120IpdCODPRO.Value := FAddProdPed.EdCodPro.Text;
                                        FAddProdPed.ClientUsu120IpdCODDER.Value := FAddProdPed.EdCodDer.Text;
                                        FAddProdPed.ClientUsu120Ipd.Post;}
                                        vaStatus := 'CONFIRMADO';
                                        Close;
                                    end;//3

   end//1
else
 if vaStatus = 'ALTERANDO' then
    begin//2
      { FAddProdPed.ClientUsu120IpdQTDCOR.Value := EdQtdPed.AsInteger;
       FAddProdPed.ClientUsu120IpdQTDABE.Value := FAddProdPed.ClientUsu120IpdQTDCOR.Value - FAddProdPed.ClientUsu120IpdQTDCAN.Value;
       FAddProdPed.ClientUsu120Ipd.Post;
       vaStatus := 'CONFIRMADO';
       Close; }
    end;//2

end;

procedure TFAddCorProdPed.BCor001Click(Sender: TObject);
begin
      Dm1.ConsE075Ldc.Close;
      Dm1.ConsE075Ldc.SQL.Clear;
      Dm1.ConsE075Ldc.SQL.Add('select * from e075ldc where codemp = 1 and');
      Dm1.ConsE075Ldc.SQL.Add('codpro = :codpro and');
      Dm1.ConsE075Ldc.SQL.Add('codder = :codder');
      Dm1.ConsE075Ldc.SQL.Add('order by codtec asc');
      Dm1.ConsE075Ldc.ParamByName('codpro').Value := trim(FAddProdPed.EdCodPro.Text);
      Dm1.ConsE075Ldc.ParamByName('codder').Value := trim(FAddProdPed.EdCodDer.Text);
      Dm1.ConsE075Ldc.Open;
      FConsCoresProdPed := TFConsCoresProdPed.Create(Self);
      FConsCoresProdPed.vaCampo := '1';
      FConsCoresProdPed.ShowModal;
      FreeAndNil(FConsCoresProdPed);
      ActiveControl := EdCor001;

end;

procedure TFAddCorProdPed.BCor002Click(Sender: TObject);
begin
      Dm1.ConsE075Ldc.Close;
      Dm1.ConsE075Ldc.SQL.Clear;
      Dm1.ConsE075Ldc.SQL.Add('select * from e075ldc where codemp = 1 and');
      Dm1.ConsE075Ldc.SQL.Add('codpro = :codpro and');
      Dm1.ConsE075Ldc.SQL.Add('codder = :codder');
      Dm1.ConsE075Ldc.SQL.Add('order by codtec asc');
      Dm1.ConsE075Ldc.ParamByName('codpro').Value := trim(FAddProdPed.EdCodPro.Text);
      Dm1.ConsE075Ldc.ParamByName('codder').Value := trim(FAddProdPed.EdCodDer.Text);
      Dm1.ConsE075Ldc.Open;
      FConsCoresProdPed := TFConsCoresProdPed.Create(Self);
      FConsCoresProdPed.vaCampo := '2';
      FConsCoresProdPed.ShowModal;
      FreeAndNil(FConsCoresProdPed);
      ActiveControl := EdCor002;
end;

procedure TFAddCorProdPed.EdCor001Exit(Sender: TObject);
begin
    if EdCor001.Value <> 0 then
       begin
         Dm1.ConsE075Ldc.Close;
         Dm1.ConsE075Ldc.SQL.Clear;
         Dm1.ConsE075Ldc.SQL.Add('select * from e075ldc where codemp = 1 and');
         Dm1.ConsE075Ldc.SQL.Add(' codpro = :codpro and');
         Dm1.ConsE075Ldc.SQL.Add(' codder = :codder and');
         Dm1.ConsE075Ldc.SQL.Add(' codtec = :codtec');
         Dm1.ConsE075Ldc.ParamByName('codpro').Value := trim(FAddProdPed.EdCodPro.Text);
         Dm1.ConsE075Ldc.ParamByName('codder').Value := trim(FAddProdPed.EdCodDer.Text);
         Dm1.ConsE075Ldc.ParamByName('codtec').Value := trim(EdCor001.Text);
         Dm1.ConsE075Ldc.Open;
         if Dm1.ConsE075Ldc.IsEmpty then
            begin
              MessageDlg('Cor não encontrada!',mtWarning,[mbOK],0);
              ActiveControl := EdCor001;
            end;
       end;
end;

procedure TFAddCorProdPed.EdCor001KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_f3 then
     begin
       BCor001.Click;
     end;
end;

procedure TFAddCorProdPed.EdCor002Exit(Sender: TObject);
begin
if EdCor002.Value <> 0 then
       begin
         Dm1.ConsE075Ldc.Close;
         Dm1.ConsE075Ldc.SQL.Clear;
         Dm1.ConsE075Ldc.SQL.Add('select * from e075ldc where codemp = 1 and');
         Dm1.ConsE075Ldc.SQL.Add(' codpro = :codpro and');
         Dm1.ConsE075Ldc.SQL.Add(' codder = :codder and');
         Dm1.ConsE075Ldc.SQL.Add(' codtec = :codtec');
         Dm1.ConsE075Ldc.ParamByName('codpro').Value := trim(FAddProdPed.EdCodPro.Text);
         Dm1.ConsE075Ldc.ParamByName('codder').Value := trim(FAddProdPed.EdCodDer.Text);
         Dm1.ConsE075Ldc.ParamByName('codtec').Value := trim(EdCor002.Text);
         Dm1.ConsE075Ldc.Open;
         if Dm1.ConsE075Ldc.IsEmpty then
            begin
              MessageDlg('Cor não encontrada!',mtWarning,[mbOK],0);
              ActiveControl := EdCor002;
            end;
       end;
end;

procedure TFAddCorProdPed.EdCor002KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_f3 then
     begin
       BCor002.Click;
     end;
end;

procedure TFAddCorProdPed.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    if vaStatus <> 'CONFIRMADO' then
       BEGIN
        // FAddProdPed.ClientUsu120Ipd.Cancel;
       END;
end;

procedure TFAddCorProdPed.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = VK_UP then
    SelectNext(ActiveControl,false,true);
  if key = VK_DOWN then
    SelectNext(ActiveControl, true, true);
end;

procedure TFAddCorProdPed.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
    begin
      key := #0;
      Perform (Wm_NextDlgCtl,0,0);
    end;

 if key = #27 then
    begin
      Close;
    end;
end;

procedure TFAddCorProdPed.FormShow(Sender: TObject);
begin
    if vaStatus = 'ALTERANDO' then
       begin//1
         EdTipCmb.Enabled := false;
         EdCor001.Enabled := false;
         EdCor002.Enabled := false;
         BCor001.Enabled := false;
         BCor002.Enabled := false;

       end;//1
end;

end.
