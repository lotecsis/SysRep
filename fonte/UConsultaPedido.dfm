object FConsultaPedido: TFConsultaPedido
  Left = 0
  Top = 0
  Caption = 'Consulta Pedidos'
  ClientHeight = 663
  ClientWidth = 899
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 20
    Top = 20
    Width = 86
    Height = 13
    Caption = 'Pesquisar por..:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 57
    Top = 59
    Width = 38
    Height = 13
    Caption = 'Valor..:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object CbCampo: TComboBox
    Left = 112
    Top = 12
    Width = 621
    Height = 22
    Style = csOwnerDrawFixed
    Color = 15854048
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ItemIndex = 0
    ParentFont = False
    TabOrder = 0
    TabStop = False
    Text = 'Raz'#227'o Social do Clinte'
    Items.Strings = (
      'Raz'#227'o Social do Clinte'
      'Nome Fantasia do Cliente'
      'C'#243'digo do Cliente'
      'CNPJ do Cliente'
      'Cidade do Cliente'
      'N'#186' do Pedido na Empresa'
      'N'#186' de Controle do Pedido'
      '')
  end
  object EdPesquisa: TEdit
    Left = 112
    Top = 51
    Width = 501
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 255
    TabOrder = 1
  end
  object BPesquisar: TBitBtn
    Left = 624
    Top = 48
    Width = 109
    Height = 25
    Caption = 'Pesquisar'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = BPesquisarClick
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 88
    Width = 899
    Height = 575
    Align = alBottom
    DataSource = DsConsPedido
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGridDrawColumnCell
    OnDblClick = DBGridDblClick
    OnEnter = DBGridEnter
    OnExit = DBGridExit
    OnKeyPress = DBGridKeyPress
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CODFIL'
        Title.Alignment = taCenter
        Title.Caption = 'Filial'
        Width = 50
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CODREP'
        Title.Alignment = taCenter
        Title.Caption = 'Representante'
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NUMCON'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Controle'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NUMPED'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Pedido'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATEMI'
        Title.Alignment = taCenter
        Title.Caption = 'Data Emiss'#227'o'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CODCLI'
        Title.Alignment = taCenter
        Title.Caption = 'Cod. Cliente'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMCLI'
        Title.Alignment = taCenter
        Title.Caption = 'Nome'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'APECLI'
        Title.Alignment = taCenter
        Title.Caption = 'Apelido'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIDCLI'
        Title.Alignment = taCenter
        Title.Caption = 'Cidade'
        Width = 250
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SIGUFS'
        Title.Alignment = taCenter
        Title.Caption = 'UF'
        Width = 30
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CGCCPF'
        Title.Alignment = taCenter
        Title.Caption = 'CNPJ'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SITPED'
        Title.Alignment = taCenter
        Title.Caption = 'Sit. Pedido'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODCPG'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTDORI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTDABE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLRBIP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLRIPI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLRBIC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLRICM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLRBCO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLRCOM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLRLIQ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLRORI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUGER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATGER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PEDENV'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATENV'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PEDCON'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATCON'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUCON'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INSEST'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENDCLI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NENCLI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPLEND'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CEPCLI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BAICLI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SITCLI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FONCLI'
        Visible = True
      end>
  end
  object ConsPedido: TIBQuery
    Database = Dm1.IBDBanco
    Transaction = Dm1.IBDTransacao
    SQL.Strings = (
      'select e120ped.*,e085cli.* from e120ped'
      'inner join e085cli on e085cli.codcli = e120ped.codcli')
    Left = 680
    Top = 168
    object ConsPedidoCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E120PED"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsPedidoCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Origin = '"E120PED"."CODFIL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsPedidoNUMPED: TIntegerField
      FieldName = 'NUMPED'
      Origin = '"E120PED"."NUMPED"'
    end
    object ConsPedidoNUMCON: TIntegerField
      FieldName = 'NUMCON'
      Origin = '"E120PED"."NUMCON"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsPedidoCODCLI: TIntegerField
      FieldName = 'CODCLI'
      Origin = '"E120PED"."CODCLI"'
    end
    object ConsPedidoTNSPRO: TIBStringField
      FieldName = 'TNSPRO'
      Origin = '"E120PED"."TNSPRO"'
      Size = 5
    end
    object ConsPedidoDATEMI: TDateField
      FieldName = 'DATEMI'
      Origin = '"E120PED"."DATEMI"'
    end
    object ConsPedidoCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"E120PED"."CODREP"'
    end
    object ConsPedidoCODCPG: TIBStringField
      FieldName = 'CODCPG'
      Origin = '"E120PED"."CODCPG"'
      Size = 6
    end
    object ConsPedidoQTDORI: TFloatField
      FieldName = 'QTDORI'
      Origin = '"E120PED"."QTDORI"'
    end
    object ConsPedidoQTDABE: TFloatField
      FieldName = 'QTDABE'
      Origin = '"E120PED"."QTDABE"'
    end
    object ConsPedidoVLRBIP: TFloatField
      FieldName = 'VLRBIP'
      Origin = '"E120PED"."VLRBIP"'
    end
    object ConsPedidoVLRIPI: TFloatField
      FieldName = 'VLRIPI'
      Origin = '"E120PED"."VLRIPI"'
    end
    object ConsPedidoVLRBIC: TFloatField
      FieldName = 'VLRBIC'
      Origin = '"E120PED"."VLRBIC"'
    end
    object ConsPedidoVLRICM: TFloatField
      FieldName = 'VLRICM'
      Origin = '"E120PED"."VLRICM"'
    end
    object ConsPedidoVLRBCO: TFloatField
      FieldName = 'VLRBCO'
      Origin = '"E120PED"."VLRBCO"'
    end
    object ConsPedidoVLRCOM: TFloatField
      FieldName = 'VLRCOM'
      Origin = '"E120PED"."VLRCOM"'
    end
    object ConsPedidoVLRLIQ: TFloatField
      FieldName = 'VLRLIQ'
      Origin = '"E120PED"."VLRLIQ"'
    end
    object ConsPedidoVLRORI: TFloatField
      FieldName = 'VLRORI'
      Origin = '"E120PED"."VLRORI"'
    end
    object ConsPedidoSITPED: TIBStringField
      FieldName = 'SITPED'
      Origin = '"E120PED"."SITPED"'
      FixedChar = True
      Size = 1
    end
    object ConsPedidoUSUGER: TIntegerField
      FieldName = 'USUGER'
      Origin = '"E120PED"."USUGER"'
    end
    object ConsPedidoDATGER: TDateField
      FieldName = 'DATGER'
      Origin = '"E120PED"."DATGER"'
    end
    object ConsPedidoPEDENV: TIBStringField
      FieldName = 'PEDENV'
      Origin = '"E120PED"."PEDENV"'
      FixedChar = True
      Size = 1
    end
    object ConsPedidoDATENV: TDateField
      FieldName = 'DATENV'
      Origin = '"E120PED"."DATENV"'
    end
    object ConsPedidoPEDCON: TIBStringField
      FieldName = 'PEDCON'
      Origin = '"E120PED"."PEDCON"'
      FixedChar = True
      Size = 1
    end
    object ConsPedidoDATCON: TDateField
      FieldName = 'DATCON'
      Origin = '"E120PED"."DATCON"'
    end
    object ConsPedidoUSUCON: TIntegerField
      FieldName = 'USUCON'
      Origin = '"E120PED"."USUCON"'
    end
    object ConsPedidoCODCLI1: TIntegerField
      FieldName = 'CODCLI1'
      Origin = '"E085CLI"."CODCLI"'
      Required = True
    end
    object ConsPedidoNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Origin = '"E085CLI"."NOMCLI"'
      Size = 100
    end
    object ConsPedidoAPECLI: TIBStringField
      FieldName = 'APECLI'
      Origin = '"E085CLI"."APECLI"'
      Size = 50
    end
    object ConsPedidoINSEST: TIBStringField
      FieldName = 'INSEST'
      Origin = '"E085CLI"."INSEST"'
      Size = 25
    end
    object ConsPedidoENDCLI: TIBStringField
      FieldName = 'ENDCLI'
      Origin = '"E085CLI"."ENDCLI"'
      Size = 100
    end
    object ConsPedidoNENCLI: TIBStringField
      FieldName = 'NENCLI'
      Origin = '"E085CLI"."NENCLI"'
      Size = 60
    end
    object ConsPedidoCPLEND: TIBStringField
      FieldName = 'CPLEND'
      Origin = '"E085CLI"."CPLEND"'
    end
    object ConsPedidoCEPCLI: TIBStringField
      FieldName = 'CEPCLI'
      Origin = '"E085CLI"."CEPCLI"'
      Size = 10
    end
    object ConsPedidoBAICLI: TIBStringField
      FieldName = 'BAICLI'
      Origin = '"E085CLI"."BAICLI"'
      Size = 75
    end
    object ConsPedidoCIDCLI: TIBStringField
      FieldName = 'CIDCLI'
      Origin = '"E085CLI"."CIDCLI"'
      Size = 60
    end
    object ConsPedidoSIGUFS: TIBStringField
      FieldName = 'SIGUFS'
      Origin = '"E085CLI"."SIGUFS"'
      Size = 2
    end
    object ConsPedidoSITCLI: TIBStringField
      FieldName = 'SITCLI'
      Origin = '"E085CLI"."SITCLI"'
      FixedChar = True
      Size = 1
    end
    object ConsPedidoCGCCPF: TIBStringField
      FieldName = 'CGCCPF'
      Origin = '"E085CLI"."CGCCPF"'
      Size = 14
    end
    object ConsPedidoFONCLI: TIBStringField
      FieldName = 'FONCLI'
      Origin = '"E085CLI"."FONCLI"'
    end
  end
  object DsConsPedido: TDataSource
    DataSet = ConsPedido
    Left = 664
    Top = 224
  end
end
