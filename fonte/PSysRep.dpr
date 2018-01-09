program PSysRep;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {FPrincipal},
  UDm1 in 'UDm1.pas' {Dm1: TDataModule},
  ULogin in 'ULogin.pas' {FLogin},
  UConfig in 'UConfig.pas' {FConfig},
  UAtualiza in 'UAtualiza.pas' {FAtualiza},
  UPedido in 'UPedido.pas' {FPedido},
  UConsGeral in 'UConsGeral.pas' {FConsGeral},
  UAddProdPed in 'UAddProdPed.pas' {FAddProdPed},
  UConsDerivacao in 'UConsDerivacao.pas' {FConsDerivacao},
  UAddCorProdPed in 'UAddCorProdPed.pas' {FAddCorProdPed},
  UConsCoresProdPed in 'UConsCoresProdPed.pas' {FConsCoresProdPed},
  UObsPed in 'UObsPed.pas' {FObsPed},
  UEnviaPedidos in 'UEnviaPedidos.pas' {FEnviaPedidos},
  UConsultaPedido in 'UConsultaPedido.pas' {FConsultaPedido},
  UDmOra in 'UDmOra.pas' {DmOra: TDataModule},
  UAcompanhamentoPedidos in 'UAcompanhamentoPedidos.pas' {FAcompanhamentoPedidos},
  UResumoPreCargas in 'UResumoPreCargas.pas' {FResumoPreCargas},
  UDmRave in 'UDmRave.pas' {DmRave: TDataModule},
  UInformacoesClientes in 'UInformacoesClientes.pas' {FInformacoesClientes},
  URelacaoCobranca in 'URelacaoCobranca.pas' {FRelacaoCobranca},
  UVisuTabPreco in 'UVisuTabPreco.pas' {FVisuTabPreco},
  UDmR in 'UDmR.pas' {DmR: TDataModule},
  UDmFireRep in 'UDmFireRep.pas' {DmFireRep: TDataModule},
  UAcompanhaPedidosOnline in 'UAcompanhaPedidosOnline.pas' {FAcompanhaPedidosOnline},
  UItensPedido in 'UItensPedido.pas' {FItensPedido};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'SysRep';
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TDm1, Dm1);
  Application.CreateForm(TDmFireRep, DmFireRep);
  Application.CreateForm(TDmRave, DmRave);
  Application.CreateForm(TFAcompanhaPedidosOnline, FAcompanhaPedidosOnline);
  Application.CreateForm(TFItensPedido, FItensPedido);
  Application.Run;
end.
