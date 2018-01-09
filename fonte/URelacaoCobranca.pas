unit URelacaoCobranca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, Grids, DBGrids, frxClass, frxDBSet;

type
  TFRelacaoCobranca = class(TForm)
    btn1: TBitBtn;
    frxImpressao: TfrxReport;
    frxDBClientE301Tcr: TfrxDBDataset;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelacaoCobranca: TFRelacaoCobranca;

implementation

uses UDm1, UDmRave, UDmOra, UPrincipal;

{$R *.dfm}

procedure TFRelacaoCobranca.btn1Click(Sender: TObject);
begin
  try
      //conecta com o banco oracle
      DmOra := TDmOra.Create(Self);
      DmOra.Banco.Connected := True;
  except
       Application.MessageBox('Não foi possível conectar com WebService Oracle, verifique sua conexão com a internet!!','Atenção', MB_ICONWARNING+MB_OK);
       Abort;
  end;

  DmOra.ClientE301Tcr.Close;
  DmOra.E301Tcr.Close;
  DmOra.E301Tcr.Parameters.ParamByName('VCTPRO').Value := Date;
  DmOra.E301Tcr.Parameters.ParamByName('CODREP').Value := FPrincipal.vnCodRep;
  DmOra.E301Tcr.Open;
  DmOra.ClientE301Tcr.Open;

  frxImpressao.ShowReport();
  Close;
end;

end.
