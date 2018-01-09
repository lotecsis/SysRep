unit UDmR;

interface

uses
  SysUtils, Classes, IBDatabase, DB;

type
  TDmR = class(TDataModule)
    Banco: TIBDatabase;
    Transacao: TIBTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmR: TDmR;

implementation

{$R *.dfm}

end.
