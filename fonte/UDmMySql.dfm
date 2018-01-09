object DmMySql: TDmMySql
  OldCreateOrder = False
  Height = 519
  Width = 670
  object Banco: TZConnection
    Protocol = 'mysql-5'
    HostName = 'mysql12.redehost.com.br'
    Port = 3306
    Database = 'sysrep'
    User = 'sysrep'
    Password = 'liderlar1483'
    TransactIsolationLevel = tiReadCommitted
    Left = 48
    Top = 32
  end
  object ConsE085Cli: TZQuery
    Connection = Banco
    SQL.Strings = (
      'SELECT * FROM E085CLI WHERE CODREP = :CODREP')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CODREP'
        ParamType = ptUnknown
      end>
    Left = 56
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODREP'
        ParamType = ptUnknown
      end>
    object ConsE085CliCODCLI: TIntegerField
      FieldName = 'CODCLI'
      Required = True
    end
    object ConsE085CliNOMCLI: TWideStringField
      FieldName = 'NOMCLI'
      Size = 100
    end
    object ConsE085CliAPECLI: TWideStringField
      FieldName = 'APECLI'
      Size = 50
    end
    object ConsE085CliINSEST: TWideStringField
      FieldName = 'INSEST'
      Size = 25
    end
    object ConsE085CliENDCLI: TWideStringField
      FieldName = 'ENDCLI'
      Size = 100
    end
    object ConsE085CliNENCLI: TWideStringField
      FieldName = 'NENCLI'
      Size = 60
    end
    object ConsE085CliCPLEND: TWideStringField
      FieldName = 'CPLEND'
    end
    object ConsE085CliCEPCLI: TWideStringField
      FieldName = 'CEPCLI'
      Size = 10
    end
    object ConsE085CliBAICLI: TWideStringField
      FieldName = 'BAICLI'
      Size = 75
    end
    object ConsE085CliCIDCLI: TWideStringField
      FieldName = 'CIDCLI'
      Size = 60
    end
    object ConsE085CliSIGUFS: TWideStringField
      FieldName = 'SIGUFS'
      Size = 2
    end
    object ConsE085CliSITCLI: TWideStringField
      FieldName = 'SITCLI'
      Size = 1
    end
    object ConsE085CliCGCCPF: TWideStringField
      FieldName = 'CGCCPF'
      Size = 14
    end
    object ConsE085CliFONCLI: TWideStringField
      FieldName = 'FONCLI'
    end
    object ConsE085CliCODREP: TIntegerField
      FieldName = 'CODREP'
    end
  end
  object ConsE085Hcl: TZQuery
    Connection = Banco
    SQL.Strings = (
      'SELECT * FROM E085HCL WHERE CODREP = :CODREP')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CODREP'
        ParamType = ptUnknown
      end>
    Left = 136
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODREP'
        ParamType = ptUnknown
      end>
    object ConsE085HclCODCLI: TIntegerField
      FieldName = 'CODCLI'
      Required = True
    end
    object ConsE085HclCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Required = True
    end
    object ConsE085HclCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Required = True
    end
    object ConsE085HclCODREP: TIntegerField
      FieldName = 'CODREP'
    end
    object ConsE085HclSALDUP: TFloatField
      FieldName = 'SALDUP'
    end
    object ConsE085HclDATMAC: TDateField
      FieldName = 'DATMAC'
    end
    object ConsE085HclVLRMAC: TFloatField
      FieldName = 'VLRMAC'
    end
    object ConsE085HclDATUPE: TDateField
      FieldName = 'DATUPE'
    end
    object ConsE085HclVLRUPE: TFloatField
      FieldName = 'VLRUPE'
    end
    object ConsE085HclDATUFA: TDateField
      FieldName = 'DATUFA'
    end
    object ConsE085HclVLRUFA: TFloatField
      FieldName = 'VLRUFA'
    end
    object ConsE085HclDATUPG: TDateField
      FieldName = 'DATUPG'
    end
    object ConsE085HclVLRUPG: TFloatField
      FieldName = 'VLRUPG'
    end
    object ConsE085HclQTDPGT: TIntegerField
      FieldName = 'QTDPGT'
    end
    object ConsE085HclDATMFA: TDateField
      FieldName = 'DATMFA'
    end
    object ConsE085HclVLRMFA: TFloatField
      FieldName = 'VLRMFA'
    end
    object ConsE085HclDATATR: TDateField
      FieldName = 'DATATR'
    end
    object ConsE085HclVLRATR: TFloatField
      FieldName = 'VLRATR'
    end
    object ConsE085HclMAIATR: TIntegerField
      FieldName = 'MAIATR'
    end
    object ConsE085HclULTNFV: TFloatField
      FieldName = 'ULTNFV'
    end
  end
  object ConsE075Pro: TZQuery
    Connection = Banco
    SQL.Strings = (
      'SELECT * FROM E075PRO')
    Params = <>
    Left = 56
    Top = 160
    object ConsE075ProCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Required = True
    end
    object ConsE075ProCODPRO: TWideStringField
      FieldName = 'CODPRO'
      Required = True
      Size = 14
    end
    object ConsE075ProDESPRO: TWideStringField
      FieldName = 'DESPRO'
      Size = 100
    end
    object ConsE075ProCODFAM: TWideStringField
      FieldName = 'CODFAM'
      Size = 10
    end
    object ConsE075ProCODAGP: TWideStringField
      FieldName = 'CODAGP'
      Size = 10
    end
    object ConsE075ProSITPRO: TWideStringField
      FieldName = 'SITPRO'
      Size = 1
    end
  end
  object ConsE075Der: TZQuery
    Connection = Banco
    SQL.Strings = (
      'SELECT * FROM E075DER')
    Params = <>
    Left = 128
    Top = 159
    object ConsE075DerCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Required = True
    end
    object ConsE075DerCODPRO: TWideStringField
      FieldName = 'CODPRO'
      Required = True
      Size = 14
    end
    object ConsE075DerCODDER: TWideStringField
      FieldName = 'CODDER'
      Required = True
      Size = 7
    end
    object ConsE075DerDESDER: TWideStringField
      FieldName = 'DESDER'
      Size = 50
    end
    object ConsE075DerPESBRU: TFloatField
      FieldName = 'PESBRU'
    end
    object ConsE075DerPESLIQ: TFloatField
      FieldName = 'PESLIQ'
    end
    object ConsE075DerVOLDER: TFloatField
      FieldName = 'VOLDER'
    end
    object ConsE075DerSITDER: TWideStringField
      FieldName = 'SITDER'
      Size = 1
    end
    object ConsE075DerCORUNI: TFloatField
      FieldName = 'CORUNI'
    end
    object ConsE075DerCMP1BB: TFloatField
      FieldName = 'CMP1BB'
    end
    object ConsE075DerCMP1AC: TFloatField
      FieldName = 'CMP1AC'
    end
    object ConsE075DerCMP2BB: TFloatField
      FieldName = 'CMP2BB'
    end
    object ConsE075DerCMP2EN: TFloatField
      FieldName = 'CMP2EN'
    end
  end
  object ConsE075cor: TZQuery
    Connection = Banco
    SQL.Strings = (
      'SELECT * FROM E075COR')
    Params = <>
    Left = 208
    Top = 160
    object ConsE075corCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Required = True
    end
    object ConsE075corCODPRO: TWideStringField
      FieldName = 'CODPRO'
      Required = True
      Size = 14
    end
    object ConsE075corDESPRO: TWideStringField
      FieldName = 'DESPRO'
      Size = 100
    end
    object ConsE075corSITPRO: TWideStringField
      FieldName = 'SITPRO'
      Size = 1
    end
  end
  object ConsE028Cpg: TZQuery
    Connection = Banco
    SQL.Strings = (
      'SELECT * FROM E028CPG')
    Params = <>
    Left = 56
    Top = 216
    object ConsE028CpgCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Required = True
    end
    object ConsE028CpgCODCPG: TWideStringField
      FieldName = 'CODCPG'
      Required = True
      Size = 6
    end
    object ConsE028CpgCODUSU: TIntegerField
      FieldName = 'CODUSU'
    end
    object ConsE028CpgDESCPG: TWideStringField
      FieldName = 'DESCPG'
      Size = 50
    end
    object ConsE028CpgABRCPG: TWideStringField
      FieldName = 'ABRCPG'
      Size = 10
    end
    object ConsE028CpgPRZMED: TIntegerField
      FieldName = 'PRZMED'
    end
    object ConsE028CpgQTDPAR: TIntegerField
      FieldName = 'QTDPAR'
    end
    object ConsE028CpgSITCPG: TWideStringField
      FieldName = 'SITCPG'
      Size = 1
    end
    object ConsE028CpgPERCOM: TFloatField
      FieldName = 'PERCOM'
    end
  end
  object ConsE081Tab: TZQuery
    Connection = Banco
    SQL.Strings = (
      'SELECT * FROM E081TAB')
    Params = <>
    Left = 48
    Top = 272
    object ConsE081TabCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Required = True
    end
    object ConsE081TabCODTPR: TWideStringField
      FieldName = 'CODTPR'
      Required = True
      Size = 4
    end
    object ConsE081TabCODUSU: TIntegerField
      FieldName = 'CODUSU'
    end
    object ConsE081TabDESTPR: TWideStringField
      FieldName = 'DESTPR'
      Size = 30
    end
    object ConsE081TabSITTPR: TWideStringField
      FieldName = 'SITTPR'
      Size = 1
    end
  end
  object ConsE081Itp: TZQuery
    Connection = Banco
    SQL.Strings = (
      'SELECT * FROM E081ITP')
    Params = <>
    Left = 120
    Top = 272
    object ConsE081ItpCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Required = True
    end
    object ConsE081ItpCODTPR: TWideStringField
      FieldName = 'CODTPR'
      Required = True
      Size = 4
    end
    object ConsE081ItpCODPRO: TWideStringField
      FieldName = 'CODPRO'
      Required = True
      Size = 14
    end
    object ConsE081ItpCODDER: TWideStringField
      FieldName = 'CODDER'
      Required = True
      Size = 7
    end
    object ConsE081ItpCODUSU: TIntegerField
      FieldName = 'CODUSU'
    end
    object ConsE081ItpDESPRO: TWideStringField
      FieldName = 'DESPRO'
      Size = 100
    end
    object ConsE081ItpPREBAS: TFloatField
      FieldName = 'PREBAS'
    end
    object ConsE081ItpTOLMAI: TFloatField
      FieldName = 'TOLMAI'
    end
    object ConsE081ItpTOLMEN: TFloatField
      FieldName = 'TOLMEN'
    end
    object ConsE081ItpVLRMAI: TFloatField
      FieldName = 'VLRMAI'
    end
    object ConsE081ItpVLRMEN: TFloatField
      FieldName = 'VLRMEN'
    end
    object ConsE081ItpSITREG: TWideStringField
      FieldName = 'SITREG'
      Size = 1
    end
    object ConsE081ItpDATINI: TDateField
      FieldName = 'DATINI'
    end
    object ConsE081ItpDATFIM: TDateField
      FieldName = 'DATFIM'
    end
  end
  object ConsE075Ldc: TZQuery
    Connection = Banco
    SQL.Strings = (
      'SELECT * FROM E075LDC')
    Params = <>
    Left = 48
    Top = 320
    object ConsE075LdcCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Required = True
    end
    object ConsE075LdcCODPRO: TWideStringField
      FieldName = 'CODPRO'
      Required = True
      Size = 14
    end
    object ConsE075LdcCODDER: TWideStringField
      FieldName = 'CODDER'
      Required = True
      Size = 7
    end
    object ConsE075LdcCODTEC: TWideStringField
      FieldName = 'CODTEC'
      Required = True
      Size = 14
    end
    object ConsE075LdcDESTEC: TWideStringField
      FieldName = 'DESTEC'
      Size = 100
    end
    object ConsE075LdcSITLIG: TWideStringField
      FieldName = 'SITLIG'
      Size = 1
    end
  end
  object ConsE075LLdc: TZQuery
    Connection = Banco
    SQL.Strings = (
      'SELECT * FROM E075LLDC ')
    Params = <>
    Left = 128
    Top = 320
    object ConsE075LLdcNUMMOV: TIntegerField
      FieldName = 'NUMMOV'
      Required = True
    end
    object ConsE075LLdcCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Required = True
    end
    object ConsE075LLdcCODPRO: TWideStringField
      FieldName = 'CODPRO'
      Required = True
    end
    object ConsE075LLdcCODDER: TWideStringField
      FieldName = 'CODDER'
      Required = True
      Size = 10
    end
    object ConsE075LLdcCODTEC: TWideStringField
      FieldName = 'CODTEC'
      Required = True
    end
    object ConsE075LLdcDATMOV: TDateField
      FieldName = 'DATMOV'
      Required = True
    end
    object ConsE075LLdcTIPMOV: TWideStringField
      FieldName = 'TIPMOV'
      Size = 1
    end
  end
  object ConsE301Tcr: TZQuery
    Connection = Banco
    SQL.Strings = (
      'SELECT * FROM E301TCR WHERE CODREP = :CODREP')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CODREP'
        ParamType = ptUnknown
      end>
    Left = 56
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODREP'
        ParamType = ptUnknown
      end>
    object ConsE301TcrCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Required = True
    end
    object ConsE301TcrCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Required = True
    end
    object ConsE301TcrNUMTIT: TWideStringField
      FieldName = 'NUMTIT'
      Required = True
      Size = 15
    end
    object ConsE301TcrCODTPT: TWideStringField
      FieldName = 'CODTPT'
      Required = True
      Size = 3
    end
    object ConsE301TcrCODTNS: TWideStringField
      FieldName = 'CODTNS'
      Size = 5
    end
    object ConsE301TcrSITTIT: TWideStringField
      FieldName = 'SITTIT'
      Size = 2
    end
    object ConsE301TcrDATEMI: TDateField
      FieldName = 'DATEMI'
    end
    object ConsE301TcrCODCLI: TIntegerField
      FieldName = 'CODCLI'
    end
    object ConsE301TcrVCTORI: TDateField
      FieldName = 'VCTORI'
    end
    object ConsE301TcrVLRORI: TFloatField
      FieldName = 'VLRORI'
    end
    object ConsE301TcrVCTPRO: TDateField
      FieldName = 'VCTPRO'
    end
    object ConsE301TcrDATPPT: TDateField
      FieldName = 'DATPPT'
    end
    object ConsE301TcrVLRABE: TFloatField
      FieldName = 'VLRABE'
    end
    object ConsE301TcrCODREP: TIntegerField
      FieldName = 'CODREP'
    end
  end
  object CadAtu_Realizado: TZQuery
    Connection = Banco
    SQL.Strings = (
      'SELECT * FROM ATU_REALIZADA'
      'WHERE'
      'DATATU = :DATATU AND'
      'HORATU = :HORATU')
    Params = <
      item
        DataType = ftUnknown
        Name = 'DATATU'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HORATU'
        ParamType = ptUnknown
      end>
    Left = 184
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATATU'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HORATU'
        ParamType = ptUnknown
      end>
    object CadAtu_RealizadoDATATU: TDateField
      FieldName = 'DATATU'
      Required = True
    end
    object CadAtu_RealizadoHORATU: TTimeField
      FieldName = 'HORATU'
      Required = True
    end
    object CadAtu_RealizadoCODUSU: TIntegerField
      FieldName = 'CODUSU'
    end
    object CadAtu_RealizadoCODREP: TIntegerField
      FieldName = 'CODREP'
    end
  end
  object ConsE100usu: TZQuery
    Connection = Banco
    SQL.Strings = (
      'SELECT * FROM E100USU WHERE CHAVE = :CHAVE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CHAVE'
        ParamType = ptUnknown
      end>
    Left = 360
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CHAVE'
        ParamType = ptUnknown
      end>
    object ConsE100usuCODUSU: TIntegerField
      FieldName = 'CODUSU'
      Required = True
    end
    object ConsE100usuLOGUSU: TWideStringField
      FieldName = 'LOGUSU'
      Size = 40
    end
    object ConsE100usuSENUSU: TWideStringField
      FieldName = 'SENUSU'
      Size = 40
    end
    object ConsE100usuDATCAD: TDateField
      FieldName = 'DATCAD'
    end
    object ConsE100usuSITUSU: TWideStringField
      FieldName = 'SITUSU'
      Size = 1
    end
    object ConsE100usuCHAVE: TWideStringField
      FieldName = 'CHAVE'
    end
    object ConsE100usuNOMUSU: TWideStringField
      FieldName = 'NOMUSU'
      Size = 50
    end
    object ConsE100usuCODREP: TIntegerField
      FieldName = 'CODREP'
    end
    object ConsE100usuNOMREP: TWideStringField
      FieldName = 'NOMREP'
      Size = 60
    end
    object ConsE100usuUSUADM: TWideStringField
      FieldName = 'USUADM'
      Size = 1
    end
    object ConsE100usuNCIE: TIntegerField
      FieldName = 'NCIE'
    end
    object ConsE100usuNCFE: TIntegerField
      FieldName = 'NCFE'
    end
    object ConsE100usuNCAE: TIntegerField
      FieldName = 'NCAE'
    end
    object ConsE100usuNCII: TIntegerField
      FieldName = 'NCII'
    end
    object ConsE100usuNCFI: TIntegerField
      FieldName = 'NCFI'
    end
    object ConsE100usuNCAI: TIntegerField
      FieldName = 'NCAI'
    end
  end
  object ConsSql: TZQuery
    Connection = Banco
    Params = <>
    Left = 544
    Top = 33
  end
  object CadE120Ped: TZQuery
    Connection = Banco
    SQL.Strings = (
      'select * from E120PED where'
      'CODEMP = :CODEMP and'
      'CODFIL = :CODFIL and'
      'NUMCON = :NUMCON and'
      'CODREP = :CODREP')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CODEMP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODFIL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMCON'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODREP'
        ParamType = ptUnknown
      end>
    Left = 256
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODEMP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODFIL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMCON'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODREP'
        ParamType = ptUnknown
      end>
    object CadE120PedCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Required = True
    end
    object CadE120PedCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Required = True
    end
    object CadE120PedNUMCON: TIntegerField
      FieldName = 'NUMCON'
      Required = True
    end
    object CadE120PedNUMPED: TIntegerField
      FieldName = 'NUMPED'
    end
    object CadE120PedCODREP: TIntegerField
      FieldName = 'CODREP'
      Required = True
    end
    object CadE120PedCODCLI: TIntegerField
      FieldName = 'CODCLI'
    end
    object CadE120PedTNSPRO: TWideStringField
      FieldName = 'TNSPRO'
      Size = 5
    end
    object CadE120PedDATEMI: TDateField
      FieldName = 'DATEMI'
    end
    object CadE120PedCODCPG: TWideStringField
      FieldName = 'CODCPG'
      Size = 6
    end
    object CadE120PedQTDORI: TFloatField
      FieldName = 'QTDORI'
    end
    object CadE120PedQTDABE: TFloatField
      FieldName = 'QTDABE'
    end
    object CadE120PedVLRBIP: TFloatField
      FieldName = 'VLRBIP'
    end
    object CadE120PedVLRIPI: TFloatField
      FieldName = 'VLRIPI'
    end
    object CadE120PedVLRBIC: TFloatField
      FieldName = 'VLRBIC'
    end
    object CadE120PedVLRICM: TFloatField
      FieldName = 'VLRICM'
    end
    object CadE120PedVLRBCO: TFloatField
      FieldName = 'VLRBCO'
    end
    object CadE120PedVLRCOM: TFloatField
      FieldName = 'VLRCOM'
    end
    object CadE120PedVLRLIQ: TFloatField
      FieldName = 'VLRLIQ'
    end
    object CadE120PedVLRORI: TFloatField
      FieldName = 'VLRORI'
    end
    object CadE120PedSITPED: TWideStringField
      FieldName = 'SITPED'
      Size = 1
    end
    object CadE120PedUSUGER: TIntegerField
      FieldName = 'USUGER'
    end
    object CadE120PedDATGER: TDateField
      FieldName = 'DATGER'
    end
    object CadE120PedPEDENV: TWideStringField
      FieldName = 'PEDENV'
      Size = 1
    end
    object CadE120PedDATENV: TDateField
      FieldName = 'DATENV'
    end
    object CadE120PedPEDCON: TWideStringField
      FieldName = 'PEDCON'
      Size = 1
    end
    object CadE120PedDATCON: TDateField
      FieldName = 'DATCON'
    end
    object CadE120PedUSUCON: TIntegerField
      FieldName = 'USUCON'
    end
    object CadE120PedPRECAR: TIntegerField
      FieldName = 'PRECAR'
    end
    object CadE120PedPEDPRO: TWideStringField
      FieldName = 'PEDPRO'
      Size = 1
    end
  end
  object CadE120Ipd: TZQuery
    Connection = Banco
    SQL.Strings = (
      'select * from E120IPD where'
      'CODEMP = :CODEMP and'
      'CODFIL = :CODFIL and'
      'NUMCON = :NUMCON and'
      'CODREP = :CODREP AND'
      'SEQIPD = :SEQIPD')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CODEMP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODFIL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMCON'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODREP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEQIPD'
        ParamType = ptUnknown
      end>
    Left = 336
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODEMP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODFIL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMCON'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODREP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEQIPD'
        ParamType = ptUnknown
      end>
    object CadE120IpdCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Required = True
    end
    object CadE120IpdCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Required = True
    end
    object CadE120IpdNUMPED: TIntegerField
      FieldName = 'NUMPED'
    end
    object CadE120IpdNUMCON: TIntegerField
      FieldName = 'NUMCON'
      Required = True
    end
    object CadE120IpdCODREP: TIntegerField
      FieldName = 'CODREP'
      Required = True
    end
    object CadE120IpdSEQIPD: TIntegerField
      FieldName = 'SEQIPD'
      Required = True
    end
    object CadE120IpdTNSPRO: TWideStringField
      FieldName = 'TNSPRO'
      Size = 5
    end
    object CadE120IpdCODPRO: TWideStringField
      FieldName = 'CODPRO'
      Size = 14
    end
    object CadE120IpdCODDER: TWideStringField
      FieldName = 'CODDER'
      Size = 7
    end
    object CadE120IpdCODFAM: TWideStringField
      FieldName = 'CODFAM'
      Size = 6
    end
    object CadE120IpdCODDEP: TWideStringField
      FieldName = 'CODDEP'
      Size = 10
    end
    object CadE120IpdQTDPED: TIntegerField
      FieldName = 'QTDPED'
    end
    object CadE120IpdQTDFAT: TIntegerField
      FieldName = 'QTDFAT'
    end
    object CadE120IpdQTDCAN: TIntegerField
      FieldName = 'QTDCAN'
    end
    object CadE120IpdQTDABE: TIntegerField
      FieldName = 'QTDABE'
    end
    object CadE120IpdUNIMED: TWideStringField
      FieldName = 'UNIMED'
      Size = 3
    end
    object CadE120IpdCODTPR: TWideStringField
      FieldName = 'CODTPR'
      Size = 4
    end
    object CadE120IpdPREUNI: TFloatField
      FieldName = 'PREUNI'
    end
    object CadE120IpdPERIPI: TFloatField
      FieldName = 'PERIPI'
    end
    object CadE120IpdPERICM: TFloatField
      FieldName = 'PERICM'
    end
    object CadE120IpdPERCOM: TFloatField
      FieldName = 'PERCOM'
    end
    object CadE120IpdVLRBRU: TFloatField
      FieldName = 'VLRBRU'
    end
    object CadE120IpdVLRBIP: TFloatField
      FieldName = 'VLRBIP'
    end
    object CadE120IpdVLRIPI: TFloatField
      FieldName = 'VLRIPI'
    end
    object CadE120IpdVLRBIC: TFloatField
      FieldName = 'VLRBIC'
    end
    object CadE120IpdVLRICM: TFloatField
      FieldName = 'VLRICM'
    end
    object CadE120IpdVLRBSI: TFloatField
      FieldName = 'VLRBSI'
    end
    object CadE120IpdVLRICS: TFloatField
      FieldName = 'VLRICS'
    end
    object CadE120IpdVLRBCO: TFloatField
      FieldName = 'VLRBCO'
    end
    object CadE120IpdVLRCOM: TFloatField
      FieldName = 'VLRCOM'
    end
    object CadE120IpdVLRLPR: TFloatField
      FieldName = 'VLRLPR'
    end
    object CadE120IpdVLRLIQ: TFloatField
      FieldName = 'VLRLIQ'
    end
    object CadE120IpdSITIPD: TWideStringField
      FieldName = 'SITIPD'
      Size = 1
    end
    object CadE120IpdUSUGER: TIntegerField
      FieldName = 'USUGER'
    end
    object CadE120IpdDATGER: TDateField
      FieldName = 'DATGER'
    end
    object CadE120IpdTOTDESC: TFloatField
      FieldName = 'TOTDESC'
    end
    object CadE120IpdVLRORI: TFloatField
      FieldName = 'VLRORI'
    end
    object CadE120IpdDATEMI: TDateField
      FieldName = 'DATEMI'
    end
    object CadE120IpdDATENT: TDateField
      FieldName = 'DATENT'
    end
    object CadE120IpdCORGRID: TWideStringField
      FieldName = 'CORGRID'
      Size = 30
    end
    object CadE120IpdCORES: TWideStringField
      FieldName = 'CORES'
      Size = 400
    end
  end
  object CadUsu120Ipd: TZQuery
    Connection = Banco
    SQL.Strings = (
      'select * from USU120IPD where'
      'CODEMP = :CODEMP and'
      'CODFIL = :CODFIL and'
      'NUMCON = :NUMCON and'
      'CODREP = :CODREP AND'
      'SEQIPD = :SEQIPD AND'
      'SEQITE = :SEQITE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CODEMP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODFIL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMCON'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODREP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEQIPD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEQITE'
        ParamType = ptUnknown
      end>
    Left = 408
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODEMP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODFIL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMCON'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODREP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEQIPD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEQITE'
        ParamType = ptUnknown
      end>
    object CadUsu120IpdCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Required = True
    end
    object CadUsu120IpdCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Required = True
    end
    object CadUsu120IpdNUMCON: TIntegerField
      FieldName = 'NUMCON'
      Required = True
    end
    object CadUsu120IpdCODREP: TIntegerField
      FieldName = 'CODREP'
      Required = True
    end
    object CadUsu120IpdSEQIPD: TIntegerField
      FieldName = 'SEQIPD'
      Required = True
    end
    object CadUsu120IpdSEQITE: TIntegerField
      FieldName = 'SEQITE'
      Required = True
    end
    object CadUsu120IpdNUMPED: TIntegerField
      FieldName = 'NUMPED'
    end
    object CadUsu120IpdQTDCOR: TIntegerField
      FieldName = 'QTDCOR'
    end
    object CadUsu120IpdQTDABE: TIntegerField
      FieldName = 'QTDABE'
    end
    object CadUsu120IpdQTDCAN: TIntegerField
      FieldName = 'QTDCAN'
    end
    object CadUsu120IpdTIPCMB: TIntegerField
      FieldName = 'TIPCMB'
    end
    object CadUsu120IpdCOR001: TWideStringField
      FieldName = 'COR001'
      Size = 14
    end
    object CadUsu120IpdCOR002: TWideStringField
      FieldName = 'COR002'
      Size = 14
    end
    object CadUsu120IpdCODPRO: TWideStringField
      FieldName = 'CODPRO'
      Size = 14
    end
    object CadUsu120IpdCODDER: TWideStringField
      FieldName = 'CODDER'
      Size = 7
    end
    object CadUsu120IpdTECTRA: TWideStringField
      FieldName = 'TECTRA'
      Size = 1
    end
    object CadUsu120IpdPRECAR: TIntegerField
      FieldName = 'PRECAR'
    end
  end
  object CadE120Obs: TZQuery
    Connection = Banco
    SQL.Strings = (
      'SELECT * FROM E120OBS'
      'WHERE'
      'CODEMP = :CODEMP AND'
      'CODFIL = :CODFIL AND'
      'NUMCON = :NUMCON AND'
      'CODREP = :CODREP AND'
      'SEQOBS = :SEQOBS')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CODEMP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODFIL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMCON'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODREP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEQOBS'
        ParamType = ptUnknown
      end>
    Left = 488
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODEMP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODFIL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMCON'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODREP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEQOBS'
        ParamType = ptUnknown
      end>
    object CadE120ObsCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Required = True
    end
    object CadE120ObsCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Required = True
    end
    object CadE120ObsNUMCON: TIntegerField
      FieldName = 'NUMCON'
      Required = True
    end
    object CadE120ObsCODREP: TIntegerField
      FieldName = 'CODREP'
      Required = True
    end
    object CadE120ObsSEQOBS: TIntegerField
      FieldName = 'SEQOBS'
      Required = True
    end
    object CadE120ObsNUMPED: TIntegerField
      FieldName = 'NUMPED'
    end
    object CadE120ObsOBSPED: TWideStringField
      FieldName = 'OBSPED'
      Size = 250
    end
    object CadE120ObsSITOBS: TWideStringField
      FieldName = 'SITOBS'
      Size = 1
    end
    object CadE120ObsOBSUSU: TIntegerField
      FieldName = 'OBSUSU'
    end
    object CadE120ObsOBSDAT: TDateField
      FieldName = 'OBSDAT'
    end
  end
  object CadE100Usu: TZQuery
    Connection = Banco
    SQL.Strings = (
      'SELECT * FROM E100USU WHERE CODUSU = :CODUSU')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CODUSU'
        ParamType = ptUnknown
      end>
    Left = 456
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODUSU'
        ParamType = ptUnknown
      end>
    object CadE100UsuCODUSU: TIntegerField
      FieldName = 'CODUSU'
      Required = True
    end
    object CadE100UsuLOGUSU: TWideStringField
      FieldName = 'LOGUSU'
      Size = 40
    end
    object CadE100UsuSENUSU: TWideStringField
      FieldName = 'SENUSU'
      Size = 40
    end
    object CadE100UsuDATCAD: TDateField
      FieldName = 'DATCAD'
    end
    object CadE100UsuSITUSU: TWideStringField
      FieldName = 'SITUSU'
      Size = 1
    end
    object CadE100UsuCHAVE: TWideStringField
      FieldName = 'CHAVE'
    end
    object CadE100UsuNOMUSU: TWideStringField
      FieldName = 'NOMUSU'
      Size = 50
    end
    object CadE100UsuCODREP: TIntegerField
      FieldName = 'CODREP'
    end
    object CadE100UsuNOMREP: TWideStringField
      FieldName = 'NOMREP'
      Size = 60
    end
    object CadE100UsuUSUADM: TWideStringField
      FieldName = 'USUADM'
      Size = 1
    end
    object CadE100UsuNCIE: TIntegerField
      FieldName = 'NCIE'
    end
    object CadE100UsuNCFE: TIntegerField
      FieldName = 'NCFE'
    end
    object CadE100UsuNCAE: TIntegerField
      FieldName = 'NCAE'
    end
    object CadE100UsuNCII: TIntegerField
      FieldName = 'NCII'
    end
    object CadE100UsuNCFI: TIntegerField
      FieldName = 'NCFI'
    end
    object CadE100UsuNCAI: TIntegerField
      FieldName = 'NCAI'
    end
  end
  object UltimaFaixaNumCon: TZQuery
    Connection = Banco
    SQL.Strings = (
      
        'SELECT MAX(NCFI) AS ULTIMA_I, MAX(NCFE) AS ULTIMA_E FROM E100USU' +
        ' ')
    Params = <>
    Left = 352
    Top = 104
    object UltimaFaixaNumConULTIMA_I: TIntegerField
      FieldName = 'ULTIMA_I'
      ReadOnly = True
    end
    object UltimaFaixaNumConULTIMA_E: TIntegerField
      FieldName = 'ULTIMA_E'
      ReadOnly = True
    end
  end
  object ConsE120Ped: TZQuery
    Connection = Banco
    SQL.Strings = (
      'SELECT E120PED.* FROM E120PED')
    Params = <>
    Left = 256
    Top = 312
    object ConsE120PedCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Required = True
    end
    object ConsE120PedCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Required = True
    end
    object ConsE120PedNUMCON: TIntegerField
      FieldName = 'NUMCON'
    end
    object ConsE120PedNUMPED: TIntegerField
      FieldName = 'NUMPED'
    end
    object ConsE120PedCODREP: TIntegerField
      FieldName = 'CODREP'
      Required = True
    end
    object ConsE120PedCODCLI: TIntegerField
      FieldName = 'CODCLI'
    end
    object ConsE120PedTNSPRO: TWideStringField
      FieldName = 'TNSPRO'
      Required = True
      Size = 5
    end
    object ConsE120PedDATEMI: TDateField
      FieldName = 'DATEMI'
    end
    object ConsE120PedCODCPG: TWideStringField
      FieldName = 'CODCPG'
      Size = 6
    end
    object ConsE120PedQTDORI: TFloatField
      FieldName = 'QTDORI'
    end
    object ConsE120PedQTDABE: TFloatField
      FieldName = 'QTDABE'
    end
    object ConsE120PedVLRBIP: TFloatField
      FieldName = 'VLRBIP'
    end
    object ConsE120PedVLRIPI: TFloatField
      FieldName = 'VLRIPI'
    end
    object ConsE120PedVLRBIC: TFloatField
      FieldName = 'VLRBIC'
    end
    object ConsE120PedVLRICM: TFloatField
      FieldName = 'VLRICM'
    end
    object ConsE120PedVLRBCO: TFloatField
      FieldName = 'VLRBCO'
    end
    object ConsE120PedVLRCOM: TFloatField
      FieldName = 'VLRCOM'
    end
    object ConsE120PedVLRLIQ: TFloatField
      FieldName = 'VLRLIQ'
    end
    object ConsE120PedVLRORI: TFloatField
      FieldName = 'VLRORI'
    end
    object ConsE120PedSITPED: TWideStringField
      FieldName = 'SITPED'
      Size = 1
    end
    object ConsE120PedUSUGER: TIntegerField
      FieldName = 'USUGER'
    end
    object ConsE120PedDATGER: TDateField
      FieldName = 'DATGER'
    end
    object ConsE120PedPEDENV: TWideStringField
      FieldName = 'PEDENV'
      Size = 1
    end
    object ConsE120PedDATENV: TDateField
      FieldName = 'DATENV'
    end
    object ConsE120PedPEDCON: TWideStringField
      FieldName = 'PEDCON'
      Size = 1
    end
    object ConsE120PedDATCON: TDateField
      FieldName = 'DATCON'
    end
    object ConsE120PedUSUCON: TIntegerField
      FieldName = 'USUCON'
    end
    object ConsE120PedPRECAR: TIntegerField
      FieldName = 'PRECAR'
    end
    object ConsE120PedPEDPRO: TWideStringField
      FieldName = 'PEDPRO'
      Size = 1
    end
  end
  object ConsE120Ipd: TZQuery
    Connection = Banco
    SQL.Strings = (
      'SELECT * FROM E120IPD')
    Params = <>
    Left = 336
    Top = 312
    object ConsE120IpdCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Required = True
    end
    object ConsE120IpdCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Required = True
    end
    object ConsE120IpdNUMPED: TIntegerField
      FieldName = 'NUMPED'
    end
    object ConsE120IpdNUMCON: TIntegerField
      FieldName = 'NUMCON'
    end
    object ConsE120IpdCODREP: TIntegerField
      FieldName = 'CODREP'
      Required = True
    end
    object ConsE120IpdSEQIPD: TIntegerField
      FieldName = 'SEQIPD'
    end
    object ConsE120IpdTNSPRO: TWideStringField
      FieldName = 'TNSPRO'
      Size = 5
    end
    object ConsE120IpdCODPRO: TWideStringField
      FieldName = 'CODPRO'
      Size = 14
    end
    object ConsE120IpdCODDER: TWideStringField
      FieldName = 'CODDER'
      Size = 7
    end
    object ConsE120IpdCODFAM: TWideStringField
      FieldName = 'CODFAM'
      Size = 6
    end
    object ConsE120IpdCODDEP: TWideStringField
      FieldName = 'CODDEP'
      Size = 10
    end
    object ConsE120IpdQTDPED: TIntegerField
      FieldName = 'QTDPED'
    end
    object ConsE120IpdQTDFAT: TIntegerField
      FieldName = 'QTDFAT'
    end
    object ConsE120IpdQTDCAN: TIntegerField
      FieldName = 'QTDCAN'
    end
    object ConsE120IpdQTDABE: TIntegerField
      FieldName = 'QTDABE'
    end
    object ConsE120IpdUNIMED: TWideStringField
      FieldName = 'UNIMED'
      Size = 3
    end
    object ConsE120IpdCODTPR: TWideStringField
      FieldName = 'CODTPR'
      Size = 4
    end
    object ConsE120IpdPREUNI: TFloatField
      FieldName = 'PREUNI'
    end
    object ConsE120IpdPERIPI: TFloatField
      FieldName = 'PERIPI'
    end
    object ConsE120IpdPERICM: TFloatField
      FieldName = 'PERICM'
    end
    object ConsE120IpdPERCOM: TFloatField
      FieldName = 'PERCOM'
    end
    object ConsE120IpdVLRBRU: TFloatField
      FieldName = 'VLRBRU'
    end
    object ConsE120IpdVLRBIP: TFloatField
      FieldName = 'VLRBIP'
    end
    object ConsE120IpdVLRIPI: TFloatField
      FieldName = 'VLRIPI'
    end
    object ConsE120IpdVLRBIC: TFloatField
      FieldName = 'VLRBIC'
    end
    object ConsE120IpdVLRICM: TFloatField
      FieldName = 'VLRICM'
    end
    object ConsE120IpdVLRBSI: TFloatField
      FieldName = 'VLRBSI'
    end
    object ConsE120IpdVLRICS: TFloatField
      FieldName = 'VLRICS'
    end
    object ConsE120IpdVLRBCO: TFloatField
      FieldName = 'VLRBCO'
    end
    object ConsE120IpdVLRCOM: TFloatField
      FieldName = 'VLRCOM'
    end
    object ConsE120IpdVLRLPR: TFloatField
      FieldName = 'VLRLPR'
    end
    object ConsE120IpdVLRLIQ: TFloatField
      FieldName = 'VLRLIQ'
    end
    object ConsE120IpdSITIPD: TWideStringField
      FieldName = 'SITIPD'
      Size = 1
    end
    object ConsE120IpdUSUGER: TIntegerField
      FieldName = 'USUGER'
    end
    object ConsE120IpdDATGER: TDateField
      FieldName = 'DATGER'
    end
    object ConsE120IpdTOTDESC: TFloatField
      FieldName = 'TOTDESC'
    end
    object ConsE120IpdVLRORI: TFloatField
      FieldName = 'VLRORI'
    end
    object ConsE120IpdDATEMI: TDateField
      FieldName = 'DATEMI'
    end
    object ConsE120IpdDATENT: TDateField
      FieldName = 'DATENT'
    end
    object ConsE120IpdCORGRID: TWideStringField
      FieldName = 'CORGRID'
      Size = 30
    end
    object ConsE120IpdCORES: TWideStringField
      FieldName = 'CORES'
      Size = 400
    end
  end
  object ConsUsu120Ipd: TZQuery
    Connection = Banco
    SQL.Strings = (
      'SELECT * FROM USU120IPD')
    Params = <>
    Left = 410
    Top = 312
    object ConsUsu120IpdCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Required = True
    end
    object ConsUsu120IpdCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Required = True
    end
    object ConsUsu120IpdNUMCON: TIntegerField
      FieldName = 'NUMCON'
    end
    object ConsUsu120IpdCODREP: TIntegerField
      FieldName = 'CODREP'
      Required = True
    end
    object ConsUsu120IpdSEQIPD: TIntegerField
      FieldName = 'SEQIPD'
    end
    object ConsUsu120IpdSEQITE: TIntegerField
      FieldName = 'SEQITE'
    end
    object ConsUsu120IpdNUMPED: TIntegerField
      FieldName = 'NUMPED'
    end
    object ConsUsu120IpdQTDCOR: TIntegerField
      FieldName = 'QTDCOR'
    end
    object ConsUsu120IpdQTDABE: TIntegerField
      FieldName = 'QTDABE'
    end
    object ConsUsu120IpdQTDCAN: TIntegerField
      FieldName = 'QTDCAN'
    end
    object ConsUsu120IpdTIPCMB: TIntegerField
      FieldName = 'TIPCMB'
    end
    object ConsUsu120IpdCOR001: TWideStringField
      FieldName = 'COR001'
      Size = 14
    end
    object ConsUsu120IpdCOR002: TWideStringField
      FieldName = 'COR002'
      Size = 14
    end
    object ConsUsu120IpdCODPRO: TWideStringField
      FieldName = 'CODPRO'
      Size = 14
    end
    object ConsUsu120IpdCODDER: TWideStringField
      FieldName = 'CODDER'
      Size = 7
    end
    object ConsUsu120IpdTECTRA: TWideStringField
      FieldName = 'TECTRA'
      Size = 1
    end
    object ConsUsu120IpdPRECAR: TIntegerField
      FieldName = 'PRECAR'
    end
  end
  object ConsE120Obs: TZQuery
    Connection = Banco
    SQL.Strings = (
      'SELECT E120OBS.* FROM E120OBS')
    Params = <>
    Left = 488
    Top = 312
    object ConsE120ObsCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Required = True
    end
    object ConsE120ObsCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Required = True
    end
    object ConsE120ObsNUMCON: TIntegerField
      FieldName = 'NUMCON'
    end
    object ConsE120ObsCODREP: TIntegerField
      FieldName = 'CODREP'
      Required = True
    end
    object ConsE120ObsSEQOBS: TIntegerField
      FieldName = 'SEQOBS'
    end
    object ConsE120ObsNUMPED: TIntegerField
      FieldName = 'NUMPED'
    end
    object ConsE120ObsOBSPED: TWideStringField
      FieldName = 'OBSPED'
      Size = 250
    end
    object ConsE120ObsSITOBS: TWideStringField
      FieldName = 'SITOBS'
      Size = 1
    end
    object ConsE120ObsOBSUSU: TIntegerField
      FieldName = 'OBSUSU'
    end
    object ConsE120ObsOBSDAT: TDateField
      FieldName = 'OBSDAT'
    end
  end
end
