object DmFireRep: TDmFireRep
  OldCreateOrder = False
  Height = 517
  Width = 723
  object Banco: TIBDatabase
    DatabaseName = 
      '192.168.10.44:C:\DelphiSapiens\SapiensDelphi\ServerRep\Banco_Bas' +
      'e\BANCO.FDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey'
      'lc_ctype=ISO8859_1')
    LoginPrompt = False
    DefaultTransaction = ibtTransacao
    Left = 32
    Top = 24
  end
  object ibtTransacao: TIBTransaction
    DefaultDatabase = Banco
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 112
    Top = 24
  end
  object ConsE085Cli: TIBQuery
    Database = Banco
    Transaction = ibtTransacao
    SQL.Strings = (
      'SELECT * FROM E085CLI WHERE CODREP = :CODREP')
    Left = 56
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODREP'
        ParamType = ptUnknown
      end>
    object ConsE085CliCODCLI: TIntegerField
      FieldName = 'CODCLI'
      Origin = '"E085CLI"."CODCLI"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE085CliNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Origin = '"E085CLI"."NOMCLI"'
      Size = 100
    end
    object ConsE085CliAPECLI: TIBStringField
      FieldName = 'APECLI'
      Origin = '"E085CLI"."APECLI"'
      Size = 50
    end
    object ConsE085CliINSEST: TIBStringField
      FieldName = 'INSEST'
      Origin = '"E085CLI"."INSEST"'
      Size = 25
    end
    object ConsE085CliENDCLI: TIBStringField
      FieldName = 'ENDCLI'
      Origin = '"E085CLI"."ENDCLI"'
      Size = 100
    end
    object ConsE085CliNENCLI: TIBStringField
      FieldName = 'NENCLI'
      Origin = '"E085CLI"."NENCLI"'
      Size = 60
    end
    object ConsE085CliCPLEND: TIBStringField
      FieldName = 'CPLEND'
      Origin = '"E085CLI"."CPLEND"'
    end
    object ConsE085CliCEPCLI: TIBStringField
      FieldName = 'CEPCLI'
      Origin = '"E085CLI"."CEPCLI"'
      Size = 10
    end
    object ConsE085CliBAICLI: TIBStringField
      FieldName = 'BAICLI'
      Origin = '"E085CLI"."BAICLI"'
      Size = 75
    end
    object ConsE085CliCIDCLI: TIBStringField
      FieldName = 'CIDCLI'
      Origin = '"E085CLI"."CIDCLI"'
      Size = 60
    end
    object ConsE085CliSIGUFS: TIBStringField
      FieldName = 'SIGUFS'
      Origin = '"E085CLI"."SIGUFS"'
      Size = 2
    end
    object ConsE085CliSITCLI: TIBStringField
      FieldName = 'SITCLI'
      Origin = '"E085CLI"."SITCLI"'
      FixedChar = True
      Size = 1
    end
    object ConsE085CliCGCCPF: TIBStringField
      FieldName = 'CGCCPF'
      Origin = '"E085CLI"."CGCCPF"'
      Size = 14
    end
    object ConsE085CliFONCLI: TIBStringField
      FieldName = 'FONCLI'
      Origin = '"E085CLI"."FONCLI"'
    end
    object ConsE085CliCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"E085CLI"."CODREP"'
    end
  end
  object ConsE085Hcl: TIBQuery
    Database = Banco
    Transaction = ibtTransacao
    SQL.Strings = (
      'SELECT * FROM E085HCL WHERE CODREP = :CODREP')
    Left = 128
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODREP'
        ParamType = ptUnknown
      end>
    object ConsE085HclCODCLI: TIntegerField
      FieldName = 'CODCLI'
      Origin = '"E085HCL"."CODCLI"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE085HclCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E085HCL"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE085HclCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Origin = '"E085HCL"."CODFIL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE085HclCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"E085HCL"."CODREP"'
    end
    object ConsE085HclSALDUP: TFloatField
      FieldName = 'SALDUP'
      Origin = '"E085HCL"."SALDUP"'
    end
    object ConsE085HclDATMAC: TDateField
      FieldName = 'DATMAC'
      Origin = '"E085HCL"."DATMAC"'
    end
    object ConsE085HclVLRMAC: TFloatField
      FieldName = 'VLRMAC'
      Origin = '"E085HCL"."VLRMAC"'
    end
    object ConsE085HclDATUPE: TDateField
      FieldName = 'DATUPE'
      Origin = '"E085HCL"."DATUPE"'
    end
    object ConsE085HclVLRUPE: TFloatField
      FieldName = 'VLRUPE'
      Origin = '"E085HCL"."VLRUPE"'
    end
    object ConsE085HclDATUFA: TDateField
      FieldName = 'DATUFA'
      Origin = '"E085HCL"."DATUFA"'
    end
    object ConsE085HclVLRUFA: TFloatField
      FieldName = 'VLRUFA'
      Origin = '"E085HCL"."VLRUFA"'
    end
    object ConsE085HclDATUPG: TDateField
      FieldName = 'DATUPG'
      Origin = '"E085HCL"."DATUPG"'
    end
    object ConsE085HclVLRUPG: TFloatField
      FieldName = 'VLRUPG'
      Origin = '"E085HCL"."VLRUPG"'
    end
    object ConsE085HclQTDPGT: TIntegerField
      FieldName = 'QTDPGT'
      Origin = '"E085HCL"."QTDPGT"'
    end
    object ConsE085HclDATMFA: TDateField
      FieldName = 'DATMFA'
      Origin = '"E085HCL"."DATMFA"'
    end
    object ConsE085HclVLRMFA: TFloatField
      FieldName = 'VLRMFA'
      Origin = '"E085HCL"."VLRMFA"'
    end
    object ConsE085HclDATATR: TDateField
      FieldName = 'DATATR'
      Origin = '"E085HCL"."DATATR"'
    end
    object ConsE085HclVLRATR: TFloatField
      FieldName = 'VLRATR'
      Origin = '"E085HCL"."VLRATR"'
    end
    object ConsE085HclMAIATR: TIntegerField
      FieldName = 'MAIATR'
      Origin = '"E085HCL"."MAIATR"'
    end
    object ConsE085HclULTNFV: TFloatField
      FieldName = 'ULTNFV'
      Origin = '"E085HCL"."ULTNFV"'
    end
  end
  object ConsE075Pro: TIBQuery
    Database = Banco
    Transaction = ibtTransacao
    SQL.Strings = (
      'SELECT * FROM E075PRO')
    Left = 56
    Top = 176
    object ConsE075ProCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E075PRO"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE075ProCODPRO: TIBStringField
      FieldName = 'CODPRO'
      Origin = '"E075PRO"."CODPRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 14
    end
    object ConsE075ProDESPRO: TIBStringField
      FieldName = 'DESPRO'
      Origin = '"E075PRO"."DESPRO"'
      Size = 100
    end
    object ConsE075ProCODFAM: TIBStringField
      FieldName = 'CODFAM'
      Origin = '"E075PRO"."CODFAM"'
      Size = 10
    end
    object ConsE075ProCODAGP: TIBStringField
      FieldName = 'CODAGP'
      Origin = '"E075PRO"."CODAGP"'
      Size = 10
    end
    object ConsE075ProSITPRO: TIBStringField
      FieldName = 'SITPRO'
      Origin = '"E075PRO"."SITPRO"'
      FixedChar = True
      Size = 1
    end
  end
  object ConsE075Der: TIBQuery
    Database = Banco
    Transaction = ibtTransacao
    SQL.Strings = (
      'SELECT * FROM E075DER')
    Left = 128
    Top = 176
    object ConsE075DerCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E075DER"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE075DerCODPRO: TIBStringField
      FieldName = 'CODPRO'
      Origin = '"E075DER"."CODPRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 14
    end
    object ConsE075DerCODDER: TIBStringField
      FieldName = 'CODDER'
      Origin = '"E075DER"."CODDER"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 7
    end
    object ConsE075DerDESDER: TIBStringField
      FieldName = 'DESDER'
      Origin = '"E075DER"."DESDER"'
      Size = 50
    end
    object ConsE075DerPESBRU: TFloatField
      FieldName = 'PESBRU'
      Origin = '"E075DER"."PESBRU"'
    end
    object ConsE075DerPESLIQ: TFloatField
      FieldName = 'PESLIQ'
      Origin = '"E075DER"."PESLIQ"'
    end
    object ConsE075DerVOLDER: TFloatField
      FieldName = 'VOLDER'
      Origin = '"E075DER"."VOLDER"'
    end
    object ConsE075DerSITDER: TIBStringField
      FieldName = 'SITDER'
      Origin = '"E075DER"."SITDER"'
      FixedChar = True
      Size = 1
    end
    object ConsE075DerCORUNI: TFloatField
      FieldName = 'CORUNI'
      Origin = '"E075DER"."CORUNI"'
    end
    object ConsE075DerCMP1BB: TFloatField
      FieldName = 'CMP1BB'
      Origin = '"E075DER"."CMP1BB"'
    end
    object ConsE075DerCMP1AC: TFloatField
      FieldName = 'CMP1AC'
      Origin = '"E075DER"."CMP1AC"'
    end
    object ConsE075DerCMP2BB: TFloatField
      FieldName = 'CMP2BB'
      Origin = '"E075DER"."CMP2BB"'
    end
    object ConsE075DerCMP2EN: TFloatField
      FieldName = 'CMP2EN'
      Origin = '"E075DER"."CMP2EN"'
    end
  end
  object ConsE075cor: TIBQuery
    Database = Banco
    Transaction = ibtTransacao
    SQL.Strings = (
      'SELECT * FROM E075COR')
    Left = 200
    Top = 176
    object ConsE075corCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E075COR"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE075corCODPRO: TIBStringField
      FieldName = 'CODPRO'
      Origin = '"E075COR"."CODPRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 14
    end
    object ConsE075corDESPRO: TIBStringField
      FieldName = 'DESPRO'
      Origin = '"E075COR"."DESPRO"'
      Size = 100
    end
    object ConsE075corSITPRO: TIBStringField
      FieldName = 'SITPRO'
      Origin = '"E075COR"."SITPRO"'
      FixedChar = True
      Size = 1
    end
  end
  object ConsE028Cpg: TIBQuery
    Database = Banco
    Transaction = ibtTransacao
    SQL.Strings = (
      'SELECT * FROM E028CPG')
    Left = 56
    Top = 224
    object ConsE028CpgCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E028CPG"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE028CpgCODCPG: TIBStringField
      FieldName = 'CODCPG'
      Origin = '"E028CPG"."CODCPG"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object ConsE028CpgCODUSU: TIntegerField
      FieldName = 'CODUSU'
      Origin = '"E028CPG"."CODUSU"'
    end
    object ConsE028CpgDESCPG: TIBStringField
      FieldName = 'DESCPG'
      Origin = '"E028CPG"."DESCPG"'
      Size = 50
    end
    object ConsE028CpgABRCPG: TIBStringField
      FieldName = 'ABRCPG'
      Origin = '"E028CPG"."ABRCPG"'
      Size = 10
    end
    object ConsE028CpgPRZMED: TIntegerField
      FieldName = 'PRZMED'
      Origin = '"E028CPG"."PRZMED"'
    end
    object ConsE028CpgQTDPAR: TIntegerField
      FieldName = 'QTDPAR'
      Origin = '"E028CPG"."QTDPAR"'
    end
    object ConsE028CpgSITCPG: TIBStringField
      FieldName = 'SITCPG'
      Origin = '"E028CPG"."SITCPG"'
      FixedChar = True
      Size = 1
    end
    object ConsE028CpgPERCOM: TFloatField
      FieldName = 'PERCOM'
      Origin = '"E028CPG"."PERCOM"'
    end
  end
  object ConsE081Tab: TIBQuery
    Database = Banco
    Transaction = ibtTransacao
    SQL.Strings = (
      'SELECT * FROM E081TAB')
    Left = 56
    Top = 280
    object ConsE081TabCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E081TAB"."CODEMP"'
      Required = True
    end
    object ConsE081TabCODTPR: TIBStringField
      FieldName = 'CODTPR'
      Origin = '"E081TAB"."CODTPR"'
      Required = True
      Size = 4
    end
    object ConsE081TabCODUSU: TIntegerField
      FieldName = 'CODUSU'
      Origin = '"E081TAB"."CODUSU"'
    end
    object ConsE081TabDESTPR: TIBStringField
      FieldName = 'DESTPR'
      Origin = '"E081TAB"."DESTPR"'
      Size = 30
    end
    object ConsE081TabSITTPR: TIBStringField
      FieldName = 'SITTPR'
      Origin = '"E081TAB"."SITTPR"'
      FixedChar = True
      Size = 1
    end
  end
  object ConsE081Itp: TIBQuery
    Database = Banco
    Transaction = ibtTransacao
    SQL.Strings = (
      'SELECT * FROM E081ITP')
    Left = 128
    Top = 280
    object ConsE081ItpCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E081ITP"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE081ItpCODTPR: TIBStringField
      FieldName = 'CODTPR'
      Origin = '"E081ITP"."CODTPR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object ConsE081ItpCODPRO: TIBStringField
      FieldName = 'CODPRO'
      Origin = '"E081ITP"."CODPRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 14
    end
    object ConsE081ItpCODDER: TIBStringField
      FieldName = 'CODDER'
      Origin = '"E081ITP"."CODDER"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 7
    end
    object ConsE081ItpCODUSU: TIntegerField
      FieldName = 'CODUSU'
      Origin = '"E081ITP"."CODUSU"'
    end
    object ConsE081ItpDESPRO: TIBStringField
      FieldName = 'DESPRO'
      Origin = '"E081ITP"."DESPRO"'
      Size = 100
    end
    object ConsE081ItpPREBAS: TFloatField
      FieldName = 'PREBAS'
      Origin = '"E081ITP"."PREBAS"'
    end
    object ConsE081ItpTOLMAI: TFloatField
      FieldName = 'TOLMAI'
      Origin = '"E081ITP"."TOLMAI"'
    end
    object ConsE081ItpTOLMEN: TFloatField
      FieldName = 'TOLMEN'
      Origin = '"E081ITP"."TOLMEN"'
    end
    object ConsE081ItpVLRMAI: TFloatField
      FieldName = 'VLRMAI'
      Origin = '"E081ITP"."VLRMAI"'
    end
    object ConsE081ItpVLRMEN: TFloatField
      FieldName = 'VLRMEN'
      Origin = '"E081ITP"."VLRMEN"'
    end
    object ConsE081ItpSITREG: TIBStringField
      FieldName = 'SITREG'
      Origin = '"E081ITP"."SITREG"'
      FixedChar = True
      Size = 1
    end
    object ConsE081ItpDATINI: TDateField
      FieldName = 'DATINI'
      Origin = '"E081ITP"."DATINI"'
    end
    object ConsE081ItpDATFIM: TDateField
      FieldName = 'DATFIM'
      Origin = '"E081ITP"."DATFIM"'
    end
    object ConsE081ItpCODFAM: TIBStringField
      FieldName = 'CODFAM'
      Origin = '"E081ITP"."CODFAM"'
      Size = 6
    end
    object ConsE081ItpCODAGC: TIBStringField
      FieldName = 'CODAGC'
      Origin = '"E081ITP"."CODAGC"'
    end
  end
  object ConsE075Ldc: TIBQuery
    Database = Banco
    Transaction = ibtTransacao
    SQL.Strings = (
      'SELECT * FROM E075LDC')
    Left = 48
    Top = 328
    object ConsE075LdcCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E075LDC"."CODEMP"'
      Required = True
    end
    object ConsE075LdcCODPRO: TIBStringField
      FieldName = 'CODPRO'
      Origin = '"E075LDC"."CODPRO"'
      Required = True
      Size = 14
    end
    object ConsE075LdcCODDER: TIBStringField
      FieldName = 'CODDER'
      Origin = '"E075LDC"."CODDER"'
      Required = True
      Size = 7
    end
    object ConsE075LdcCODTEC: TIBStringField
      FieldName = 'CODTEC'
      Origin = '"E075LDC"."CODTEC"'
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
  object ConsE075LLdc: TIBQuery
    Database = Banco
    Transaction = ibtTransacao
    SQL.Strings = (
      'SELECT * FROM E075LLDC ')
    Left = 128
    Top = 328
    object ConsE075LLdcNUMMOV: TIntegerField
      FieldName = 'NUMMOV'
      Origin = '"E075LLDC"."NUMMOV"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE075LLdcCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E075LLDC"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE075LLdcCODPRO: TIBStringField
      FieldName = 'CODPRO'
      Origin = '"E075LLDC"."CODPRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE075LLdcCODDER: TIBStringField
      FieldName = 'CODDER'
      Origin = '"E075LLDC"."CODDER"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object ConsE075LLdcCODTEC: TIBStringField
      FieldName = 'CODTEC'
      Origin = '"E075LLDC"."CODTEC"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE075LLdcDATMOV: TDateField
      FieldName = 'DATMOV'
      Origin = '"E075LLDC"."DATMOV"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE075LLdcTIPMOV: TIBStringField
      FieldName = 'TIPMOV'
      Origin = '"E075LLDC"."TIPMOV"'
      FixedChar = True
      Size = 1
    end
  end
  object ConsE301Tcr: TIBQuery
    Database = Banco
    Transaction = ibtTransacao
    SQL.Strings = (
      'SELECT * FROM E301TCR WHERE CODREP = :CODREP')
    Left = 48
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODREP'
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
    end
    object ConsE301TcrCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"E301TCR"."CODREP"'
    end
  end
  object ConsSql: TIBQuery
    Database = Banco
    Transaction = ibtTransacao
    Left = 336
    Top = 48
  end
  object ConsE120Ped: TIBQuery
    Database = Banco
    Transaction = ibtTransacao
    SQL.Strings = (
      'SELECT E120PED.* FROM E120PED')
    Left = 344
    Top = 248
    object ConsE120PedCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E120PED"."CODEMP"'
      Required = True
    end
    object ConsE120PedCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Origin = '"E120PED"."CODFIL"'
      Required = True
    end
    object ConsE120PedNUMCON: TIntegerField
      FieldName = 'NUMCON'
      Origin = '"E120PED"."NUMCON"'
    end
    object ConsE120PedNUMPED: TIntegerField
      FieldName = 'NUMPED'
      Origin = '"E120PED"."NUMPED"'
    end
    object ConsE120PedCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"E120PED"."CODREP"'
      Required = True
    end
    object ConsE120PedCODCLI: TIntegerField
      FieldName = 'CODCLI'
      Origin = '"E120PED"."CODCLI"'
    end
    object ConsE120PedTNSPRO: TIBStringField
      FieldName = 'TNSPRO'
      Origin = '"E120PED"."TNSPRO"'
      Required = True
      Size = 5
    end
    object ConsE120PedDATEMI: TDateField
      FieldName = 'DATEMI'
      Origin = '"E120PED"."DATEMI"'
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
    object ConsE120PedPEDPRO: TIBStringField
      FieldName = 'PEDPRO'
      Origin = '"E120PED"."PEDPRO"'
      FixedChar = True
      Size = 1
    end
  end
  object ConsE120Ipd: TIBQuery
    Database = Banco
    Transaction = ibtTransacao
    SQL.Strings = (
      'SELECT * FROM E120IPD')
    Left = 432
    Top = 248
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
    object ConsE120IpdCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"E120IPD"."CODREP"'
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
    end
    object ConsE120IpdPERIPI: TFloatField
      FieldName = 'PERIPI'
      Origin = '"E120IPD"."PERIPI"'
    end
    object ConsE120IpdPERICM: TFloatField
      FieldName = 'PERICM'
      Origin = '"E120IPD"."PERICM"'
    end
    object ConsE120IpdPERCOM: TFloatField
      FieldName = 'PERCOM'
      Origin = '"E120IPD"."PERCOM"'
    end
    object ConsE120IpdVLRBRU: TFloatField
      FieldName = 'VLRBRU'
      Origin = '"E120IPD"."VLRBRU"'
    end
    object ConsE120IpdVLRBIP: TFloatField
      FieldName = 'VLRBIP'
      Origin = '"E120IPD"."VLRBIP"'
    end
    object ConsE120IpdVLRIPI: TFloatField
      FieldName = 'VLRIPI'
      Origin = '"E120IPD"."VLRIPI"'
    end
    object ConsE120IpdVLRBIC: TFloatField
      FieldName = 'VLRBIC'
      Origin = '"E120IPD"."VLRBIC"'
    end
    object ConsE120IpdVLRICM: TFloatField
      FieldName = 'VLRICM'
      Origin = '"E120IPD"."VLRICM"'
    end
    object ConsE120IpdVLRBSI: TFloatField
      FieldName = 'VLRBSI'
      Origin = '"E120IPD"."VLRBSI"'
    end
    object ConsE120IpdVLRICS: TFloatField
      FieldName = 'VLRICS'
      Origin = '"E120IPD"."VLRICS"'
    end
    object ConsE120IpdVLRBCO: TFloatField
      FieldName = 'VLRBCO'
      Origin = '"E120IPD"."VLRBCO"'
    end
    object ConsE120IpdVLRCOM: TFloatField
      FieldName = 'VLRCOM'
      Origin = '"E120IPD"."VLRCOM"'
    end
    object ConsE120IpdVLRLPR: TFloatField
      FieldName = 'VLRLPR'
      Origin = '"E120IPD"."VLRLPR"'
    end
    object ConsE120IpdVLRLIQ: TFloatField
      FieldName = 'VLRLIQ'
      Origin = '"E120IPD"."VLRLIQ"'
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
    end
    object ConsE120IpdVLRORI: TFloatField
      FieldName = 'VLRORI'
      Origin = '"E120IPD"."VLRORI"'
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
    object ConsE120IpdCORES: TIBStringField
      FieldName = 'CORES'
      Origin = '"E120IPD"."CORES"'
      Size = 400
    end
  end
  object ConsUsu120Ipd: TIBQuery
    Database = Banco
    Transaction = ibtTransacao
    SQL.Strings = (
      'SELECT * FROM USU120IPD')
    Left = 512
    Top = 248
    object ConsUsu120IpdCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"USU120IPD"."CODEMP"'
      Required = True
    end
    object ConsUsu120IpdCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Origin = '"USU120IPD"."CODFIL"'
      Required = True
    end
    object ConsUsu120IpdNUMCON: TIntegerField
      FieldName = 'NUMCON'
      Origin = '"USU120IPD"."NUMCON"'
    end
    object ConsUsu120IpdCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"USU120IPD"."CODREP"'
      Required = True
    end
    object ConsUsu120IpdSEQIPD: TIntegerField
      FieldName = 'SEQIPD'
      Origin = '"USU120IPD"."SEQIPD"'
    end
    object ConsUsu120IpdSEQITE: TIntegerField
      FieldName = 'SEQITE'
      Origin = '"USU120IPD"."SEQITE"'
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
  end
  object ConsE120Obs: TIBQuery
    Database = Banco
    Transaction = ibtTransacao
    SQL.Strings = (
      'SELECT E120OBS.* FROM E120OBS')
    Left = 592
    Top = 248
    object ConsE120ObsCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E120OBS"."CODEMP"'
      Required = True
    end
    object ConsE120ObsCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Origin = '"E120OBS"."CODFIL"'
      Required = True
    end
    object ConsE120ObsNUMCON: TIntegerField
      FieldName = 'NUMCON'
      Origin = '"E120OBS"."NUMCON"'
    end
    object ConsE120ObsCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"E120OBS"."CODREP"'
      Required = True
    end
    object ConsE120ObsSEQOBS: TIntegerField
      FieldName = 'SEQOBS'
      Origin = '"E120OBS"."SEQOBS"'
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
  end
  object CadAtu_Realizado: TIBDataSet
    Database = Banco
    Transaction = ibtTransacao
    DeleteSQL.Strings = (
      'delete from ATU_REALIZADA'
      'where'
      '  DATATU = :OLD_DATATU and'
      '  HORATU = :OLD_HORATU')
    InsertSQL.Strings = (
      'insert into ATU_REALIZADA'
      '  (CODREP, CODUSU, DATATU, HORATU, VERSAO)'
      'values'
      '  (:CODREP, :CODUSU, :DATATU, :HORATU, :VERSAO)')
    RefreshSQL.Strings = (
      'Select '
      '  DATATU,'
      '  HORATU,'
      '  CODUSU,'
      '  CODREP,'
      '  VERSAO'
      'from ATU_REALIZADA '
      'where'
      '  DATATU = :DATATU and'
      '  HORATU = :HORATU')
    SelectSQL.Strings = (
      'SELECT * FROM ATU_REALIZADA'
      'WHERE'
      'DATATU = :DATATU AND'
      'HORATU = :HORATU')
    ModifySQL.Strings = (
      'update ATU_REALIZADA'
      'set'
      '  CODREP = :CODREP,'
      '  CODUSU = :CODUSU,'
      '  DATATU = :DATATU,'
      '  HORATU = :HORATU,'
      '  VERSAO = :VERSAO'
      'where'
      '  DATATU = :OLD_DATATU and'
      '  HORATU = :OLD_HORATU')
    Left = 224
    Top = 24
    object CadAtu_RealizadoDATATU: TDateField
      FieldName = 'DATATU'
      Origin = '"ATU_REALIZADA"."DATATU"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadAtu_RealizadoHORATU: TTimeField
      FieldName = 'HORATU'
      Origin = '"ATU_REALIZADA"."HORATU"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadAtu_RealizadoCODUSU: TIntegerField
      FieldName = 'CODUSU'
      Origin = '"ATU_REALIZADA"."CODUSU"'
    end
    object CadAtu_RealizadoCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"ATU_REALIZADA"."CODREP"'
    end
    object CadAtu_RealizadoVERSAO: TIBStringField
      FieldName = 'VERSAO'
      Origin = '"ATU_REALIZADA"."VERSAO"'
      Size = 10
    end
  end
  object ConsE100usu: TIBQuery
    Database = Banco
    Transaction = ibtTransacao
    SQL.Strings = (
      'SELECT * FROM E100USU WHERE CHAVE = :CHAVE')
    Left = 408
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CHAVE'
        ParamType = ptUnknown
      end>
    object ConsE100usuCODUSU: TIntegerField
      FieldName = 'CODUSU'
      Origin = '"E100USU"."CODUSU"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE100usuLOGUSU: TIBStringField
      FieldName = 'LOGUSU'
      Origin = '"E100USU"."LOGUSU"'
      Size = 40
    end
    object ConsE100usuSENUSU: TIBStringField
      FieldName = 'SENUSU'
      Origin = '"E100USU"."SENUSU"'
      Size = 40
    end
    object ConsE100usuDATCAD: TDateField
      FieldName = 'DATCAD'
      Origin = '"E100USU"."DATCAD"'
    end
    object ConsE100usuSITUSU: TIBStringField
      FieldName = 'SITUSU'
      Origin = '"E100USU"."SITUSU"'
      FixedChar = True
      Size = 1
    end
    object ConsE100usuCHAVE: TIBStringField
      FieldName = 'CHAVE'
      Origin = '"E100USU"."CHAVE"'
    end
    object ConsE100usuNOMUSU: TIBStringField
      FieldName = 'NOMUSU'
      Origin = '"E100USU"."NOMUSU"'
      Size = 50
    end
    object ConsE100usuCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"E100USU"."CODREP"'
    end
    object ConsE100usuNOMREP: TIBStringField
      FieldName = 'NOMREP'
      Origin = '"E100USU"."NOMREP"'
      Size = 60
    end
    object ConsE100usuUSUADM: TIBStringField
      FieldName = 'USUADM'
      Origin = '"E100USU"."USUADM"'
      FixedChar = True
      Size = 1
    end
    object ConsE100usuNCIE: TIntegerField
      FieldName = 'NCIE'
      Origin = '"E100USU"."NCIE"'
    end
    object ConsE100usuNCFE: TIntegerField
      FieldName = 'NCFE'
      Origin = '"E100USU"."NCFE"'
    end
    object ConsE100usuNCAE: TIntegerField
      FieldName = 'NCAE'
      Origin = '"E100USU"."NCAE"'
    end
    object ConsE100usuNCII: TIntegerField
      FieldName = 'NCII'
      Origin = '"E100USU"."NCII"'
    end
    object ConsE100usuNCFI: TIntegerField
      FieldName = 'NCFI'
      Origin = '"E100USU"."NCFI"'
    end
    object ConsE100usuNCAI: TIntegerField
      FieldName = 'NCAI'
      Origin = '"E100USU"."NCAI"'
    end
  end
  object CadE120Ped: TIBDataSet
    Database = Banco
    Transaction = ibtTransacao
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
      
        '   NUMCON, NUMPED, PEDCON, PEDENV, PEDPRO, PRECAR, QTDABE, QTDOR' +
        'I, SITPED, '
      
        '   TNSPRO, USUCON, USUGER, VLRBCO, VLRBIC, VLRBIP, VLRCOM, VLRIC' +
        'M, VLRIPI, '
      '   VLRLIQ, VLRORI)'
      'values'
      
        '  (:CODCLI, :CODCPG, :CODEMP, :CODFIL, :CODREP, :DATCON, :DATEMI' +
        ', :DATENV, '
      
        '   :DATGER, :NUMCON, :NUMPED, :PEDCON, :PEDENV, :PEDPRO, :PRECAR' +
        ', :QTDABE, '
      
        '   :QTDORI, :SITPED, :TNSPRO, :USUCON, :USUGER, :VLRBCO, :VLRBIC' +
        ', :VLRBIP, '
      '   :VLRCOM, :VLRICM, :VLRIPI, :VLRLIQ, :VLRORI)')
    RefreshSQL.Strings = (
      'Select '
      '  CODEMP,'
      '  CODFIL,'
      '  NUMCON,'
      '  NUMPED,'
      '  CODREP,'
      '  CODCLI,'
      '  TNSPRO,'
      '  DATEMI,'
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
      '  PRECAR,'
      '  PEDPRO'
      'from E120PED '
      'where'
      '  CODEMP = :CODEMP and'
      '  CODFIL = :CODFIL and'
      '  CODREP = :CODREP and'
      '  NUMCON = :NUMCON')
    SelectSQL.Strings = (
      'select * from E120PED where'
      'CODEMP = :CODEMP and'
      'CODFIL = :CODFIL and'
      'NUMCON = :NUMCON and'
      'CODREP = :CODREP')
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
      '  PEDPRO = :PEDPRO,'
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
    Left = 344
    Top = 200
    object CadE120PedCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E120PED"."CODEMP"'
      Required = True
    end
    object CadE120PedCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Origin = '"E120PED"."CODFIL"'
      Required = True
    end
    object CadE120PedNUMCON: TIntegerField
      FieldName = 'NUMCON'
      Origin = '"E120PED"."NUMCON"'
    end
    object CadE120PedNUMPED: TIntegerField
      FieldName = 'NUMPED'
      Origin = '"E120PED"."NUMPED"'
    end
    object CadE120PedCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"E120PED"."CODREP"'
      Required = True
    end
    object CadE120PedCODCLI: TIntegerField
      FieldName = 'CODCLI'
      Origin = '"E120PED"."CODCLI"'
    end
    object CadE120PedTNSPRO: TIBStringField
      FieldName = 'TNSPRO'
      Origin = '"E120PED"."TNSPRO"'
      Required = True
      Size = 5
    end
    object CadE120PedDATEMI: TDateField
      FieldName = 'DATEMI'
      Origin = '"E120PED"."DATEMI"'
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
    object CadE120PedPEDPRO: TIBStringField
      FieldName = 'PEDPRO'
      Origin = '"E120PED"."PEDPRO"'
      FixedChar = True
      Size = 1
    end
  end
  object CadE120Ipd: TIBDataSet
    Database = Banco
    Transaction = ibtTransacao
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
        'R, CORES, '
      
        '   CORGRID, DATEMI, DATENT, DATGER, NUMCON, NUMPED, PERCOM, PERI' +
        'CM, PERIPI, '
      
        '   PREUNI, QTDABE, QTDCAN, QTDFAT, QTDPED, SEQIPD, SITIPD, TNSPR' +
        'O, TOTDESC, '
      
        '   UNIMED, USUGER, VLRBCO, VLRBIC, VLRBIP, VLRBRU, VLRBSI, VLRCO' +
        'M, VLRICM, '
      '   VLRICS, VLRIPI, VLRLIQ, VLRLPR, VLRORI)'
      'values'
      
        '  (:CODDEP, :CODDER, :CODEMP, :CODFAM, :CODFIL, :CODPRO, :CODREP' +
        ', :CODTPR, '
      
        '   :CORES, :CORGRID, :DATEMI, :DATENT, :DATGER, :NUMCON, :NUMPED' +
        ', :PERCOM, '
      
        '   :PERICM, :PERIPI, :PREUNI, :QTDABE, :QTDCAN, :QTDFAT, :QTDPED' +
        ', :SEQIPD, '
      
        '   :SITIPD, :TNSPRO, :TOTDESC, :UNIMED, :USUGER, :VLRBCO, :VLRBI' +
        'C, :VLRBIP, '
      
        '   :VLRBRU, :VLRBSI, :VLRCOM, :VLRICM, :VLRICS, :VLRIPI, :VLRLIQ' +
        ', :VLRLPR, '
      '   :VLRORI)')
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
      '  CORGRID,'
      '  CORES'
      'from E120IPD '
      'where'
      '  CODEMP = :CODEMP and'
      '  CODFIL = :CODFIL and'
      '  CODREP = :CODREP and'
      '  NUMCON = :NUMCON and'
      '  SEQIPD = :SEQIPD')
    SelectSQL.Strings = (
      'select * from E120IPD where'
      'CODEMP = :CODEMP and'
      'CODFIL = :CODFIL and'
      'NUMCON = :NUMCON and'
      'CODREP = :CODREP AND'
      'SEQIPD = :SEQIPD')
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
      '  CORES = :CORES,'
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
    Left = 432
    Top = 200
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
    object CadE120IpdCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"E120IPD"."CODREP"'
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
    object CadE120IpdCORES: TIBStringField
      FieldName = 'CORES'
      Origin = '"E120IPD"."CORES"'
      Size = 400
    end
  end
  object CadUsu120Ipd: TIBDataSet
    Database = Banco
    Transaction = ibtTransacao
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
      'select * from USU120IPD where'
      'CODEMP = :CODEMP and'
      'CODFIL = :CODFIL and'
      'NUMCON = :NUMCON and'
      'CODREP = :CODREP AND'
      'SEQIPD = :SEQIPD AND'
      'SEQITE = :SEQITE')
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
    Left = 512
    Top = 200
    object CadUsu120IpdCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"USU120IPD"."CODEMP"'
      Required = True
    end
    object CadUsu120IpdCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Origin = '"USU120IPD"."CODFIL"'
      Required = True
    end
    object CadUsu120IpdNUMCON: TIntegerField
      FieldName = 'NUMCON'
      Origin = '"USU120IPD"."NUMCON"'
    end
    object CadUsu120IpdCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"USU120IPD"."CODREP"'
      Required = True
    end
    object CadUsu120IpdSEQIPD: TIntegerField
      FieldName = 'SEQIPD'
      Origin = '"USU120IPD"."SEQIPD"'
    end
    object CadUsu120IpdSEQITE: TIntegerField
      FieldName = 'SEQITE'
      Origin = '"USU120IPD"."SEQITE"'
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
  end
  object CadE120Obs: TIBDataSet
    Database = Banco
    Transaction = ibtTransacao
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
      'SELECT * FROM E120OBS'
      'WHERE'
      'CODEMP = :CODEMP AND'
      'CODFIL = :CODFIL AND'
      'NUMCON = :NUMCON AND'
      'CODREP = :CODREP AND'
      'SEQOBS = :SEQOBS')
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
    Left = 584
    Top = 200
    object CadE120ObsCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E120OBS"."CODEMP"'
      Required = True
    end
    object CadE120ObsCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Origin = '"E120OBS"."CODFIL"'
      Required = True
    end
    object CadE120ObsNUMCON: TIntegerField
      FieldName = 'NUMCON'
      Origin = '"E120OBS"."NUMCON"'
    end
    object CadE120ObsCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"E120OBS"."CODREP"'
      Required = True
    end
    object CadE120ObsSEQOBS: TIntegerField
      FieldName = 'SEQOBS'
      Origin = '"E120OBS"."SEQOBS"'
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
  end
  object UltimaFaixaNumCon: TIBQuery
    Database = Banco
    Transaction = ibtTransacao
    SQL.Strings = (
      
        'SELECT MAX(NCFI) AS ULTIMA_I, MAX(NCFE) AS ULTIMA_E FROM E100USU' +
        ' ')
    Left = 360
    Top = 128
    object UltimaFaixaNumConULTIMA_I: TIntegerField
      FieldName = 'ULTIMA_I'
      ProviderFlags = []
    end
    object UltimaFaixaNumConULTIMA_E: TIntegerField
      FieldName = 'ULTIMA_E'
      ProviderFlags = []
    end
  end
  object CadE100Usu: TIBDataSet
    Database = Banco
    Transaction = ibtTransacao
    DeleteSQL.Strings = (
      'delete from E100USU'
      'where'
      '  CODUSU = :OLD_CODUSU')
    InsertSQL.Strings = (
      'insert into E100USU'
      
        '  (CHAVE, CODREP, CODUSU, DATCAD, LOGUSU, NCAE, NCAI, NCFE, NCFI' +
        ', NCIE, '
      '   NCII, NOMREP, NOMUSU, SENUSU, SITUSU, USUADM)'
      'values'
      
        '  (:CHAVE, :CODREP, :CODUSU, :DATCAD, :LOGUSU, :NCAE, :NCAI, :NC' +
        'FE, :NCFI, '
      '   :NCIE, :NCII, :NOMREP, :NOMUSU, :SENUSU, :SITUSU, :USUADM)')
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
      '  NCIE,'
      '  NCFE,'
      '  NCAE,'
      '  NCII,'
      '  NCFI,'
      '  NCAI'
      'from E100USU '
      'where'
      '  CODUSU = :CODUSU')
    SelectSQL.Strings = (
      'SELECT * FROM E100USU WHERE CODUSU = :CODUSU')
    ModifySQL.Strings = (
      'update E100USU'
      'set'
      '  CHAVE = :CHAVE,'
      '  CODREP = :CODREP,'
      '  CODUSU = :CODUSU,'
      '  DATCAD = :DATCAD,'
      '  LOGUSU = :LOGUSU,'
      '  NCAE = :NCAE,'
      '  NCAI = :NCAI,'
      '  NCFE = :NCFE,'
      '  NCFI = :NCFI,'
      '  NCIE = :NCIE,'
      '  NCII = :NCII,'
      '  NOMREP = :NOMREP,'
      '  NOMUSU = :NOMUSU,'
      '  SENUSU = :SENUSU,'
      '  SITUSU = :SITUSU,'
      '  USUADM = :USUADM'
      'where'
      '  CODUSU = :OLD_CODUSU')
    Left = 488
    Top = 24
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
    object CadE100UsuNCIE: TIntegerField
      FieldName = 'NCIE'
      Origin = '"E100USU"."NCIE"'
    end
    object CadE100UsuNCFE: TIntegerField
      FieldName = 'NCFE'
      Origin = '"E100USU"."NCFE"'
    end
    object CadE100UsuNCAE: TIntegerField
      FieldName = 'NCAE'
      Origin = '"E100USU"."NCAE"'
    end
    object CadE100UsuNCII: TIntegerField
      FieldName = 'NCII'
      Origin = '"E100USU"."NCII"'
    end
    object CadE100UsuNCFI: TIntegerField
      FieldName = 'NCFI'
      Origin = '"E100USU"."NCFI"'
    end
    object CadE100UsuNCAI: TIntegerField
      FieldName = 'NCAI'
      Origin = '"E100USU"."NCAI"'
    end
  end
  object ConsE090Rcp: TIBQuery
    Database = Banco
    Transaction = ibtTransacao
    SQL.Strings = (
      'select * from e090rcp where codrep = :codrep')
    Left = 128
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codrep'
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
end
