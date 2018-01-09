object DmR: TDmR
  OldCreateOrder = False
  Height = 414
  Width = 397
  object Banco: TIBDatabase
    DatabaseName = 'C:\DelphiSapiens\SapiensDelphi\ServerRep\BANCO\BANCO.FDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey'
      'lc_ctype=ISO8859_1')
    LoginPrompt = False
    DefaultTransaction = Transacao
    Left = 24
    Top = 24
  end
  object Transacao: TIBTransaction
    DefaultDatabase = Banco
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 96
    Top = 24
  end
end
