object FResumoPreCargas: TFResumoPreCargas
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cargas Montadas'
  ClientHeight = 423
  ClientWidth = 797
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Times New Roman'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 7
    Width = 184
    Height = 15
    Caption = 'Resumo de Pr'#233'-Cargas / Pedidos  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 237
    Top = 385
    Width = 30
    Height = 15
    Caption = 'Valor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 127
    Top = 385
    Width = 41
    Height = 15
    Caption = 'Volume'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 6
    Top = 29
    Width = 115
    Height = 353
    DataSource = DsConsCargas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Times New Roman'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'USU_PRECAR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'PR'#201'-CARGA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = []
        Width = 80
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 127
    Top = 29
    Width = 665
    Height = 353
    DataSource = dsClientPedidosLiberadosEmCarga
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Times New Roman'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'USU_NUMCOM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' CONT.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = []
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMPED'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' PEDIDO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = []
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODCLI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'CLIENTE'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = []
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMCLI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'NOME'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = []
        Width = 240
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATEMI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'EMISS'#195'O'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = []
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLRBRU'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'VALOR'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = []
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VOLUME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = []
        Width = 70
        Visible = True
      end>
  end
  object dbedtTVlrBru2: TDBEdit
    Left = 237
    Top = 402
    Width = 100
    Height = 19
    TabStop = False
    Ctl3D = False
    DataField = 'TVlrBru'
    DataSource = dsClientPedidosLiberadosEmCarga
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object dbedtTVolume2: TDBEdit
    Left = 126
    Top = 402
    Width = 100
    Height = 19
    TabStop = False
    Ctl3D = False
    DataField = 'TVolume'
    DataSource = dsClientPedidosLiberadosEmCarga
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object DsConsCargas: TDataSource
    DataSet = Cargas
    Left = 288
    Top = 80
  end
  object dsClientPedidosLiberadosEmCarga: TDataSource
    DataSet = ClientPedidosLiberadosEmCarga
    Left = 600
    Top = 232
  end
  object Cargas: TADOQuery
    Connection = DmOra.Banco
    CursorType = ctStatic
    AfterScroll = CargasAfterScroll
    Parameters = <
      item
        Name = 'CODREP'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select distinct(e120ped.usu_precar)'
      '       from e120ped'
      '        where'
      '         e120ped.sitped in (1,2) and'
      '         e120ped.usu_precar <> 0 and'
      '         e120ped.codrep = :CODREP and'
      '         e120ped.codfil = 1'
      '         order by e120ped.usu_precar')
    Left = 288
    Top = 136
    object CargasUSU_PRECAR: TIntegerField
      FieldName = 'USU_PRECAR'
      ReadOnly = True
    end
  end
  object PedidosLiberadosEmCarga: TADOQuery
    Connection = DmOra.Banco
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'precar'
        DataType = ftInteger
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
        'r = :precar and'
      
        '                                               e120ped.codfil = ' +
        '1 and'
      
        '                                               e120ped.codrep = ' +
        ':codrep'
      
        '                                               order by e120ped.' +
        'codrep,e120ped.datemi')
    Left = 592
    Top = 80
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
    Left = 592
    Top = 128
  end
  object ClientPedidosLiberadosEmCarga: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'pvdPedidosLiberadosEmCarga'
    Left = 592
    Top = 176
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
end
