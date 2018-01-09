unit UConsCoresProdPed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB;

type
  TFConsCoresProdPed = class(TForm)
    DBGrid1: TDBGrid;
    BOk: TBitBtn;
    DsConsE075Ldc: TDataSource;
    EdPesquisa: TEdit;
    procedure FormShow(Sender: TObject);
    procedure EdPesquisaChange(Sender: TObject);
    procedure BOkClick(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure EdPesquisaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    vaCampo : string;
  end;

var
  FConsCoresProdPed: TFConsCoresProdPed;

implementation

uses UDm1, UAddProdPed, UAddCorProdPed;

{$R *.dfm}

procedure TFConsCoresProdPed.BOkClick(Sender: TObject);
begin
    if vaCampo = '1' then
       begin
         FAddCorProdPed.EdCor001.Text := Dm1.ConsE075LdcCODTEC.AsString;
         Close;
       end
    else if vaCampo = '2' then
            begin
              FAddCorProdPed.EdCor002.Text := Dm1.ConsE075LdcCODTEC.AsString;
              Close;
            end;
end;

procedure TFConsCoresProdPed.DBGrid1Enter(Sender: TObject);
begin
KeyPreview := false;
end;

procedure TFConsCoresProdPed.DBGrid1Exit(Sender: TObject);
begin
KeyPreview := true;
end;

procedure TFConsCoresProdPed.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
     begin
       BOk.Click;
     end;
end;

procedure TFConsCoresProdPed.EdPesquisaChange(Sender: TObject);
begin
      Dm1.ConsE075Ldc.Close;
      Dm1.ConsE075Ldc.SQL.Clear;
      Dm1.ConsE075Ldc.SQL.Add('select * from e075ldc where codemp = 1 and');
      Dm1.ConsE075Ldc.SQL.Add(' codpro = :codpro and');
      Dm1.ConsE075Ldc.SQL.Add(' codder = :codder and');
      Dm1.ConsE075Ldc.SQL.Add(' codtec like'+QuotedStr('%'+EdPesquisa.Text+'%'));
      Dm1.ConsE075Ldc.SQL.Add(' order by codtec asc');
      Dm1.ConsE075Ldc.ParamByName('codpro').Value := trim(FAddProdPed.EdCodPro.Text);
      Dm1.ConsE075Ldc.ParamByName('codder').Value := trim(FAddProdPed.EdCodDer.Text);
      Dm1.ConsE075Ldc.Open;
end;

procedure TFConsCoresProdPed.EdPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
     begin
       BOk.Click;
     end;
end;

procedure TFConsCoresProdPed.FormShow(Sender: TObject);
begin
    ActiveControl := EdPesquisa;
end;

end.
