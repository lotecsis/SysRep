object DmOra: TDmOra
  OldCreateOrder = False
  Height = 477
  Width = 591
  object Banco: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDAORA.1;Password=saplider;User ID=saplider;Data Sourc' +
      'e=liderlar;Persist Security Info=True'
    LoginPrompt = False
    Provider = 'MSDAORA.1'
    Left = 32
    Top = 32
  end
  object ConsUSU_TDERCOR: TADOQuery
    Connection = Banco
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select USU_TDERCOR.*'
      '  FROM USU_TDERCOR'
      '    WHERE'
      '      USU_SITTEC = '#39'A'#39)
    Left = 144
    Top = 32
    object ConsUSU_TDERCORUSU_CODEMP: TIntegerField
      FieldName = 'USU_CODEMP'
    end
    object ConsUSU_TDERCORUSU_CODPRO: TStringField
      FieldName = 'USU_CODPRO'
      Size = 14
    end
    object ConsUSU_TDERCORUSU_CODDER: TStringField
      FieldName = 'USU_CODDER'
      Size = 7
    end
    object ConsUSU_TDERCORUSU_CODTEC: TStringField
      FieldName = 'USU_CODTEC'
      Size = 14
    end
    object ConsUSU_TDERCORUSU_SITTEC: TStringField
      FieldName = 'USU_SITTEC'
      Size = 1
    end
    object ConsUSU_TDERCORUSU_DESTEC: TStringField
      FieldName = 'USU_DESTEC'
      Size = 50
    end
  end
  object ConsE075Pro: TADOQuery
    Connection = Banco
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DATALT'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'DATGER'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'select e075pro.codemp,e075pro.codpro,e075pro.despro,e075pro.codf' +
        'am,e075pro.codagc,e075pro.sitpro'
      '                            from e075pro'
      '                            where codori IN (1,2) AND'
      
        '                           ((DATALT >= :DATALT) OR (datger >= :D' +
        'ATGER)) AND'
      
        '                                  CODAGC IN ('#39'ESTOF'#39','#39'COLCH'#39','#39'DI' +
        'VER'#39')'
      '                            order by codfam,codpro')
    Left = 272
    Top = 32
    object ConsE075ProCODEMP: TIntegerField
      FieldName = 'CODEMP'
    end
    object ConsE075ProCODPRO: TStringField
      FieldName = 'CODPRO'
      Size = 14
    end
    object ConsE075ProDESPRO: TStringField
      FieldName = 'DESPRO'
      Size = 100
    end
    object ConsE075ProCODFAM: TStringField
      FieldName = 'CODFAM'
      Size = 6
    end
    object ConsE075ProSITPRO: TStringField
      FieldName = 'SITPRO'
      Size = 1
    end
    object ConsE075ProCODAGC: TStringField
      FieldName = 'CODAGC'
      Size = 5
    end
  end
  object ConsE075Der: TADOQuery
    Connection = Banco
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'datger'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'datalt'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'select e075der.codemp,e075der.codpro,e075der.codder,e075der.desd' +
        'er,e075der.pesbru,e075der.pesliq,'
      
        '       e075der.volder,e075der.sitder,e075der.usu_coruni,e075der.' +
        'usu_cmp1bb,e075der.usu_cmp1ae,'
      '       e075der.usu_cmp2bb,e075der.usu_cmp2en'
      '       from e075der'
      'inner join e075pro on e075pro.codemp = e075der.codemp and'
      '                      e075pro.codpro = e075der.codpro and'
      '                      e075pro.codori in (1,2) and'
      '                      e075pro.CODAGP IN ('#39'ESTOF'#39','#39'COLCH'#39') and'
      
        '                      ((e075der.datger >= :datger) or (e075der.d' +
        'atalt >= :datalt))'
      '                      order by e075pro.codfam,e075der.codpro')
    Left = 360
    Top = 32
    object ConsE075DerCODEMP: TIntegerField
      FieldName = 'CODEMP'
    end
    object ConsE075DerCODPRO: TStringField
      FieldName = 'CODPRO'
      Size = 14
    end
    object ConsE075DerCODDER: TStringField
      FieldName = 'CODDER'
      Size = 7
    end
    object ConsE075DerDESDER: TStringField
      FieldName = 'DESDER'
      Size = 50
    end
    object ConsE075DerPESBRU: TFMTBCDField
      FieldName = 'PESBRU'
      Precision = 11
      Size = 5
    end
    object ConsE075DerPESLIQ: TFMTBCDField
      FieldName = 'PESLIQ'
      Precision = 11
      Size = 5
    end
    object ConsE075DerVOLDER: TFMTBCDField
      FieldName = 'VOLDER'
      Precision = 11
      Size = 5
    end
    object ConsE075DerSITDER: TStringField
      FieldName = 'SITDER'
      Size = 1
    end
    object ConsE075DerUSU_CORUNI: TBCDField
      FieldName = 'USU_CORUNI'
      Precision = 8
      Size = 2
    end
    object ConsE075DerUSU_CMP1BB: TBCDField
      FieldName = 'USU_CMP1BB'
      Precision = 8
      Size = 2
    end
    object ConsE075DerUSU_CMP1AE: TBCDField
      FieldName = 'USU_CMP1AE'
      Precision = 8
      Size = 2
    end
    object ConsE075DerUSU_CMP2BB: TBCDField
      FieldName = 'USU_CMP2BB'
      Precision = 8
      Size = 2
    end
    object ConsE075DerUSU_CMP2EN: TBCDField
      FieldName = 'USU_CMP2EN'
      Precision = 8
      Size = 2
    end
  end
  object PedidosSuspensos: TADOQuery
    Connection = Banco
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'codrep'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'select e120ped.codemp,e120ped.codfil,e120ped.numped,e120ped.tnsp' +
        'ro,e120ped.datemi,e120ped.codcli,'
      
        '       e120ped.codrep,e120ped.datger,e120ped.sitped,e120ped.usu_' +
        'precar,e120ped.usu_numcom,'
      '       e085cli.nomcli,e085cli.cidcli,e085cli.sigufs,'
      '       e001tns.destns,'
      '(select sum(e120ipd.vlrbru) from e120ipd where'
      '                      e120ipd.codemp = e120ped.codemp and'
      '                      e120ipd.codfil = e120ped.codfil and'
      
        '                      e120ipd.numped = e120ped.numped) as VlrBru' +
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
      
        '                                              e120ipd.numped = e' +
        '120ped.numped) as volume'
      '                      from e120ped'
      'inner join e085cli on e085cli.codcli = e120ped.codcli'
      'inner join e001tns on e001tns.codemp = e120ped.codemp and'
      '                      e001tns.codtns = e120ped.tnspro'
      '                                               where'
      
        '                                               e120ped.sitped in' +
        ' (3) and'
      
        '                                               e120ped.usu_preca' +
        'r = 0 and'
      
        '                                               e120ped.codfil = ' +
        '1 and'
      
        '                                               e120ped.codrep = ' +
        ':codrep'
      
        '                                               order by e120ped.' +
        'codrep,e120ped.datemi')
    Left = 54
    Top = 120
    object PedidosSuspensosCODEMP: TIntegerField
      FieldName = 'CODEMP'
    end
    object PedidosSuspensosCODFIL: TIntegerField
      FieldName = 'CODFIL'
    end
    object PedidosSuspensosNUMPED: TIntegerField
      FieldName = 'NUMPED'
    end
    object PedidosSuspensosTNSPRO: TStringField
      FieldName = 'TNSPRO'
      Size = 5
    end
    object PedidosSuspensosDATEMI: TDateTimeField
      FieldName = 'DATEMI'
    end
    object PedidosSuspensosCODCLI: TIntegerField
      FieldName = 'CODCLI'
    end
    object PedidosSuspensosCODREP: TIntegerField
      FieldName = 'CODREP'
    end
    object PedidosSuspensosDATGER: TDateTimeField
      FieldName = 'DATGER'
    end
    object PedidosSuspensosSITPED: TIntegerField
      FieldName = 'SITPED'
    end
    object PedidosSuspensosUSU_PRECAR: TIntegerField
      FieldName = 'USU_PRECAR'
    end
    object PedidosSuspensosUSU_NUMCOM: TIntegerField
      FieldName = 'USU_NUMCOM'
    end
    object PedidosSuspensosNOMCLI: TStringField
      FieldName = 'NOMCLI'
      Size = 100
    end
    object PedidosSuspensosCIDCLI: TStringField
      FieldName = 'CIDCLI'
      Size = 60
    end
    object PedidosSuspensosSIGUFS: TStringField
      FieldName = 'SIGUFS'
      Size = 2
    end
    object PedidosSuspensosDESTNS: TStringField
      FieldName = 'DESTNS'
      Size = 60
    end
    object PedidosSuspensosVLRBRU: TFMTBCDField
      FieldName = 'VLRBRU'
      ReadOnly = True
      Precision = 38
      Size = 0
    end
    object PedidosSuspensosVOLUME: TFMTBCDField
      FieldName = 'VOLUME'
      Precision = 38
      Size = 0
    end
  end
  object pvdPedidosSuspensos: TDataSetProvider
    DataSet = PedidosSuspensos
    Left = 54
    Top = 168
  end
  object ClientPedidosSuspensos: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'pvdPedidosSuspensos'
    Left = 54
    Top = 216
    object ClientPedidosSuspensosCODEMP: TIntegerField
      Alignment = taCenter
      FieldName = 'CODEMP'
    end
    object ClientPedidosSuspensosCODFIL: TIntegerField
      Alignment = taCenter
      FieldName = 'CODFIL'
    end
    object ClientPedidosSuspensosNUMPED: TIntegerField
      Alignment = taCenter
      FieldName = 'NUMPED'
    end
    object ClientPedidosSuspensosTNSPRO: TStringField
      Alignment = taCenter
      FieldName = 'TNSPRO'
      Size = 5
    end
    object ClientPedidosSuspensosDATEMI: TDateTimeField
      Alignment = taCenter
      FieldName = 'DATEMI'
    end
    object ClientPedidosSuspensosCODCLI: TIntegerField
      Alignment = taCenter
      FieldName = 'CODCLI'
    end
    object ClientPedidosSuspensosCODREP: TIntegerField
      Alignment = taCenter
      FieldName = 'CODREP'
    end
    object ClientPedidosSuspensosDATGER: TDateTimeField
      Alignment = taCenter
      FieldName = 'DATGER'
    end
    object ClientPedidosSuspensosSITPED: TIntegerField
      Alignment = taCenter
      FieldName = 'SITPED'
    end
    object ClientPedidosSuspensosUSU_PRECAR: TIntegerField
      Alignment = taCenter
      FieldName = 'USU_PRECAR'
    end
    object ClientPedidosSuspensosUSU_NUMCOM: TIntegerField
      Alignment = taCenter
      FieldName = 'USU_NUMCOM'
    end
    object ClientPedidosSuspensosNOMCLI: TStringField
      FieldName = 'NOMCLI'
      Size = 100
    end
    object ClientPedidosSuspensosCIDCLI: TStringField
      FieldName = 'CIDCLI'
      Size = 60
    end
    object ClientPedidosSuspensosSIGUFS: TStringField
      Alignment = taCenter
      FieldName = 'SIGUFS'
      Size = 2
    end
    object ClientPedidosSuspensosDESTNS: TStringField
      FieldName = 'DESTNS'
      Size = 60
    end
    object ClientPedidosSuspensosVLRBRU: TFMTBCDField
      Alignment = taCenter
      FieldName = 'VLRBRU'
      ReadOnly = True
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
      Precision = 38
      Size = 0
    end
    object ClientPedidosSuspensosVOLUME: TFMTBCDField
      Alignment = taCenter
      FieldName = 'VOLUME'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
      Precision = 38
      Size = 0
    end
    object ClientPedidosSuspensosTVlrBru: TAggregateField
      Alignment = taCenter
      FieldName = 'TVlrBru'
      Active = True
      DisplayFormat = ',0.00'
      Expression = 'SUM(VLRBRU)'
    end
    object ClientPedidosSuspensosTVolume: TAggregateField
      Alignment = taCenter
      FieldName = 'TVolume'
      Active = True
      DisplayFormat = ',0.00'
      Expression = 'SUM(VOLUME)'
    end
  end
  object PedidosLiberadosSemCarga: TADOQuery
    Connection = Banco
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'codrep'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'select e120ped.codemp,e120ped.codfil,e120ped.numped,e120ped.tnsp' +
        'ro,e120ped.datemi,e120ped.codcli,'
      
        '       e120ped.codrep,e120ped.datger,e120ped.sitped,e120ped.usu_' +
        'precar,e120ped.usu_numcom,'
      '       e085cli.nomcli,e085cli.cidcli,e085cli.sigufs,'
      '       e001tns.destns,'
      '(select sum(e120ipd.vlrbru) from e120ipd where'
      '                      e120ipd.codemp = e120ped.codemp and'
      '                      e120ipd.codfil = e120ped.codfil and'
      
        '                      e120ipd.numped = e120ped.numped) as VlrBru' +
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
      
        '                                              e120ipd.numped = e' +
        '120ped.numped) as volume'
      '                      from e120ped'
      'inner join e085cli on e085cli.codcli = e120ped.codcli'
      'inner join e001tns on e001tns.codemp = e120ped.codemp and'
      '                      e001tns.codtns = e120ped.tnspro'
      '                                               where'
      
        '                                               e120ped.sitped in' +
        ' (1,2) and'
      
        '                                               e120ped.usu_preca' +
        'r = 0 and'
      
        '                                               e120ped.codfil = ' +
        '1 and'
      
        '                                               e120ped.codrep = ' +
        ':codrep'
      
        '                                               order by e120ped.' +
        'codrep,e120ped.datemi')
    Left = 216
    Top = 120
    object PedidosLiberadosSemCargaCODEMP: TIntegerField
      FieldName = 'CODEMP'
    end
    object PedidosLiberadosSemCargaCODFIL: TIntegerField
      FieldName = 'CODFIL'
    end
    object PedidosLiberadosSemCargaNUMPED: TIntegerField
      FieldName = 'NUMPED'
    end
    object PedidosLiberadosSemCargaTNSPRO: TStringField
      FieldName = 'TNSPRO'
      Size = 5
    end
    object PedidosLiberadosSemCargaDATEMI: TDateTimeField
      FieldName = 'DATEMI'
    end
    object PedidosLiberadosSemCargaCODCLI: TIntegerField
      FieldName = 'CODCLI'
    end
    object PedidosLiberadosSemCargaCODREP: TIntegerField
      FieldName = 'CODREP'
    end
    object PedidosLiberadosSemCargaDATGER: TDateTimeField
      FieldName = 'DATGER'
    end
    object PedidosLiberadosSemCargaSITPED: TIntegerField
      FieldName = 'SITPED'
    end
    object PedidosLiberadosSemCargaUSU_PRECAR: TIntegerField
      FieldName = 'USU_PRECAR'
    end
    object PedidosLiberadosSemCargaUSU_NUMCOM: TIntegerField
      FieldName = 'USU_NUMCOM'
    end
    object PedidosLiberadosSemCargaNOMCLI: TStringField
      FieldName = 'NOMCLI'
      Size = 100
    end
    object PedidosLiberadosSemCargaCIDCLI: TStringField
      FieldName = 'CIDCLI'
      Size = 60
    end
    object PedidosLiberadosSemCargaSIGUFS: TStringField
      FieldName = 'SIGUFS'
      Size = 2
    end
    object PedidosLiberadosSemCargaDESTNS: TStringField
      FieldName = 'DESTNS'
      Size = 60
    end
    object PedidosLiberadosSemCargaVLRBRU: TFMTBCDField
      FieldName = 'VLRBRU'
      ReadOnly = True
      Precision = 38
      Size = 0
    end
    object PedidosLiberadosSemCargaVOLUME: TFMTBCDField
      FieldName = 'VOLUME'
      Precision = 38
      Size = 0
    end
  end
  object pvdPedidosLiberadosSemCarga: TDataSetProvider
    DataSet = PedidosLiberadosSemCarga
    Left = 216
    Top = 168
  end
  object ClientPedidosLiberadosSemCarga: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'pvdPedidosLiberadosSemCarga'
    OnCalcFields = ClientPedidosLiberadosSemCargaCalcFields
    Left = 216
    Top = 216
    object ClientPedidosLiberadosSemCargaCODEMP: TIntegerField
      Alignment = taCenter
      FieldName = 'CODEMP'
    end
    object ClientPedidosLiberadosSemCargaCODFIL: TIntegerField
      Alignment = taCenter
      FieldName = 'CODFIL'
    end
    object ClientPedidosLiberadosSemCargaNUMPED: TIntegerField
      Alignment = taCenter
      FieldName = 'NUMPED'
    end
    object ClientPedidosLiberadosSemCargaTNSPRO: TStringField
      Alignment = taCenter
      FieldName = 'TNSPRO'
      Size = 5
    end
    object ClientPedidosLiberadosSemCargaDATEMI: TDateTimeField
      Alignment = taCenter
      FieldName = 'DATEMI'
    end
    object ClientPedidosLiberadosSemCargaCODCLI: TIntegerField
      Alignment = taCenter
      FieldName = 'CODCLI'
    end
    object ClientPedidosLiberadosSemCargaCODREP: TIntegerField
      Alignment = taCenter
      FieldName = 'CODREP'
    end
    object ClientPedidosLiberadosSemCargaDATGER: TDateTimeField
      Alignment = taCenter
      FieldName = 'DATGER'
    end
    object ClientPedidosLiberadosSemCargaSITPED: TIntegerField
      Alignment = taCenter
      FieldName = 'SITPED'
    end
    object ClientPedidosLiberadosSemCargaUSU_PRECAR: TIntegerField
      Alignment = taCenter
      FieldName = 'USU_PRECAR'
    end
    object ClientPedidosLiberadosSemCargaUSU_NUMCOM: TIntegerField
      Alignment = taCenter
      FieldName = 'USU_NUMCOM'
    end
    object ClientPedidosLiberadosSemCargaNOMCLI: TStringField
      FieldName = 'NOMCLI'
      Size = 100
    end
    object ClientPedidosLiberadosSemCargaCIDCLI: TStringField
      FieldName = 'CIDCLI'
      Size = 60
    end
    object ClientPedidosLiberadosSemCargaSIGUFS: TStringField
      Alignment = taCenter
      FieldName = 'SIGUFS'
      Size = 2
    end
    object ClientPedidosLiberadosSemCargaDESTNS: TStringField
      FieldName = 'DESTNS'
      Size = 60
    end
    object ClientPedidosLiberadosSemCargaVLRBRU: TFMTBCDField
      Alignment = taCenter
      FieldName = 'VLRBRU'
      ReadOnly = True
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
      Precision = 38
      Size = 0
    end
    object ClientPedidosLiberadosSemCargaVOLUME: TFMTBCDField
      Alignment = taCenter
      FieldName = 'VOLUME'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
      Precision = 38
      Size = 0
    end
    object ClientPedidosLiberadosSemCargavaSitPed: TStringField
      FieldKind = fkCalculated
      FieldName = 'vaSitPed'
      Calculated = True
    end
    object ClientPedidosLiberadosSemCargaTVlrBru: TAggregateField
      Alignment = taCenter
      FieldName = 'TVlrBru'
      Active = True
      DisplayFormat = ',0.00'
      Expression = 'SUM(VLRBRU)'
    end
    object ClientPedidosLiberadosSemCargaTVolume: TAggregateField
      Alignment = taCenter
      FieldName = 'TVolume'
      Active = True
      DisplayFormat = ',0.00'
      Expression = 'SUM(VOLUME)'
    end
  end
  object ConsSql: TADOQuery
    Connection = Banco
    Parameters = <>
    Left = 488
    Top = 24
  end
  object PedidosLiberadosEmCarga: TADOQuery
    Connection = Banco
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'codrep'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'select e120ped.codemp,e120ped.codfil,e120ped.numped,e120ped.tnsp' +
        'ro,e120ped.datemi,e120ped.codcli,'
      
        '       e120ped.codrep,e120ped.datger,e120ped.sitped,e120ped.usu_' +
        'precar,e120ped.usu_numcom,'
      '       e085cli.nomcli,e085cli.cidcli,e085cli.sigufs,'
      '       e001tns.destns,'
      '(select sum(e120ipd.vlrbru) from e120ipd where'
      '                      e120ipd.codemp = e120ped.codemp and'
      '                      e120ipd.codfil = e120ped.codfil and'
      
        '                      e120ipd.numped = e120ped.numped) as VlrBru' +
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
      
        '                                              e120ipd.numped = e' +
        '120ped.numped) as volume'
      '                      from e120ped'
      'inner join e085cli on e085cli.codcli = e120ped.codcli'
      'inner join e001tns on e001tns.codemp = e120ped.codemp and'
      '                      e001tns.codtns = e120ped.tnspro'
      '                                               where'
      
        '                                               e120ped.sitped in' +
        ' (1,2) and'
      
        '                                               e120ped.usu_preca' +
        'r <> 0 and'
      
        '                                               e120ped.codfil = ' +
        '1 and'
      
        '                                               e120ped.codrep = ' +
        ':codrep'
      
        '                                               order by e120ped.' +
        'codrep,e120ped.datemi')
    Left = 392
    Top = 120
    object PedidosLiberadosEmCargaCODEMP: TIntegerField
      FieldName = 'CODEMP'
    end
    object PedidosLiberadosEmCargaCODFIL: TIntegerField
      FieldName = 'CODFIL'
    end
    object PedidosLiberadosEmCargaNUMPED: TIntegerField
      FieldName = 'NUMPED'
    end
    object PedidosLiberadosEmCargaTNSPRO: TStringField
      FieldName = 'TNSPRO'
      Size = 5
    end
    object PedidosLiberadosEmCargaDATEMI: TDateTimeField
      FieldName = 'DATEMI'
    end
    object PedidosLiberadosEmCargaCODCLI: TIntegerField
      FieldName = 'CODCLI'
    end
    object PedidosLiberadosEmCargaCODREP: TIntegerField
      FieldName = 'CODREP'
    end
    object PedidosLiberadosEmCargaDATGER: TDateTimeField
      FieldName = 'DATGER'
    end
    object PedidosLiberadosEmCargaSITPED: TIntegerField
      FieldName = 'SITPED'
    end
    object PedidosLiberadosEmCargaUSU_PRECAR: TIntegerField
      FieldName = 'USU_PRECAR'
    end
    object PedidosLiberadosEmCargaUSU_NUMCOM: TIntegerField
      FieldName = 'USU_NUMCOM'
    end
    object PedidosLiberadosEmCargaNOMCLI: TStringField
      FieldName = 'NOMCLI'
      Size = 100
    end
    object PedidosLiberadosEmCargaCIDCLI: TStringField
      FieldName = 'CIDCLI'
      Size = 60
    end
    object PedidosLiberadosEmCargaSIGUFS: TStringField
      FieldName = 'SIGUFS'
      Size = 2
    end
    object PedidosLiberadosEmCargaDESTNS: TStringField
      FieldName = 'DESTNS'
      Size = 60
    end
    object PedidosLiberadosEmCargaVLRBRU: TFMTBCDField
      FieldName = 'VLRBRU'
      ReadOnly = True
      Precision = 38
      Size = 0
    end
    object PedidosLiberadosEmCargaVOLUME: TFMTBCDField
      FieldName = 'VOLUME'
      Precision = 38
      Size = 0
    end
  end
  object pvdPedidosLiberadosEmCarga: TDataSetProvider
    DataSet = PedidosLiberadosEmCarga
    Left = 392
    Top = 168
  end
  object ClientPedidosLiberadosEmCarga: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'pvdPedidosLiberadosEmCarga'
    Left = 392
    Top = 216
    object ClientPedidosLiberadosEmCargaCODEMP: TIntegerField
      Alignment = taCenter
      FieldName = 'CODEMP'
    end
    object ClientPedidosLiberadosEmCargaCODFIL: TIntegerField
      Alignment = taCenter
      FieldName = 'CODFIL'
    end
    object ClientPedidosLiberadosEmCargaNUMPED: TIntegerField
      Alignment = taCenter
      FieldName = 'NUMPED'
    end
    object ClientPedidosLiberadosEmCargaTNSPRO: TStringField
      Alignment = taCenter
      FieldName = 'TNSPRO'
      Size = 5
    end
    object ClientPedidosLiberadosEmCargaDATEMI: TDateTimeField
      Alignment = taCenter
      FieldName = 'DATEMI'
    end
    object ClientPedidosLiberadosEmCargaCODCLI: TIntegerField
      Alignment = taCenter
      FieldName = 'CODCLI'
    end
    object ClientPedidosLiberadosEmCargaCODREP: TIntegerField
      Alignment = taCenter
      FieldName = 'CODREP'
    end
    object ClientPedidosLiberadosEmCargaDATGER: TDateTimeField
      Alignment = taCenter
      FieldName = 'DATGER'
    end
    object ClientPedidosLiberadosEmCargaSITPED: TIntegerField
      Alignment = taCenter
      FieldName = 'SITPED'
    end
    object ClientPedidosLiberadosEmCargaUSU_PRECAR: TIntegerField
      Alignment = taCenter
      FieldName = 'USU_PRECAR'
    end
    object ClientPedidosLiberadosEmCargaUSU_NUMCOM: TIntegerField
      Alignment = taCenter
      FieldName = 'USU_NUMCOM'
    end
    object ClientPedidosLiberadosEmCargaNOMCLI: TStringField
      FieldName = 'NOMCLI'
      Size = 100
    end
    object ClientPedidosLiberadosEmCargaCIDCLI: TStringField
      FieldName = 'CIDCLI'
      Size = 60
    end
    object ClientPedidosLiberadosEmCargaSIGUFS: TStringField
      Alignment = taCenter
      FieldName = 'SIGUFS'
      Size = 2
    end
    object ClientPedidosLiberadosEmCargaDESTNS: TStringField
      FieldName = 'DESTNS'
      Size = 60
    end
    object ClientPedidosLiberadosEmCargaVLRBRU: TFMTBCDField
      Alignment = taCenter
      FieldName = 'VLRBRU'
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 38
      Size = 0
    end
    object ClientPedidosLiberadosEmCargaVOLUME: TFMTBCDField
      Alignment = taCenter
      FieldName = 'VOLUME'
      DisplayFormat = ',0.00'
      Precision = 38
      Size = 0
    end
    object ClientPedidosLiberadosEmCargaTVlrBru: TAggregateField
      Alignment = taCenter
      FieldName = 'TVlrBru'
      Active = True
      DisplayFormat = ',0.00'
      Expression = 'SUM(VLRBRU)'
    end
    object ClientPedidosLiberadosEmCargaTVolume: TAggregateField
      Alignment = taCenter
      FieldName = 'TVolume'
      Active = True
      DisplayFormat = ',0.00'
      Expression = 'SUM(VOLUME)'
    end
  end
  object ItensPedido: TADOQuery
    Connection = Banco
    CursorType = ctStatic
    AfterScroll = ItensPedidoAfterScroll
    OnCalcFields = ItensPedidoCalcFields
    Parameters = <
      item
        Name = 'numped'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'select e120ipd.codemp,e120ipd.codfil,e120ipd.numped,e120ipd.seqi' +
        'pd,e120ipd.tnspro,'
      '       e120ipd.codpro,e120ipd.codder,e120ipd.cplipd,'
      
        '       e120ipd.qtdped,e120ipd.qtdcan,e120ipd.qtdfat,e120ipd.qtda' +
        'be,e120ipd.preuni,'
      '       e075der.desder'
      '       from e120ipd'
      'inner join e075der on e075der.codemp = e120ipd.codemp and'
      '                      e075der.codpro = e120ipd.codpro and'
      '                      e075der.codder = e120ipd.codder'
      '                      where'
      '                      e120ipd.codemp = 1 and'
      '                      e120ipd.codfil = 1 and'
      '                      e120ipd.numped = :numped'
      '                      order by e120ipd.seqipd')
    Left = 528
    Top = 120
    object ItensPedidoCODEMP: TIntegerField
      Alignment = taCenter
      FieldName = 'CODEMP'
    end
    object ItensPedidoCODFIL: TIntegerField
      Alignment = taCenter
      FieldName = 'CODFIL'
    end
    object ItensPedidoNUMPED: TIntegerField
      Alignment = taCenter
      FieldName = 'NUMPED'
    end
    object ItensPedidoSEQIPD: TIntegerField
      Alignment = taCenter
      FieldName = 'SEQIPD'
    end
    object ItensPedidoTNSPRO: TStringField
      Alignment = taCenter
      FieldName = 'TNSPRO'
      Size = 5
    end
    object ItensPedidoCODPRO: TStringField
      Alignment = taCenter
      FieldName = 'CODPRO'
      Size = 14
    end
    object ItensPedidoCODDER: TStringField
      Alignment = taCenter
      FieldName = 'CODDER'
      Size = 7
    end
    object ItensPedidoCPLIPD: TStringField
      FieldName = 'CPLIPD'
      Size = 250
    end
    object ItensPedidoQTDPED: TFMTBCDField
      Alignment = taCenter
      FieldName = 'QTDPED'
      Precision = 14
      Size = 5
    end
    object ItensPedidoQTDCAN: TFMTBCDField
      Alignment = taCenter
      FieldName = 'QTDCAN'
      Precision = 14
      Size = 5
    end
    object ItensPedidoQTDFAT: TFMTBCDField
      Alignment = taCenter
      FieldName = 'QTDFAT'
      Precision = 14
      Size = 5
    end
    object ItensPedidoQTDABE: TFMTBCDField
      Alignment = taCenter
      FieldName = 'QTDABE'
      Precision = 14
      Size = 5
    end
    object ItensPedidoPREUNI: TFMTBCDField
      Alignment = taCenter
      FieldName = 'PREUNI'
      DisplayFormat = ',0.00'
      Precision = 14
      Size = 5
    end
    object ItensPedidoDESDER: TStringField
      FieldName = 'DESDER'
      Size = 50
    end
    object ItensPedidovnVlrAbe: TFloatField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'vnVlrAbe'
      DisplayFormat = ',0.00'
      Calculated = True
    end
    object ItensPedidovnVlrPed: TFloatField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'vnVlrPed'
      DisplayFormat = ',0.00'
      Calculated = True
    end
  end
  object CoresPedido: TADOQuery
    Connection = Banco
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'NUMPED'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'SEQIPD'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT USU_QTDCOR, USU_TIPCMB, USU_COR001, USU_COR002, USU_QTDAB' +
        'E'
      '  FROM USU_T120IPD'
      '   WHERE'
      '     USU_CODEMP = 1 AND'
      '     USU_CODFIL = 1 AND'
      '     USU_NUMPED = :NUMPED AND'
      '     USU_SEQIPD = :SEQIPD')
    Left = 528
    Top = 176
    object CoresPedidoUSU_QTDCOR: TIntegerField
      Alignment = taCenter
      FieldName = 'USU_QTDCOR'
    end
    object CoresPedidoUSU_TIPCMB: TIntegerField
      Alignment = taCenter
      FieldName = 'USU_TIPCMB'
    end
    object CoresPedidoUSU_COR001: TStringField
      Alignment = taCenter
      FieldName = 'USU_COR001'
      Size = 14
    end
    object CoresPedidoUSU_COR002: TStringField
      Alignment = taCenter
      FieldName = 'USU_COR002'
      Size = 14
    end
    object CoresPedidoUSU_QTDABE: TIntegerField
      Alignment = taCenter
      FieldName = 'USU_QTDABE'
    end
  end
  object E301Tcr: TADOQuery
    Connection = Banco
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'vctpro'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'codrep'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT E301TCR.CODEMP,E301TCR.CODFIL,E301TCR.NUMTIT,E301TCR.CODT' +
        'PT,E301TCR.CODTNS,'
      
        '         E301TCR.SITTIT,E301TCR.DATEMI,E301TCR.CODCLI,E301TCR.OB' +
        'STCR,E301TCR.VCTORI,'
      
        '         E301TCR.VLRORI,E301TCR.VCTPRO,E301TCR.DATPPT,E301TCR.VL' +
        'RABE,E301TCR.CODREP,'
      '         E085CLI.NOMCLI,E085CLI.CIDCLI,E085CLI.SIGUFS'
      '         FROM E301TCR'
      
        '             INNER JOIN E085CLI ON E085CLI.CODCLI = E301TCR.CODC' +
        'LI'
      '             WHERE'
      '             E301TCR.CODTPT IN ('#39'DPL'#39','#39'CHP'#39','#39'CHD'#39') AND'
      '             E301TCR.SITTIT IN ('#39'AB'#39','#39'AP'#39','#39'AC'#39') AND'
      '             E301TCR.CODFIL = 1 and'
      '             e301tcr.vctpro <= :vctpro AND'
      '             E301TCR.CODREP = :codrep'
      '             ORDER BY E085CLI.NOMCLI,E301TCR.VCTPRO')
    Left = 56
    Top = 296
    object E301TcrCODEMP: TIntegerField
      FieldName = 'CODEMP'
    end
    object E301TcrCODFIL: TIntegerField
      FieldName = 'CODFIL'
    end
    object E301TcrNUMTIT: TStringField
      FieldName = 'NUMTIT'
      Size = 15
    end
    object E301TcrCODTPT: TStringField
      FieldName = 'CODTPT'
      Size = 3
    end
    object E301TcrCODTNS: TStringField
      FieldName = 'CODTNS'
      Size = 5
    end
    object E301TcrSITTIT: TStringField
      FieldName = 'SITTIT'
      Size = 2
    end
    object E301TcrDATEMI: TDateTimeField
      FieldName = 'DATEMI'
    end
    object E301TcrCODCLI: TIntegerField
      FieldName = 'CODCLI'
    end
    object E301TcrOBSTCR: TStringField
      FieldName = 'OBSTCR'
      Size = 250
    end
    object E301TcrVCTORI: TDateTimeField
      FieldName = 'VCTORI'
    end
    object E301TcrVLRORI: TBCDField
      FieldName = 'VLRORI'
      Precision = 15
      Size = 2
    end
    object E301TcrVCTPRO: TDateTimeField
      FieldName = 'VCTPRO'
    end
    object E301TcrDATPPT: TDateTimeField
      FieldName = 'DATPPT'
    end
    object E301TcrVLRABE: TBCDField
      FieldName = 'VLRABE'
      Precision = 15
      Size = 2
    end
    object E301TcrCODREP: TIntegerField
      FieldName = 'CODREP'
    end
    object E301TcrNOMCLI: TStringField
      FieldName = 'NOMCLI'
      Size = 100
    end
    object E301TcrCIDCLI: TStringField
      FieldName = 'CIDCLI'
      Size = 60
    end
    object E301TcrSIGUFS: TStringField
      FieldName = 'SIGUFS'
      Size = 2
    end
  end
  object pvdE301Tcr: TDataSetProvider
    DataSet = E301Tcr
    Left = 56
    Top = 344
  end
  object ClientE301Tcr: TClientDataSet
    Active = True
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'pvdE301Tcr'
    OnCalcFields = ClientE301TcrCalcFields
    Left = 56
    Top = 400
    object ClientE301TcrCODEMP: TIntegerField
      Alignment = taCenter
      FieldName = 'CODEMP'
    end
    object ClientE301TcrCODFIL: TIntegerField
      Alignment = taCenter
      FieldName = 'CODFIL'
    end
    object ClientE301TcrNUMTIT: TStringField
      Alignment = taCenter
      FieldName = 'NUMTIT'
      Size = 15
    end
    object ClientE301TcrCODTPT: TStringField
      Alignment = taCenter
      FieldName = 'CODTPT'
      Size = 3
    end
    object ClientE301TcrCODTNS: TStringField
      Alignment = taCenter
      FieldName = 'CODTNS'
      Size = 5
    end
    object ClientE301TcrSITTIT: TStringField
      Alignment = taCenter
      FieldName = 'SITTIT'
      Size = 2
    end
    object ClientE301TcrDATEMI: TDateTimeField
      Alignment = taCenter
      FieldName = 'DATEMI'
    end
    object ClientE301TcrCODCLI: TIntegerField
      Alignment = taCenter
      FieldName = 'CODCLI'
    end
    object ClientE301TcrOBSTCR: TStringField
      Alignment = taCenter
      FieldName = 'OBSTCR'
      Size = 250
    end
    object ClientE301TcrVCTORI: TDateTimeField
      Alignment = taCenter
      FieldName = 'VCTORI'
    end
    object ClientE301TcrVLRORI: TBCDField
      Alignment = taCenter
      FieldName = 'VLRORI'
      Precision = 15
      Size = 2
    end
    object ClientE301TcrVCTPRO: TDateTimeField
      Alignment = taCenter
      FieldName = 'VCTPRO'
    end
    object ClientE301TcrDATPPT: TDateTimeField
      Alignment = taCenter
      FieldName = 'DATPPT'
    end
    object ClientE301TcrVLRABE: TBCDField
      Alignment = taCenter
      FieldName = 'VLRABE'
      DisplayFormat = ',0.00'
      Precision = 15
      Size = 2
    end
    object ClientE301TcrCODREP: TIntegerField
      Alignment = taCenter
      FieldName = 'CODREP'
    end
    object ClientE301TcrNOMCLI: TStringField
      FieldName = 'NOMCLI'
      Size = 100
    end
    object ClientE301TcrCIDCLI: TStringField
      FieldName = 'CIDCLI'
      Size = 60
    end
    object ClientE301TcrSIGUFS: TStringField
      FieldName = 'SIGUFS'
      Size = 2
    end
    object ClientE301TcrvnQtdDias: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'vnQtdDias'
    end
    object ClientE301TcrTVlrAbe: TAggregateField
      Alignment = taCenter
      FieldName = 'TVlrAbe'
      Active = True
      DisplayFormat = ',0.00'
      Expression = 'SUM(VLRABE)'
    end
  end
end
