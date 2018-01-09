object FAddProdPed: TFAddProdPed
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Adicionar Produtos'
  ClientHeight = 269
  ClientWidth = 523
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 523
    Height = 217
    TabOrder = 0
    object Label1: TLabel
      Left = 36
      Top = 18
      Width = 54
      Height = 13
      Caption = 'Produto..:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 46
      Width = 66
      Height = 13
      Caption = 'Deriva'#231#227'o..:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 10
      Top = 74
      Width = 80
      Height = 13
      Caption = 'Qtde. Pedida..:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 25
      Top = 103
      Width = 65
      Height = 13
      Caption = 'Tab.Pre'#231'o..:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 12
      Top = 135
      Width = 78
      Height = 13
      Caption = '% Desconto..:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LDsCodPro: TLabel
      Left = 212
      Top = 17
      Width = 3
      Height = 13
    end
    object LDsCodDer: TLabel
      Left = 212
      Top = 45
      Width = 3
      Height = 13
    end
    object EdCodPro: TEdit
      Left = 96
      Top = 10
      Width = 110
      Height = 21
      TabOrder = 0
      OnExit = EdCodProExit
      OnKeyDown = EdCodProKeyDown
    end
    object BCodPro: TBitBtn
      Left = 184
      Top = 11
      Width = 20
      Height = 19
      Caption = '...'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 4
      TabStop = False
      OnClick = BCodProClick
    end
    object EdCodDer: TEdit
      Left = 96
      Top = 38
      Width = 110
      Height = 21
      TabOrder = 1
      OnExit = EdCodDerExit
      OnKeyDown = EdCodDerKeyDown
    end
    object EdQtdPed: TEdit
      Left = 96
      Top = 67
      Width = 110
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnExit = EdQtdPedExit
      OnKeyPress = EdQtdPedKeyPress
    end
    object BCodDer: TBitBtn
      Left = 184
      Top = 39
      Width = 20
      Height = 19
      Caption = '...'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 5
      TabStop = False
      OnClick = BCodDerClick
    end
    object EdCodTpr: TEdit
      Left = 96
      Top = 96
      Width = 110
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 6
      Text = '1000'
      OnExit = EdCodTprExit
    end
    object Panel1: TPanel
      Left = 96
      Top = 127
      Width = 142
      Height = 76
      BevelOuter = bvLowered
      TabOrder = 3
      object Desc2: TCurrencyEdit
        Left = 51
        Top = 3
        Width = 40
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = ' ,0.00;- ,0.00'
        TabOrder = 1
        OnExit = Desc2Exit
      end
      object Desc6: TCurrencyEdit
        Left = 98
        Top = 28
        Width = 40
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = ' ,0.00;- ,0.00'
        TabOrder = 5
        OnExit = Desc6Exit
      end
      object Desc1: TCurrencyEdit
        Left = 4
        Top = 3
        Width = 40
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = ' ,0.00;- ,0.00'
        TabOrder = 0
        OnExit = Desc1Exit
      end
      object Desc5: TCurrencyEdit
        Left = 51
        Top = 28
        Width = 40
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = ' ,0.00;- ,0.00'
        TabOrder = 4
        OnExit = Desc5Exit
      end
      object Desc4: TCurrencyEdit
        Left = 4
        Top = 27
        Width = 40
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = ' ,0.00;- ,0.00'
        TabOrder = 3
        OnExit = Desc4Exit
      end
      object Desc3: TCurrencyEdit
        Left = 98
        Top = 3
        Width = 40
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = ' ,0.00;- ,0.00'
        TabOrder = 2
        OnExit = Desc3Exit
      end
      object EdTotDesc: TCurrencyEdit
        Left = 35
        Top = 52
        Width = 74
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        Alignment = taCenter
        Color = 14671807
        DisplayFormat = ' ,0.00;- ,0.00'
        ReadOnly = True
        TabOrder = 6
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 218
    Width = 523
    Height = 51
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object Label5: TLabel
      Left = 38
      Top = 6
      Width = 82
      Height = 13
      Caption = 'Pre'#231'o Tabela..:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 10
      Top = 31
      Width = 110
      Height = 13
      Caption = 'Pre'#231'o C/Desconto..:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel5: TPanel
      Left = 305
      Top = 8
      Width = 214
      Height = 35
      BevelOuter = bvLowered
      TabOrder = 0
      object BConfirma: TBitBtn
        Left = 4
        Top = 6
        Width = 100
        Height = 25
        Caption = 'Confirmar (F5)'
        DoubleBuffered = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 0
        OnClick = BConfirmaClick
      end
      object BitBtn4: TBitBtn
        Left = 110
        Top = 6
        Width = 100
        Height = 25
        Caption = 'Cancelar'
        DoubleBuffered = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
          3333333777333777FF3333993333339993333377FF3333377FF3399993333339
          993337777FF3333377F3393999333333993337F777FF333337FF993399933333
          399377F3777FF333377F993339993333399377F33777FF33377F993333999333
          399377F333777FF3377F993333399933399377F3333777FF377F993333339993
          399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
          99333773FF3333777733339993333339933333773FFFFFF77333333999999999
          3333333777333777333333333999993333333333377777333333}
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 1
        OnClick = BitBtn4Click
      end
    end
    object EdVlrOri: TCurrencyEdit
      Left = 124
      Top = 3
      Width = 100
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      TabStop = False
      DisplayFormat = ' ,0.00;- ,0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object EdPreUni: TCurrencyEdit
      Left = 124
      Top = 28
      Width = 100
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      TabStop = False
      DisplayFormat = ' ,0.00;- ,0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
  end
  object ConsE075Pro: TIBQuery
    Database = Dm1.IBDBanco
    Transaction = Dm1.IBDTransacao
    SQL.Strings = (
      'select e075pro.* from e075pro where'
      '                              e075pro.codemp = 1 and'
      '                              e075pro.sitpro = '#39'A'#39' and'
      '                              e075pro.codpro = :codpro')
    Left = 464
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codpro'
        ParamType = ptUnknown
      end>
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
    object ConsE075ProCODAGC: TIBStringField
      FieldName = 'CODAGC'
      Origin = '"E075PRO"."CODAGC"'
      Size = 10
    end
  end
  object ConsE075Der: TIBQuery
    Database = Dm1.IBDBanco
    Transaction = Dm1.IBDTransacao
    SQL.Strings = (
      'select e075der.* from e075der'
      '                      where e075der.codemp = 1 and'
      '                            e075der.codpro = :codpro and'
      '                            e075der.codder = :codder and'
      '                            e075der.sitder = '#39'A'#39)
    Left = 464
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codpro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codder'
        ParamType = ptUnknown
      end>
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
  object ConsE081Itp: TIBQuery
    Database = Dm1.IBDBanco
    Transaction = Dm1.IBDTransacao
    SQL.Strings = (
      'select e081itp.* from e081itp where'
      '                              e081itp.codemp = 1 and'
      '                              e081itp.codtpr = :codtpr and'
      '                              e081itp.codpro = :codpro and'
      '                              e081itp.codder = :codder')
    Left = 464
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codtpr'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codpro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codder'
        ParamType = ptUnknown
      end>
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
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
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
  end
  object ConsE081Tab: TIBQuery
    Database = Dm1.IBDBanco
    Transaction = Dm1.IBDTransacao
    SQL.Strings = (
      'select * from e081tab where codemp = 1 and'
      '                            codtpr = :codtpr')
    Left = 464
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codtpr'
        ParamType = ptUnknown
      end>
    object ConsE081TabCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E081TAB"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsE081TabCODTPR: TIBStringField
      FieldName = 'CODTPR'
      Origin = '"E081TAB"."CODTPR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object ConsE081TabCODUSU: TIntegerField
      FieldName = 'CODUSU'
      Origin = '"E081TAB"."CODUSU"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
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
  object E120IpdSeqIpd: TIBQuery
    Database = Dm1.IBDBanco
    Transaction = Dm1.IBDTransacao
    SQL.Strings = (
      'select max(e120ipd.seqipd) as ultimo from e120ipd'
      '                                     where'
      '                                     e120ipd.codemp = 1 and'
      '                                     e120ipd.codfil = 1 and'
      
        '                                     e120ipd.numcon = :numcon an' +
        'd'
      '                                     e120ipd.codrep = :codrep')
    Left = 464
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
    object E120IpdSeqIpdULTIMO: TIntegerField
      FieldName = 'ULTIMO'
      ProviderFlags = []
    end
  end
  object Usu120IpdSeqIte: TIBQuery
    Database = Dm1.IBDBanco
    Transaction = Dm1.IBDTransacao
    SQL.Strings = (
      'select max(seqite) as ultimo from USU120IPD where'
      
        '                                             codemp = :codemp an' +
        'd'
      
        '                                             codfil = :codfil an' +
        'd'
      
        '                                             numcon = :numcon an' +
        'd'
      '                                             seqipd = :seqipd'
      '                                                    ')
    Left = 256
    Top = 8
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
        Name = 'seqipd'
        ParamType = ptUnknown
      end>
    object Usu120IpdSeqIteULTIMO: TIntegerField
      FieldName = 'ULTIMO'
      ProviderFlags = []
    end
  end
  object ConsCorGrid: TIBQuery
    Database = Dm1.IBDBanco
    Transaction = Dm1.IBDTransacao
    Left = 280
    Top = 160
  end
  object SqlAtuCorGrid: TIBSQL
    Database = Dm1.IBDBanco
    Transaction = Dm1.IBDTransacao
    Left = 48
    Top = 160
  end
  object SeExisteProDer: TIBQuery
    Database = Dm1.IBDBanco
    Transaction = Dm1.IBDTransacao
    SQL.Strings = (
      
        'select e120ipd.numcon from e120ipd where e120ipd.codemp = :codem' +
        'p and'
      '                            e120ipd.codfil = :codfil and'
      '                            e120ipd.numcon = :numcon and'
      '                            e120ipd.codpro = :codpro and'
      '                            e120ipd.codder = :codder')
    Left = 264
    Top = 88
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
        Name = 'codpro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codder'
        ParamType = ptUnknown
      end>
    object SeExisteProDerNUMCON: TIntegerField
      FieldName = 'NUMCON'
      Origin = '"E120IPD"."NUMCON"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
end
