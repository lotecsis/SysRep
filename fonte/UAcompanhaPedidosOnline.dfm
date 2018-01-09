object FAcompanhaPedidosOnline: TFAcompanhaPedidosOnline
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Acompanhamento de Pedidos Online'
  ClientHeight = 613
  ClientWidth = 984
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgcControle: TPageControl
    Left = 0
    Top = 0
    Width = 984
    Height = 613
    ActivePage = tsLiberadosEmCarga
    Align = alClient
    TabOrder = 0
    object tsSuspensos: TTabSheet
      Caption = '     Suspensos     '
      object Label1: TLabel
        Left = 622
        Top = 556
        Width = 51
        Height = 13
        Caption = 'Valor Total'
      end
      object Label2: TLabel
        Left = 792
        Top = 556
        Width = 61
        Height = 13
        Caption = 'Volume Total'
      end
      object dbg1: TDBGrid
        Left = 0
        Top = 0
        Width = 976
        Height = 537
        Align = alTop
        DataSource = dsClientPedidosSuspensos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NUMPED'
            Title.Alignment = taCenter
            Title.Caption = 'Pedido'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USU_NUMCOM'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Controle'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATEMI'
            Title.Alignment = taCenter
            Title.Caption = 'Emiss'#227'o'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODCLI'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd. Cliente'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMCLI'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Cliente'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLRBRU'
            Title.Alignment = taCenter
            Title.Caption = 'Valor'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VOLUME'
            Title.Alignment = taCenter
            Title.Caption = 'Volume'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TNSPRO'
            Title.Alignment = taCenter
            Title.Caption = 'Trans.'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESTNS'
            Title.Alignment = taCenter
            Title.Caption = 'Desc. Transa'#231#227'o'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CIDCLI'
            Title.Alignment = taCenter
            Title.Caption = 'Cidade'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SIGUFS'
            Title.Alignment = taCenter
            Title.Caption = 'UF'
            Width = 40
            Visible = True
          end>
      end
      object dbedtTVlrBru: TDBEdit
        Left = 678
        Top = 553
        Width = 100
        Height = 19
        TabStop = False
        Ctl3D = False
        DataField = 'TVlrBru'
        DataSource = dsClientPedidosSuspensos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object dbedtTVolume: TDBEdit
        Left = 858
        Top = 553
        Width = 100
        Height = 19
        TabStop = False
        Ctl3D = False
        DataField = 'TVolume'
        DataSource = dsClientPedidosSuspensos
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
      object btnBVisuMotivoSusp: TBitBtn
        Left = 5
        Top = 551
        Width = 140
        Height = 25
        Caption = 'Motivo Suspens'#227'o'
        DoubleBuffered = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF999903333
          333333377777FFF33333FF9FFFF9993333333F7F3FF7773FF333009F00F03399
          3333777F7737FF773F33FF9FFFF9933393333F73FFF7733373F300F999903333
          393377377777F33337F3FFFFFFF0333339333FF33337F333373300FFFFF03333
          93337733FFF7F3337333FFF00000333333333F377777FF33FF330FF0FF999339
          93337337F3777FF77F33FFF0F993993993333337F77377F77F33FFF003339939
          93333337733F77377FFFFFF03399933999933FF733777337777F000339933339
          93997773377F3FF77F7733333993993993993333377F77377F77333333999339
          9993333333777337777333333333333333333333333333333333}
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 3
        OnClick = btnBVisuMotivoSuspClick
      end
      object btnItensPedidoSuspenso: TBitBtn
        Left = 160
        Top = 551
        Width = 75
        Height = 25
        Caption = 'Itens Pedido'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 4
        TabStop = False
        OnClick = btnItensPedidoSuspensoClick
      end
    end
    object tsLiberadosSemCarga: TTabSheet
      Caption = '     Liberados Aguardando Forma'#231#227'o de Carga'
      ImageIndex = 1
      object Label3: TLabel
        Left = 622
        Top = 556
        Width = 51
        Height = 13
        Caption = 'Valor Total'
      end
      object Label4: TLabel
        Left = 792
        Top = 556
        Width = 61
        Height = 13
        Caption = 'Volume Total'
      end
      object dbg2: TDBGrid
        Left = 0
        Top = 0
        Width = 976
        Height = 539
        Align = alTop
        DataSource = dsClientPedidosLiberadosSemCarga
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NUMPED'
            Title.Alignment = taCenter
            Title.Caption = 'Pedido'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USU_NUMCOM'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Controle'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATEMI'
            Title.Alignment = taCenter
            Title.Caption = 'Emiss'#227'o'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODCLI'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd. Cliente'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMCLI'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Cliente'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLRBRU'
            Title.Alignment = taCenter
            Title.Caption = 'Valor'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VOLUME'
            Title.Alignment = taCenter
            Title.Caption = 'Volume'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TNSPRO'
            Title.Alignment = taCenter
            Title.Caption = 'Trans.'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESTNS'
            Title.Alignment = taCenter
            Title.Caption = 'Desc. Transa'#231#227'o'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CIDCLI'
            Title.Alignment = taCenter
            Title.Caption = 'Cidade'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SIGUFS'
            Title.Alignment = taCenter
            Title.Caption = 'UF'
            Width = 40
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'vaSitPed'
            Title.Alignment = taCenter
            Title.Caption = 'Situa'#231#227'o'
            Width = 100
            Visible = True
          end>
      end
      object dbedtTVlrBru1: TDBEdit
        Left = 678
        Top = 553
        Width = 100
        Height = 19
        TabStop = False
        Ctl3D = False
        DataField = 'TVlrBru'
        DataSource = dsClientPedidosLiberadosSemCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object dbedtTVolume1: TDBEdit
        Left = 858
        Top = 553
        Width = 100
        Height = 19
        TabStop = False
        Ctl3D = False
        DataField = 'TVolume'
        DataSource = dsClientPedidosLiberadosSemCarga
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
      object btn1: TBitBtn
        Left = 8
        Top = 550
        Width = 75
        Height = 25
        Caption = 'Itens Pedido'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 3
        TabStop = False
        OnClick = btn1Click
      end
    end
    object tsLiberadosEmCarga: TTabSheet
      Caption = '     Liberados em Carga     '
      ImageIndex = 2
      object Label5: TLabel
        Left = 622
        Top = 556
        Width = 51
        Height = 13
        Caption = 'Valor Total'
      end
      object Label6: TLabel
        Left = 792
        Top = 556
        Width = 61
        Height = 13
        Caption = 'Volume Total'
      end
      object btnBVisuPreCargas: TSpeedButton
        Left = 7
        Top = 553
        Width = 140
        Height = 25
        Caption = 'Resumo de Cargas'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
          000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
          FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
          00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
          00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
          FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
          0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
          05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
          55557F7777777555555500000005555555557777777555555555}
        NumGlyphs = 2
        OnClick = btnBVisuPreCargasClick
      end
      object dbg3: TDBGrid
        Left = 0
        Top = 0
        Width = 976
        Height = 539
        Align = alTop
        DataSource = dsClientPedidosLiberadosEmCarga
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NUMPED'
            Title.Alignment = taCenter
            Title.Caption = 'Pedido'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USU_NUMCOM'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Controle'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATEMI'
            Title.Alignment = taCenter
            Title.Caption = 'Emiss'#227'o'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODCLI'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd. Cliente'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMCLI'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Cliente'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLRBRU'
            Title.Alignment = taCenter
            Title.Caption = 'Valor'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VOLUME'
            Title.Alignment = taCenter
            Title.Caption = 'Volume'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USU_PRECAR'
            Title.Alignment = taCenter
            Title.Caption = 'Carga'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TNSPRO'
            Title.Alignment = taCenter
            Title.Caption = 'Trans.'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESTNS'
            Title.Alignment = taCenter
            Title.Caption = 'Desc. Transa'#231#227'o'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CIDCLI'
            Title.Alignment = taCenter
            Title.Caption = 'Cidade'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SIGUFS'
            Title.Alignment = taCenter
            Title.Caption = 'UF'
            Width = 40
            Visible = True
          end>
      end
      object dbedtTVlrBru2: TDBEdit
        Left = 678
        Top = 553
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
        TabOrder = 1
      end
      object dbedtTVolume2: TDBEdit
        Left = 858
        Top = 553
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
        TabOrder = 2
      end
      object btn2: TBitBtn
        Left = 156
        Top = 553
        Width = 75
        Height = 25
        Caption = 'Itens Pedido'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 3
        TabStop = False
        OnClick = btn2Click
      end
    end
  end
  object dsClientPedidosSuspensos: TDataSource
    DataSet = DmOra.ClientPedidosSuspensos
    Left = 184
    Top = 168
  end
  object dsClientPedidosLiberadosSemCarga: TDataSource
    DataSet = DmOra.ClientPedidosLiberadosSemCarga
    Left = 184
    Top = 240
  end
  object dsClientPedidosLiberadosEmCarga: TDataSource
    DataSet = DmOra.ClientPedidosLiberadosEmCarga
    Left = 192
    Top = 304
  end
end
