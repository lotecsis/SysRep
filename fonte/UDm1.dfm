object Dm1: TDm1
  OldCreateOrder = False
  Height = 701
  Width = 926
  object IBDBanco: TIBDatabase
    DatabaseName = 'C:\SysRep\banco\BANCO.FDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey'
      'lc_ctype=ISO8859_1')
    LoginPrompt = False
    Left = 18
    Top = 12
  end
  object IBDTransacao: TIBTransaction
    DefaultDatabase = IBDBanco
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 106
    Top = 12
  end
  object ConsE100Usu: TIBQuery
    Database = IBDBanco
    Transaction = IBDTransacao
    SQL.Strings = (
      'select E100USU.* from E100USU where logusu = :logusu and'
      
        '                                                                ' +
        'senusu = :senusu')
    Left = 48
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'logusu'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'senusu'
        ParamType = ptUnknown
      end>
    object ConsE100UsuCODUSU: TIntegerField
      FieldName = 'CODUSU'
      Origin = '"E100USU"."CODUSU"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE100UsuLOGUSU: TIBStringField
      FieldName = 'LOGUSU'
      Origin = '"E100USU"."LOGUSU"'
      Size = 40
    end
    object ConsE100UsuSENUSU: TIBStringField
      FieldName = 'SENUSU'
      Origin = '"E100USU"."SENUSU"'
      Size = 40
    end
    object ConsE100UsuDATCAD: TDateField
      FieldName = 'DATCAD'
      Origin = '"E100USU"."DATCAD"'
    end
    object ConsE100UsuSITUSU: TIBStringField
      FieldName = 'SITUSU'
      Origin = '"E100USU"."SITUSU"'
      FixedChar = True
      Size = 1
    end
    object ConsE100UsuCHAVE: TIBStringField
      FieldName = 'CHAVE'
      Origin = '"E100USU"."CHAVE"'
    end
    object ConsE100UsuNOMUSU: TIBStringField
      FieldName = 'NOMUSU'
      Origin = '"E100USU"."NOMUSU"'
      Size = 50
    end
    object ConsE100UsuCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"E100USU"."CODREP"'
    end
    object ConsE100UsuNOMREP: TIBStringField
      FieldName = 'NOMREP'
      Origin = '"E100USU"."NOMREP"'
      Size = 60
    end
    object ConsE100UsuUSUADM: TIBStringField
      FieldName = 'USUADM'
      Origin = '"E100USU"."USUADM"'
      FixedChar = True
      Size = 1
    end
    object ConsE100UsuNUMPEDINI: TIntegerField
      FieldName = 'NUMPEDINI'
      Origin = '"E100USU"."NUMPEDINI"'
    end
    object ConsE100UsuNUMPEDFIM: TIntegerField
      FieldName = 'NUMPEDFIM'
      Origin = '"E100USU"."NUMPEDFIM"'
    end
    object ConsE100UsuNUMPEDATU: TIntegerField
      FieldName = 'NUMPEDATU'
      Origin = '"E100USU"."NUMPEDATU"'
    end
    object ConsE100UsuNUMFAIXA: TIntegerField
      FieldName = 'NUMFAIXA'
      Origin = '"E100USU"."NUMFAIXA"'
    end
  end
  object CadE100Usu: TIBDataSet
    Database = IBDBanco
    Transaction = IBDTransacao
    DeleteSQL.Strings = (
      'delete from E100USU'
      'where'
      '  CODUSU = :OLD_CODUSU')
    InsertSQL.Strings = (
      'insert into E100USU'
      
        '  (CHAVE, CODREP, CODUSU, DATCAD, LOGUSU, NOMREP, NOMUSU, NUMFAI' +
        'XA, NUMPEDATU, '
      '   NUMPEDFIM, NUMPEDINI, SENUSU, SITUSU, USUADM)'
      'values'
      
        '  (:CHAVE, :CODREP, :CODUSU, :DATCAD, :LOGUSU, :NOMREP, :NOMUSU,' +
        ' :NUMFAIXA, '
      
        '   :NUMPEDATU, :NUMPEDFIM, :NUMPEDINI, :SENUSU, :SITUSU, :USUADM' +
        ')')
    RefreshSQL.Strings = (
      'Select '
      '  CODUSU,'
      '  LOGUSU,'
      '  SENUSU,'
      '  DATCAD,'
      '  SITUSU,'
      '  CHAVE,'
      '  NOMUSU,'
      '  CODREP,'
      '  NOMREP,'
      '  USUADM,'
      '  NUMPEDINI,'
      '  NUMPEDFIM,'
      '  NUMPEDATU,'
      '  NUMFAIXA'
      'from E100USU '
      'where'
      '  CODUSU = :CODUSU')
    SelectSQL.Strings = (
      'select E100USU .* from E100USU where codusu = :codusu')
    ModifySQL.Strings = (
      'update E100USU'
      'set'
      '  CHAVE = :CHAVE,'
      '  CODREP = :CODREP,'
      '  CODUSU = :CODUSU,'
      '  DATCAD = :DATCAD,'
      '  LOGUSU = :LOGUSU,'
      '  NOMREP = :NOMREP,'
      '  NOMUSU = :NOMUSU,'
      '  NUMFAIXA = :NUMFAIXA,'
      '  NUMPEDATU = :NUMPEDATU,'
      '  NUMPEDFIM = :NUMPEDFIM,'
      '  NUMPEDINI = :NUMPEDINI,'
      '  SENUSU = :SENUSU,'
      '  SITUSU = :SITUSU,'
      '  USUADM = :USUADM'
      'where'
      '  CODUSU = :OLD_CODUSU')
    Left = 152
    Top = 88
    object CadE100UsuCODUSU: TIntegerField
      FieldName = 'CODUSU'
      Origin = '"E100USU"."CODUSU"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE100UsuLOGUSU: TIBStringField
      FieldName = 'LOGUSU'
      Origin = '"E100USU"."LOGUSU"'
      Size = 40
    end
    object CadE100UsuSENUSU: TIBStringField
      FieldName = 'SENUSU'
      Origin = '"E100USU"."SENUSU"'
      Size = 40
    end
    object CadE100UsuDATCAD: TDateField
      FieldName = 'DATCAD'
      Origin = '"E100USU"."DATCAD"'
    end
    object CadE100UsuSITUSU: TIBStringField
      FieldName = 'SITUSU'
      Origin = '"E100USU"."SITUSU"'
      FixedChar = True
      Size = 1
    end
    object CadE100UsuCHAVE: TIBStringField
      FieldName = 'CHAVE'
      Origin = '"E100USU"."CHAVE"'
    end
    object CadE100UsuNOMUSU: TIBStringField
      FieldName = 'NOMUSU'
      Origin = '"E100USU"."NOMUSU"'
      Size = 50
    end
    object CadE100UsuCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"E100USU"."CODREP"'
    end
    object CadE100UsuNOMREP: TIBStringField
      FieldName = 'NOMREP'
      Origin = '"E100USU"."NOMREP"'
      Size = 60
    end
    object CadE100UsuUSUADM: TIBStringField
      FieldName = 'USUADM'
      Origin = '"E100USU"."USUADM"'
      FixedChar = True
      Size = 1
    end
    object CadE100UsuNUMPEDINI: TIntegerField
      FieldName = 'NUMPEDINI'
      Origin = '"E100USU"."NUMPEDINI"'
    end
    object CadE100UsuNUMPEDFIM: TIntegerField
      FieldName = 'NUMPEDFIM'
      Origin = '"E100USU"."NUMPEDFIM"'
    end
    object CadE100UsuNUMPEDATU: TIntegerField
      FieldName = 'NUMPEDATU'
      Origin = '"E100USU"."NUMPEDATU"'
    end
    object CadE100UsuNUMFAIXA: TIntegerField
      FieldName = 'NUMFAIXA'
      Origin = '"E100USU"."NUMFAIXA"'
    end
  end
  object CadE085cli: TIBDataSet
    Database = IBDBanco
    Transaction = IBDTransacao
    DeleteSQL.Strings = (
      'delete from E085CLI'
      'where'
      '  CODCLI = :OLD_CODCLI')
    InsertSQL.Strings = (
      'insert into E085CLI'
      
        '  (APECLI, BAICLI, CEPCLI, CGCCPF, CIDCLI, CODCLI, CPLEND, ENDCL' +
        'I, FONCLI, '
      '   INSEST, NENCLI, NOMCLI, SIGUFS, SITCLI)'
      'values'
      
        '  (:APECLI, :BAICLI, :CEPCLI, :CGCCPF, :CIDCLI, :CODCLI, :CPLEND' +
        ', :ENDCLI, '
      '   :FONCLI, :INSEST, :NENCLI, :NOMCLI, :SIGUFS, :SITCLI)')
    RefreshSQL.Strings = (
      'Select '
      '  CODCLI,'
      '  NOMCLI,'
      '  APECLI,'
      '  INSEST,'
      '  ENDCLI,'
      '  NENCLI,'
      '  CPLEND,'
      '  CEPCLI,'
      '  BAICLI,'
      '  CIDCLI,'
      '  SIGUFS,'
      '  SITCLI,'
      '  CGCCPF,'
      '  FONCLI'
      'from E085CLI '
      'where'
      '  CODCLI = :CODCLI')
    SelectSQL.Strings = (
      'select * from E085CLI where codcli = :codcli')
    ModifySQL.Strings = (
      'update E085CLI'
      'set'
      '  APECLI = :APECLI,'
      '  BAICLI = :BAICLI,'
      '  CEPCLI = :CEPCLI,'
      '  CGCCPF = :CGCCPF,'
      '  CIDCLI = :CIDCLI,'
      '  CODCLI = :CODCLI,'
      '  CPLEND = :CPLEND,'
      '  ENDCLI = :ENDCLI,'
      '  FONCLI = :FONCLI,'
      '  INSEST = :INSEST,'
      '  NENCLI = :NENCLI,'
      '  NOMCLI = :NOMCLI,'
      '  SIGUFS = :SIGUFS,'
      '  SITCLI = :SITCLI'
      'where'
      '  CODCLI = :OLD_CODCLI')
    Left = 40
    Top = 150
    object CadE085cliCODCLI: TIntegerField
      FieldName = 'CODCLI'
      Origin = '"E085CLI"."CODCLI"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE085cliNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Origin = '"E085CLI"."NOMCLI"'
      Size = 100
    end
    object CadE085cliAPECLI: TIBStringField
      FieldName = 'APECLI'
      Origin = '"E085CLI"."APECLI"'
      Size = 50
    end
    object CadE085cliINSEST: TIBStringField
      FieldName = 'INSEST'
      Origin = '"E085CLI"."INSEST"'
      Size = 25
    end
    object CadE085cliENDCLI: TIBStringField
      FieldName = 'ENDCLI'
      Origin = '"E085CLI"."ENDCLI"'
      Size = 100
    end
    object CadE085cliNENCLI: TIBStringField
      FieldName = 'NENCLI'
      Origin = '"E085CLI"."NENCLI"'
      Size = 60
    end
    object CadE085cliCPLEND: TIBStringField
      FieldName = 'CPLEND'
      Origin = '"E085CLI"."CPLEND"'
    end
    object CadE085cliCEPCLI: TIBStringField
      FieldName = 'CEPCLI'
      Origin = '"E085CLI"."CEPCLI"'
      Size = 10
    end
    object CadE085cliBAICLI: TIBStringField
      FieldName = 'BAICLI'
      Origin = '"E085CLI"."BAICLI"'
      Size = 75
    end
    object CadE085cliCIDCLI: TIBStringField
      FieldName = 'CIDCLI'
      Origin = '"E085CLI"."CIDCLI"'
      Size = 60
    end
    object CadE085cliSIGUFS: TIBStringField
      FieldName = 'SIGUFS'
      Origin = '"E085CLI"."SIGUFS"'
      Size = 2
    end
    object CadE085cliSITCLI: TIBStringField
      FieldName = 'SITCLI'
      Origin = '"E085CLI"."SITCLI"'
      FixedChar = True
      Size = 1
    end
    object CadE085cliCGCCPF: TIBStringField
      FieldName = 'CGCCPF'
      Origin = '"E085CLI"."CGCCPF"'
      Size = 14
    end
    object CadE085cliFONCLI: TIBStringField
      FieldName = 'FONCLI'
      Origin = '"E085CLI"."FONCLI"'
    end
  end
  object CadE085Hcl: TIBDataSet
    Database = IBDBanco
    Transaction = IBDTransacao
    DeleteSQL.Strings = (
      'delete from E085HCL'
      'where'
      '  CODCLI = :OLD_CODCLI and'
      '  CODEMP = :OLD_CODEMP and'
      '  CODFIL = :OLD_CODFIL')
    InsertSQL.Strings = (
      'insert into E085HCL'
      
        '  (CODCLI, CODEMP, CODFIL, CODREP, DATATR, DATMAC, DATMFA, DATUF' +
        'A, DATUPE, '
      
        '   DATUPG, MAIATR, QTDPGT, SALDUP, ULTNFV, VLRATR, VLRMAC, VLRMF' +
        'A, VLRUFA, '
      '   VLRUPE, VLRUPG)'
      'values'
      
        '  (:CODCLI, :CODEMP, :CODFIL, :CODREP, :DATATR, :DATMAC, :DATMFA' +
        ', :DATUFA, '
      
        '   :DATUPE, :DATUPG, :MAIATR, :QTDPGT, :SALDUP, :ULTNFV, :VLRATR' +
        ', :VLRMAC, '
      '   :VLRMFA, :VLRUFA, :VLRUPE, :VLRUPG)')
    RefreshSQL.Strings = (
      'Select '
      '  CODCLI,'
      '  CODEMP,'
      '  CODFIL,'
      '  CODREP,'
      '  SALDUP,'
      '  DATMAC,'
      '  VLRMAC,'
      '  DATUPE,'
      '  VLRUPE,'
      '  DATUFA,'
      '  VLRUFA,'
      '  DATUPG,'
      '  VLRUPG,'
      '  QTDPGT,'
      '  DATMFA,'
      '  VLRMFA,'
      '  DATATR,'
      '  VLRATR,'
      '  MAIATR,'
      '  ULTNFV'
      'from E085HCL '
      'where'
      '  CODCLI = :CODCLI and'
      '  CODEMP = :CODEMP and'
      '  CODFIL = :CODFIL')
    SelectSQL.Strings = (
      'select E085HCL.* from E085HCL where codemp = :codemp and'
      
        '                                                                ' +
        'codfil = :codfil and'
      
        '                                                                ' +
        'codcli = :codcli')
    ModifySQL.Strings = (
      'update E085HCL'
      'set'
      '  CODCLI = :CODCLI,'
      '  CODEMP = :CODEMP,'
      '  CODFIL = :CODFIL,'
      '  CODREP = :CODREP,'
      '  DATATR = :DATATR,'
      '  DATMAC = :DATMAC,'
      '  DATMFA = :DATMFA,'
      '  DATUFA = :DATUFA,'
      '  DATUPE = :DATUPE,'
      '  DATUPG = :DATUPG,'
      '  MAIATR = :MAIATR,'
      '  QTDPGT = :QTDPGT,'
      '  SALDUP = :SALDUP,'
      '  ULTNFV = :ULTNFV,'
      '  VLRATR = :VLRATR,'
      '  VLRMAC = :VLRMAC,'
      '  VLRMFA = :VLRMFA,'
      '  VLRUFA = :VLRUFA,'
      '  VLRUPE = :VLRUPE,'
      '  VLRUPG = :VLRUPG'
      'where'
      '  CODCLI = :OLD_CODCLI and'
      '  CODEMP = :OLD_CODEMP and'
      '  CODFIL = :OLD_CODFIL')
    Left = 112
    Top = 150
    object CadE085HclCODCLI: TIntegerField
      FieldName = 'CODCLI'
      Origin = '"E085HCL"."CODCLI"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE085HclCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E085HCL"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE085HclCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Origin = '"E085HCL"."CODFIL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE085HclCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"E085HCL"."CODREP"'
    end
    object CadE085HclSALDUP: TFloatField
      FieldName = 'SALDUP'
      Origin = '"E085HCL"."SALDUP"'
    end
    object CadE085HclDATMAC: TDateField
      FieldName = 'DATMAC'
      Origin = '"E085HCL"."DATMAC"'
    end
    object CadE085HclVLRMAC: TFloatField
      FieldName = 'VLRMAC'
      Origin = '"E085HCL"."VLRMAC"'
    end
    object CadE085HclDATUPE: TDateField
      FieldName = 'DATUPE'
      Origin = '"E085HCL"."DATUPE"'
    end
    object CadE085HclVLRUPE: TFloatField
      FieldName = 'VLRUPE'
      Origin = '"E085HCL"."VLRUPE"'
    end
    object CadE085HclDATUFA: TDateField
      FieldName = 'DATUFA'
      Origin = '"E085HCL"."DATUFA"'
    end
    object CadE085HclVLRUFA: TFloatField
      FieldName = 'VLRUFA'
      Origin = '"E085HCL"."VLRUFA"'
    end
    object CadE085HclDATUPG: TDateField
      FieldName = 'DATUPG'
      Origin = '"E085HCL"."DATUPG"'
    end
    object CadE085HclVLRUPG: TFloatField
      FieldName = 'VLRUPG'
      Origin = '"E085HCL"."VLRUPG"'
    end
    object CadE085HclQTDPGT: TIntegerField
      FieldName = 'QTDPGT'
      Origin = '"E085HCL"."QTDPGT"'
    end
    object CadE085HclDATMFA: TDateField
      FieldName = 'DATMFA'
      Origin = '"E085HCL"."DATMFA"'
    end
    object CadE085HclVLRMFA: TFloatField
      FieldName = 'VLRMFA'
      Origin = '"E085HCL"."VLRMFA"'
    end
    object CadE085HclDATATR: TDateField
      FieldName = 'DATATR'
      Origin = '"E085HCL"."DATATR"'
    end
    object CadE085HclVLRATR: TFloatField
      FieldName = 'VLRATR'
      Origin = '"E085HCL"."VLRATR"'
    end
    object CadE085HclMAIATR: TIntegerField
      FieldName = 'MAIATR'
      Origin = '"E085HCL"."MAIATR"'
    end
    object CadE085HclULTNFV: TFloatField
      FieldName = 'ULTNFV'
      Origin = '"E085HCL"."ULTNFV"'
    end
  end
  object CadE028Cpg: TIBDataSet
    Database = IBDBanco
    Transaction = IBDTransacao
    DeleteSQL.Strings = (
      'delete from E028CPG'
      'where'
      '  CODCPG = :OLD_CODCPG and'
      '  CODEMP = :OLD_CODEMP and'
      '  CODUSU = :OLD_CODUSU')
    InsertSQL.Strings = (
      'insert into E028CPG'
      
        '  (ABRCPG, CODCPG, CODEMP, CODUSU, DESCPG, PERCOM, PRZMED, QTDPA' +
        'R, SITCPG)'
      'values'
      
        '  (:ABRCPG, :CODCPG, :CODEMP, :CODUSU, :DESCPG, :PERCOM, :PRZMED' +
        ', :QTDPAR, '
      '   :SITCPG)')
    RefreshSQL.Strings = (
      'Select '
      '  CODEMP,'
      '  CODCPG,'
      '  CODUSU,'
      '  DESCPG,'
      '  ABRCPG,'
      '  PRZMED,'
      '  QTDPAR,'
      '  SITCPG,'
      '  PERCOM'
      'from E028CPG '
      'where'
      '  CODCPG = :CODCPG and'
      '  CODEMP = :CODEMP and'
      '  CODUSU = :CODUSU')
    SelectSQL.Strings = (
      'select * from E028CPG where codemp = :codemp and'
      
        '                                                 codcpg = :codcp' +
        'g and'
      
        '                                                 codusu = :codus' +
        'u')
    ModifySQL.Strings = (
      'update E028CPG'
      'set'
      '  ABRCPG = :ABRCPG,'
      '  CODCPG = :CODCPG,'
      '  CODEMP = :CODEMP,'
      '  CODUSU = :CODUSU,'
      '  DESCPG = :DESCPG,'
      '  PERCOM = :PERCOM,'
      '  PRZMED = :PRZMED,'
      '  QTDPAR = :QTDPAR,'
      '  SITCPG = :SITCPG'
      'where'
      '  CODCPG = :OLD_CODCPG and'
      '  CODEMP = :OLD_CODEMP and'
      '  CODUSU = :OLD_CODUSU')
    Left = 200
    Top = 150
    object CadE028CpgCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E028CPG"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE028CpgCODCPG: TIBStringField
      FieldName = 'CODCPG'
      Origin = '"E028CPG"."CODCPG"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object CadE028CpgCODUSU: TIntegerField
      FieldName = 'CODUSU'
      Origin = '"E028CPG"."CODUSU"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE028CpgDESCPG: TIBStringField
      FieldName = 'DESCPG'
      Origin = '"E028CPG"."DESCPG"'
      Size = 50
    end
    object CadE028CpgABRCPG: TIBStringField
      FieldName = 'ABRCPG'
      Origin = '"E028CPG"."ABRCPG"'
      Size = 10
    end
    object CadE028CpgPRZMED: TIntegerField
      FieldName = 'PRZMED'
      Origin = '"E028CPG"."PRZMED"'
    end
    object CadE028CpgQTDPAR: TIntegerField
      FieldName = 'QTDPAR'
      Origin = '"E028CPG"."QTDPAR"'
    end
    object CadE028CpgSITCPG: TIBStringField
      FieldName = 'SITCPG'
      Origin = '"E028CPG"."SITCPG"'
      FixedChar = True
      Size = 1
    end
    object CadE028CpgPERCOM: TFloatField
      FieldName = 'PERCOM'
      Origin = '"E028CPG"."PERCOM"'
    end
  end
  object CadE075Pro: TIBDataSet
    Database = IBDBanco
    Transaction = IBDTransacao
    DeleteSQL.Strings = (
      'delete from E075PRO'
      'where'
      '  CODEMP = :OLD_CODEMP and'
      '  CODPRO = :OLD_CODPRO')
    InsertSQL.Strings = (
      'insert into E075PRO'
      '  (CODAGC, CODAGP, CODEMP, CODFAM, CODPRO, DESPRO, SITPRO)'
      'values'
      
        '  (:CODAGC, :CODAGP, :CODEMP, :CODFAM, :CODPRO, :DESPRO, :SITPRO' +
        ')')
    RefreshSQL.Strings = (
      'Select '
      '  CODEMP,'
      '  CODPRO,'
      '  DESPRO,'
      '  CODFAM,'
      '  CODAGP,'
      '  SITPRO,'
      '  CODAGC'
      'from E075PRO '
      'where'
      '  CODEMP = :CODEMP and'
      '  CODPRO = :CODPRO')
    SelectSQL.Strings = (
      'select * from E075PRO where codemp = :codemp and'
      
        '                                                 codpro = :codpr' +
        'o            ')
    ModifySQL.Strings = (
      'update E075PRO'
      'set'
      '  CODAGC = :CODAGC,'
      '  CODAGP = :CODAGP,'
      '  CODEMP = :CODEMP,'
      '  CODFAM = :CODFAM,'
      '  CODPRO = :CODPRO,'
      '  DESPRO = :DESPRO,'
      '  SITPRO = :SITPRO'
      'where'
      '  CODEMP = :OLD_CODEMP and'
      '  CODPRO = :OLD_CODPRO')
    Left = 280
    Top = 150
    object CadE075ProCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E075PRO"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE075ProCODPRO: TIBStringField
      FieldName = 'CODPRO'
      Origin = '"E075PRO"."CODPRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 14
    end
    object CadE075ProDESPRO: TIBStringField
      FieldName = 'DESPRO'
      Origin = '"E075PRO"."DESPRO"'
      Size = 100
    end
    object CadE075ProCODFAM: TIBStringField
      FieldName = 'CODFAM'
      Origin = '"E075PRO"."CODFAM"'
      Size = 10
    end
    object CadE075ProCODAGP: TIBStringField
      FieldName = 'CODAGP'
      Origin = '"E075PRO"."CODAGP"'
      Size = 10
    end
    object CadE075ProSITPRO: TIBStringField
      FieldName = 'SITPRO'
      Origin = '"E075PRO"."SITPRO"'
      FixedChar = True
      Size = 1
    end
    object CadE075ProCODAGC: TIBStringField
      FieldName = 'CODAGC'
      Origin = '"E075PRO"."CODAGC"'
      Size = 10
    end
  end
  object CadE075Der: TIBDataSet
    Database = IBDBanco
    Transaction = IBDTransacao
    DeleteSQL.Strings = (
      'delete from E075DER'
      'where'
      '  CODDER = :OLD_CODDER and'
      '  CODEMP = :OLD_CODEMP and'
      '  CODPRO = :OLD_CODPRO')
    InsertSQL.Strings = (
      'insert into E075DER'
      
        '  (CMP1AC, CMP1BB, CMP2BB, CMP2EN, CODDER, CODEMP, CODPRO, CORUN' +
        'I, DESDER, '
      '   PESBRU, PESLIQ, SITDER, VOLDER)'
      'values'
      
        '  (:CMP1AC, :CMP1BB, :CMP2BB, :CMP2EN, :CODDER, :CODEMP, :CODPRO' +
        ', :CORUNI, '
      '   :DESDER, :PESBRU, :PESLIQ, :SITDER, :VOLDER)')
    RefreshSQL.Strings = (
      'Select '
      '  CODEMP,'
      '  CODPRO,'
      '  CODDER,'
      '  DESDER,'
      '  PESBRU,'
      '  PESLIQ,'
      '  VOLDER,'
      '  SITDER,'
      '  CORUNI,'
      '  CMP1BB,'
      '  CMP1AC,'
      '  CMP2BB,'
      '  CMP2EN'
      'from E075DER '
      'where'
      '  CODDER = :CODDER and'
      '  CODEMP = :CODEMP and'
      '  CODPRO = :CODPRO')
    SelectSQL.Strings = (
      'select * from E075DER where codemp = :codemp and'
      
        '                                                 codpro = :codpr' +
        'o and'
      
        '                                                 codder = :codde' +
        'r                                            ')
    ModifySQL.Strings = (
      'update E075DER'
      'set'
      '  CMP1AC = :CMP1AC,'
      '  CMP1BB = :CMP1BB,'
      '  CMP2BB = :CMP2BB,'
      '  CMP2EN = :CMP2EN,'
      '  CODDER = :CODDER,'
      '  CODEMP = :CODEMP,'
      '  CODPRO = :CODPRO,'
      '  CORUNI = :CORUNI,'
      '  DESDER = :DESDER,'
      '  PESBRU = :PESBRU,'
      '  PESLIQ = :PESLIQ,'
      '  SITDER = :SITDER,'
      '  VOLDER = :VOLDER'
      'where'
      '  CODDER = :OLD_CODDER and'
      '  CODEMP = :OLD_CODEMP and'
      '  CODPRO = :OLD_CODPRO')
    Left = 352
    Top = 150
    object CadE075DerCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E075DER"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE075DerCODPRO: TIBStringField
      FieldName = 'CODPRO'
      Origin = '"E075DER"."CODPRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 14
    end
    object CadE075DerCODDER: TIBStringField
      FieldName = 'CODDER'
      Origin = '"E075DER"."CODDER"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 7
    end
    object CadE075DerDESDER: TIBStringField
      FieldName = 'DESDER'
      Origin = '"E075DER"."DESDER"'
      Size = 50
    end
    object CadE075DerPESBRU: TFloatField
      FieldName = 'PESBRU'
      Origin = '"E075DER"."PESBRU"'
    end
    object CadE075DerPESLIQ: TFloatField
      FieldName = 'PESLIQ'
      Origin = '"E075DER"."PESLIQ"'
    end
    object CadE075DerVOLDER: TFloatField
      FieldName = 'VOLDER'
      Origin = '"E075DER"."VOLDER"'
    end
    object CadE075DerSITDER: TIBStringField
      FieldName = 'SITDER'
      Origin = '"E075DER"."SITDER"'
      FixedChar = True
      Size = 1
    end
    object CadE075DerCORUNI: TFloatField
      FieldName = 'CORUNI'
      Origin = '"E075DER"."CORUNI"'
    end
    object CadE075DerCMP1BB: TFloatField
      FieldName = 'CMP1BB'
      Origin = '"E075DER"."CMP1BB"'
    end
    object CadE075DerCMP1AC: TFloatField
      FieldName = 'CMP1AC'
      Origin = '"E075DER"."CMP1AC"'
    end
    object CadE075DerCMP2BB: TFloatField
      FieldName = 'CMP2BB'
      Origin = '"E075DER"."CMP2BB"'
    end
    object CadE075DerCMP2EN: TFloatField
      FieldName = 'CMP2EN'
      Origin = '"E075DER"."CMP2EN"'
    end
  end
  object CadE075Cor: TIBDataSet
    Database = IBDBanco
    Transaction = IBDTransacao
    DeleteSQL.Strings = (
      'delete from E075COR'
      'where'
      '  CODEMP = :OLD_CODEMP and'
      '  CODPRO = :OLD_CODPRO')
    InsertSQL.Strings = (
      'insert into E075COR'
      '  (CODEMP, CODPRO, DESPRO, SITPRO)'
      'values'
      '  (:CODEMP, :CODPRO, :DESPRO, :SITPRO)')
    RefreshSQL.Strings = (
      'Select '
      '  CODEMP,'
      '  CODPRO,'
      '  DESPRO,'
      '  SITPRO'
      'from E075COR '
      'where'
      '  CODEMP = :CODEMP and'
      '  CODPRO = :CODPRO')
    SelectSQL.Strings = (
      'select * from E075COR where codemp = :codemp and'
      
        '                                                 codpro = :codpr' +
        'o')
    ModifySQL.Strings = (
      'update E075COR'
      'set'
      '  CODEMP = :CODEMP,'
      '  CODPRO = :CODPRO,'
      '  DESPRO = :DESPRO,'
      '  SITPRO = :SITPRO'
      'where'
      '  CODEMP = :OLD_CODEMP and'
      '  CODPRO = :OLD_CODPRO')
    Left = 432
    Top = 150
    object CadE075CorCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E075COR"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE075CorCODPRO: TIBStringField
      FieldName = 'CODPRO'
      Origin = '"E075COR"."CODPRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 14
    end
    object CadE075CorDESPRO: TIBStringField
      FieldName = 'DESPRO'
      Origin = '"E075COR"."DESPRO"'
      Size = 100
    end
    object CadE075CorSITPRO: TIBStringField
      FieldName = 'SITPRO'
      Origin = '"E075COR"."SITPRO"'
      FixedChar = True
      Size = 1
    end
  end
  object CadE075Ldc: TIBDataSet
    Database = IBDBanco
    Transaction = IBDTransacao
    DeleteSQL.Strings = (
      'delete from E075LDC'
      'where'
      '  CODDER = :OLD_CODDER and'
      '  CODEMP = :OLD_CODEMP and'
      '  CODPRO = :OLD_CODPRO and'
      '  CODTEC = :OLD_CODTEC')
    InsertSQL.Strings = (
      'insert into E075LDC'
      '  (CODDER, CODEMP, CODPRO, CODTEC, DESTEC, SITLIG)'
      'values'
      '  (:CODDER, :CODEMP, :CODPRO, :CODTEC, :DESTEC, :SITLIG)')
    RefreshSQL.Strings = (
      'Select '
      '  CODEMP,'
      '  CODPRO,'
      '  CODDER,'
      '  CODTEC,'
      '  DESTEC,'
      '  SITLIG'
      'from E075LDC '
      'where'
      '  CODDER = :CODDER and'
      '  CODEMP = :CODEMP and'
      '  CODPRO = :CODPRO and'
      '  CODTEC = :CODTEC')
    SelectSQL.Strings = (
      'select * from E075LDC where codemp = :codemp and'
      
        '                                                codpro = :codpro' +
        ' and'
      
        '                                                codder = :codder' +
        ' and'
      '                                                codtec = :codtec')
    ModifySQL.Strings = (
      'update E075LDC'
      'set'
      '  CODDER = :CODDER,'
      '  CODEMP = :CODEMP,'
      '  CODPRO = :CODPRO,'
      '  CODTEC = :CODTEC,'
      '  DESTEC = :DESTEC,'
      '  SITLIG = :SITLIG'
      'where'
      '  CODDER = :OLD_CODDER and'
      '  CODEMP = :OLD_CODEMP and'
      '  CODPRO = :OLD_CODPRO and'
      '  CODTEC = :OLD_CODTEC')
    Left = 512
    Top = 150
    object CadE075LdcCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E075LDC"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE075LdcCODPRO: TIBStringField
      FieldName = 'CODPRO'
      Origin = '"E075LDC"."CODPRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 14
    end
    object CadE075LdcCODDER: TIBStringField
      FieldName = 'CODDER'
      Origin = '"E075LDC"."CODDER"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 7
    end
    object CadE075LdcCODTEC: TIBStringField
      FieldName = 'CODTEC'
      Origin = '"E075LDC"."CODTEC"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 14
    end
    object CadE075LdcDESTEC: TIBStringField
      FieldName = 'DESTEC'
      Origin = '"E075LDC"."DESTEC"'
      Size = 100
    end
    object CadE075LdcSITLIG: TIBStringField
      FieldName = 'SITLIG'
      Origin = '"E075LDC"."SITLIG"'
      FixedChar = True
      Size = 1
    end
  end
  object ConsE075Ldc: TIBQuery
    Database = IBDBanco
    Transaction = IBDTransacao
    SQL.Strings = (
      'select * from E075LDC')
    Left = 512
    Top = 198
    object ConsE075LdcCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E075LDC"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE075LdcCODPRO: TIBStringField
      FieldName = 'CODPRO'
      Origin = '"E075LDC"."CODPRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 14
    end
    object ConsE075LdcCODDER: TIBStringField
      FieldName = 'CODDER'
      Origin = '"E075LDC"."CODDER"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 7
    end
    object ConsE075LdcCODTEC: TIBStringField
      FieldName = 'CODTEC'
      Origin = '"E075LDC"."CODTEC"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 14
    end
    object ConsE075LdcDESTEC: TIBStringField
      FieldName = 'DESTEC'
      Origin = '"E075LDC"."DESTEC"'
      Size = 100
    end
    object ConsE075LdcSITLIG: TIBStringField
      FieldName = 'SITLIG'
      Origin = '"E075LDC"."SITLIG"'
      FixedChar = True
      Size = 1
    end
  end
  object ApagaE075Ldc2: TIBSQL
    Database = IBDBanco
    SQL.Strings = (
      'delete from e075ldc')
    Transaction = IBDTransacao
    Left = 512
    Top = 262
  end
  object CadE081Tab: TIBDataSet
    Database = IBDBanco
    Transaction = IBDTransacao
    DeleteSQL.Strings = (
      'delete from E081TAB'
      'where'
      '  CODEMP = :OLD_CODEMP and'
      '  CODTPR = :OLD_CODTPR and'
      '  CODUSU = :OLD_CODUSU')
    InsertSQL.Strings = (
      'insert into E081TAB'
      '  (CODEMP, CODTPR, CODUSU, DESTPR, SITTPR)'
      'values'
      '  (:CODEMP, :CODTPR, :CODUSU, :DESTPR, :SITTPR)')
    RefreshSQL.Strings = (
      'Select '
      '  CODEMP,'
      '  CODTPR,'
      '  CODUSU,'
      '  DESTPR,'
      '  SITTPR'
      'from E081TAB '
      'where'
      '  CODEMP = :CODEMP and'
      '  CODTPR = :CODTPR and'
      '  CODUSU = :CODUSU')
    SelectSQL.Strings = (
      'select * from E081TAB where codemp = :codemp and'
      
        '                                                codtpr = :codtpr' +
        ' and '
      '                                                codusu = :codusu')
    ModifySQL.Strings = (
      'update E081TAB'
      'set'
      '  CODEMP = :CODEMP,'
      '  CODTPR = :CODTPR,'
      '  CODUSU = :CODUSU,'
      '  DESTPR = :DESTPR,'
      '  SITTPR = :SITTPR'
      'where'
      '  CODEMP = :OLD_CODEMP and'
      '  CODTPR = :OLD_CODTPR and'
      '  CODUSU = :OLD_CODUSU')
    Left = 48
    Top = 246
    object CadE081TabCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E081TAB"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE081TabCODTPR: TIBStringField
      FieldName = 'CODTPR'
      Origin = '"E081TAB"."CODTPR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object CadE081TabCODUSU: TIntegerField
      FieldName = 'CODUSU'
      Origin = '"E081TAB"."CODUSU"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE081TabDESTPR: TIBStringField
      FieldName = 'DESTPR'
      Origin = '"E081TAB"."DESTPR"'
      Size = 30
    end
    object CadE081TabSITTPR: TIBStringField
      FieldName = 'SITTPR'
      Origin = '"E081TAB"."SITTPR"'
      FixedChar = True
      Size = 1
    end
  end
  object CadE081Itp: TIBDataSet
    Database = IBDBanco
    Transaction = IBDTransacao
    DeleteSQL.Strings = (
      'delete from E081ITP'
      'where'
      '  CODDER = :OLD_CODDER and'
      '  CODEMP = :OLD_CODEMP and'
      '  CODPRO = :OLD_CODPRO and'
      '  CODTPR = :OLD_CODTPR')
    InsertSQL.Strings = (
      'insert into E081ITP'
      
        '  (CODDER, CODEMP, CODPRO, CODTPR, CODUSU, DATFIM, DATINI, DESPR' +
        'O, PREBAS, '
      '   SITREG, TOLMAI, TOLMEN, VLRMAI, VLRMEN)'
      'values'
      
        '  (:CODDER, :CODEMP, :CODPRO, :CODTPR, :CODUSU, :DATFIM, :DATINI' +
        ', :DESPRO, '
      '   :PREBAS, :SITREG, :TOLMAI, :TOLMEN, :VLRMAI, :VLRMEN)')
    RefreshSQL.Strings = (
      'Select '
      '  CODEMP,'
      '  CODTPR,'
      '  CODPRO,'
      '  CODDER,'
      '  CODUSU,'
      '  DESPRO,'
      '  PREBAS,'
      '  TOLMAI,'
      '  TOLMEN,'
      '  VLRMAI,'
      '  VLRMEN,'
      '  SITREG,'
      '  DATINI,'
      '  DATFIM'
      'from E081ITP '
      'where'
      '  CODDER = :CODDER and'
      '  CODEMP = :CODEMP and'
      '  CODPRO = :CODPRO and'
      '  CODTPR = :CODTPR')
    SelectSQL.Strings = (
      'select * from E081ITP where codemp = :codemp and'
      
        '                                               codtpr = :codtpr ' +
        'and'
      
        '                                               codpro = :codpro ' +
        'and'
      
        '                                               codder = :codder ' +
        'and'
      '                                               codusu = :codusu')
    ModifySQL.Strings = (
      'update E081ITP'
      'set'
      '  CODDER = :CODDER,'
      '  CODEMP = :CODEMP,'
      '  CODPRO = :CODPRO,'
      '  CODTPR = :CODTPR,'
      '  CODUSU = :CODUSU,'
      '  DATFIM = :DATFIM,'
      '  DATINI = :DATINI,'
      '  DESPRO = :DESPRO,'
      '  PREBAS = :PREBAS,'
      '  SITREG = :SITREG,'
      '  TOLMAI = :TOLMAI,'
      '  TOLMEN = :TOLMEN,'
      '  VLRMAI = :VLRMAI,'
      '  VLRMEN = :VLRMEN'
      'where'
      '  CODDER = :OLD_CODDER and'
      '  CODEMP = :OLD_CODEMP and'
      '  CODPRO = :OLD_CODPRO and'
      '  CODTPR = :OLD_CODTPR')
    Left = 136
    Top = 246
    object CadE081ItpCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E081ITP"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE081ItpCODTPR: TIBStringField
      FieldName = 'CODTPR'
      Origin = '"E081ITP"."CODTPR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object CadE081ItpCODPRO: TIBStringField
      FieldName = 'CODPRO'
      Origin = '"E081ITP"."CODPRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 14
    end
    object CadE081ItpCODDER: TIBStringField
      FieldName = 'CODDER'
      Origin = '"E081ITP"."CODDER"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 7
    end
    object CadE081ItpCODUSU: TIntegerField
      FieldName = 'CODUSU'
      Origin = '"E081ITP"."CODUSU"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE081ItpDESPRO: TIBStringField
      FieldName = 'DESPRO'
      Origin = '"E081ITP"."DESPRO"'
      Size = 100
    end
    object CadE081ItpPREBAS: TFloatField
      FieldName = 'PREBAS'
      Origin = '"E081ITP"."PREBAS"'
    end
    object CadE081ItpTOLMAI: TFloatField
      FieldName = 'TOLMAI'
      Origin = '"E081ITP"."TOLMAI"'
    end
    object CadE081ItpTOLMEN: TFloatField
      FieldName = 'TOLMEN'
      Origin = '"E081ITP"."TOLMEN"'
    end
    object CadE081ItpVLRMAI: TFloatField
      FieldName = 'VLRMAI'
      Origin = '"E081ITP"."VLRMAI"'
    end
    object CadE081ItpVLRMEN: TFloatField
      FieldName = 'VLRMEN'
      Origin = '"E081ITP"."VLRMEN"'
    end
    object CadE081ItpSITREG: TIBStringField
      FieldName = 'SITREG'
      Origin = '"E081ITP"."SITREG"'
      FixedChar = True
      Size = 1
    end
    object CadE081ItpDATINI: TDateField
      FieldName = 'DATINI'
      Origin = '"E081ITP"."DATINI"'
    end
    object CadE081ItpDATFIM: TDateField
      FieldName = 'DATFIM'
      Origin = '"E081ITP"."DATFIM"'
    end
  end
  object ConsGeral: TIBQuery
    Database = IBDBanco
    Transaction = IBDTransacao
    Left = 48
    Top = 312
  end
  object ValidaE085Cli: TIBQuery
    Database = IBDBanco
    Transaction = IBDTransacao
    SQL.Strings = (
      'select e085cli.*,e085hcl.codrep from e085cli'
      'inner join e085hcl on e085hcl.codcli = e085cli.codcli'
      '                                          where'
      
        '                                          e085cli.codcli = :codc' +
        'li')
    Left = 48
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codcli'
        ParamType = ptUnknown
      end>
    object ValidaE085CliCODCLI: TIntegerField
      FieldName = 'CODCLI'
      Origin = '"E085CLI"."CODCLI"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ValidaE085CliNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Origin = '"E085CLI"."NOMCLI"'
      Size = 100
    end
    object ValidaE085CliAPECLI: TIBStringField
      FieldName = 'APECLI'
      Origin = '"E085CLI"."APECLI"'
      Size = 50
    end
    object ValidaE085CliINSEST: TIBStringField
      FieldName = 'INSEST'
      Origin = '"E085CLI"."INSEST"'
      Size = 25
    end
    object ValidaE085CliENDCLI: TIBStringField
      FieldName = 'ENDCLI'
      Origin = '"E085CLI"."ENDCLI"'
      Size = 100
    end
    object ValidaE085CliNENCLI: TIBStringField
      FieldName = 'NENCLI'
      Origin = '"E085CLI"."NENCLI"'
      Size = 60
    end
    object ValidaE085CliCPLEND: TIBStringField
      FieldName = 'CPLEND'
      Origin = '"E085CLI"."CPLEND"'
    end
    object ValidaE085CliCEPCLI: TIBStringField
      FieldName = 'CEPCLI'
      Origin = '"E085CLI"."CEPCLI"'
      Size = 10
    end
    object ValidaE085CliBAICLI: TIBStringField
      FieldName = 'BAICLI'
      Origin = '"E085CLI"."BAICLI"'
      Size = 75
    end
    object ValidaE085CliCIDCLI: TIBStringField
      FieldName = 'CIDCLI'
      Origin = '"E085CLI"."CIDCLI"'
      Size = 60
    end
    object ValidaE085CliSIGUFS: TIBStringField
      FieldName = 'SIGUFS'
      Origin = '"E085CLI"."SIGUFS"'
      Size = 2
    end
    object ValidaE085CliSITCLI: TIBStringField
      FieldName = 'SITCLI'
      Origin = '"E085CLI"."SITCLI"'
      FixedChar = True
      Size = 1
    end
    object ValidaE085CliCGCCPF: TIBStringField
      FieldName = 'CGCCPF'
      Origin = '"E085CLI"."CGCCPF"'
      Size = 14
    end
    object ValidaE085CliFONCLI: TIBStringField
      FieldName = 'FONCLI'
      Origin = '"E085CLI"."FONCLI"'
    end
    object ValidaE085CliCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"E085HCL"."CODREP"'
    end
  end
  object ValidaE028Cpg: TIBQuery
    Database = IBDBanco
    Transaction = IBDTransacao
    SQL.Strings = (
      'select * from E028CPG where codcpg = :codcpg and'
      '                                                codusu = :codusu')
    Left = 128
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codcpg'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codusu'
        ParamType = ptUnknown
      end>
    object ValidaE028CpgCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E028CPG"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ValidaE028CpgCODCPG: TIBStringField
      FieldName = 'CODCPG'
      Origin = '"E028CPG"."CODCPG"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object ValidaE028CpgCODUSU: TIntegerField
      FieldName = 'CODUSU'
      Origin = '"E028CPG"."CODUSU"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ValidaE028CpgDESCPG: TIBStringField
      FieldName = 'DESCPG'
      Origin = '"E028CPG"."DESCPG"'
      Size = 50
    end
    object ValidaE028CpgABRCPG: TIBStringField
      FieldName = 'ABRCPG'
      Origin = '"E028CPG"."ABRCPG"'
      Size = 10
    end
    object ValidaE028CpgPRZMED: TIntegerField
      FieldName = 'PRZMED'
      Origin = '"E028CPG"."PRZMED"'
    end
    object ValidaE028CpgQTDPAR: TIntegerField
      FieldName = 'QTDPAR'
      Origin = '"E028CPG"."QTDPAR"'
    end
    object ValidaE028CpgSITCPG: TIBStringField
      FieldName = 'SITCPG'
      Origin = '"E028CPG"."SITCPG"'
      FixedChar = True
      Size = 1
    end
    object ValidaE028CpgPERCOM: TFloatField
      FieldName = 'PERCOM'
      Origin = '"E028CPG"."PERCOM"'
    end
  end
  object UltNumConE120Ped: TIBQuery
    Database = IBDBanco
    Transaction = IBDTransacao
    SQL.Strings = (
      'select max(numcon) as ultimo from e120ped')
    Left = 48
    Top = 440
    object UltNumConE120PedULTIMO: TIntegerField
      FieldName = 'ULTIMO'
      ProviderFlags = []
    end
  end
  object CadE120Ped: TIBDataSet
    Database = IBDBanco
    Transaction = IBDTransacao
    DeleteSQL.Strings = (
      'delete from E120PED'
      'where'
      '  CODEMP = :OLD_CODEMP and'
      '  CODFIL = :OLD_CODFIL and'
      '  CODREP = :OLD_CODREP and'
      '  NUMCON = :OLD_NUMCON')
    InsertSQL.Strings = (
      'insert into E120PED'
      
        '  (CODCLI, CODCPG, CODEMP, CODFIL, CODREP, DATCON, DATEMI, DATEN' +
        'V, DATGER, '
      
        '   NUMCON, NUMPED, PEDCON, PEDENV, PRECAR, QTDABE, QTDORI, SITPE' +
        'D, TNSPRO, '
      
        '   USUCON, USUGER, VLRBCO, VLRBIC, VLRBIP, VLRCOM, VLRICM, VLRIP' +
        'I, VLRLIQ, '
      '   VLRORI)'
      'values'
      
        '  (:CODCLI, :CODCPG, :CODEMP, :CODFIL, :CODREP, :DATCON, :DATEMI' +
        ', :DATENV, '
      
        '   :DATGER, :NUMCON, :NUMPED, :PEDCON, :PEDENV, :PRECAR, :QTDABE' +
        ', :QTDORI, '
      
        '   :SITPED, :TNSPRO, :USUCON, :USUGER, :VLRBCO, :VLRBIC, :VLRBIP' +
        ', :VLRCOM, '
      '   :VLRICM, :VLRIPI, :VLRLIQ, :VLRORI)')
    RefreshSQL.Strings = (
      'Select '
      '  CODEMP,'
      '  CODFIL,'
      '  NUMPED,'
      '  NUMCON,'
      '  CODCLI,'
      '  TNSPRO,'
      '  DATEMI,'
      '  CODREP,'
      '  CODCPG,'
      '  QTDORI,'
      '  QTDABE,'
      '  VLRBIP,'
      '  VLRIPI,'
      '  VLRBIC,'
      '  VLRICM,'
      '  VLRBCO,'
      '  VLRCOM,'
      '  VLRLIQ,'
      '  VLRORI,'
      '  SITPED,'
      '  USUGER,'
      '  DATGER,'
      '  PEDENV,'
      '  DATENV,'
      '  PEDCON,'
      '  DATCON,'
      '  USUCON,'
      '  PRECAR'
      'from E120PED '
      'where'
      '  CODEMP = :CODEMP and'
      '  CODFIL = :CODFIL and'
      '  CODREP = :CODREP and'
      '  NUMCON = :NUMCON')
    SelectSQL.Strings = (
      'select * from E120PED where codemp = :codemp and'
      
        '                                                codfil = :codfil' +
        ' and'
      
        '                                                numcon = :numcon' +
        ' and'
      '                                               codrep = :codrep')
    ModifySQL.Strings = (
      'update E120PED'
      'set'
      '  CODCLI = :CODCLI,'
      '  CODCPG = :CODCPG,'
      '  CODEMP = :CODEMP,'
      '  CODFIL = :CODFIL,'
      '  CODREP = :CODREP,'
      '  DATCON = :DATCON,'
      '  DATEMI = :DATEMI,'
      '  DATENV = :DATENV,'
      '  DATGER = :DATGER,'
      '  NUMCON = :NUMCON,'
      '  NUMPED = :NUMPED,'
      '  PEDCON = :PEDCON,'
      '  PEDENV = :PEDENV,'
      '  PRECAR = :PRECAR,'
      '  QTDABE = :QTDABE,'
      '  QTDORI = :QTDORI,'
      '  SITPED = :SITPED,'
      '  TNSPRO = :TNSPRO,'
      '  USUCON = :USUCON,'
      '  USUGER = :USUGER,'
      '  VLRBCO = :VLRBCO,'
      '  VLRBIC = :VLRBIC,'
      '  VLRBIP = :VLRBIP,'
      '  VLRCOM = :VLRCOM,'
      '  VLRICM = :VLRICM,'
      '  VLRIPI = :VLRIPI,'
      '  VLRLIQ = :VLRLIQ,'
      '  VLRORI = :VLRORI'
      'where'
      '  CODEMP = :OLD_CODEMP and'
      '  CODFIL = :OLD_CODFIL and'
      '  CODREP = :OLD_CODREP and'
      '  NUMCON = :OLD_NUMCON')
    Left = 136
    Top = 440
    object CadE120PedCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E120PED"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE120PedCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Origin = '"E120PED"."CODFIL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE120PedNUMPED: TIntegerField
      FieldName = 'NUMPED'
      Origin = '"E120PED"."NUMPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE120PedNUMCON: TIntegerField
      FieldName = 'NUMCON'
      Origin = '"E120PED"."NUMCON"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE120PedCODCLI: TIntegerField
      FieldName = 'CODCLI'
      Origin = '"E120PED"."CODCLI"'
    end
    object CadE120PedTNSPRO: TIBStringField
      FieldName = 'TNSPRO'
      Origin = '"E120PED"."TNSPRO"'
      Size = 5
    end
    object CadE120PedDATEMI: TDateField
      FieldName = 'DATEMI'
      Origin = '"E120PED"."DATEMI"'
    end
    object CadE120PedCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"E120PED"."CODREP"'
    end
    object CadE120PedCODCPG: TIBStringField
      FieldName = 'CODCPG'
      Origin = '"E120PED"."CODCPG"'
      Size = 6
    end
    object CadE120PedQTDORI: TFloatField
      FieldName = 'QTDORI'
      Origin = '"E120PED"."QTDORI"'
    end
    object CadE120PedQTDABE: TFloatField
      FieldName = 'QTDABE'
      Origin = '"E120PED"."QTDABE"'
    end
    object CadE120PedVLRBIP: TFloatField
      FieldName = 'VLRBIP'
      Origin = '"E120PED"."VLRBIP"'
    end
    object CadE120PedVLRIPI: TFloatField
      FieldName = 'VLRIPI'
      Origin = '"E120PED"."VLRIPI"'
    end
    object CadE120PedVLRBIC: TFloatField
      FieldName = 'VLRBIC'
      Origin = '"E120PED"."VLRBIC"'
    end
    object CadE120PedVLRICM: TFloatField
      FieldName = 'VLRICM'
      Origin = '"E120PED"."VLRICM"'
    end
    object CadE120PedVLRBCO: TFloatField
      FieldName = 'VLRBCO'
      Origin = '"E120PED"."VLRBCO"'
    end
    object CadE120PedVLRCOM: TFloatField
      FieldName = 'VLRCOM'
      Origin = '"E120PED"."VLRCOM"'
    end
    object CadE120PedVLRLIQ: TFloatField
      FieldName = 'VLRLIQ'
      Origin = '"E120PED"."VLRLIQ"'
    end
    object CadE120PedVLRORI: TFloatField
      FieldName = 'VLRORI'
      Origin = '"E120PED"."VLRORI"'
    end
    object CadE120PedSITPED: TIBStringField
      FieldName = 'SITPED'
      Origin = '"E120PED"."SITPED"'
      FixedChar = True
      Size = 1
    end
    object CadE120PedUSUGER: TIntegerField
      FieldName = 'USUGER'
      Origin = '"E120PED"."USUGER"'
    end
    object CadE120PedDATGER: TDateField
      FieldName = 'DATGER'
      Origin = '"E120PED"."DATGER"'
    end
    object CadE120PedPEDENV: TIBStringField
      FieldName = 'PEDENV'
      Origin = '"E120PED"."PEDENV"'
      FixedChar = True
      Size = 1
    end
    object CadE120PedDATENV: TDateField
      FieldName = 'DATENV'
      Origin = '"E120PED"."DATENV"'
    end
    object CadE120PedPEDCON: TIBStringField
      FieldName = 'PEDCON'
      Origin = '"E120PED"."PEDCON"'
      FixedChar = True
      Size = 1
    end
    object CadE120PedDATCON: TDateField
      FieldName = 'DATCON'
      Origin = '"E120PED"."DATCON"'
    end
    object CadE120PedUSUCON: TIntegerField
      FieldName = 'USUCON'
      Origin = '"E120PED"."USUCON"'
    end
    object CadE120PedPRECAR: TIntegerField
      FieldName = 'PRECAR'
      Origin = '"E120PED"."PRECAR"'
    end
  end
  object CadE120Ipd: TIBDataSet
    Database = IBDBanco
    Transaction = IBDTransacao
    DeleteSQL.Strings = (
      'delete from E120IPD'
      'where'
      '  CODEMP = :OLD_CODEMP and'
      '  CODFIL = :OLD_CODFIL and'
      '  CODREP = :OLD_CODREP and'
      '  NUMCON = :OLD_NUMCON and'
      '  SEQIPD = :OLD_SEQIPD')
    InsertSQL.Strings = (
      'insert into E120IPD'
      
        '  (CODDEP, CODDER, CODEMP, CODFAM, CODFIL, CODPRO, CODREP, CODTP' +
        'R, CORGRID, '
      
        '   DATEMI, DATENT, DATGER, NUMCON, NUMPED, PERCOM, PERICM, PERIP' +
        'I, PREUNI, '
      
        '   QTDABE, QTDCAN, QTDFAT, QTDPED, SEQIPD, SITIPD, TNSPRO, TOTDE' +
        'SC, UNIMED, '
      
        '   USUGER, VLRBCO, VLRBIC, VLRBIP, VLRBRU, VLRBSI, VLRCOM, VLRIC' +
        'M, VLRICS, '
      '   VLRIPI, VLRLIQ, VLRLPR, VLRORI)'
      'values'
      
        '  (:CODDEP, :CODDER, :CODEMP, :CODFAM, :CODFIL, :CODPRO, :CODREP' +
        ', :CODTPR, '
      
        '   :CORGRID, :DATEMI, :DATENT, :DATGER, :NUMCON, :NUMPED, :PERCO' +
        'M, :PERICM, '
      
        '   :PERIPI, :PREUNI, :QTDABE, :QTDCAN, :QTDFAT, :QTDPED, :SEQIPD' +
        ', :SITIPD, '
      
        '   :TNSPRO, :TOTDESC, :UNIMED, :USUGER, :VLRBCO, :VLRBIC, :VLRBI' +
        'P, :VLRBRU, '
      
        '   :VLRBSI, :VLRCOM, :VLRICM, :VLRICS, :VLRIPI, :VLRLIQ, :VLRLPR' +
        ', :VLRORI)')
    RefreshSQL.Strings = (
      'Select '
      '  CODEMP,'
      '  CODFIL,'
      '  NUMPED,'
      '  NUMCON,'
      '  CODREP,'
      '  SEQIPD,'
      '  TNSPRO,'
      '  CODPRO,'
      '  CODDER,'
      '  CODFAM,'
      '  CODDEP,'
      '  QTDPED,'
      '  QTDFAT,'
      '  QTDCAN,'
      '  QTDABE,'
      '  UNIMED,'
      '  CODTPR,'
      '  PREUNI,'
      '  PERIPI,'
      '  PERICM,'
      '  PERCOM,'
      '  VLRBRU,'
      '  VLRBIP,'
      '  VLRIPI,'
      '  VLRBIC,'
      '  VLRICM,'
      '  VLRBSI,'
      '  VLRICS,'
      '  VLRBCO,'
      '  VLRCOM,'
      '  VLRLPR,'
      '  VLRLIQ,'
      '  SITIPD,'
      '  USUGER,'
      '  DATGER,'
      '  TOTDESC,'
      '  VLRORI,'
      '  DATEMI,'
      '  DATENT,'
      '  CORGRID'
      'from E120IPD '
      'where'
      '  CODEMP = :CODEMP and'
      '  CODFIL = :CODFIL and'
      '  CODREP = :CODREP and'
      '  NUMCON = :NUMCON and'
      '  SEQIPD = :SEQIPD')
    SelectSQL.Strings = (
      'select * from E120IPD where codemp = :codemp and'
      
        '                                               codfil = :codfil ' +
        'and'
      
        '                                               numcon = :numcon ' +
        'and'
      
        '                                               seqipd = :seqipd ' +
        'and'
      '                                               codrep = :codrep ')
    ModifySQL.Strings = (
      'update E120IPD'
      'set'
      '  CODDEP = :CODDEP,'
      '  CODDER = :CODDER,'
      '  CODEMP = :CODEMP,'
      '  CODFAM = :CODFAM,'
      '  CODFIL = :CODFIL,'
      '  CODPRO = :CODPRO,'
      '  CODREP = :CODREP,'
      '  CODTPR = :CODTPR,'
      '  CORGRID = :CORGRID,'
      '  DATEMI = :DATEMI,'
      '  DATENT = :DATENT,'
      '  DATGER = :DATGER,'
      '  NUMCON = :NUMCON,'
      '  NUMPED = :NUMPED,'
      '  PERCOM = :PERCOM,'
      '  PERICM = :PERICM,'
      '  PERIPI = :PERIPI,'
      '  PREUNI = :PREUNI,'
      '  QTDABE = :QTDABE,'
      '  QTDCAN = :QTDCAN,'
      '  QTDFAT = :QTDFAT,'
      '  QTDPED = :QTDPED,'
      '  SEQIPD = :SEQIPD,'
      '  SITIPD = :SITIPD,'
      '  TNSPRO = :TNSPRO,'
      '  TOTDESC = :TOTDESC,'
      '  UNIMED = :UNIMED,'
      '  USUGER = :USUGER,'
      '  VLRBCO = :VLRBCO,'
      '  VLRBIC = :VLRBIC,'
      '  VLRBIP = :VLRBIP,'
      '  VLRBRU = :VLRBRU,'
      '  VLRBSI = :VLRBSI,'
      '  VLRCOM = :VLRCOM,'
      '  VLRICM = :VLRICM,'
      '  VLRICS = :VLRICS,'
      '  VLRIPI = :VLRIPI,'
      '  VLRLIQ = :VLRLIQ,'
      '  VLRLPR = :VLRLPR,'
      '  VLRORI = :VLRORI'
      'where'
      '  CODEMP = :OLD_CODEMP and'
      '  CODFIL = :OLD_CODFIL and'
      '  CODREP = :OLD_CODREP and'
      '  NUMCON = :OLD_NUMCON and'
      '  SEQIPD = :OLD_SEQIPD')
    Left = 136
    Top = 488
    object CadE120IpdCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E120IPD"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE120IpdCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Origin = '"E120IPD"."CODFIL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE120IpdNUMPED: TIntegerField
      FieldName = 'NUMPED'
      Origin = '"E120IPD"."NUMPED"'
    end
    object CadE120IpdNUMCON: TIntegerField
      FieldName = 'NUMCON'
      Origin = '"E120IPD"."NUMCON"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE120IpdSEQIPD: TIntegerField
      FieldName = 'SEQIPD'
      Origin = '"E120IPD"."SEQIPD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE120IpdTNSPRO: TIBStringField
      FieldName = 'TNSPRO'
      Origin = '"E120IPD"."TNSPRO"'
      Size = 5
    end
    object CadE120IpdCODPRO: TIBStringField
      FieldName = 'CODPRO'
      Origin = '"E120IPD"."CODPRO"'
      Size = 14
    end
    object CadE120IpdCODDER: TIBStringField
      FieldName = 'CODDER'
      Origin = '"E120IPD"."CODDER"'
      Size = 7
    end
    object CadE120IpdCODFAM: TIBStringField
      FieldName = 'CODFAM'
      Origin = '"E120IPD"."CODFAM"'
      Size = 6
    end
    object CadE120IpdCODDEP: TIBStringField
      FieldName = 'CODDEP'
      Origin = '"E120IPD"."CODDEP"'
      Size = 10
    end
    object CadE120IpdQTDPED: TIntegerField
      FieldName = 'QTDPED'
      Origin = '"E120IPD"."QTDPED"'
    end
    object CadE120IpdQTDFAT: TIntegerField
      FieldName = 'QTDFAT'
      Origin = '"E120IPD"."QTDFAT"'
    end
    object CadE120IpdQTDCAN: TIntegerField
      FieldName = 'QTDCAN'
      Origin = '"E120IPD"."QTDCAN"'
    end
    object CadE120IpdQTDABE: TIntegerField
      FieldName = 'QTDABE'
      Origin = '"E120IPD"."QTDABE"'
    end
    object CadE120IpdUNIMED: TIBStringField
      FieldName = 'UNIMED'
      Origin = '"E120IPD"."UNIMED"'
      Size = 3
    end
    object CadE120IpdCODTPR: TIBStringField
      FieldName = 'CODTPR'
      Origin = '"E120IPD"."CODTPR"'
      Size = 4
    end
    object CadE120IpdPREUNI: TFloatField
      FieldName = 'PREUNI'
      Origin = '"E120IPD"."PREUNI"'
    end
    object CadE120IpdPERIPI: TFloatField
      FieldName = 'PERIPI'
      Origin = '"E120IPD"."PERIPI"'
    end
    object CadE120IpdPERICM: TFloatField
      FieldName = 'PERICM'
      Origin = '"E120IPD"."PERICM"'
    end
    object CadE120IpdPERCOM: TFloatField
      FieldName = 'PERCOM'
      Origin = '"E120IPD"."PERCOM"'
    end
    object CadE120IpdVLRBRU: TFloatField
      FieldName = 'VLRBRU'
      Origin = '"E120IPD"."VLRBRU"'
    end
    object CadE120IpdVLRBIP: TFloatField
      FieldName = 'VLRBIP'
      Origin = '"E120IPD"."VLRBIP"'
    end
    object CadE120IpdVLRIPI: TFloatField
      FieldName = 'VLRIPI'
      Origin = '"E120IPD"."VLRIPI"'
    end
    object CadE120IpdVLRBIC: TFloatField
      FieldName = 'VLRBIC'
      Origin = '"E120IPD"."VLRBIC"'
    end
    object CadE120IpdVLRICM: TFloatField
      FieldName = 'VLRICM'
      Origin = '"E120IPD"."VLRICM"'
    end
    object CadE120IpdVLRBSI: TFloatField
      FieldName = 'VLRBSI'
      Origin = '"E120IPD"."VLRBSI"'
    end
    object CadE120IpdVLRICS: TFloatField
      FieldName = 'VLRICS'
      Origin = '"E120IPD"."VLRICS"'
    end
    object CadE120IpdVLRBCO: TFloatField
      FieldName = 'VLRBCO'
      Origin = '"E120IPD"."VLRBCO"'
    end
    object CadE120IpdVLRCOM: TFloatField
      FieldName = 'VLRCOM'
      Origin = '"E120IPD"."VLRCOM"'
    end
    object CadE120IpdVLRLPR: TFloatField
      FieldName = 'VLRLPR'
      Origin = '"E120IPD"."VLRLPR"'
    end
    object CadE120IpdVLRLIQ: TFloatField
      FieldName = 'VLRLIQ'
      Origin = '"E120IPD"."VLRLIQ"'
    end
    object CadE120IpdSITIPD: TIBStringField
      FieldName = 'SITIPD'
      Origin = '"E120IPD"."SITIPD"'
      FixedChar = True
      Size = 1
    end
    object CadE120IpdUSUGER: TIntegerField
      FieldName = 'USUGER'
      Origin = '"E120IPD"."USUGER"'
    end
    object CadE120IpdDATGER: TDateField
      FieldName = 'DATGER'
      Origin = '"E120IPD"."DATGER"'
    end
    object CadE120IpdTOTDESC: TFloatField
      FieldName = 'TOTDESC'
      Origin = '"E120IPD"."TOTDESC"'
    end
    object CadE120IpdVLRORI: TFloatField
      FieldName = 'VLRORI'
      Origin = '"E120IPD"."VLRORI"'
    end
    object CadE120IpdDATEMI: TDateField
      FieldName = 'DATEMI'
      Origin = '"E120IPD"."DATEMI"'
    end
    object CadE120IpdDATENT: TDateField
      FieldName = 'DATENT'
      Origin = '"E120IPD"."DATENT"'
    end
    object CadE120IpdCORGRID: TIBStringField
      FieldName = 'CORGRID'
      Origin = '"E120IPD"."CORGRID"'
      Size = 30
    end
    object CadE120IpdCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"E120IPD"."CODREP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object ConsE120Ped: TIBQuery
    Database = IBDBanco
    Transaction = IBDTransacao
    SQL.Strings = (
      'select e120ped.* from e120ped ')
    Left = 216
    Top = 440
    object ConsE120PedCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E120PED"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120PedCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Origin = '"E120PED"."CODFIL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120PedNUMPED: TIntegerField
      FieldName = 'NUMPED'
      Origin = '"E120PED"."NUMPED"'
    end
    object ConsE120PedNUMCON: TIntegerField
      FieldName = 'NUMCON'
      Origin = '"E120PED"."NUMCON"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120PedCODCLI: TIntegerField
      FieldName = 'CODCLI'
      Origin = '"E120PED"."CODCLI"'
    end
    object ConsE120PedTNSPRO: TIBStringField
      FieldName = 'TNSPRO'
      Origin = '"E120PED"."TNSPRO"'
      Size = 5
    end
    object ConsE120PedDATEMI: TDateField
      FieldName = 'DATEMI'
      Origin = '"E120PED"."DATEMI"'
    end
    object ConsE120PedCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"E120PED"."CODREP"'
    end
    object ConsE120PedCODCPG: TIBStringField
      FieldName = 'CODCPG'
      Origin = '"E120PED"."CODCPG"'
      Size = 6
    end
    object ConsE120PedQTDORI: TFloatField
      FieldName = 'QTDORI'
      Origin = '"E120PED"."QTDORI"'
    end
    object ConsE120PedQTDABE: TFloatField
      FieldName = 'QTDABE'
      Origin = '"E120PED"."QTDABE"'
    end
    object ConsE120PedVLRBIP: TFloatField
      FieldName = 'VLRBIP'
      Origin = '"E120PED"."VLRBIP"'
    end
    object ConsE120PedVLRIPI: TFloatField
      FieldName = 'VLRIPI'
      Origin = '"E120PED"."VLRIPI"'
    end
    object ConsE120PedVLRBIC: TFloatField
      FieldName = 'VLRBIC'
      Origin = '"E120PED"."VLRBIC"'
    end
    object ConsE120PedVLRICM: TFloatField
      FieldName = 'VLRICM'
      Origin = '"E120PED"."VLRICM"'
    end
    object ConsE120PedVLRBCO: TFloatField
      FieldName = 'VLRBCO'
      Origin = '"E120PED"."VLRBCO"'
    end
    object ConsE120PedVLRCOM: TFloatField
      FieldName = 'VLRCOM'
      Origin = '"E120PED"."VLRCOM"'
    end
    object ConsE120PedVLRLIQ: TFloatField
      FieldName = 'VLRLIQ'
      Origin = '"E120PED"."VLRLIQ"'
    end
    object ConsE120PedVLRORI: TFloatField
      FieldName = 'VLRORI'
      Origin = '"E120PED"."VLRORI"'
    end
    object ConsE120PedSITPED: TIBStringField
      FieldName = 'SITPED'
      Origin = '"E120PED"."SITPED"'
      FixedChar = True
      Size = 1
    end
    object ConsE120PedUSUGER: TIntegerField
      FieldName = 'USUGER'
      Origin = '"E120PED"."USUGER"'
    end
    object ConsE120PedDATGER: TDateField
      FieldName = 'DATGER'
      Origin = '"E120PED"."DATGER"'
    end
    object ConsE120PedPEDENV: TIBStringField
      FieldName = 'PEDENV'
      Origin = '"E120PED"."PEDENV"'
      FixedChar = True
      Size = 1
    end
    object ConsE120PedDATENV: TDateField
      FieldName = 'DATENV'
      Origin = '"E120PED"."DATENV"'
    end
    object ConsE120PedPEDCON: TIBStringField
      FieldName = 'PEDCON'
      Origin = '"E120PED"."PEDCON"'
      FixedChar = True
      Size = 1
    end
    object ConsE120PedDATCON: TDateField
      FieldName = 'DATCON'
      Origin = '"E120PED"."DATCON"'
    end
    object ConsE120PedUSUCON: TIntegerField
      FieldName = 'USUCON'
      Origin = '"E120PED"."USUCON"'
    end
    object ConsE120PedPRECAR: TIntegerField
      FieldName = 'PRECAR'
      Origin = '"E120PED"."PRECAR"'
    end
  end
  object ConsE120Ipd: TIBQuery
    Database = IBDBanco
    Transaction = IBDTransacao
    AfterScroll = ConsE120IpdAfterScroll
    SQL.Strings = (
      'select e120ipd.*,e075pro.despro,e075der.* from e120ipd'
      'inner join e075pro on e075pro.codemp = e120ipd.codemp and'
      '                      e075pro.codpro = e120ipd.codpro'
      'inner join e075der on e075der.codemp = e120ipd.codemp and'
      '                      e075der.codpro = e120ipd.codpro and'
      '                      e075der.codder = e120ipd.codder'
      '                      where'
      '                      e120ipd.codemp = 1 and'
      '                      e120ipd.codfil = 1 and'
      '                      e120ipd.numcon = :numcon and'
      '                      e120ipd.codrep = :codrep'
      '                      order by e120ipd.codpro')
    Left = 216
    Top = 488
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numcon'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codrep'
        ParamType = ptUnknown
      end>
    object ConsE120IpdCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E120IPD"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120IpdCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Origin = '"E120IPD"."CODFIL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120IpdNUMPED: TIntegerField
      FieldName = 'NUMPED'
      Origin = '"E120IPD"."NUMPED"'
    end
    object ConsE120IpdNUMCON: TIntegerField
      FieldName = 'NUMCON'
      Origin = '"E120IPD"."NUMCON"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120IpdSEQIPD: TIntegerField
      FieldName = 'SEQIPD'
      Origin = '"E120IPD"."SEQIPD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120IpdTNSPRO: TIBStringField
      FieldName = 'TNSPRO'
      Origin = '"E120IPD"."TNSPRO"'
      Size = 5
    end
    object ConsE120IpdCODPRO: TIBStringField
      FieldName = 'CODPRO'
      Origin = '"E120IPD"."CODPRO"'
      Size = 14
    end
    object ConsE120IpdCODDER: TIBStringField
      FieldName = 'CODDER'
      Origin = '"E120IPD"."CODDER"'
      Size = 7
    end
    object ConsE120IpdCODFAM: TIBStringField
      FieldName = 'CODFAM'
      Origin = '"E120IPD"."CODFAM"'
      Size = 6
    end
    object ConsE120IpdCODDEP: TIBStringField
      FieldName = 'CODDEP'
      Origin = '"E120IPD"."CODDEP"'
      Size = 10
    end
    object ConsE120IpdQTDPED: TIntegerField
      FieldName = 'QTDPED'
      Origin = '"E120IPD"."QTDPED"'
    end
    object ConsE120IpdQTDFAT: TIntegerField
      FieldName = 'QTDFAT'
      Origin = '"E120IPD"."QTDFAT"'
    end
    object ConsE120IpdQTDCAN: TIntegerField
      FieldName = 'QTDCAN'
      Origin = '"E120IPD"."QTDCAN"'
    end
    object ConsE120IpdQTDABE: TIntegerField
      FieldName = 'QTDABE'
      Origin = '"E120IPD"."QTDABE"'
    end
    object ConsE120IpdUNIMED: TIBStringField
      FieldName = 'UNIMED'
      Origin = '"E120IPD"."UNIMED"'
      Size = 3
    end
    object ConsE120IpdCODTPR: TIBStringField
      FieldName = 'CODTPR'
      Origin = '"E120IPD"."CODTPR"'
      Size = 4
    end
    object ConsE120IpdPREUNI: TFloatField
      FieldName = 'PREUNI'
      Origin = '"E120IPD"."PREUNI"'
      DisplayFormat = ' ,0.00;- ,0.00'
      EditFormat = ' ,0.00;- ,0.00'
    end
    object ConsE120IpdPERIPI: TFloatField
      FieldName = 'PERIPI'
      Origin = '"E120IPD"."PERIPI"'
      DisplayFormat = ' ,0.00;- ,0.00'
      EditFormat = ' ,0.00;- ,0.00'
    end
    object ConsE120IpdPERICM: TFloatField
      FieldName = 'PERICM'
      Origin = '"E120IPD"."PERICM"'
      DisplayFormat = ' ,0.00;- ,0.00'
      EditFormat = ' ,0.00;- ,0.00'
    end
    object ConsE120IpdPERCOM: TFloatField
      FieldName = 'PERCOM'
      Origin = '"E120IPD"."PERCOM"'
      DisplayFormat = ' ,0.00;- ,0.00'
      EditFormat = ' ,0.00;- ,0.00'
    end
    object ConsE120IpdVLRBRU: TFloatField
      FieldName = 'VLRBRU'
      Origin = '"E120IPD"."VLRBRU"'
      DisplayFormat = ' ,0.00;- ,0.00'
      EditFormat = ' ,0.00;- ,0.00'
    end
    object ConsE120IpdVLRBIP: TFloatField
      FieldName = 'VLRBIP'
      Origin = '"E120IPD"."VLRBIP"'
      DisplayFormat = ' ,0.00;- ,0.00'
      EditFormat = ' ,0.00;- ,0.00'
    end
    object ConsE120IpdVLRIPI: TFloatField
      FieldName = 'VLRIPI'
      Origin = '"E120IPD"."VLRIPI"'
      DisplayFormat = ' ,0.00;- ,0.00'
      EditFormat = ' ,0.00;- ,0.00'
    end
    object ConsE120IpdVLRBIC: TFloatField
      FieldName = 'VLRBIC'
      Origin = '"E120IPD"."VLRBIC"'
      DisplayFormat = ' ,0.00;- ,0.00'
      EditFormat = ' ,0.00;- ,0.00'
    end
    object ConsE120IpdVLRICM: TFloatField
      FieldName = 'VLRICM'
      Origin = '"E120IPD"."VLRICM"'
      DisplayFormat = ' ,0.00;- ,0.00'
      EditFormat = ' ,0.00;- ,0.00'
    end
    object ConsE120IpdVLRBSI: TFloatField
      FieldName = 'VLRBSI'
      Origin = '"E120IPD"."VLRBSI"'
      DisplayFormat = ' ,0.00;- ,0.00'
      EditFormat = ' ,0.00;- ,0.00'
    end
    object ConsE120IpdVLRICS: TFloatField
      FieldName = 'VLRICS'
      Origin = '"E120IPD"."VLRICS"'
      DisplayFormat = ' ,0.00;- ,0.00'
      EditFormat = ' ,0.00;- ,0.00'
    end
    object ConsE120IpdVLRBCO: TFloatField
      FieldName = 'VLRBCO'
      Origin = '"E120IPD"."VLRBCO"'
      DisplayFormat = ' ,0.00;- ,0.00'
      EditFormat = ' ,0.00;- ,0.00'
    end
    object ConsE120IpdVLRCOM: TFloatField
      FieldName = 'VLRCOM'
      Origin = '"E120IPD"."VLRCOM"'
      DisplayFormat = ' ,0.00;- ,0.00'
      EditFormat = ' ,0.00;- ,0.00'
    end
    object ConsE120IpdVLRLPR: TFloatField
      FieldName = 'VLRLPR'
      Origin = '"E120IPD"."VLRLPR"'
      DisplayFormat = ' ,0.00;- ,0.00'
      EditFormat = ' ,0.00;- ,0.00'
    end
    object ConsE120IpdVLRLIQ: TFloatField
      FieldName = 'VLRLIQ'
      Origin = '"E120IPD"."VLRLIQ"'
      DisplayFormat = ' ,0.00;- ,0.00'
      EditFormat = ' ,0.00;- ,0.00'
    end
    object ConsE120IpdSITIPD: TIBStringField
      FieldName = 'SITIPD'
      Origin = '"E120IPD"."SITIPD"'
      FixedChar = True
      Size = 1
    end
    object ConsE120IpdUSUGER: TIntegerField
      FieldName = 'USUGER'
      Origin = '"E120IPD"."USUGER"'
    end
    object ConsE120IpdDATGER: TDateField
      FieldName = 'DATGER'
      Origin = '"E120IPD"."DATGER"'
    end
    object ConsE120IpdTOTDESC: TFloatField
      FieldName = 'TOTDESC'
      Origin = '"E120IPD"."TOTDESC"'
      DisplayFormat = ' ,0.00;- ,0.00'
      EditFormat = ' ,0.00;- ,0.00'
    end
    object ConsE120IpdVLRORI: TFloatField
      FieldName = 'VLRORI'
      Origin = '"E120IPD"."VLRORI"'
      DisplayFormat = ' ,0.00;- ,0.00'
      EditFormat = ' ,0.00;- ,0.00'
    end
    object ConsE120IpdDESPRO: TIBStringField
      FieldName = 'DESPRO'
      Origin = '"E075PRO"."DESPRO"'
      Size = 100
    end
    object ConsE120IpdCODEMP1: TIntegerField
      FieldName = 'CODEMP1'
      Origin = '"E075DER"."CODEMP"'
      Required = True
    end
    object ConsE120IpdCODPRO1: TIBStringField
      FieldName = 'CODPRO1'
      Origin = '"E075DER"."CODPRO"'
      Required = True
      Size = 14
    end
    object ConsE120IpdCODDER1: TIBStringField
      FieldName = 'CODDER1'
      Origin = '"E075DER"."CODDER"'
      Required = True
      Size = 7
    end
    object ConsE120IpdDESDER: TIBStringField
      FieldName = 'DESDER'
      Origin = '"E075DER"."DESDER"'
      Size = 50
    end
    object ConsE120IpdPESBRU: TFloatField
      FieldName = 'PESBRU'
      Origin = '"E075DER"."PESBRU"'
    end
    object ConsE120IpdPESLIQ: TFloatField
      FieldName = 'PESLIQ'
      Origin = '"E075DER"."PESLIQ"'
    end
    object ConsE120IpdVOLDER: TFloatField
      FieldName = 'VOLDER'
      Origin = '"E075DER"."VOLDER"'
    end
    object ConsE120IpdSITDER: TIBStringField
      FieldName = 'SITDER'
      Origin = '"E075DER"."SITDER"'
      FixedChar = True
      Size = 1
    end
    object ConsE120IpdCORUNI: TFloatField
      FieldName = 'CORUNI'
      Origin = '"E075DER"."CORUNI"'
    end
    object ConsE120IpdCMP1BB: TFloatField
      FieldName = 'CMP1BB'
      Origin = '"E075DER"."CMP1BB"'
    end
    object ConsE120IpdCMP1AC: TFloatField
      FieldName = 'CMP1AC'
      Origin = '"E075DER"."CMP1AC"'
    end
    object ConsE120IpdCMP2BB: TFloatField
      FieldName = 'CMP2BB'
      Origin = '"E075DER"."CMP2BB"'
    end
    object ConsE120IpdCMP2EN: TFloatField
      FieldName = 'CMP2EN'
      Origin = '"E075DER"."CMP2EN"'
    end
    object ConsE120IpdDATEMI: TDateField
      FieldName = 'DATEMI'
      Origin = '"E120IPD"."DATEMI"'
    end
    object ConsE120IpdDATENT: TDateField
      FieldName = 'DATENT'
      Origin = '"E120IPD"."DATENT"'
    end
    object ConsE120IpdCORGRID: TIBStringField
      FieldName = 'CORGRID'
      Origin = '"E120IPD"."CORGRID"'
      Size = 30
    end
    object ConsE120IpdCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"E120IPD"."CODREP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object CadUsu120Ipd: TIBDataSet
    Database = IBDBanco
    Transaction = IBDTransacao
    DeleteSQL.Strings = (
      'delete from USU120IPD'
      'where'
      '  CODEMP = :OLD_CODEMP and'
      '  CODFIL = :OLD_CODFIL and'
      '  CODREP = :OLD_CODREP and'
      '  NUMCON = :OLD_NUMCON and'
      '  SEQIPD = :OLD_SEQIPD and'
      '  SEQITE = :OLD_SEQITE')
    InsertSQL.Strings = (
      'insert into USU120IPD'
      
        '  (CODDER, CODEMP, CODFIL, CODPRO, CODREP, COR001, COR002, NUMCO' +
        'N, NUMPED, '
      
        '   PRECAR, QTDABE, QTDCAN, QTDCOR, SEQIPD, SEQITE, TECTRA, TIPCM' +
        'B)'
      'values'
      
        '  (:CODDER, :CODEMP, :CODFIL, :CODPRO, :CODREP, :COR001, :COR002' +
        ', :NUMCON, '
      
        '   :NUMPED, :PRECAR, :QTDABE, :QTDCAN, :QTDCOR, :SEQIPD, :SEQITE' +
        ', :TECTRA, '
      '   :TIPCMB)')
    RefreshSQL.Strings = (
      'Select '
      '  CODEMP,'
      '  CODFIL,'
      '  NUMCON,'
      '  CODREP,'
      '  SEQIPD,'
      '  SEQITE,'
      '  NUMPED,'
      '  QTDCOR,'
      '  QTDABE,'
      '  QTDCAN,'
      '  TIPCMB,'
      '  COR001,'
      '  COR002,'
      '  CODPRO,'
      '  CODDER,'
      '  TECTRA,'
      '  PRECAR'
      'from USU120IPD '
      'where'
      '  CODEMP = :CODEMP and'
      '  CODFIL = :CODFIL and'
      '  CODREP = :CODREP and'
      '  NUMCON = :NUMCON and'
      '  SEQIPD = :SEQIPD and'
      '  SEQITE = :SEQITE')
    SelectSQL.Strings = (
      'select * from USU120IPD where codemp = :codemp and'
      
        '                                                    codfil = :co' +
        'dfil and'
      
        '                                                    numcon = :nu' +
        'mcon and '
      
        '                                                    seqipd = :se' +
        'qipd and'
      
        '                                                    seqite = :se' +
        'qite and'
      
        '                                                    codrep = :co' +
        'drep')
    ModifySQL.Strings = (
      'update USU120IPD'
      'set'
      '  CODDER = :CODDER,'
      '  CODEMP = :CODEMP,'
      '  CODFIL = :CODFIL,'
      '  CODPRO = :CODPRO,'
      '  CODREP = :CODREP,'
      '  COR001 = :COR001,'
      '  COR002 = :COR002,'
      '  NUMCON = :NUMCON,'
      '  NUMPED = :NUMPED,'
      '  PRECAR = :PRECAR,'
      '  QTDABE = :QTDABE,'
      '  QTDCAN = :QTDCAN,'
      '  QTDCOR = :QTDCOR,'
      '  SEQIPD = :SEQIPD,'
      '  SEQITE = :SEQITE,'
      '  TECTRA = :TECTRA,'
      '  TIPCMB = :TIPCMB'
      'where'
      '  CODEMP = :OLD_CODEMP and'
      '  CODFIL = :OLD_CODFIL and'
      '  CODREP = :OLD_CODREP and'
      '  NUMCON = :OLD_NUMCON and'
      '  SEQIPD = :OLD_SEQIPD and'
      '  SEQITE = :OLD_SEQITE')
    Left = 136
    Top = 536
    object CadUsu120IpdCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"USU120IPD"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadUsu120IpdCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Origin = '"USU120IPD"."CODFIL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadUsu120IpdNUMCON: TIntegerField
      FieldName = 'NUMCON'
      Origin = '"USU120IPD"."NUMCON"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadUsu120IpdSEQIPD: TIntegerField
      FieldName = 'SEQIPD'
      Origin = '"USU120IPD"."SEQIPD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadUsu120IpdSEQITE: TIntegerField
      FieldName = 'SEQITE'
      Origin = '"USU120IPD"."SEQITE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadUsu120IpdNUMPED: TIntegerField
      FieldName = 'NUMPED'
      Origin = '"USU120IPD"."NUMPED"'
    end
    object CadUsu120IpdQTDCOR: TIntegerField
      FieldName = 'QTDCOR'
      Origin = '"USU120IPD"."QTDCOR"'
    end
    object CadUsu120IpdQTDABE: TIntegerField
      FieldName = 'QTDABE'
      Origin = '"USU120IPD"."QTDABE"'
    end
    object CadUsu120IpdQTDCAN: TIntegerField
      FieldName = 'QTDCAN'
      Origin = '"USU120IPD"."QTDCAN"'
    end
    object CadUsu120IpdTIPCMB: TIntegerField
      FieldName = 'TIPCMB'
      Origin = '"USU120IPD"."TIPCMB"'
    end
    object CadUsu120IpdCOR001: TIBStringField
      FieldName = 'COR001'
      Origin = '"USU120IPD"."COR001"'
      Size = 14
    end
    object CadUsu120IpdCOR002: TIBStringField
      FieldName = 'COR002'
      Origin = '"USU120IPD"."COR002"'
      Size = 14
    end
    object CadUsu120IpdCODPRO: TIBStringField
      FieldName = 'CODPRO'
      Origin = '"USU120IPD"."CODPRO"'
      Size = 14
    end
    object CadUsu120IpdCODDER: TIBStringField
      FieldName = 'CODDER'
      Origin = '"USU120IPD"."CODDER"'
      Size = 7
    end
    object CadUsu120IpdTECTRA: TIBStringField
      FieldName = 'TECTRA'
      Origin = '"USU120IPD"."TECTRA"'
      FixedChar = True
      Size = 1
    end
    object CadUsu120IpdPRECAR: TIntegerField
      FieldName = 'PRECAR'
      Origin = '"USU120IPD"."PRECAR"'
    end
    object CadUsu120IpdCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"USU120IPD"."CODREP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object ConsUsu120Ipd: TIBQuery
    Database = IBDBanco
    Transaction = IBDTransacao
    SQL.Strings = (
      'select * from USU120IPD where codemp = :codemp and'
      
        '                                                    codfil = :co' +
        'dfil and'
      
        '                                                    numcon = :nu' +
        'mcon and'
      
        '                                                    codrep = :co' +
        'drep and'
      
        '                                                    seqipd = :se' +
        'qipd ')
    Left = 224
    Top = 536
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codemp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codfil'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numcon'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codrep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'seqipd'
        ParamType = ptUnknown
      end>
    object ConsUsu120IpdCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"USU120IPD"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsUsu120IpdCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Origin = '"USU120IPD"."CODFIL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsUsu120IpdNUMCON: TIntegerField
      FieldName = 'NUMCON'
      Origin = '"USU120IPD"."NUMCON"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsUsu120IpdSEQIPD: TIntegerField
      FieldName = 'SEQIPD'
      Origin = '"USU120IPD"."SEQIPD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsUsu120IpdSEQITE: TIntegerField
      FieldName = 'SEQITE'
      Origin = '"USU120IPD"."SEQITE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsUsu120IpdNUMPED: TIntegerField
      FieldName = 'NUMPED'
      Origin = '"USU120IPD"."NUMPED"'
    end
    object ConsUsu120IpdQTDCOR: TIntegerField
      FieldName = 'QTDCOR'
      Origin = '"USU120IPD"."QTDCOR"'
    end
    object ConsUsu120IpdQTDABE: TIntegerField
      FieldName = 'QTDABE'
      Origin = '"USU120IPD"."QTDABE"'
    end
    object ConsUsu120IpdQTDCAN: TIntegerField
      FieldName = 'QTDCAN'
      Origin = '"USU120IPD"."QTDCAN"'
    end
    object ConsUsu120IpdTIPCMB: TIntegerField
      FieldName = 'TIPCMB'
      Origin = '"USU120IPD"."TIPCMB"'
    end
    object ConsUsu120IpdCOR001: TIBStringField
      FieldName = 'COR001'
      Origin = '"USU120IPD"."COR001"'
      Size = 14
    end
    object ConsUsu120IpdCOR002: TIBStringField
      FieldName = 'COR002'
      Origin = '"USU120IPD"."COR002"'
      Size = 14
    end
    object ConsUsu120IpdCODPRO: TIBStringField
      FieldName = 'CODPRO'
      Origin = '"USU120IPD"."CODPRO"'
      Size = 14
    end
    object ConsUsu120IpdCODDER: TIBStringField
      FieldName = 'CODDER'
      Origin = '"USU120IPD"."CODDER"'
      Size = 7
    end
    object ConsUsu120IpdTECTRA: TIBStringField
      FieldName = 'TECTRA'
      Origin = '"USU120IPD"."TECTRA"'
      FixedChar = True
      Size = 1
    end
    object ConsUsu120IpdPRECAR: TIntegerField
      FieldName = 'PRECAR'
      Origin = '"USU120IPD"."PRECAR"'
    end
    object ConsUsu120IpdCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"USU120IPD"."CODREP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object CadE120Obs: TIBDataSet
    Database = IBDBanco
    Transaction = IBDTransacao
    DeleteSQL.Strings = (
      'delete from E120OBS'
      'where'
      '  CODEMP = :OLD_CODEMP and'
      '  CODFIL = :OLD_CODFIL and'
      '  CODREP = :OLD_CODREP and'
      '  NUMCON = :OLD_NUMCON and'
      '  SEQOBS = :OLD_SEQOBS')
    InsertSQL.Strings = (
      'insert into E120OBS'
      
        '  (CODEMP, CODFIL, CODREP, NUMCON, NUMPED, OBSDAT, OBSPED, OBSUS' +
        'U, SEQOBS, '
      '   SITOBS)'
      'values'
      
        '  (:CODEMP, :CODFIL, :CODREP, :NUMCON, :NUMPED, :OBSDAT, :OBSPED' +
        ', :OBSUSU, '
      '   :SEQOBS, :SITOBS)')
    RefreshSQL.Strings = (
      'Select '
      '  CODEMP,'
      '  CODFIL,'
      '  NUMCON,'
      '  CODREP,'
      '  SEQOBS,'
      '  NUMPED,'
      '  OBSPED,'
      '  SITOBS,'
      '  OBSUSU,'
      '  OBSDAT'
      'from E120OBS '
      'where'
      '  CODEMP = :CODEMP and'
      '  CODFIL = :CODFIL and'
      '  CODREP = :CODREP and'
      '  NUMCON = :NUMCON and'
      '  SEQOBS = :SEQOBS')
    SelectSQL.Strings = (
      'select * from E120OBS where codemp = :codemp and'
      
        '                                                codfil = :codfil' +
        ' and'
      
        '                                                numcon = :numcon' +
        ' and'
      
        '                                                seqobs = :seqobs' +
        ' and'
      '                                                codrep = :codrep')
    ModifySQL.Strings = (
      'update E120OBS'
      'set'
      '  CODEMP = :CODEMP,'
      '  CODFIL = :CODFIL,'
      '  CODREP = :CODREP,'
      '  NUMCON = :NUMCON,'
      '  NUMPED = :NUMPED,'
      '  OBSDAT = :OBSDAT,'
      '  OBSPED = :OBSPED,'
      '  OBSUSU = :OBSUSU,'
      '  SEQOBS = :SEQOBS,'
      '  SITOBS = :SITOBS'
      'where'
      '  CODEMP = :OLD_CODEMP and'
      '  CODFIL = :OLD_CODFIL and'
      '  CODREP = :OLD_CODREP and'
      '  NUMCON = :OLD_NUMCON and'
      '  SEQOBS = :OLD_SEQOBS')
    Left = 136
    Top = 584
    object CadE120ObsCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E120OBS"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE120ObsCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Origin = '"E120OBS"."CODFIL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE120ObsNUMCON: TIntegerField
      FieldName = 'NUMCON'
      Origin = '"E120OBS"."NUMCON"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE120ObsSEQOBS: TIntegerField
      FieldName = 'SEQOBS'
      Origin = '"E120OBS"."SEQOBS"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE120ObsNUMPED: TIntegerField
      FieldName = 'NUMPED'
      Origin = '"E120OBS"."NUMPED"'
    end
    object CadE120ObsOBSPED: TIBStringField
      FieldName = 'OBSPED'
      Origin = '"E120OBS"."OBSPED"'
      Size = 250
    end
    object CadE120ObsSITOBS: TIBStringField
      FieldName = 'SITOBS'
      Origin = '"E120OBS"."SITOBS"'
      FixedChar = True
      Size = 1
    end
    object CadE120ObsOBSUSU: TIntegerField
      FieldName = 'OBSUSU'
      Origin = '"E120OBS"."OBSUSU"'
    end
    object CadE120ObsOBSDAT: TDateField
      FieldName = 'OBSDAT'
      Origin = '"E120OBS"."OBSDAT"'
    end
    object CadE120ObsCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"E120OBS"."CODREP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object E120ObsSeqObs: TIBQuery
    Database = IBDBanco
    Transaction = IBDTransacao
    SQL.Strings = (
      'select max(seqobs) as ultimo from e120obs where'
      
        '                                                                ' +
        '     codemp = :codemp and'
      
        '                                                                ' +
        '     codfil = :codfil and'
      
        '                                                                ' +
        '     numcon = :numcon and'
      
        '                                                                ' +
        '     codrep = :codrep')
    Left = 224
    Top = 584
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codemp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codfil'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numcon'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codrep'
        ParamType = ptUnknown
      end>
    object E120ObsSeqObsULTIMO: TIntegerField
      FieldName = 'ULTIMO'
      ProviderFlags = []
    end
  end
  object ConsE120Obs: TIBQuery
    Database = IBDBanco
    Transaction = IBDTransacao
    SQL.Strings = (
      'select * from E120OBS where codemp = :codemp and'
      
        '                                                codfil = :codfil' +
        ' and'
      
        '                                                numcon = :numcon' +
        ' and'
      '                                                codrep = :codrep')
    Left = 312
    Top = 584
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codemp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codfil'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numcon'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codrep'
        ParamType = ptUnknown
      end>
    object ConsE120ObsCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E120OBS"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120ObsCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Origin = '"E120OBS"."CODFIL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120ObsNUMCON: TIntegerField
      FieldName = 'NUMCON'
      Origin = '"E120OBS"."NUMCON"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120ObsSEQOBS: TIntegerField
      FieldName = 'SEQOBS'
      Origin = '"E120OBS"."SEQOBS"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120ObsNUMPED: TIntegerField
      FieldName = 'NUMPED'
      Origin = '"E120OBS"."NUMPED"'
    end
    object ConsE120ObsOBSPED: TIBStringField
      FieldName = 'OBSPED'
      Origin = '"E120OBS"."OBSPED"'
      Size = 250
    end
    object ConsE120ObsSITOBS: TIBStringField
      FieldName = 'SITOBS'
      Origin = '"E120OBS"."SITOBS"'
      FixedChar = True
      Size = 1
    end
    object ConsE120ObsOBSUSU: TIntegerField
      FieldName = 'OBSUSU'
      Origin = '"E120OBS"."OBSUSU"'
    end
    object ConsE120ObsOBSDAT: TDateField
      FieldName = 'OBSDAT'
      Origin = '"E120OBS"."OBSDAT"'
    end
    object ConsE120ObsCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"E120OBS"."CODREP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object ApagaE075Ldc: TIBQuery
    Database = IBDBanco
    Transaction = IBDTransacao
    SQL.Strings = (
      'delete from e075ldc')
    Left = 528
    Top = 328
  end
  object ConsE120PedAgdConf: TIBQuery
    Database = IBDBanco
    Transaction = IBDTransacao
    SQL.Strings = (
      'select e120ped.*,e085cli.nomcli,'
      '(select sum(e120ipd.vlrbru) from e120ipd where'
      '                      e120ipd.codemp = e120ped.codemp and'
      '                      e120ipd.codfil = e120ped.codfil and'
      '                      e120ipd.numcon = e120ped.numcon and'
      
        '                      e120ipd.codrep = e120ped.codrep) as VlrBru' +
        ','
      '(select sum(e120ipd.qtdabe *(select e075der.volder from e075der'
      '                                              where'
      
        '                                              e075der.codemp = e' +
        '120ipd.codemp and'
      
        '                                              e075der.codpro = e' +
        '120ipd.codpro and'
      
        '                                              e075der.codder = e' +
        '120ipd.codder ))'
      '                                              from e120ipd'
      '                                              where'
      
        '                                              e120ipd.codemp = e' +
        '120ped.codemp and'
      
        '                                              e120ipd.codfil = e' +
        '120ped.codfil and'
      
        '                                              e120ipd.numcon = e' +
        '120ped.numcon and'
      
        '                                              e120ipd.codrep = e' +
        '120ped.codrep) as volume'
      '                      from e120ped'
      'inner join e085cli on e085cli.codcli = e120ped.codcli'
      '                                               where'
      
        '                                               e120ped.pedenv = ' +
        #39'S'#39' and'
      
        '                                               e120ped.pedcon = ' +
        #39'N'#39)
    Left = 568
    Top = 480
    object ConsE120PedAgdConfCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E120PED"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120PedAgdConfCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Origin = '"E120PED"."CODFIL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120PedAgdConfNUMPED: TIntegerField
      FieldName = 'NUMPED'
      Origin = '"E120PED"."NUMPED"'
    end
    object ConsE120PedAgdConfNUMCON: TIntegerField
      FieldName = 'NUMCON'
      Origin = '"E120PED"."NUMCON"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120PedAgdConfCODCLI: TIntegerField
      FieldName = 'CODCLI'
      Origin = '"E120PED"."CODCLI"'
    end
    object ConsE120PedAgdConfTNSPRO: TIBStringField
      FieldName = 'TNSPRO'
      Origin = '"E120PED"."TNSPRO"'
      Size = 5
    end
    object ConsE120PedAgdConfDATEMI: TDateField
      FieldName = 'DATEMI'
      Origin = '"E120PED"."DATEMI"'
    end
    object ConsE120PedAgdConfCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"E120PED"."CODREP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120PedAgdConfCODCPG: TIBStringField
      FieldName = 'CODCPG'
      Origin = '"E120PED"."CODCPG"'
      Size = 6
    end
    object ConsE120PedAgdConfQTDORI: TFloatField
      FieldName = 'QTDORI'
      Origin = '"E120PED"."QTDORI"'
    end
    object ConsE120PedAgdConfQTDABE: TFloatField
      FieldName = 'QTDABE'
      Origin = '"E120PED"."QTDABE"'
    end
    object ConsE120PedAgdConfVLRBIP: TFloatField
      FieldName = 'VLRBIP'
      Origin = '"E120PED"."VLRBIP"'
    end
    object ConsE120PedAgdConfVLRIPI: TFloatField
      FieldName = 'VLRIPI'
      Origin = '"E120PED"."VLRIPI"'
    end
    object ConsE120PedAgdConfVLRBIC: TFloatField
      FieldName = 'VLRBIC'
      Origin = '"E120PED"."VLRBIC"'
    end
    object ConsE120PedAgdConfVLRICM: TFloatField
      FieldName = 'VLRICM'
      Origin = '"E120PED"."VLRICM"'
    end
    object ConsE120PedAgdConfVLRBCO: TFloatField
      FieldName = 'VLRBCO'
      Origin = '"E120PED"."VLRBCO"'
    end
    object ConsE120PedAgdConfVLRCOM: TFloatField
      FieldName = 'VLRCOM'
      Origin = '"E120PED"."VLRCOM"'
    end
    object ConsE120PedAgdConfVLRLIQ: TFloatField
      FieldName = 'VLRLIQ'
      Origin = '"E120PED"."VLRLIQ"'
    end
    object ConsE120PedAgdConfVLRORI: TFloatField
      FieldName = 'VLRORI'
      Origin = '"E120PED"."VLRORI"'
    end
    object ConsE120PedAgdConfSITPED: TIBStringField
      FieldName = 'SITPED'
      Origin = '"E120PED"."SITPED"'
      FixedChar = True
      Size = 1
    end
    object ConsE120PedAgdConfUSUGER: TIntegerField
      FieldName = 'USUGER'
      Origin = '"E120PED"."USUGER"'
    end
    object ConsE120PedAgdConfDATGER: TDateField
      FieldName = 'DATGER'
      Origin = '"E120PED"."DATGER"'
    end
    object ConsE120PedAgdConfPEDENV: TIBStringField
      FieldName = 'PEDENV'
      Origin = '"E120PED"."PEDENV"'
      FixedChar = True
      Size = 1
    end
    object ConsE120PedAgdConfDATENV: TDateField
      FieldName = 'DATENV'
      Origin = '"E120PED"."DATENV"'
    end
    object ConsE120PedAgdConfPEDCON: TIBStringField
      FieldName = 'PEDCON'
      Origin = '"E120PED"."PEDCON"'
      FixedChar = True
      Size = 1
    end
    object ConsE120PedAgdConfDATCON: TDateField
      FieldName = 'DATCON'
      Origin = '"E120PED"."DATCON"'
    end
    object ConsE120PedAgdConfUSUCON: TIntegerField
      FieldName = 'USUCON'
      Origin = '"E120PED"."USUCON"'
    end
    object ConsE120PedAgdConfPRECAR: TIntegerField
      FieldName = 'PRECAR'
      Origin = '"E120PED"."PRECAR"'
    end
    object ConsE120PedAgdConfNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Origin = '"E085CLI"."NOMCLI"'
      Size = 100
    end
    object ConsE120PedAgdConfVLRBRU: TFloatField
      FieldName = 'VLRBRU'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ConsE120PedAgdConfVOLUME: TFloatField
      FieldName = 'VOLUME'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
  end
  object ConsE120PedSuspenso: TIBQuery
    Database = IBDBanco
    Transaction = IBDTransacao
    SQL.Strings = (
      'select e120ped.*,e085cli.nomcli,'
      '(select sum(e120ipd.vlrbru) from e120ipd where'
      '                      e120ipd.codemp = e120ped.codemp and'
      '                      e120ipd.codfil = e120ped.codfil and'
      '                      e120ipd.numcon = e120ped.numcon and'
      
        '                      e120ipd.codrep = e120ped.codrep) as VlrBru' +
        ','
      '(select sum(e120ipd.qtdabe *(select e075der.volder from e075der'
      '                                              where'
      
        '                                              e075der.codemp = e' +
        '120ipd.codemp and'
      
        '                                              e075der.codpro = e' +
        '120ipd.codpro and'
      
        '                                              e075der.codder = e' +
        '120ipd.codder ))'
      '                                              from e120ipd'
      '                                              where'
      
        '                                              e120ipd.codemp = e' +
        '120ped.codemp and'
      
        '                                              e120ipd.codfil = e' +
        '120ped.codfil and'
      
        '                                              e120ipd.numcon = e' +
        '120ped.numcon and'
      
        '                                              e120ipd.codrep = e' +
        '120ped.codrep) as volume'
      '                      from e120ped'
      'inner join e085cli on e085cli.codcli = e120ped.codcli'
      '                                               where'
      
        '                                               e120ped.sitped = ' +
        '3')
    Left = 568
    Top = 528
    object ConsE120PedSuspensoCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E120PED"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120PedSuspensoCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Origin = '"E120PED"."CODFIL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120PedSuspensoNUMPED: TIntegerField
      FieldName = 'NUMPED'
      Origin = '"E120PED"."NUMPED"'
    end
    object ConsE120PedSuspensoNUMCON: TIntegerField
      FieldName = 'NUMCON'
      Origin = '"E120PED"."NUMCON"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120PedSuspensoCODCLI: TIntegerField
      FieldName = 'CODCLI'
      Origin = '"E120PED"."CODCLI"'
    end
    object ConsE120PedSuspensoTNSPRO: TIBStringField
      FieldName = 'TNSPRO'
      Origin = '"E120PED"."TNSPRO"'
      Size = 5
    end
    object ConsE120PedSuspensoDATEMI: TDateField
      FieldName = 'DATEMI'
      Origin = '"E120PED"."DATEMI"'
    end
    object ConsE120PedSuspensoCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"E120PED"."CODREP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120PedSuspensoCODCPG: TIBStringField
      FieldName = 'CODCPG'
      Origin = '"E120PED"."CODCPG"'
      Size = 6
    end
    object ConsE120PedSuspensoQTDORI: TFloatField
      FieldName = 'QTDORI'
      Origin = '"E120PED"."QTDORI"'
    end
    object ConsE120PedSuspensoQTDABE: TFloatField
      FieldName = 'QTDABE'
      Origin = '"E120PED"."QTDABE"'
    end
    object ConsE120PedSuspensoVLRBIP: TFloatField
      FieldName = 'VLRBIP'
      Origin = '"E120PED"."VLRBIP"'
    end
    object ConsE120PedSuspensoVLRIPI: TFloatField
      FieldName = 'VLRIPI'
      Origin = '"E120PED"."VLRIPI"'
    end
    object ConsE120PedSuspensoVLRBIC: TFloatField
      FieldName = 'VLRBIC'
      Origin = '"E120PED"."VLRBIC"'
    end
    object ConsE120PedSuspensoVLRICM: TFloatField
      FieldName = 'VLRICM'
      Origin = '"E120PED"."VLRICM"'
    end
    object ConsE120PedSuspensoVLRBCO: TFloatField
      FieldName = 'VLRBCO'
      Origin = '"E120PED"."VLRBCO"'
    end
    object ConsE120PedSuspensoVLRCOM: TFloatField
      FieldName = 'VLRCOM'
      Origin = '"E120PED"."VLRCOM"'
    end
    object ConsE120PedSuspensoVLRLIQ: TFloatField
      FieldName = 'VLRLIQ'
      Origin = '"E120PED"."VLRLIQ"'
    end
    object ConsE120PedSuspensoVLRORI: TFloatField
      FieldName = 'VLRORI'
      Origin = '"E120PED"."VLRORI"'
    end
    object ConsE120PedSuspensoSITPED: TIBStringField
      FieldName = 'SITPED'
      Origin = '"E120PED"."SITPED"'
      FixedChar = True
      Size = 1
    end
    object ConsE120PedSuspensoUSUGER: TIntegerField
      FieldName = 'USUGER'
      Origin = '"E120PED"."USUGER"'
    end
    object ConsE120PedSuspensoDATGER: TDateField
      FieldName = 'DATGER'
      Origin = '"E120PED"."DATGER"'
    end
    object ConsE120PedSuspensoPEDENV: TIBStringField
      FieldName = 'PEDENV'
      Origin = '"E120PED"."PEDENV"'
      FixedChar = True
      Size = 1
    end
    object ConsE120PedSuspensoDATENV: TDateField
      FieldName = 'DATENV'
      Origin = '"E120PED"."DATENV"'
    end
    object ConsE120PedSuspensoPEDCON: TIBStringField
      FieldName = 'PEDCON'
      Origin = '"E120PED"."PEDCON"'
      FixedChar = True
      Size = 1
    end
    object ConsE120PedSuspensoDATCON: TDateField
      FieldName = 'DATCON'
      Origin = '"E120PED"."DATCON"'
    end
    object ConsE120PedSuspensoUSUCON: TIntegerField
      FieldName = 'USUCON'
      Origin = '"E120PED"."USUCON"'
    end
    object ConsE120PedSuspensoPRECAR: TIntegerField
      FieldName = 'PRECAR'
      Origin = '"E120PED"."PRECAR"'
    end
    object ConsE120PedSuspensoNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Origin = '"E085CLI"."NOMCLI"'
      Size = 100
    end
    object ConsE120PedSuspensoVLRBRU: TFloatField
      FieldName = 'VLRBRU'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ConsE120PedSuspensoVOLUME: TFloatField
      FieldName = 'VOLUME'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
  end
  object ConsE120PedLiberado: TIBQuery
    Database = IBDBanco
    Transaction = IBDTransacao
    SQL.Strings = (
      'select e120ped.*,e085cli.nomcli,'
      '(select sum(e120ipd.vlrbru) from e120ipd where'
      '                      e120ipd.codemp = e120ped.codemp and'
      '                      e120ipd.codfil = e120ped.codfil and'
      '                      e120ipd.numcon = e120ped.numcon and'
      
        '                      e120ipd.codrep = e120ped.codrep) as VlrBru' +
        ','
      '(select sum(e120ipd.qtdabe *(select e075der.volder from e075der'
      '                                              where'
      
        '                                              e075der.codemp = e' +
        '120ipd.codemp and'
      
        '                                              e075der.codpro = e' +
        '120ipd.codpro and'
      
        '                                              e075der.codder = e' +
        '120ipd.codder ))'
      '                                              from e120ipd'
      '                                              where'
      
        '                                              e120ipd.codemp = e' +
        '120ped.codemp and'
      
        '                                              e120ipd.codfil = e' +
        '120ped.codfil and'
      
        '                                              e120ipd.numcon = e' +
        '120ped.numcon and'
      
        '                                              e120ipd.codrep = e' +
        '120ped.codrep) as volume'
      '                      from e120ped'
      'inner join e085cli on e085cli.codcli = e120ped.codcli'
      '                                               where'
      
        '                                               e120ped.sitped in' +
        ' (1,2) and'
      
        '                                               e120ped.precar = ' +
        '0'
      
        '                                               order by e120ped.' +
        'codrep,e120ped.datemi')
    Left = 568
    Top = 576
    object ConsE120PedLiberadoCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E120PED"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120PedLiberadoCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Origin = '"E120PED"."CODFIL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120PedLiberadoNUMPED: TIntegerField
      FieldName = 'NUMPED'
      Origin = '"E120PED"."NUMPED"'
    end
    object ConsE120PedLiberadoNUMCON: TIntegerField
      FieldName = 'NUMCON'
      Origin = '"E120PED"."NUMCON"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120PedLiberadoCODCLI: TIntegerField
      FieldName = 'CODCLI'
      Origin = '"E120PED"."CODCLI"'
    end
    object ConsE120PedLiberadoTNSPRO: TIBStringField
      FieldName = 'TNSPRO'
      Origin = '"E120PED"."TNSPRO"'
      Size = 5
    end
    object ConsE120PedLiberadoDATEMI: TDateField
      FieldName = 'DATEMI'
      Origin = '"E120PED"."DATEMI"'
    end
    object ConsE120PedLiberadoCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"E120PED"."CODREP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120PedLiberadoCODCPG: TIBStringField
      FieldName = 'CODCPG'
      Origin = '"E120PED"."CODCPG"'
      Size = 6
    end
    object ConsE120PedLiberadoQTDORI: TFloatField
      FieldName = 'QTDORI'
      Origin = '"E120PED"."QTDORI"'
    end
    object ConsE120PedLiberadoQTDABE: TFloatField
      FieldName = 'QTDABE'
      Origin = '"E120PED"."QTDABE"'
    end
    object ConsE120PedLiberadoVLRBIP: TFloatField
      FieldName = 'VLRBIP'
      Origin = '"E120PED"."VLRBIP"'
    end
    object ConsE120PedLiberadoVLRIPI: TFloatField
      FieldName = 'VLRIPI'
      Origin = '"E120PED"."VLRIPI"'
    end
    object ConsE120PedLiberadoVLRBIC: TFloatField
      FieldName = 'VLRBIC'
      Origin = '"E120PED"."VLRBIC"'
    end
    object ConsE120PedLiberadoVLRICM: TFloatField
      FieldName = 'VLRICM'
      Origin = '"E120PED"."VLRICM"'
    end
    object ConsE120PedLiberadoVLRBCO: TFloatField
      FieldName = 'VLRBCO'
      Origin = '"E120PED"."VLRBCO"'
    end
    object ConsE120PedLiberadoVLRCOM: TFloatField
      FieldName = 'VLRCOM'
      Origin = '"E120PED"."VLRCOM"'
    end
    object ConsE120PedLiberadoVLRLIQ: TFloatField
      FieldName = 'VLRLIQ'
      Origin = '"E120PED"."VLRLIQ"'
    end
    object ConsE120PedLiberadoVLRORI: TFloatField
      FieldName = 'VLRORI'
      Origin = '"E120PED"."VLRORI"'
    end
    object ConsE120PedLiberadoSITPED: TIBStringField
      FieldName = 'SITPED'
      Origin = '"E120PED"."SITPED"'
      FixedChar = True
      Size = 1
    end
    object ConsE120PedLiberadoUSUGER: TIntegerField
      FieldName = 'USUGER'
      Origin = '"E120PED"."USUGER"'
    end
    object ConsE120PedLiberadoDATGER: TDateField
      FieldName = 'DATGER'
      Origin = '"E120PED"."DATGER"'
    end
    object ConsE120PedLiberadoPEDENV: TIBStringField
      FieldName = 'PEDENV'
      Origin = '"E120PED"."PEDENV"'
      FixedChar = True
      Size = 1
    end
    object ConsE120PedLiberadoDATENV: TDateField
      FieldName = 'DATENV'
      Origin = '"E120PED"."DATENV"'
    end
    object ConsE120PedLiberadoPEDCON: TIBStringField
      FieldName = 'PEDCON'
      Origin = '"E120PED"."PEDCON"'
      FixedChar = True
      Size = 1
    end
    object ConsE120PedLiberadoDATCON: TDateField
      FieldName = 'DATCON'
      Origin = '"E120PED"."DATCON"'
    end
    object ConsE120PedLiberadoUSUCON: TIntegerField
      FieldName = 'USUCON'
      Origin = '"E120PED"."USUCON"'
    end
    object ConsE120PedLiberadoPRECAR: TIntegerField
      FieldName = 'PRECAR'
      Origin = '"E120PED"."PRECAR"'
    end
    object ConsE120PedLiberadoNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Origin = '"E085CLI"."NOMCLI"'
      Size = 100
    end
    object ConsE120PedLiberadoVLRBRU: TFloatField
      FieldName = 'VLRBRU'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ConsE120PedLiberadoVOLUME: TFloatField
      FieldName = 'VOLUME'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
  end
  object ConsE120PedLiberadoEmCarga: TIBQuery
    Database = IBDBanco
    Transaction = IBDTransacao
    SQL.Strings = (
      'select e120ped.*,e085cli.nomcli,'
      '(select sum(e120ipd.vlrbru) from e120ipd where'
      '                      e120ipd.codemp = e120ped.codemp and'
      '                      e120ipd.codfil = e120ped.codfil and'
      '                      e120ipd.numcon = e120ped.numcon and'
      
        '                      e120ipd.codrep = e120ped.codrep) as VlrBru' +
        ','
      '(select sum(e120ipd.qtdabe *(select e075der.volder from e075der'
      '                                              where'
      
        '                                              e075der.codemp = e' +
        '120ipd.codemp and'
      
        '                                              e075der.codpro = e' +
        '120ipd.codpro and'
      
        '                                              e075der.codder = e' +
        '120ipd.codder ))'
      '                                              from e120ipd'
      '                                              where'
      
        '                                              e120ipd.codemp = e' +
        '120ped.codemp and'
      
        '                                              e120ipd.codfil = e' +
        '120ped.codfil and'
      
        '                                              e120ipd.numcon = e' +
        '120ped.numcon and'
      
        '                                              e120ipd.codrep = e' +
        '120ped.codrep) as volume'
      '                      from e120ped'
      'inner join e085cli on e085cli.codcli = e120ped.codcli'
      '                                               where'
      
        '                                               e120ped.sitped in' +
        ' (1,2) and'
      
        '                                               e120ped.precar <>' +
        ' 0'
      
        '                                               order by e120ped.' +
        'codrep,e120ped.datemi')
    Left = 568
    Top = 624
    object ConsE120PedLiberadoEmCargaCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E120PED"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120PedLiberadoEmCargaCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Origin = '"E120PED"."CODFIL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120PedLiberadoEmCargaNUMPED: TIntegerField
      FieldName = 'NUMPED'
      Origin = '"E120PED"."NUMPED"'
    end
    object ConsE120PedLiberadoEmCargaNUMCON: TIntegerField
      FieldName = 'NUMCON'
      Origin = '"E120PED"."NUMCON"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120PedLiberadoEmCargaCODCLI: TIntegerField
      FieldName = 'CODCLI'
      Origin = '"E120PED"."CODCLI"'
    end
    object ConsE120PedLiberadoEmCargaTNSPRO: TIBStringField
      FieldName = 'TNSPRO'
      Origin = '"E120PED"."TNSPRO"'
      Size = 5
    end
    object ConsE120PedLiberadoEmCargaDATEMI: TDateField
      FieldName = 'DATEMI'
      Origin = '"E120PED"."DATEMI"'
    end
    object ConsE120PedLiberadoEmCargaCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"E120PED"."CODREP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120PedLiberadoEmCargaCODCPG: TIBStringField
      FieldName = 'CODCPG'
      Origin = '"E120PED"."CODCPG"'
      Size = 6
    end
    object ConsE120PedLiberadoEmCargaQTDORI: TFloatField
      FieldName = 'QTDORI'
      Origin = '"E120PED"."QTDORI"'
    end
    object ConsE120PedLiberadoEmCargaQTDABE: TFloatField
      FieldName = 'QTDABE'
      Origin = '"E120PED"."QTDABE"'
    end
    object ConsE120PedLiberadoEmCargaVLRBIP: TFloatField
      FieldName = 'VLRBIP'
      Origin = '"E120PED"."VLRBIP"'
    end
    object ConsE120PedLiberadoEmCargaVLRIPI: TFloatField
      FieldName = 'VLRIPI'
      Origin = '"E120PED"."VLRIPI"'
    end
    object ConsE120PedLiberadoEmCargaVLRBIC: TFloatField
      FieldName = 'VLRBIC'
      Origin = '"E120PED"."VLRBIC"'
    end
    object ConsE120PedLiberadoEmCargaVLRICM: TFloatField
      FieldName = 'VLRICM'
      Origin = '"E120PED"."VLRICM"'
    end
    object ConsE120PedLiberadoEmCargaVLRBCO: TFloatField
      FieldName = 'VLRBCO'
      Origin = '"E120PED"."VLRBCO"'
    end
    object ConsE120PedLiberadoEmCargaVLRCOM: TFloatField
      FieldName = 'VLRCOM'
      Origin = '"E120PED"."VLRCOM"'
    end
    object ConsE120PedLiberadoEmCargaVLRLIQ: TFloatField
      FieldName = 'VLRLIQ'
      Origin = '"E120PED"."VLRLIQ"'
    end
    object ConsE120PedLiberadoEmCargaVLRORI: TFloatField
      FieldName = 'VLRORI'
      Origin = '"E120PED"."VLRORI"'
    end
    object ConsE120PedLiberadoEmCargaSITPED: TIBStringField
      FieldName = 'SITPED'
      Origin = '"E120PED"."SITPED"'
      FixedChar = True
      Size = 1
    end
    object ConsE120PedLiberadoEmCargaUSUGER: TIntegerField
      FieldName = 'USUGER'
      Origin = '"E120PED"."USUGER"'
    end
    object ConsE120PedLiberadoEmCargaDATGER: TDateField
      FieldName = 'DATGER'
      Origin = '"E120PED"."DATGER"'
    end
    object ConsE120PedLiberadoEmCargaPEDENV: TIBStringField
      FieldName = 'PEDENV'
      Origin = '"E120PED"."PEDENV"'
      FixedChar = True
      Size = 1
    end
    object ConsE120PedLiberadoEmCargaDATENV: TDateField
      FieldName = 'DATENV'
      Origin = '"E120PED"."DATENV"'
    end
    object ConsE120PedLiberadoEmCargaPEDCON: TIBStringField
      FieldName = 'PEDCON'
      Origin = '"E120PED"."PEDCON"'
      FixedChar = True
      Size = 1
    end
    object ConsE120PedLiberadoEmCargaDATCON: TDateField
      FieldName = 'DATCON'
      Origin = '"E120PED"."DATCON"'
    end
    object ConsE120PedLiberadoEmCargaUSUCON: TIntegerField
      FieldName = 'USUCON'
      Origin = '"E120PED"."USUCON"'
    end
    object ConsE120PedLiberadoEmCargaPRECAR: TIntegerField
      FieldName = 'PRECAR'
      Origin = '"E120PED"."PRECAR"'
    end
    object ConsE120PedLiberadoEmCargaNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Origin = '"E085CLI"."NOMCLI"'
      Size = 100
    end
    object ConsE120PedLiberadoEmCargaVLRBRU: TFloatField
      FieldName = 'VLRBRU'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ConsE120PedLiberadoEmCargaVOLUME: TFloatField
      FieldName = 'VOLUME'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
  end
  object CadE100Sql: TIBDataSet
    Database = IBDBanco
    Transaction = IBDTransacao
    DeleteSQL.Strings = (
      'delete from e100sql'
      'where'
      '  CODUSU = :OLD_CODUSU and'
      '  NUMCON = :OLD_NUMCON')
    InsertSQL.Strings = (
      'insert into e100sql'
      '  (CODUSU, COMSQL, DATGER, NUMCON)'
      'values'
      '  (:CODUSU, :COMSQL, :DATGER, :NUMCON)')
    RefreshSQL.Strings = (
      'Select '
      '  CODUSU,'
      '  NUMCON,'
      '  DATGER,'
      '  COMSQL'
      'from e100sql '
      'where'
      '  CODUSU = :CODUSU and'
      '  NUMCON = :NUMCON')
    SelectSQL.Strings = (
      'select * from e100sql where codusu = :codusu and'
      '                            numcon = :numcon')
    ModifySQL.Strings = (
      'update e100sql'
      'set'
      '  CODUSU = :CODUSU,'
      '  COMSQL = :COMSQL,'
      '  DATGER = :DATGER,'
      '  NUMCON = :NUMCON'
      'where'
      '  CODUSU = :OLD_CODUSU and'
      '  NUMCON = :OLD_NUMCON')
    Left = 136
    Top = 632
    object CadE100SqlCODUSU: TIntegerField
      FieldName = 'CODUSU'
      Origin = '"E100SQL"."CODUSU"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE100SqlNUMCON: TIntegerField
      FieldName = 'NUMCON'
      Origin = '"E100SQL"."NUMCON"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE100SqlDATGER: TDateField
      FieldName = 'DATGER'
      Origin = '"E100SQL"."DATGER"'
    end
    object CadE100SqlCOMSQL: TIBStringField
      FieldName = 'COMSQL'
      Origin = '"E100SQL"."COMSQL"'
      Size = 10000
    end
  end
  object ConsE085cli: TIBQuery
    Database = IBDBanco
    Transaction = IBDTransacao
    SQL.Strings = (
      'select e085cli.*,e085hcl.*,'
      '(select sum(e301tcr.vlrabe) from e301tcr'
      '              where'
      '              e301tcr.codcli = e085cli.codcli and'
      '              e301tcr.vctpro >= :data1) as TitAVen,'
      ' (select sum(e301tcr.vlrabe) from e301tcr'
      '              where'
      '              e301tcr.codcli = e085cli.codcli and'
      '              e301tcr.vctpro < :data2) as TitVen'
      'from e085cli'
      'inner join e085hcl on e085hcl.codcli = e085cli.codcli'
      'where'
      'e085cli.codcli = :codcli')
    Left = 720
    Top = 496
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'data1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'data2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codcli'
        ParamType = ptUnknown
      end>
    object ConsE085cliCODCLI: TIntegerField
      FieldName = 'CODCLI'
      Origin = '"E085CLI"."CODCLI"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE085cliNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Origin = '"E085CLI"."NOMCLI"'
      Size = 100
    end
    object ConsE085cliAPECLI: TIBStringField
      FieldName = 'APECLI'
      Origin = '"E085CLI"."APECLI"'
      Size = 50
    end
    object ConsE085cliINSEST: TIBStringField
      FieldName = 'INSEST'
      Origin = '"E085CLI"."INSEST"'
      Size = 25
    end
    object ConsE085cliENDCLI: TIBStringField
      FieldName = 'ENDCLI'
      Origin = '"E085CLI"."ENDCLI"'
      Size = 100
    end
    object ConsE085cliNENCLI: TIBStringField
      FieldName = 'NENCLI'
      Origin = '"E085CLI"."NENCLI"'
      Size = 60
    end
    object ConsE085cliCPLEND: TIBStringField
      FieldName = 'CPLEND'
      Origin = '"E085CLI"."CPLEND"'
    end
    object ConsE085cliCEPCLI: TIBStringField
      FieldName = 'CEPCLI'
      Origin = '"E085CLI"."CEPCLI"'
      Size = 10
    end
    object ConsE085cliBAICLI: TIBStringField
      FieldName = 'BAICLI'
      Origin = '"E085CLI"."BAICLI"'
      Size = 75
    end
    object ConsE085cliCIDCLI: TIBStringField
      FieldName = 'CIDCLI'
      Origin = '"E085CLI"."CIDCLI"'
      Size = 60
    end
    object ConsE085cliSIGUFS: TIBStringField
      FieldName = 'SIGUFS'
      Origin = '"E085CLI"."SIGUFS"'
      Size = 2
    end
    object ConsE085cliSITCLI: TIBStringField
      FieldName = 'SITCLI'
      Origin = '"E085CLI"."SITCLI"'
      FixedChar = True
      Size = 1
    end
    object ConsE085cliCGCCPF: TIBStringField
      FieldName = 'CGCCPF'
      Origin = '"E085CLI"."CGCCPF"'
      Size = 14
    end
    object ConsE085cliFONCLI: TIBStringField
      FieldName = 'FONCLI'
      Origin = '"E085CLI"."FONCLI"'
    end
    object ConsE085cliCODCLI1: TIntegerField
      FieldName = 'CODCLI1'
      Origin = '"E085HCL"."CODCLI"'
      Required = True
    end
    object ConsE085cliCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E085HCL"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE085cliCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Origin = '"E085HCL"."CODFIL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE085cliCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"E085HCL"."CODREP"'
    end
    object ConsE085cliSALDUP: TFloatField
      FieldName = 'SALDUP'
      Origin = '"E085HCL"."SALDUP"'
    end
    object ConsE085cliDATMAC: TDateField
      FieldName = 'DATMAC'
      Origin = '"E085HCL"."DATMAC"'
    end
    object ConsE085cliVLRMAC: TFloatField
      FieldName = 'VLRMAC'
      Origin = '"E085HCL"."VLRMAC"'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ConsE085cliDATUPE: TDateField
      FieldName = 'DATUPE'
      Origin = '"E085HCL"."DATUPE"'
    end
    object ConsE085cliVLRUPE: TFloatField
      FieldName = 'VLRUPE'
      Origin = '"E085HCL"."VLRUPE"'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ConsE085cliDATUFA: TDateField
      FieldName = 'DATUFA'
      Origin = '"E085HCL"."DATUFA"'
    end
    object ConsE085cliVLRUFA: TFloatField
      FieldName = 'VLRUFA'
      Origin = '"E085HCL"."VLRUFA"'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ConsE085cliDATUPG: TDateField
      FieldName = 'DATUPG'
      Origin = '"E085HCL"."DATUPG"'
    end
    object ConsE085cliVLRUPG: TFloatField
      FieldName = 'VLRUPG'
      Origin = '"E085HCL"."VLRUPG"'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ConsE085cliQTDPGT: TIntegerField
      FieldName = 'QTDPGT'
      Origin = '"E085HCL"."QTDPGT"'
    end
    object ConsE085cliDATMFA: TDateField
      FieldName = 'DATMFA'
      Origin = '"E085HCL"."DATMFA"'
    end
    object ConsE085cliVLRMFA: TFloatField
      FieldName = 'VLRMFA'
      Origin = '"E085HCL"."VLRMFA"'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ConsE085cliDATATR: TDateField
      FieldName = 'DATATR'
      Origin = '"E085HCL"."DATATR"'
    end
    object ConsE085cliVLRATR: TFloatField
      FieldName = 'VLRATR'
      Origin = '"E085HCL"."VLRATR"'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ConsE085cliMAIATR: TIntegerField
      FieldName = 'MAIATR'
      Origin = '"E085HCL"."MAIATR"'
    end
    object ConsE085cliULTNFV: TFloatField
      FieldName = 'ULTNFV'
      Origin = '"E085HCL"."ULTNFV"'
    end
    object ConsE085cliTITAVEN: TFloatField
      FieldName = 'TITAVEN'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ConsE085cliTITVEN: TFloatField
      FieldName = 'TITVEN'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
  end
  object CadE301Tcr: TIBDataSet
    Database = IBDBanco
    Transaction = IBDTransacao
    DeleteSQL.Strings = (
      'delete from e301tcr'
      'where'
      '  CODEMP = :OLD_CODEMP and'
      '  CODFIL = :OLD_CODFIL and'
      '  CODTPT = :OLD_CODTPT and'
      '  NUMTIT = :OLD_NUMTIT')
    InsertSQL.Strings = (
      'insert into e301tcr'
      
        '  (CODCLI, CODEMP, CODFIL, CODTNS, CODTPT, DATEMI, DATPPT, NUMTI' +
        'T, SITTIT, '
      '   VCTORI, VCTPRO, VLRABE, VLRORI)'
      'values'
      
        '  (:CODCLI, :CODEMP, :CODFIL, :CODTNS, :CODTPT, :DATEMI, :DATPPT' +
        ', :NUMTIT, '
      '   :SITTIT, :VCTORI, :VCTPRO, :VLRABE, :VLRORI)')
    RefreshSQL.Strings = (
      'Select '
      '  CODEMP,'
      '  CODFIL,'
      '  NUMTIT,'
      '  CODTPT,'
      '  CODTNS,'
      '  SITTIT,'
      '  DATEMI,'
      '  CODCLI,'
      '  VCTORI,'
      '  VLRORI,'
      '  VCTPRO,'
      '  DATPPT,'
      '  VLRABE'
      'from e301tcr '
      'where'
      '  CODEMP = :CODEMP and'
      '  CODFIL = :CODFIL and'
      '  CODTPT = :CODTPT and'
      '  NUMTIT = :NUMTIT')
    SelectSQL.Strings = (
      ' select * from e301tcr'
      '                where'
      '                codemp = :CODEMP and'
      '                codfil = :CODFIL and'
      '                numtit = :NUMTIT and'
      '                codtpt = :CODTPT')
    ModifySQL.Strings = (
      'update e301tcr'
      'set'
      '  CODCLI = :CODCLI,'
      '  CODEMP = :CODEMP,'
      '  CODFIL = :CODFIL,'
      '  CODTNS = :CODTNS,'
      '  CODTPT = :CODTPT,'
      '  DATEMI = :DATEMI,'
      '  DATPPT = :DATPPT,'
      '  NUMTIT = :NUMTIT,'
      '  SITTIT = :SITTIT,'
      '  VCTORI = :VCTORI,'
      '  VCTPRO = :VCTPRO,'
      '  VLRABE = :VLRABE,'
      '  VLRORI = :VLRORI'
      'where'
      '  CODEMP = :OLD_CODEMP and'
      '  CODFIL = :OLD_CODFIL and'
      '  CODTPT = :OLD_CODTPT and'
      '  NUMTIT = :OLD_NUMTIT')
    Left = 728
    Top = 552
    object CadE301TcrCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E301TCR"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE301TcrCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Origin = '"E301TCR"."CODFIL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE301TcrNUMTIT: TIBStringField
      FieldName = 'NUMTIT'
      Origin = '"E301TCR"."NUMTIT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object CadE301TcrCODTPT: TIBStringField
      FieldName = 'CODTPT'
      Origin = '"E301TCR"."CODTPT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object CadE301TcrCODTNS: TIBStringField
      FieldName = 'CODTNS'
      Origin = '"E301TCR"."CODTNS"'
      Size = 5
    end
    object CadE301TcrSITTIT: TIBStringField
      FieldName = 'SITTIT'
      Origin = '"E301TCR"."SITTIT"'
      Size = 2
    end
    object CadE301TcrDATEMI: TDateField
      FieldName = 'DATEMI'
      Origin = '"E301TCR"."DATEMI"'
    end
    object CadE301TcrCODCLI: TIntegerField
      FieldName = 'CODCLI'
      Origin = '"E301TCR"."CODCLI"'
    end
    object CadE301TcrVCTORI: TDateField
      FieldName = 'VCTORI'
      Origin = '"E301TCR"."VCTORI"'
    end
    object CadE301TcrVLRORI: TFloatField
      FieldName = 'VLRORI'
      Origin = '"E301TCR"."VLRORI"'
    end
    object CadE301TcrVCTPRO: TDateField
      FieldName = 'VCTPRO'
      Origin = '"E301TCR"."VCTPRO"'
    end
    object CadE301TcrDATPPT: TDateField
      FieldName = 'DATPPT'
      Origin = '"E301TCR"."DATPPT"'
    end
    object CadE301TcrVLRABE: TFloatField
      FieldName = 'VLRABE'
      Origin = '"E301TCR"."VLRABE"'
    end
  end
  object ApagaE301Tcr: TIBQuery
    Database = IBDBanco
    Transaction = IBDTransacao
    SQL.Strings = (
      'delete from e301Tcr')
    Left = 608
    Top = 328
  end
  object ConsE301Tcr: TIBQuery
    Database = IBDBanco
    Transaction = IBDTransacao
    SQL.Strings = (
      'select * from e301tcr'
      '              where'
      '              e301tcr.codcli = :codcli'
      '              order by e301tcr.vctpro')
    Left = 696
    Top = 352
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codcli'
        ParamType = ptUnknown
      end>
    object ConsE301TcrCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E301TCR"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE301TcrCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Origin = '"E301TCR"."CODFIL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE301TcrNUMTIT: TIBStringField
      FieldName = 'NUMTIT'
      Origin = '"E301TCR"."NUMTIT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object ConsE301TcrCODTPT: TIBStringField
      FieldName = 'CODTPT'
      Origin = '"E301TCR"."CODTPT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object ConsE301TcrCODTNS: TIBStringField
      FieldName = 'CODTNS'
      Origin = '"E301TCR"."CODTNS"'
      Size = 5
    end
    object ConsE301TcrSITTIT: TIBStringField
      FieldName = 'SITTIT'
      Origin = '"E301TCR"."SITTIT"'
      Size = 2
    end
    object ConsE301TcrDATEMI: TDateField
      FieldName = 'DATEMI'
      Origin = '"E301TCR"."DATEMI"'
    end
    object ConsE301TcrCODCLI: TIntegerField
      FieldName = 'CODCLI'
      Origin = '"E301TCR"."CODCLI"'
    end
    object ConsE301TcrVCTORI: TDateField
      FieldName = 'VCTORI'
      Origin = '"E301TCR"."VCTORI"'
    end
    object ConsE301TcrVLRORI: TFloatField
      FieldName = 'VLRORI'
      Origin = '"E301TCR"."VLRORI"'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ConsE301TcrVCTPRO: TDateField
      FieldName = 'VCTPRO'
      Origin = '"E301TCR"."VCTPRO"'
    end
    object ConsE301TcrDATPPT: TDateField
      FieldName = 'DATPPT'
      Origin = '"E301TCR"."DATPPT"'
    end
    object ConsE301TcrVLRABE: TFloatField
      FieldName = 'VLRABE'
      Origin = '"E301TCR"."VLRABE"'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
  end
  object ConsE120PedAbe: TIBQuery
    Database = IBDBanco
    Transaction = IBDTransacao
    SQL.Strings = (
      'select e120ped.*,'
      '       (select sum(e120ipd.vlrbru) from e120ipd'
      '                                where'
      
        '                                e120ipd.codemp = e120ped.codemp ' +
        'and'
      
        '                                e120ipd.codfil = e120ped.codfil ' +
        'and'
      
        '                                e120ipd.numcon = e120ped.numcon ' +
        'and'
      
        '                                e120ipd.codrep = e120ped.codrep ' +
        'and'
      
        '                                e120ipd.sitipd in (1,2)) as VlrA' +
        'be'
      '        from e120ped'
      '        where'
      '        e120ped.codcli = :codcli and'
      '        e120ped.sitped in (1,2)')
    Left = 720
    Top = 600
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codcli'
        ParamType = ptUnknown
      end>
    object ConsE120PedAbeCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E120PED"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120PedAbeCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Origin = '"E120PED"."CODFIL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120PedAbeNUMPED: TIntegerField
      FieldName = 'NUMPED'
      Origin = '"E120PED"."NUMPED"'
    end
    object ConsE120PedAbeNUMCON: TIntegerField
      FieldName = 'NUMCON'
      Origin = '"E120PED"."NUMCON"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120PedAbeCODCLI: TIntegerField
      FieldName = 'CODCLI'
      Origin = '"E120PED"."CODCLI"'
    end
    object ConsE120PedAbeTNSPRO: TIBStringField
      FieldName = 'TNSPRO'
      Origin = '"E120PED"."TNSPRO"'
      Size = 5
    end
    object ConsE120PedAbeDATEMI: TDateField
      FieldName = 'DATEMI'
      Origin = '"E120PED"."DATEMI"'
    end
    object ConsE120PedAbeCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"E120PED"."CODREP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120PedAbeCODCPG: TIBStringField
      FieldName = 'CODCPG'
      Origin = '"E120PED"."CODCPG"'
      Size = 6
    end
    object ConsE120PedAbeQTDORI: TFloatField
      FieldName = 'QTDORI'
      Origin = '"E120PED"."QTDORI"'
    end
    object ConsE120PedAbeQTDABE: TFloatField
      FieldName = 'QTDABE'
      Origin = '"E120PED"."QTDABE"'
    end
    object ConsE120PedAbeVLRBIP: TFloatField
      FieldName = 'VLRBIP'
      Origin = '"E120PED"."VLRBIP"'
    end
    object ConsE120PedAbeVLRIPI: TFloatField
      FieldName = 'VLRIPI'
      Origin = '"E120PED"."VLRIPI"'
    end
    object ConsE120PedAbeVLRBIC: TFloatField
      FieldName = 'VLRBIC'
      Origin = '"E120PED"."VLRBIC"'
    end
    object ConsE120PedAbeVLRICM: TFloatField
      FieldName = 'VLRICM'
      Origin = '"E120PED"."VLRICM"'
    end
    object ConsE120PedAbeVLRBCO: TFloatField
      FieldName = 'VLRBCO'
      Origin = '"E120PED"."VLRBCO"'
    end
    object ConsE120PedAbeVLRCOM: TFloatField
      FieldName = 'VLRCOM'
      Origin = '"E120PED"."VLRCOM"'
    end
    object ConsE120PedAbeVLRLIQ: TFloatField
      FieldName = 'VLRLIQ'
      Origin = '"E120PED"."VLRLIQ"'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ConsE120PedAbeVLRORI: TFloatField
      FieldName = 'VLRORI'
      Origin = '"E120PED"."VLRORI"'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ConsE120PedAbeSITPED: TIBStringField
      FieldName = 'SITPED'
      Origin = '"E120PED"."SITPED"'
      FixedChar = True
      Size = 1
    end
    object ConsE120PedAbeUSUGER: TIntegerField
      FieldName = 'USUGER'
      Origin = '"E120PED"."USUGER"'
    end
    object ConsE120PedAbeDATGER: TDateField
      FieldName = 'DATGER'
      Origin = '"E120PED"."DATGER"'
    end
    object ConsE120PedAbePEDENV: TIBStringField
      FieldName = 'PEDENV'
      Origin = '"E120PED"."PEDENV"'
      FixedChar = True
      Size = 1
    end
    object ConsE120PedAbeDATENV: TDateField
      FieldName = 'DATENV'
      Origin = '"E120PED"."DATENV"'
    end
    object ConsE120PedAbePEDCON: TIBStringField
      FieldName = 'PEDCON'
      Origin = '"E120PED"."PEDCON"'
      FixedChar = True
      Size = 1
    end
    object ConsE120PedAbeDATCON: TDateField
      FieldName = 'DATCON'
      Origin = '"E120PED"."DATCON"'
    end
    object ConsE120PedAbeUSUCON: TIntegerField
      FieldName = 'USUCON'
      Origin = '"E120PED"."USUCON"'
    end
    object ConsE120PedAbePRECAR: TIntegerField
      FieldName = 'PRECAR'
      Origin = '"E120PED"."PRECAR"'
    end
    object ConsE120PedAbeVLRABE: TFloatField
      FieldName = 'VLRABE'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ConsE120PedAbeImg: TStringField
      FieldKind = fkCalculated
      FieldName = 'Img'
      Size = 10
      Calculated = True
    end
  end
  object ConsE085CliRelCob: TIBQuery
    Database = IBDBanco
    Transaction = IBDTransacao
    AfterScroll = ConsE085CliRelCobAfterScroll
    SQL.Strings = (
      
        'select distinct(e301tcr.codcli),e085cli.codcli,e085cli.nomcli,e0' +
        '85cli.foncli,e085cli.cidcli,e085cli.sigufs,'
      '       (select sum(e301tcr.vlrabe) from e301tcr'
      '                 where e301tcr.vctpro <= :DATA_VEN and'
      
        '                       e301tcr.codcli = e085cli.codcli) as VlrVe' +
        'nc,'
      '        (select sum(e301tcr.vlrabe) from e301tcr'
      '                 where e301tcr.vctpro > :DATA_AVEN and'
      
        '                       e301tcr.codcli = e085cli.codcli) as VlrAV' +
        'enc'
      '    from e301tcr'
      'inner join e085cli on e085cli.codcli = e301tcr.codcli'
      '    where'
      '    e301tcr.vctpro <= :DATA'
      '    order by e085cli.codcli')
    Left = 832
    Top = 496
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATA_VEN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA_AVEN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'data'
        ParamType = ptUnknown
      end>
    object ConsE085CliRelCobCODCLI: TIntegerField
      FieldName = 'CODCLI'
      Origin = '"E301TCR"."CODCLI"'
    end
    object ConsE085CliRelCobCODCLI1: TIntegerField
      FieldName = 'CODCLI1'
      Origin = '"E085CLI"."CODCLI"'
      Required = True
    end
    object ConsE085CliRelCobNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Origin = '"E085CLI"."NOMCLI"'
      Size = 100
    end
    object ConsE085CliRelCobFONCLI: TIBStringField
      FieldName = 'FONCLI'
      Origin = '"E085CLI"."FONCLI"'
    end
    object ConsE085CliRelCobCIDCLI: TIBStringField
      FieldName = 'CIDCLI'
      Origin = '"E085CLI"."CIDCLI"'
      Size = 60
    end
    object ConsE085CliRelCobSIGUFS: TIBStringField
      FieldName = 'SIGUFS'
      Origin = '"E085CLI"."SIGUFS"'
      Size = 2
    end
    object ConsE085CliRelCobVLRVENC: TFloatField
      FieldName = 'VLRVENC'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ConsE085CliRelCobVLRAVENC: TFloatField
      FieldName = 'VLRAVENC'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
  end
  object ConsE301TcrRelCob: TIBQuery
    Database = IBDBanco
    Transaction = IBDTransacao
    SQL.Strings = (
      'select e301tcr.* from e301tcr'
      '                   where'
      '                   e301tcr.codcli = :CODCLI and'
      '                   e301tcr.vctpro <= :DATA')
    Left = 832
    Top = 544
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA'
        ParamType = ptUnknown
      end>
    object ConsE301TcrRelCobCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E301TCR"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE301TcrRelCobCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Origin = '"E301TCR"."CODFIL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE301TcrRelCobNUMTIT: TIBStringField
      FieldName = 'NUMTIT'
      Origin = '"E301TCR"."NUMTIT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object ConsE301TcrRelCobCODTPT: TIBStringField
      FieldName = 'CODTPT'
      Origin = '"E301TCR"."CODTPT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object ConsE301TcrRelCobCODTNS: TIBStringField
      FieldName = 'CODTNS'
      Origin = '"E301TCR"."CODTNS"'
      Size = 5
    end
    object ConsE301TcrRelCobSITTIT: TIBStringField
      FieldName = 'SITTIT'
      Origin = '"E301TCR"."SITTIT"'
      Size = 2
    end
    object ConsE301TcrRelCobDATEMI: TDateField
      FieldName = 'DATEMI'
      Origin = '"E301TCR"."DATEMI"'
    end
    object ConsE301TcrRelCobCODCLI: TIntegerField
      FieldName = 'CODCLI'
      Origin = '"E301TCR"."CODCLI"'
    end
    object ConsE301TcrRelCobVCTORI: TDateField
      FieldName = 'VCTORI'
      Origin = '"E301TCR"."VCTORI"'
    end
    object ConsE301TcrRelCobVLRORI: TFloatField
      FieldName = 'VLRORI'
      Origin = '"E301TCR"."VLRORI"'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ConsE301TcrRelCobVCTPRO: TDateField
      FieldName = 'VCTPRO'
      Origin = '"E301TCR"."VCTPRO"'
    end
    object ConsE301TcrRelCobDATPPT: TDateField
      FieldName = 'DATPPT'
      Origin = '"E301TCR"."DATPPT"'
    end
    object ConsE301TcrRelCobVLRABE: TFloatField
      FieldName = 'VLRABE'
      Origin = '"E301TCR"."VLRABE"'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
  end
  object ConsE081Itp: TIBQuery
    Database = IBDBanco
    Transaction = IBDTransacao
    SQL.Strings = (
      'select DISTINCT(e081itp.PREBAS), e081itp.codpro, e081itp.despro'
      '     from e081itp'
      '    where'
      '    E081ITP.SITREG = '#39'A'#39
      '                     ')
    Left = 832
    Top = 592
    object ConsE081ItpPREBAS: TFloatField
      Alignment = taCenter
      FieldName = 'PREBAS'
      Origin = '"E081ITP"."PREBAS"'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object ConsE081ItpCODPRO: TIBStringField
      Alignment = taCenter
      FieldName = 'CODPRO'
      Origin = '"E081ITP"."CODPRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 14
    end
    object ConsE081ItpDESPRO: TIBStringField
      FieldName = 'DESPRO'
      Origin = '"E081ITP"."DESPRO"'
      Size = 100
    end
  end
  object ConsE081ItpImpressao: TIBQuery
    Database = IBDBanco
    Transaction = IBDTransacao
    SQL.Strings = (
      'select DISTINCT(e081itp.despro), e081itp.codpro,'
      '       e081itp.prebas'
      '        from e081itp'
      '          WHERE'
      '          E081ITP.SITREG = '#39'A'#39
      '          ORDER BY e081itp.despro')
    Left = 832
    Top = 640
    object ConsE081ItpImpressaoCODPRO: TIBStringField
      FieldName = 'CODPRO'
      Origin = '"E081ITP"."CODPRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 14
    end
    object ConsE081ItpImpressaoDESPRO: TIBStringField
      FieldName = 'DESPRO'
      Origin = '"E081ITP"."DESPRO"'
      Size = 100
    end
    object ConsE081ItpImpressaoPREBAS: TFloatField
      FieldName = 'PREBAS'
      Origin = '"E081ITP"."PREBAS"'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
  end
  object ConsSql: TIBQuery
    Database = IBDBanco
    Transaction = IBDTransacao
    Left = 104
    Top = 312
  end
  object CadE090Rcp: TIBDataSet
    Database = IBDBanco
    Transaction = IBDTransacao
    DeleteSQL.Strings = (
      'delete from E090RCP'
      'where'
      '  CODCPG = :OLD_CODCPG and'
      '  CODREP = :OLD_CODREP and'
      '  EMPCPG = :OLD_EMPCPG')
    InsertSQL.Strings = (
      'insert into E090RCP'
      '  (CODCPG, CODREP, EMPCPG, SITLRC)'
      'values'
      '  (:CODCPG, :CODREP, :EMPCPG, :SITLRC)')
    RefreshSQL.Strings = (
      'Select '
      '  CODREP,'
      '  EMPCPG,'
      '  CODCPG,'
      '  SITLRC'
      'from E090RCP '
      'where'
      '  CODCPG = :CODCPG and'
      '  CODREP = :CODREP and'
      '  EMPCPG = :EMPCPG')
    SelectSQL.Strings = (
      'select * from E090RCP where'
      'codcpg = :codcpg and'
      'empcpg = :empcpg and'
      'codrep = :codrep')
    ModifySQL.Strings = (
      'update E090RCP'
      'set'
      '  CODCPG = :CODCPG,'
      '  CODREP = :CODREP,'
      '  EMPCPG = :EMPCPG,'
      '  SITLRC = :SITLRC'
      'where'
      '  CODCPG = :OLD_CODCPG and'
      '  CODREP = :OLD_CODREP and'
      '  EMPCPG = :OLD_EMPCPG')
    Left = 200
    Top = 384
    object CadE090RcpCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"E090RCP"."CODREP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE090RcpEMPCPG: TIntegerField
      FieldName = 'EMPCPG'
      Origin = '"E090RCP"."EMPCPG"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE090RcpCODCPG: TIBStringField
      FieldName = 'CODCPG'
      Origin = '"E090RCP"."CODCPG"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 8
    end
    object CadE090RcpSITLRC: TIBStringField
      FieldName = 'SITLRC'
      Origin = '"E090RCP"."SITLRC"'
      Size = 2
    end
  end
  object ConsE090Rcp: TIBQuery
    Database = IBDBanco
    Transaction = IBDTransacao
    SQL.Strings = (
      'select * from E090RCP where'
      'codcpg = :codcpg')
    Left = 272
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codcpg'
        ParamType = ptUnknown
      end>
    object ConsE090RcpCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"E090RCP"."CODREP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE090RcpEMPCPG: TIntegerField
      FieldName = 'EMPCPG'
      Origin = '"E090RCP"."EMPCPG"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE090RcpCODCPG: TIBStringField
      FieldName = 'CODCPG'
      Origin = '"E090RCP"."CODCPG"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 8
    end
    object ConsE090RcpSITLRC: TIBStringField
      FieldName = 'SITLRC'
      Origin = '"E090RCP"."SITLRC"'
      Size = 2
    end
  end
  object ConsE120PedFinalizado: TIBQuery
    Database = IBDBanco
    Transaction = IBDTransacao
    SQL.Strings = (
      'select e120ped.* from e120ped'
      'where'
      'e120ped.sitped in (4,5) and'
      'e120ped.codcli = :codcli'
      'order by e120ped.numped desc')
    Left = 424
    Top = 608
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codcli'
        ParamType = ptUnknown
      end>
    object ConsE120PedFinalizadoCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E120PED"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120PedFinalizadoCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Origin = '"E120PED"."CODFIL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120PedFinalizadoNUMPED: TIntegerField
      FieldName = 'NUMPED'
      Origin = '"E120PED"."NUMPED"'
    end
    object ConsE120PedFinalizadoNUMCON: TIntegerField
      FieldName = 'NUMCON'
      Origin = '"E120PED"."NUMCON"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120PedFinalizadoCODCLI: TIntegerField
      FieldName = 'CODCLI'
      Origin = '"E120PED"."CODCLI"'
    end
    object ConsE120PedFinalizadoTNSPRO: TIBStringField
      FieldName = 'TNSPRO'
      Origin = '"E120PED"."TNSPRO"'
      Size = 5
    end
    object ConsE120PedFinalizadoDATEMI: TDateField
      FieldName = 'DATEMI'
      Origin = '"E120PED"."DATEMI"'
    end
    object ConsE120PedFinalizadoCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"E120PED"."CODREP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE120PedFinalizadoCODCPG: TIBStringField
      FieldName = 'CODCPG'
      Origin = '"E120PED"."CODCPG"'
      Size = 6
    end
    object ConsE120PedFinalizadoQTDORI: TFloatField
      FieldName = 'QTDORI'
      Origin = '"E120PED"."QTDORI"'
    end
    object ConsE120PedFinalizadoQTDABE: TFloatField
      FieldName = 'QTDABE'
      Origin = '"E120PED"."QTDABE"'
    end
    object ConsE120PedFinalizadoVLRBIP: TFloatField
      FieldName = 'VLRBIP'
      Origin = '"E120PED"."VLRBIP"'
    end
    object ConsE120PedFinalizadoVLRIPI: TFloatField
      FieldName = 'VLRIPI'
      Origin = '"E120PED"."VLRIPI"'
    end
    object ConsE120PedFinalizadoVLRBIC: TFloatField
      FieldName = 'VLRBIC'
      Origin = '"E120PED"."VLRBIC"'
    end
    object ConsE120PedFinalizadoVLRICM: TFloatField
      FieldName = 'VLRICM'
      Origin = '"E120PED"."VLRICM"'
    end
    object ConsE120PedFinalizadoVLRBCO: TFloatField
      FieldName = 'VLRBCO'
      Origin = '"E120PED"."VLRBCO"'
    end
    object ConsE120PedFinalizadoVLRCOM: TFloatField
      FieldName = 'VLRCOM'
      Origin = '"E120PED"."VLRCOM"'
    end
    object ConsE120PedFinalizadoVLRLIQ: TFloatField
      FieldName = 'VLRLIQ'
      Origin = '"E120PED"."VLRLIQ"'
    end
    object ConsE120PedFinalizadoVLRORI: TFloatField
      FieldName = 'VLRORI'
      Origin = '"E120PED"."VLRORI"'
    end
    object ConsE120PedFinalizadoSITPED: TIBStringField
      FieldName = 'SITPED'
      Origin = '"E120PED"."SITPED"'
      FixedChar = True
      Size = 1
    end
    object ConsE120PedFinalizadoUSUGER: TIntegerField
      FieldName = 'USUGER'
      Origin = '"E120PED"."USUGER"'
    end
    object ConsE120PedFinalizadoDATGER: TDateField
      FieldName = 'DATGER'
      Origin = '"E120PED"."DATGER"'
    end
    object ConsE120PedFinalizadoPEDENV: TIBStringField
      FieldName = 'PEDENV'
      Origin = '"E120PED"."PEDENV"'
      FixedChar = True
      Size = 1
    end
    object ConsE120PedFinalizadoDATENV: TDateField
      FieldName = 'DATENV'
      Origin = '"E120PED"."DATENV"'
    end
    object ConsE120PedFinalizadoPEDCON: TIBStringField
      FieldName = 'PEDCON'
      Origin = '"E120PED"."PEDCON"'
      FixedChar = True
      Size = 1
    end
    object ConsE120PedFinalizadoDATCON: TDateField
      FieldName = 'DATCON'
      Origin = '"E120PED"."DATCON"'
    end
    object ConsE120PedFinalizadoUSUCON: TIntegerField
      FieldName = 'USUCON'
      Origin = '"E120PED"."USUCON"'
    end
    object ConsE120PedFinalizadoPRECAR: TIntegerField
      FieldName = 'PRECAR'
      Origin = '"E120PED"."PRECAR"'
    end
    object ConsE120PedFinalizadoImg: TStringField
      FieldKind = fkCalculated
      FieldName = 'Img'
      Size = 10
      Calculated = True
    end
  end
  object CadE100Atu: TIBDataSet
    Database = IBDBanco
    Transaction = IBDTransacao
    DeleteSQL.Strings = (
      'delete from E100ATU'
      'where'
      '  IDATU = :OLD_IDATU')
    InsertSQL.Strings = (
      'insert into E100ATU'
      '  (DATATU, HORATU, IDATU, VERSIS)'
      'values'
      '  (:DATATU, :HORATU, :IDATU, :VERSIS)')
    RefreshSQL.Strings = (
      'Select '
      '  IDATU,'
      '  DATATU,'
      '  HORATU,'
      '  VERSIS'
      'from E100ATU '
      'where'
      '  IDATU = :IDATU')
    SelectSQL.Strings = (
      'select * FROM E100ATU'
      '  WHERE'
      '    IDATU = :IDATU')
    ModifySQL.Strings = (
      'update E100ATU'
      'set'
      '  DATATU = :DATATU,'
      '  HORATU = :HORATU,'
      '  IDATU = :IDATU,'
      '  VERSIS = :VERSIS'
      'where'
      '  IDATU = :OLD_IDATU')
    Left = 656
    Top = 224
    object CadE100AtuIDATU: TIntegerField
      FieldName = 'IDATU'
      Origin = '"E100ATU"."IDATU"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadE100AtuDATATU: TDateField
      FieldName = 'DATATU'
      Origin = '"E100ATU"."DATATU"'
    end
    object CadE100AtuHORATU: TTimeField
      FieldName = 'HORATU'
      Origin = '"E100ATU"."HORATU"'
    end
    object CadE100AtuVERSIS: TIBStringField
      FieldName = 'VERSIS'
      Origin = '"E100ATU"."VERSIS"'
      Size = 10
    end
  end
end
