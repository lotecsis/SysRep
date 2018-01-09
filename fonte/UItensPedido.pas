unit UItensPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, StdCtrls;

type
  TFItensPedido = class(TForm)
    dbg1: TDBGrid;
    dsItensPedido: TDataSource;
    edtDescPedido: TEdit;
    dsCoresPedido: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FItensPedido: TFItensPedido;

implementation

uses UDmOra;

{$R *.dfm}

end.
