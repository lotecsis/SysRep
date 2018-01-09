unit UConsDerivacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, IBCustomDataSet, IBQuery;

type
  TFConsDerivacao = class(TForm)
    DBGrid1: TDBGrid;
    BSeleciona: TBitBtn;
    BCancela: TBitBtn;
    ConsE075Der: TIBQuery;
    ConsE075DerCODDER: TIBStringField;
    ConsE075DerDESDER: TIBStringField;
    DsConsE075Der: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
     vaCodPro : string;
  end;

var
  FConsDerivacao: TFConsDerivacao;

implementation

uses UDm1;

{$R *.dfm}

procedure TFConsDerivacao.DBGrid1DblClick(Sender: TObject);
begin
BSeleciona.Click;
end;

procedure TFConsDerivacao.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
     begin
       BSeleciona.Click;
     end;
end;

procedure TFConsDerivacao.FormShow(Sender: TObject);
begin
 ConsE075Der.Close;
 ConsE075Der.ParamByName('codpro').Value := vaCodPro;
 ConsE075Der.Open;
end;

end.
