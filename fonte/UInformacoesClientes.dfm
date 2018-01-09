object FInformacoesClientes: TFInformacoesClientes
  Left = 0
  Top = 0
  Caption = 'Informa'#231#245'es de Clientes'
  ClientHeight = 555
  ClientWidth = 880
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 880
    Height = 555
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 880
      Height = 127
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 34
        Top = 80
        Width = 83
        Height = 13
        Caption = #218'ltimo Pedido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 46
        Top = 105
        Width = 71
        Height = 13
        Caption = #218'ltima Nota:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 370
        Top = 80
        Width = 109
        Height = 13
        Caption = #218'ltimo Pagamento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 402
        Top = 104
        Width = 77
        Height = 13
        Caption = 'Maior Atrazo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 549
        Top = 108
        Width = 25
        Height = 13
        Caption = 'Dias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object EdCodCli: TEdit
        Left = 8
        Top = 9
        Width = 101
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
      object DBE_NOMCLI: TDBEdit
        Left = 113
        Top = 9
        Width = 333
        Height = 19
        TabStop = False
        Ctl3D = False
        DataField = 'NOMCLI'
        DataSource = DsConsE085cli
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object DBE_APECLI: TDBEdit
        Left = 449
        Top = 9
        Width = 318
        Height = 19
        TabStop = False
        Ctl3D = False
        DataField = 'APECLI'
        DataSource = DsConsE085cli
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object DBE_ENDCLI: TDBEdit
        Left = 8
        Top = 30
        Width = 341
        Height = 19
        TabStop = False
        Ctl3D = False
        DataField = 'ENDCLI'
        DataSource = DsConsE085cli
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object DBE_NENCLI: TDBEdit
        Left = 351
        Top = 30
        Width = 61
        Height = 19
        TabStop = False
        Ctl3D = False
        DataField = 'NENCLI'
        DataSource = DsConsE085cli
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object DBE_BAICLI: TDBEdit
        Left = 414
        Top = 30
        Width = 258
        Height = 19
        TabStop = False
        Ctl3D = False
        DataField = 'BAICLI'
        DataSource = DsConsE085cli
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object DBE_CEPCLI: TDBEdit
        Left = 674
        Top = 30
        Width = 93
        Height = 19
        TabStop = False
        Ctl3D = False
        DataField = 'CEPCLI'
        DataSource = DsConsE085cli
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object DBE_CIDCLI: TDBEdit
        Left = 8
        Top = 51
        Width = 341
        Height = 19
        TabStop = False
        Ctl3D = False
        DataField = 'CIDCLI'
        DataSource = DsConsE085cli
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
      object DBE_SIGUFS: TDBEdit
        Left = 351
        Top = 51
        Width = 23
        Height = 19
        TabStop = False
        Ctl3D = False
        DataField = 'SIGUFS'
        DataSource = DsConsE085cli
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
      end
      object DBE_FONCLI: TDBEdit
        Left = 377
        Top = 51
        Width = 111
        Height = 19
        TabStop = False
        Ctl3D = False
        DataField = 'FONCLI'
        DataSource = DsConsE085cli
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 9
      end
      object DBE_INSEST: TDBEdit
        Left = 490
        Top = 51
        Width = 125
        Height = 19
        TabStop = False
        Ctl3D = False
        DataField = 'INSEST'
        DataSource = DsConsE085cli
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
      end
      object DBE_CGCCPF: TDBEdit
        Left = 618
        Top = 51
        Width = 149
        Height = 19
        TabStop = False
        Ctl3D = False
        DataField = 'CGCCPF'
        DataSource = DsConsE085cli
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 11
      end
      object BCodCli: TBitBtn
        Left = 90
        Top = 10
        Width = 18
        Height = 16
        Caption = '...'
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 12
        OnClick = BCodCliClick
      end
      object Panel5: TPanel
        Left = 776
        Top = 1
        Width = 103
        Height = 125
        Align = alRight
        BevelOuter = bvLowered
        TabOrder = 13
        object BMostrar: TBitBtn
          Left = 8
          Top = 6
          Width = 87
          Height = 22
          Caption = 'Mostrar'
          DoubleBuffered = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
            FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
            FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
            FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
            FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
            FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
            C8807FF7777777777FF700000000000000007777777777777777333333333333
            3333333333333333333333333333333333333333333333333333}
          NumGlyphs = 2
          ParentDoubleBuffered = False
          TabOrder = 0
          OnClick = BMostrarClick
        end
      end
      object DBE_VLRUPE: TDBEdit
        Left = 226
        Top = 78
        Width = 95
        Height = 19
        TabStop = False
        Ctl3D = False
        DataField = 'VLRUPE'
        DataSource = DsConsE085cli
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 14
      end
      object DBD_DATUPE: TDBDateEdit
        Left = 119
        Top = 78
        Width = 100
        Height = 19
        Margins.Left = 5
        Margins.Top = 2
        TabStop = False
        DataField = 'DATUPE'
        DataSource = DsConsE085cli
        ReadOnly = True
        Ctl3D = False
        NumGlyphs = 2
        ParentCtl3D = False
        TabOrder = 15
      end
      object DBD_DATUFA: TDBDateEdit
        Left = 119
        Top = 102
        Width = 100
        Height = 19
        Margins.Left = 5
        Margins.Top = 2
        TabStop = False
        DataField = 'DATUFA'
        DataSource = DsConsE085cli
        ReadOnly = True
        Ctl3D = False
        NumGlyphs = 2
        ParentCtl3D = False
        TabOrder = 16
      end
      object DBE_VLRUFA: TDBEdit
        Left = 226
        Top = 103
        Width = 95
        Height = 19
        TabStop = False
        Ctl3D = False
        DataField = 'VLRUFA'
        DataSource = DsConsE085cli
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 17
      end
      object DBD_DATUPG: TDBDateEdit
        Left = 481
        Top = 77
        Width = 100
        Height = 19
        Margins.Left = 5
        Margins.Top = 2
        TabStop = False
        DataField = 'DATUPG'
        DataSource = DsConsE085cli
        ReadOnly = True
        Ctl3D = False
        NumGlyphs = 2
        ParentCtl3D = False
        TabOrder = 18
      end
      object DBE_VLRUPG: TDBEdit
        Left = 588
        Top = 77
        Width = 96
        Height = 19
        TabStop = False
        Ctl3D = False
        DataField = 'VLRUPG'
        DataSource = DsConsE085cli
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 19
      end
      object DBE_MAIATR: TDBEdit
        Left = 481
        Top = 102
        Width = 64
        Height = 19
        TabStop = False
        Ctl3D = False
        DataField = 'MAIATR'
        DataSource = DsConsE085cli
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 20
      end
      object DBE_VLRATR: TDBEdit
        Left = 588
        Top = 102
        Width = 95
        Height = 19
        TabStop = False
        Ctl3D = False
        DataField = 'VLRATR'
        DataSource = DsConsE085cli
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 21
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 544
      Width = 880
      Height = 11
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
    end
    object Panel4: TPanel
      Left = 0
      Top = 127
      Width = 880
      Height = 417
      Align = alClient
      TabOrder = 2
      object PaginaControle: TPageControl
        Left = 1
        Top = 1
        Width = 878
        Height = 415
        ActivePage = TbPedidos
        Align = alClient
        TabOrder = 0
        object TbTitulos: TTabSheet
          Caption = 'T'#237'tulos'
          object Panel6: TPanel
            Left = 0
            Top = 336
            Width = 870
            Height = 51
            Align = alBottom
            BevelOuter = bvLowered
            TabOrder = 0
            object Label7: TLabel
              Left = 18
              Top = 8
              Width = 57
              Height = 13
              Caption = #192' Vencer:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label8: TLabel
              Left = 25
              Top = 31
              Width = 50
              Height = 13
              Caption = 'Vencido:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label9: TLabel
              Left = 681
              Top = 5
              Width = 106
              Height = 13
              Caption = 'DPL - DUPLICATA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsItalic]
              ParentFont = False
            end
            object Label10: TLabel
              Left = 681
              Top = 21
              Width = 171
              Height = 13
              Caption = 'CHP - CHEQUE PR'#201'-DATADO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsItalic]
              ParentFont = False
            end
            object Label11: TLabel
              Left = 681
              Top = 37
              Width = 162
              Height = 13
              Caption = 'CHD - CHEQUE DEVOLVIDO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsItalic]
              ParentFont = False
            end
            object DBE_TITAVEN: TDBEdit
              Left = 78
              Top = 7
              Width = 100
              Height = 19
              TabStop = False
              Ctl3D = False
              DataField = 'TITAVEN'
              DataSource = DsConsE085cli
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBE_TITVEN: TDBEdit
              Left = 78
              Top = 29
              Width = 100
              Height = 19
              TabStop = False
              Ctl3D = False
              DataField = 'TITVEN'
              DataSource = DsConsE085cli
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
          end
          object Panel7: TPanel
            Left = 0
            Top = 0
            Width = 870
            Height = 21
            Align = alTop
            TabOrder = 1
            object Label6: TLabel
              Left = 4
              Top = 3
              Width = 126
              Height = 13
              Caption = 'T'#205'TULOS EM ABERTO:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
          end
          object DBGrid1: TDBGrid
            Left = 0
            Top = 21
            Width = 870
            Height = 315
            Align = alClient
            DataSource = DsConsE301Tcr
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ReadOnly = True
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Verdana'
            TitleFont.Style = []
            OnDrawColumnCell = DBGrid1DrawColumnCell
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'NUMTIT'
                Title.Alignment = taCenter
                Title.Caption = 'N'#186' T'#205'TULO'
                Width = 100
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'CODTPT'
                Title.Alignment = taCenter
                Title.Caption = 'TIPO'
                Width = 60
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'SITTIT'
                Title.Alignment = taCenter
                Title.Caption = 'SIT.'
                Width = 60
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'DATEMI'
                Title.Alignment = taCenter
                Title.Caption = 'DT.EMISS'#195'O'
                Width = 100
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'VCTORI'
                Title.Alignment = taCenter
                Title.Caption = 'VENC.ORIGINAL'
                Width = 110
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'VLRORI'
                Title.Alignment = taCenter
                Title.Caption = 'R$ ORIGINAL'
                Width = 100
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'VCTPRO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                Title.Alignment = taCenter
                Title.Caption = 'VENC.PRO.'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'Verdana'
                Title.Font.Style = [fsBold]
                Width = 100
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'VLRABE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                Title.Alignment = taCenter
                Title.Caption = 'R$ ABERTO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'Verdana'
                Title.Font.Style = [fsBold]
                Width = 100
                Visible = True
              end>
          end
        end
        object TbPedidos: TTabSheet
          Caption = 'Pedidos em Aberto'
          ImageIndex = 1
          object Panel8: TPanel
            Left = 0
            Top = 356
            Width = 870
            Height = 31
            Align = alBottom
            BevelOuter = bvLowered
            TabOrder = 0
            object Label13: TLabel
              Left = 13
              Top = 10
              Width = 99
              Height = 13
              Caption = 'Valor em Aberto:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object EdVlrPedAbe: TCurrencyEdit
              Left = 115
              Top = 8
              Width = 121
              Height = 19
              Margins.Left = 5
              Margins.Top = 2
              TabStop = False
              Ctl3D = False
              DisplayFormat = ' ,0.00;- ,0.00'
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 0
            end
          end
          object Panel9: TPanel
            Left = 0
            Top = 21
            Width = 870
            Height = 335
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object DBGrid2: TDBGrid
              Left = 0
              Top = 0
              Width = 870
              Height = 335
              Align = alClient
              DataSource = DsConsE120PedAbe
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Verdana'
              TitleFont.Style = []
              OnCellClick = DBGrid2CellClick
              OnDrawColumnCell = DBGrid2DrawColumnCell
              OnDblClick = DBGrid2DblClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'Img'
                  Title.Caption = ' '
                  Width = 30
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'NUMCON'
                  Title.Alignment = taCenter
                  Title.Caption = 'N'#186' CONT.'
                  Width = 80
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'NUMPED'
                  Title.Alignment = taCenter
                  Title.Caption = 'N'#186' PEDIDO'
                  Width = 80
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'DATEMI'
                  Title.Alignment = taCenter
                  Title.Caption = 'EMISS'#195'O'
                  Width = 90
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'VLRABE'
                  Title.Alignment = taCenter
                  Title.Caption = 'R$ ABERTO'
                  Width = 100
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'VLRLIQ'
                  Title.Alignment = taCenter
                  Title.Caption = 'R$ L'#205'QUIDO'
                  Width = 100
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'DATGER'
                  Title.Alignment = taCenter
                  Title.Caption = 'DT.GERA'#199#195'O'
                  Width = 95
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'DATCON'
                  Title.Alignment = taCenter
                  Title.Caption = 'DT.CONF'
                  Width = 90
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'PRECAR'
                  Title.Alignment = taCenter
                  Title.Caption = 'PR'#201'-CARGA'
                  Width = 90
                  Visible = True
                end>
            end
          end
          object Panel10: TPanel
            Left = 0
            Top = 0
            Width = 870
            Height = 21
            Align = alTop
            TabOrder = 2
            object Label12: TLabel
              Left = 4
              Top = 3
              Width = 130
              Height = 13
              Caption = 'PEDIDOS EM ABERTO:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
          end
        end
        object tbPedidosFinalizados: TTabSheet
          Caption = 'Pedidos Finalizados'
          ImageIndex = 2
          object Label14: TLabel
            Left = 4
            Top = 3
            Width = 138
            Height = 13
            Caption = 'PEDIDOS FINALIZADOS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object dbg1: TDBGrid
            Left = 0
            Top = 22
            Width = 873
            Height = 366
            DataSource = dsConsE120PedFinalizado
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Verdana'
            TitleFont.Style = []
            OnCellClick = dbg1CellClick
            OnDrawColumnCell = dbg1DrawColumnCell
            OnDblClick = dbg1DblClick
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Img'
                Title.Caption = ' '
                Width = 30
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'NUMCON'
                Title.Alignment = taCenter
                Title.Caption = 'N'#186' CONT.'
                Width = 120
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'NUMPED'
                Title.Alignment = taCenter
                Title.Caption = 'N'#186' PEDIDO'
                Width = 120
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'DATGER'
                Title.Alignment = taCenter
                Title.Caption = 'GERA'#199#195'O'
                Width = 120
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'DATEMI'
                Title.Alignment = taCenter
                Title.Caption = 'EMISS'#195'O'
                Width = 120
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'DATCON'
                Title.Alignment = taCenter
                Title.Caption = 'CONFIRMA'#199#195'O'
                Width = 120
                Visible = True
              end>
          end
        end
      end
    end
  end
  object DsConsE085cli: TDataSource
    DataSet = Dm1.ConsE085cli
    Left = 704
    Top = 184
  end
  object DsConsE301Tcr: TDataSource
    DataSet = Dm1.ConsE301Tcr
    Left = 696
    Top = 256
  end
  object DsConsE120PedAbe: TDataSource
    DataSet = Dm1.ConsE120PedAbe
    Left = 784
    Top = 240
  end
  object dsConsE120PedFinalizado: TDataSource
    DataSet = Dm1.ConsE120PedFinalizado
    Left = 416
    Top = 232
  end
  object ImageList1: TImageList
    Left = 258
    Top = 408
    Bitmap = {
      494C01010D00A001140210001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000FFFF0000FFFF0000C0C0C000C0C0C000C0C0
      C000C0C0C0008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800000000000C0C0C000FFFF0000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000FFFF0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000FFFF0000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000FFFF0000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000FFFF0000FFFF000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000C0C0C000C0C0C000C0C0C000FFFF0000FFFF
      0000FFFF00008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C2C0FC00716EF700403CF4002925F3002925F300403CF400716EF700C2C0
      FC00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00E7E7FE006461
      F6001510F2001510F2001510F2001510F2001510F2001510F2001510F2001510
      F2006461F600E7E7FE00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080808000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF000000000000000000FFFFFF00E5E5FE00403CF4001510
      F2001510F2001510F2001510F2001510F2001510F2001510F2001510F2001510
      F2001510F200403CF400E5E5FE00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000FFFFFF000000000080808000FFFFFF000000
      000080808000FFFFFF000000000000000000FAFAFF005552F6001510F2001510
      F2001510F2001510F2001510F2001510F2001510F2001510F2001510F2001510
      F2001510F2001510F2005552F600FAFAFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000000000000000000080808000000000000000
      000080808000000000000000000000000000B2B0FB001510F2001510F2001510
      F2001510F2001510F2001510F2001510F2001510F2001510F2001510F2001510
      F2001510F2001510F2001510F200B2B0FB000000000012129700121297001212
      9700121297001212970012129700121297001212970012129700121297001212
      970012129700121297001212970000000000000000002EBE32002EBE32002EBE
      32002EBE32002EBE32002EBE32002EBE32002EBE32002EBE32002EBE32002EBE
      32002EBE32002EBE32002EBE3200000000000000000000000000000000000000
      0000000000008080800000000000000000000000000080808000FFFFFF000000
      000080808000FFFFFF0000000000000000005C58F6001510F2001510F2001510
      F2001510F2001510F2001510F2001510F2001510F2001510F2001510F2001510
      F2001510F2001510F2001510F2005C58F6000000000012129700121297001212
      9700121297001212970012129700121297001212970012129700121297001212
      970012129700121297001212970000000000000000002EBE32002EBE32002EBE
      32002EBE32002EBE32002EBE32002EBE32002EBE32002EBE32002EBE32002EBE
      32002EBE32002EBE32002EBE3200000000000000000000000000000000000000
      0000000000008080800000000000FFFF000000000000FFFFFF00FFFFFF000000
      000080808000FFFFFF000000000000000000322EF400140FF200140FF200140F
      F200140FF200140FF200140FF200140FF200140FF200140FF200140FF200140F
      F200140FF200140FF200140FF200322EF4000000000012129700121297001212
      9700121297001212970012129700121297001212970012129700121297001212
      970012129700121297001212970000000000000000002EBE32002EBE32002EBE
      32002EBE32002EBE32002EBE32002EBE32002EBE32002EBE32002EBE32002EBE
      32002EBE32002EBE32002EBE3200000000000000000000000000808080008080
      800080808000808080000000000000000000FFFF000000000000000000000000
      0000000000000000000000000000000000002D28F2001D18F1001D18F1001D18
      F1001D18F1001D18F1001D18F1001D18F1001D18F1001D18F1001D18F1001D18
      F1001D18F1001D18F1001D18F1002D28F2000000000012129700121297001212
      9700121297001212970012129700121297001212970012129700121297001212
      970012129700121297001212970000000000000000002EBE32002EBE32002EBE
      32002EBE32002EBE32002EBE32002EBE32002EBE32002EBE32002EBE32002EBE
      32002EBE32002EBE32002EBE3200000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF0000000000FFFF0000000000000000
      0000FFFFFF00FFFFFF0000000000000000004C48F200332FF000332FF000332F
      F000332FF000332FF000332FF000332FF000332FF000332FF000332FF000332F
      F000332FF000332FF000332FF0004C48F2000000000012129700121297001212
      9700121297001212970012129700121297001212970012129700121297001212
      970012129700121297001212970000000000000000002EBE32002EBE32002EBE
      32002EBE32002EBE32002EBE32002EBE32002EBE32002EBE32002EBE32002EBE
      32002EBE32002EBE32002EBE3200000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFF00000000
      0000FFFFFF00FFFFFF0000000000000000007E7CF400504DEE004F4CEF004F4C
      EF004F4CEF004F4CEF004F4CEF004F4CEF004F4CEF004F4CEF004F4CEF004F4C
      EF004F4CEF004F4CEF00504DEE007E7CF4000000000012129700121297001212
      9700121297001212970012129700121297001212970012129700121297001212
      970012129700121297001212970000000000000000002EBE32002EBE32002EBE
      32002EBE32002EBE32002EBE32002EBE32002EBE32002EBE32002EBE32002EBE
      32002EBE32002EBE32002EBE3200000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      000000000000FFFFFF000000000000000000C3C2F900716FED006F6DED006F6D
      ED006F6DED006F6DED006F6DED006F6DED006F6DED006F6DED006F6DED006F6D
      ED006F6DED006F6DED00716FED00C3C2F9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000008000
      80008000800080008000000000000000000000000000FFFFFF00FFFFFF000000
      0000FFFF0000000000000000000000000000FAFAFE009E9DF0009393EB00908F
      EB00908EEB00908EEB008F8EEB008F8EEB00908EEB00908EEB00908FEB00908E
      EB00908EEB009393EB009E9DF000FAFAFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000008000
      8000000000000000000000000000000000008000000080000000800000008000
      000000000000FFFF00000000000000000000FFFFFF00EAE9FC00ADABEE00B5B5
      EA00B0B0EA00AFAEEA00AFAFEA00AFAFEA00AFAFEA00AFAFEA00AFAFEA00B0B0
      EA00B4B4EA00ADABEE00EAEAFC00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000008000
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF000000000000FFFFFF00FFFFFF00ECECFC00C1C0
      F000CBCBE900D1D0E900CFCEE900CCCCE900CCCCE900CFCFE900D1D1E900CBCB
      E900C2C1F000ECECFC00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FEFE
      FF00DCDCF900CFCEF100D1D0EC00DDDDEA00DDDDEA00D1D0EC00CFCDF100DCDC
      F800FEFEFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      00000000000000000000000000000000000000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C2ECC50071D3780041C34A002ABC34002ABC340041C34A0071D37800C2EC
      C500FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000000000000000000000000000000000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00E7F8E80065CF
      6C0016B6210016B6210016B6210016B6210016B6210016B6210016B6210016B6
      210065CF6C00E7F8E800FFFFFF00FFFFFF0000000000000000000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF00000000007F7F7F00000000007F7F7F00000000000000FF000000
      FF000000FF00000000000000000000000000FFFFFF00E5F7E70041C34A0016B6
      210016B6210016B6210016B6210016B6210016B6210016B6210016B6210016B6
      210016B6210041C34A00E5F7E700FFFFFF00000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF00000000000000000000000000FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF0000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000000000000000FAFEFB0056CA5E0016B6210016B6
      210016B6210016B6210016B6210016B6210016B6210016B6210016B6210016B6
      210016B6210016B6210056CA5E00FAFEFB00000000000000FF00000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000FF000000FF00000000000000000000000000BFBFBF00FFFFFF00BFBF
      BF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBF
      BF00FFFFFF000000FF00FFFFFF0000000000000000000000FF000000FF000000
      000000000000000000007F7F7F00000000007F7F7F0000000000000000000000
      00000000FF000000FF000000000000000000B2E7B60016B6210016B6210016B6
      210016B6210016B6210016B6210016B6210016B6210016B6210016B6210016B6
      210016B6210016B6210016B62100B2E7B6000000FF000000FF00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF000000000000000000FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF00000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000005CCC640016B6210016B6210016B6
      210016B6210016B6210016B6210016B6210016B6210016B6210016B6210016B6
      210016B6210016B6210016B621005CCC64000000FF000000FF00000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000000033BF3D0015B6200015B6200015B6
      200015B6200015B6200015B6200015B6200015B6200015B6200015B6200015B6
      200015B6200015B6200015B6200033BF3D000000FF000000FF00000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000007F7F7F00000000007F7F7F0000000000000000000000
      00000000000000000000000000000000000029BC330019B7240019B7240019B7
      240019B7240019B7240019B7240019B7240019B7240019B7240019B7240019B7
      240019B7240019B7240019B7240029BC33000000FF000000FF00000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000008000000000000000800000000000000000000000
      00000000000000000000000000000000000046C34E002CBB36002CBB36002CBB
      36002CBB36002CBB36002CBB36002CBB36002CBB36002CBB36002CBB36002CBB
      36002CBB36002CBB36002CBB360046C34E000000FF000000FF00000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000FF000000FF00000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000007AD3810049C1520048C1520048C1
      520048C1520049C1520049C1520048C1520049C1520049C1520048C1520048C1
      520048C1520048C1520049C153007AD38100000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF0000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF0000000000C2EAC5006AC9730069C9710069C9
      710069C9710069C9710069C9710069C9710069C9710069C9710069C9710069C9
      710069C9710069C971006AC97300C2EAC500000000000000FF000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF0000000000FAFDFA009BD9A2008FD195008BD0
      92008BD092008BD092008BD092008BD092008BD092008BD192008CD092008BD0
      92008BD092008FD195009BD9A200FAFDFA0000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00FFFFFF0000000000FFFFFF00000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF00000000007F7F7F00000000007F7F7F00000000000000FF000000
      FF000000FF000000FF000000FF0000000000FFFFFF00E9F7EA00AADAAF00B2D9
      B700ADD8B300ACD8B200ACD8B200ACD8B200ACD8B200ACD8B200ACD8B100ADD8
      B300B1D9B700AAD9AF00E9F7EB00FFFFFF000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000000000000000000000FF0000000000FFFFFF00FFFFFF00ECF8ED00C0E2
      C500CADECE00CFE0D400CDDFD200CADECF00CADFCF00CEDFD200CFE0D300CADE
      CE00C0E2C500ECF8ED00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FEFF
      FE00DCF0DE00CFE6D200D1E3D500DDE4E100DDE4E100D1E3D500CFE6D200DCF0
      DE00FEFFFE00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F0000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F000000000000000000FFFFFF00FFFFFF00FFFFFF007F7F7F007F7F
      7F0000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000BFBFBF00BFBFBF007F7F7F007F7F7F007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BFBFBF00BFBFBF007F7F7F007F7F7F007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BFBFBF00BFBFBF007F7F7F007F7F7F007F7F7F00000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      000000000000FFFFFF007F7F7F007F7F7F007F7F7F00FFFFFF00FFFFFF00FFFF
      FF007F7F7F0000000000FFFFFF0000000000000000000000000000000000BFBF
      BF00BFBFBF007F7F7F000000000000000000000000007F7F7F007F7F7F007F7F
      7F0000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF007F7F7F000000000000000000000000007F7F7F007F7F7F007F7F
      7F0000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF007F7F7F000000000000000000000000007F7F7F007F7F7F007F7F
      7F0000000000000000000000000000000000000000007F7F7F00FFFFFF000000
      00007F7F7F007F7F7F000000000000000000000000007F7F7F007F7F7F00FFFF
      FF00FFFFFF007F7F7F00FFFFFF00000000000000000000000000BFBFBF00BFBF
      BF0000000000FFFFFF0000FF0000FFFFFF0000FF0000FFFFFF00000000007F7F
      7F007F7F7F000000000000000000000000000000000000000000BFBFBF00BFBF
      BF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000007F7F
      7F007F7F7F000000000000000000000000000000000000000000BFBFBF00BFBF
      BF0000000000FFFFFF000000FF00FFFFFF000000FF00FFFFFF00000000007F7F
      7F007F7F7F00000000000000000000000000000000007F7F7F00000000007F7F
      7F0000000000000000007F7F7F007F7F7F007F7F7F0000000000000000007F7F
      7F00FFFFFF007F7F7F0000000000FFFFFF000000000000000000BFBFBF000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      00007F7F7F000000000000000000000000000000000000000000BFBFBF000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      00007F7F7F000000000000000000000000000000000000000000BFBFBF000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      00007F7F7F000000000000000000000000007F7F7F00FFFFFF00000000007F7F
      7F00000000007F7F7F000000000000000000000000007F7F7F00000000007F7F
      7F00FFFFFF00FFFFFF007F7F7F00FFFFFF0000000000BFBFBF007F7F7F00FFFF
      FF00000000000000000000FF000000800000008000000000000000000000FFFF
      FF007F7F7F007F7F7F00000000000000000000000000BFBFBF007F7F7F00FFFF
      FF00000000000000000000FFFF0000808000008080000000000000000000FFFF
      FF007F7F7F007F7F7F00000000000000000000000000BFBFBF007F7F7F00FFFF
      FF0000000000000000000000FF0000008000000080000000000000000000FFFF
      FF007F7F7F007F7F7F0000000000000000007F7F7F00FFFFFF007F7F7F000000
      00007F7F7F00FFFFFF00000000000000000000000000000000007F7F7F000000
      00007F7F7F00FFFFFF007F7F7F00FFFFFF0000000000BFBFBF000000000000FF
      00000000000000FF00000080000000FF000000800000008000000000000000FF
      0000000000007F7F7F00000000000000000000000000BFBFBF000000000000FF
      FF000000000000FFFF000080800000FFFF0000808000008080000000000000FF
      FF00000000007F7F7F00000000000000000000000000BFBFBF00000000000000
      FF00000000000000FF00000080000000FF000000800000008000000000000000
      FF00000000007F7F7F0000000000000000007F7F7F00FFFFFF007F7F7F000000
      00007F7F7F00FFFFFF00000000000000000000000000000000007F7F7F000000
      00007F7F7F00FFFFFF007F7F7F00FFFFFF0000000000FFFFFF0000000000FFFF
      FF000000000000FF000000FF000000FF000000FF00000080000000000000FFFF
      FF00000000007F7F7F00000000000000000000000000FFFFFF0000000000FFFF
      FF000000000000FFFF0000FFFF0000FFFF0000FFFF000080800000000000FFFF
      FF00000000007F7F7F00000000000000000000000000FFFFFF0000000000FFFF
      FF00000000000000FF000000FF000000FF000000FF000000800000000000FFFF
      FF00000000007F7F7F0000000000000000007F7F7F00FFFFFF007F7F7F000000
      00007F7F7F00FFFFFF00FFFFFF000000000000000000000000007F7F7F000000
      00007F7F7F00000000007F7F7F00FFFFFF0000000000FFFFFF000000000000FF
      000000000000FFFFFF0000FF000000FF00000080000000FF00000000000000FF
      000000000000BFBFBF00000000000000000000000000FFFFFF000000000000FF
      FF0000000000FFFFFF0000FFFF0000FFFF000080800000FFFF000000000000FF
      FF0000000000BFBFBF00000000000000000000000000FFFFFF00000000000000
      FF0000000000FFFFFF000000FF000000FF00000080000000FF00000000000000
      FF0000000000BFBFBF0000000000000000007F7F7F0000000000FFFFFF007F7F
      7F00000000007F7F7F00FFFFFF00FFFFFF00FFFFFF007F7F7F00000000007F7F
      7F00FFFFFF00000000007F7F7F000000000000000000FFFFFF007F7F7F00FFFF
      FF000000000000000000FFFFFF00FFFFFF0000FF00000000000000000000FFFF
      FF007F7F7F00BFBFBF00000000000000000000000000FFFFFF007F7F7F00FFFF
      FF000000000000000000FFFFFF00FFFFFF0000FFFF000000000000000000FFFF
      FF007F7F7F00BFBFBF00000000000000000000000000FFFFFF007F7F7F00FFFF
      FF000000000000000000FFFFFF00FFFFFF000000FF000000000000000000FFFF
      FF007F7F7F00BFBFBF000000000000000000000000007F7F7F00FFFFFF007F7F
      7F0000000000000000007F7F7F007F7F7F007F7F7F0000000000000000007F7F
      7F00000000007F7F7F00FFFFFF00000000000000000000000000BFBFBF000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000BFBFBF000000000000000000000000000000000000000000BFBFBF000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000BFBFBF000000000000000000000000000000000000000000BFBFBF000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000BFBFBF00000000000000000000000000000000007F7F7F0000000000FFFF
      FF007F7F7F007F7F7F000000000000000000000000007F7F7F007F7F7F000000
      0000000000007F7F7F0000000000000000000000000000000000FFFFFF00BFBF
      BF0000000000FFFFFF0000FF0000FFFFFF0000FF0000FFFFFF0000000000BFBF
      BF00BFBFBF000000000000000000000000000000000000000000FFFFFF00BFBF
      BF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000BFBF
      BF00BFBFBF000000000000000000000000000000000000000000FFFFFF00BFBF
      BF0000000000FFFFFF000000FF00FFFFFF000000FF00FFFFFF0000000000BFBF
      BF00BFBFBF0000000000000000000000000000000000000000007F7F7F000000
      0000FFFFFF00FFFFFF007F7F7F007F7F7F007F7F7F000000000000000000FFFF
      FF007F7F7F00000000000000000000000000000000000000000000000000FFFF
      FF00BFBFBF007F7F7F000000000000000000000000007F7F7F00BFBFBF00BFBF
      BF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00BFBFBF007F7F7F000000000000000000000000007F7F7F00BFBFBF00BFBF
      BF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00BFBFBF007F7F7F000000000000000000000000007F7F7F00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F7F007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00BFBFBF00BFBFBF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00BFBFBF00BFBFBF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00BFBFBF00BFBFBF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF009FFF0000000000008FFF000000000000
      C7FF000000000000E207000000000000F003000000000000F801000000000000
      F000000000000000F000000000000000F000000000000000F000000000000000
      F000000000000000F000000000000000F801000000000000FC03000000000000
      FE07000000000000FFFF000000000000FFFFFFFFFFFFFFFF0000FFFFFFFF8001
      0000FFFFFFFFB8910000FFFFFFFFB8910000FFFFFFFF81B5000080018001B891
      000080018001B811000080018001823D0000800180018011000080018001BC81
      0000800180017E810000FFFFFFFF22810000FFFFFFFF2E010000FFFFFFFF2E00
      0000FFFFFFFF85FC0000FFFFFFFFC3FFFFFF8001FFFFFFFFF83F0000F83F0000
      E00F0000E00F0000CFC70000C447000087E300008C630000A3F300009C730000
      31F900003FF9000038F900003EF900003C79E0073C7F00003E39E0073C7F0000
      3F19E0073C4100009F8BE0079C6100008FC3E00F8C710000C7E7E01FC4410000
      E00FE03FE00D0000F83FE07FF83F0000FC1FFFFFFFFFFFFFF027F83FF83FF83F
      E60BE00FE00FE00FD805C007C007C0079381800380038003AC62800380038003
      2BA000010001000113D000010001000113D000010001000111D4000100010001
      48250001000100018C69800380038003A39B800380038003D067C007C007C007
      E40FE00FE00FE00FF83FF83FF83FF83F00000000000000000000000000000000
      000000000000}
  end
end
