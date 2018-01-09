object FAcompanhamentoPedidos: TFAcompanhamentoPedidos
  Left = 0
  Top = 0
  Caption = 'Acompanhamento de Pedidos'
  ClientHeight = 633
  ClientWidth = 923
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
  object PaginaControle: TPageControl
    Left = 0
    Top = 0
    Width = 923
    Height = 633
    ActivePage = ts4
    Align = alClient
    TabOrder = 0
    object ts1: TTabSheet
      Caption = '     Enviado Aguardando Aprova'#231#227'o     '
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 915
        Height = 605
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object pnl2: TPanel
          Left = 1
          Top = 1
          Width = 913
          Height = 30
          Align = alTop
          TabOrder = 0
          object lbl1: TLabel
            Left = 5
            Top = 7
            Width = 240
            Height = 13
            Caption = 'ENVIADO AGUARDANDO APROVA'#199#195'O  '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 8404992
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object pnl3: TPanel
          Left = 744
          Top = 31
          Width = 170
          Height = 573
          Align = alRight
          BevelOuter = bvLowered
          TabOrder = 1
          object lbl2: TLabel
            Left = 19
            Top = 9
            Width = 46
            Height = 13
            Caption = 'Valor..:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl3: TLabel
            Left = 6
            Top = 32
            Width = 60
            Height = 13
            Caption = 'Volume..:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EdVlrAgdConf: TCurrencyEdit
            Left = 70
            Top = 7
            Width = 95
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
          object EdVolAgdConf: TCurrencyEdit
            Left = 70
            Top = 30
            Width = 95
            Height = 19
            Margins.Left = 5
            Margins.Top = 2
            TabStop = False
            Ctl3D = False
            DisplayFormat = ' ,0.00;- ,0.00'
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 1
          end
        end
        object dbg1: TDBGrid
          Left = 1
          Top = 31
          Width = 743
          Height = 573
          Align = alClient
          DataSource = DsConsE120PedAgdConf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CODREP'
              Title.Alignment = taCenter
              Title.Caption = 'REP.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 30
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NUMCON'
              Title.Alignment = taCenter
              Title.Caption = 'N'#186' CONTROLE'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 90
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CODCLI'
              Title.Alignment = taCenter
              Title.Caption = 'CLIENTE'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMCLI'
              Title.Alignment = taCenter
              Title.Caption = 'NOME'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 240
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATEMI'
              Title.Alignment = taCenter
              Title.Caption = 'EMISS'#195'O'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 75
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATENV'
              Title.Alignment = taCenter
              Title.Caption = 'ENVIO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 75
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'VLRBRU'
              Title.Alignment = taCenter
              Title.Caption = 'VALOR'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'VOLUME'
              Title.Alignment = taCenter
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 64
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'USUGER'
              Title.Alignment = taCenter
              Title.Caption = 'USU.GER'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 50
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATGER'
              Title.Alignment = taCenter
              Title.Caption = 'DAT.GER'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 64
              Visible = True
            end>
        end
      end
    end
    object ts2: TTabSheet
      Caption = '     Suspenso     '
      ImageIndex = 1
      object pnl7: TPanel
        Left = 0
        Top = 0
        Width = 915
        Height = 605
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object pnl8: TPanel
          Left = 1
          Top = 1
          Width = 913
          Height = 30
          Align = alTop
          TabOrder = 0
          object lbl7: TLabel
            Left = 5
            Top = 8
            Width = 67
            Height = 13
            Caption = 'SUSPENSO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object pnl9: TPanel
          Left = 744
          Top = 31
          Width = 170
          Height = 573
          Align = alRight
          BevelOuter = bvLowered
          TabOrder = 1
          object lbl8: TLabel
            Left = 19
            Top = 9
            Width = 46
            Height = 13
            Caption = 'Valor..:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl9: TLabel
            Left = 6
            Top = 32
            Width = 60
            Height = 13
            Caption = 'Volume..:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EdVlrSuspenso: TCurrencyEdit
            Left = 70
            Top = 7
            Width = 95
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
          object EdVolSuspenso: TCurrencyEdit
            Left = 70
            Top = 30
            Width = 95
            Height = 19
            Margins.Left = 5
            Margins.Top = 2
            TabStop = False
            Ctl3D = False
            DisplayFormat = ' ,0.00;- ,0.00'
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 1
          end
          object btnBVisuMotivoSusp: TBitBtn
            Left = 17
            Top = 95
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
            TabOrder = 2
            OnClick = btnBVisuMotivoSuspClick
          end
        end
        object dbg3: TDBGrid
          Left = 1
          Top = 31
          Width = 743
          Height = 573
          Align = alClient
          DataSource = DsConsE120PedSuspenso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = dbg3DblClick
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CODREP'
              Title.Alignment = taCenter
              Title.Caption = 'REP.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 30
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NUMCON'
              Title.Alignment = taCenter
              Title.Caption = 'N'#186' CONTROLE'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 90
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NUMPED'
              Title.Alignment = taCenter
              Title.Caption = 'N'#186' PEDIDO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CODCLI'
              Title.Alignment = taCenter
              Title.Caption = 'CLIENTE'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMCLI'
              Title.Alignment = taCenter
              Title.Caption = 'NOME'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 240
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATEMI'
              Title.Alignment = taCenter
              Title.Caption = 'EMISS'#195'O'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATENV'
              Title.Alignment = taCenter
              Title.Caption = 'ENVIO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'VLRBRU'
              Title.Alignment = taCenter
              Title.Caption = 'VALOR'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'VOLUME'
              Title.Alignment = taCenter
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'USUGER'
              Title.Alignment = taCenter
              Title.Caption = 'USU.GER'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATGER'
              Title.Alignment = taCenter
              Title.Caption = 'DAT.GER'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'USUCON'
              Title.Alignment = taCenter
              Title.Caption = 'USU.CONF'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATCON'
              Title.Alignment = taCenter
              Title.Caption = 'DAT.CONF'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end>
        end
      end
    end
    object ts3: TTabSheet
      Caption = '     Liberado Aguardando Forma'#231#227'o de Carga     '
      ImageIndex = 2
      object pnl10: TPanel
        Left = 0
        Top = 0
        Width = 915
        Height = 605
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object pnl11: TPanel
          Left = 1
          Top = 1
          Width = 913
          Height = 30
          Align = alTop
          TabOrder = 0
          object lbl10: TLabel
            Left = 5
            Top = 7
            Width = 307
            Height = 13
            Caption = 'LIBERADO AGUARDANDO FORMA'#199#195'O DE CARGA  '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object pnl12: TPanel
          Left = 744
          Top = 31
          Width = 170
          Height = 573
          Align = alRight
          BevelOuter = bvLowered
          TabOrder = 1
          object lbl11: TLabel
            Left = 20
            Top = 9
            Width = 46
            Height = 13
            Caption = 'Valor..:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl12: TLabel
            Left = 6
            Top = 32
            Width = 60
            Height = 13
            Caption = 'Volume..:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object img1: TImage
            Left = 12
            Top = 80
            Width = 145
            Height = 43
            Picture.Data = {
              0954506E67496D61676589504E470D0A1A0A0000000D49484452000000910000
              002B080600000078896A30000000097048597300000F6100000F6101A83FA769
              00000A4F6943435050686F746F73686F70204943432070726F66696C65000078
              DA9D53675453E9163DF7DEF4424B8880944B6F5215082052428B801491262A21
              09104A8821A1D91551C1114545041BC8A088038E8E808C15512C0C8A0AD807E4
              21A28E83A3888ACAFBE17BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C
              9648335135800CA9421E11E083C7C4C6E1E42E40810A2470001008B3642173FD
              230100F87E3C3C2B22C007BE000178D30B0800C04D9BC0301C87FF0FEA42995C
              01808401C07491384B08801400407A8E42A600404601809D98265300A0040060
              CB6362E300502D0060277FE6D300809DF8997B01005B94211501A09100201365
              884400683B00ACCF568A450058300014664BC43900D82D00304957664800B0B7
              00C0CE100BB200080C00305188852900047B0060C8232378008499001446F257
              3CF12BAE10E72A00007899B23CB9243945815B082D710757572E1E28CE49172B
              14366102619A402EC27999193281340FE0F3CC0000A0911511E083F3FD78CE0E
              AECECE368EB60E5F2DEABF06FF226262E3FEE5CFAB70400000E1747ED1FE2C2F
              B31A803B06806DFEA225EE04685E0BA075F78B66B20F40B500A0E9DA57F370F8
              7E3C3C45A190B9D9D9E5E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3C
              FCF7F5E0BEE22481325D814704F8E0C2CCF44CA51CCF92098462DCE68F47FCB7
              0BFFFC1DD322C44962B9582A14E35112718E449A8CF332A52289429229C525D2
              FF64E2DF2CFB033EDF3500B06A3E017B912DA85D6303F64B27105874C0E2F700
              00F2BB6FC1D4280803806883E1CF77FFEF3FFD47A02500806649927100005E44
              242E54CAB33FC708000044A0812AB0411BF4C1182CC0061CC105DCC10BFC6036
              844224C4C24210420A64801C726029AC82422886CDB01D2A602FD4401D34C051
              688693700E2EC255B80E3D700FFA61089EC128BC81090441C808136121DA8801
              628A58238E08179985F821C14804128B2420C9881451224B91354831528A5420
              55481DF23D720239875C46BA913BC8003282FC86BC47319481B2513DD40CB543
              B9A8371A8446A20BD06474319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F
              3E43C730C0E8180733C46C302EC6C342B1382C099363CBB122AC0CABC61AB056
              AC03BB89F563CFB17704128145C0093604774220611E4148584C584ED848A820
              1C243411DA093709038451C2272293A84BB426BA11F9C4186232318758482C23
              D6128F132F107B8843C437241289433227B9900249B1A454D212D246D26E5223
              E92CA99B34481A2393C9DA646BB20739942C202BC885E49DE4C3E433E41BE421
              F25B0A9D624071A4F853E22852CA6A4A19E510E534E5066598324155A39A52DD
              A8A15411358F5A42ADA1B652AF5187A81334759A39CD8316494BA5ADA295D31A
              681768F769AFE874BA11DD951E4E97D057D2CBE947E897E803F4770C0D861583
              C7886728199B18071867197718AF984CA619D38B19C754303731EB98E7990F99
              6F55582AB62A7C1591CA0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB54
              8FA95E537DAE46553353E3A909D496AB55AA9D50EB531B5367A93BA887AA67A8
              6F543FA47E59FD890659C34CC34F43A451A0B15FE3BCC6200B6319B3782C216B
              0DAB86758135C426B1CDD97C762ABB98FD1DBB8B3DAAA9A13943334A3357B352
              F394663F07E39871F89C744E09E728A797F37E8ADE14EF29E2291BA6344CB931
              655C6BAA96979658AB48AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A
              275C2747678FCE059DE753D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477
              BF6EA7EE989EBE5E809E4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806
              B30C2406DB0CCE183CC535716F3C1D2FC7DBF151435DC34043A561956197E184
              91B9D13CA3D5468D460F8C69C65CE324E36DC66DC6A326062621264B4DEA4DEE
              9A524DB9A629A63B4C3B4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDF
              B7605A785A2CB6A8B6B86549B2E45AA659EEB6BC6E855A3959A558555A5DB346
              AD9DAD25D6BBADBBA711A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806
              DBAEB66DB67D6167621767B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D
              5A1D7E73B472143A563ADE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613
              CB29C4699D539BD347671767B97383F3888B894B82CB2E973E2E9B1BC6DDC8BD
              E44A74F5715DE17AD2F59D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E
              593373D0C3C843E051E5D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F91
              57ADD7B0B7A577AAF761EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8
              B7CB4FC36F9E5F85DF437F23FF64FF7AFFD100A78025016703898141815B02FB
              F87A7C21BF8E3F3ADB65F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC
              90AD21F7E798CE91CE690E85507EE8D6D00761E6618BC37E0C2785878557863F
              8E7088581AD131973577D1DC4373DF44FA449644DE9B67314F39AF2D4A352A3E
              AA2E6A3CDA37BA34BA3FC62E6659CCD5589D58496C4B1C392E2AAE366E6CBEDF
              FCEDF387E29DE20BE37B17982FC85D7079A1CEC2F485A716A92E122C3A96404C
              884E3894F041102AA8168C25F21377258E0A79C21DC267222FD136D188D8435C
              2A1E4EF2482A4D7A92EC91BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A
              9E169A76206D323D3ABD31839291907142AA214D93B667EA67E66676CBAC6585
              B2FEC56E8BB72F1E9507C96BB390AC05592D0AB642A6E8545A28D72A07B26765
              5766BFCD89CA3996AB9E2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A586
              4B572D1D58E6BDAC6A39B23C7179DB0AE315052B865606AC3CB88AB62A6DD54F
              ABED5797AE7EBD267A4D6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D
              4F582F59DFB561FA869D1B3E15898AAE14DB1797157FD828DC78E51B876FCABF
              99DC94B4A9ABC4B964CF66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40D
              DF56B4EDF5F645DB2F97CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A4
              54F454FA5436EED2DDB561D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB
              5501554DD566D565FB49FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203
              FD07230EB6D7B9D4D51DD23D54528FD62BEB470EC71FBEFE9DEF772D0D360D55
              8D9CC6E223704479E4E9F709DFF71E0D3ADA768C7BACE107D31F761D671D2F6A
              429AF29A469B539AFB5B625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794A
              F354C969DAE982D39367F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F
              6FEFBA1074E1D245FF8BE73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6D
              EA74EA3CFE93D34FC7BB9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4
              BD79F116FFD6D59E393DDDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727
              EEADBC4FBC5FF440ED41D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7
              068583CFFE91F58F0F43058F998FCB860D86EB9E383E3939E23F72FDE9FCA743
              CF64CF269E17FEA2FECBAE17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5
              FDEAC0EB19AFDBC6C2C61EBEC97833315EF456FBEDC177DC771DEFA3DF0F4FE4
              7C207F28FF68F9B1F553D0A7FB93199393FF040398F3FC63332DDB000023EE49
              44415478DAED7C077C5465F6F673A74F266526BDF7841002A185AEA87490A2A8
              44D615B0EDDA4064DDA2AEEBAEEE82756DAB22A82052050105C44F6A503A2801
              422010427A2F936432FDFECF79672644C4EFB7BBEECAFFF77D79314EBBF7BEE5
              3CE739CF39EF9D9164594677EB6E3FA549DD20EA6E3FB509101594B740AD52A0
              B2AE1D1FE79D4787434650A006C72FD4223B3A14250DAD18966C44515D0706F4
              8881C3E9FAC1851492847AB31591213A04EB646C3F5E8553A5669437B6C36CEE
              A09E547410E0B4DA31A887114BEFC980D5E1EE3C5FA954A2ADA90EEB0E96E33B
              4B18B40A379C2EB73A23DAF47C82C92F830E751D3A5B7AD225A92ED25015D77A
              E1FE7F69B2A4901470CB56872C1BB55266DFE4885485A4D47C7BB131AFB4AEFD
              8543AF4CFEDF05A2D6A6066C3F70168B0B02C0FCE892E5B0F41043F19050A5BF
              4E76A1CA6C83D96687447D75B79FAFB1C73AC92046BD06E1011AC20750026DD1
              A259FD33B293C3DCFFAB40D4D8D080E2B30558B2DF81A3672C804A0A830AC58F
              DF7E9D7F4A7430F9838BFA61787583E85A34726A28E9DF85AA7A6C3978FAFCD6
              45D33252E3235CD7044443324C024416FBE5EB7841A42A2A2C906B1A9CAE8DBB
              6AE83D85A9B2A6E1EC94DB2784252652BF7CBC0864DD3AEE9A345901B592BCBA
              AC02F9FB0FE67FF8DABDD9BDD2E3AF4138B33B9019E78F950F66D17B12DC6E0F
              201844757575BDF2BFFBB631C8145A9535F02618746AFC71F9BEB5706AEFE811
              130A07311113513784AE5D53919D4AAA9A101824BF79EB75E973270C4EFAF941
              24BB9CA0A08445B919C81D120E7387539C4F3A4761B7D9A2AC96B63A854A6757
              9AE2E0AF57E3C995C756B5D6DBEE4C0D37C0ED62007543E85A355E7935D9B0A4
              D182D8F880D76E1B92307F5CBFD86B0322A54A85B0201D9EBB3D094393027DDA
              484D4D45482758A9D0E6D6C39F98E8A955C756D756B5E5268618046B7543E8DA
              36A542425993053D52825FBB6368E2FCB10362AE0D88082B080ED4A277AA11BF
              1915839840153AEC2EB55EAF57D267944DAA6076683A4174E162636EACC9D019
              FABADBB56A321404A2AA16C241AF88376E1F9A386FFC806BC4440CA230A30E7D
              D2823032350C39D12A8407AA542A8D9E484A69B3B909444E2D8533159E5E7974
              F5B1C2FADC28622EB74C1A8A26D29D9B5DAB46D919D9B9B6B50323FBC7FD63FA
              F0F44726F70BFBD74074BEBE03FDD37F1C44752D5624441A106690B1E570154E
              5C6A4159431B5ACC94AEA32B88D40837E930242B18518600286D1DF8F59848A5
              5B564AB2CBE594555A98E5000410889E2410EDCCAFCE0D0BD0407673F1AB3BC1
              BFA68D16BFB6D58639D7A72CFAE588C43F0CCE8AFA5799C8827EA9515C491699
              55D7C6206A6EB7C7D6B75AA64B4E5BDCC992A6A4F2C68EF08636BBD4D1618740
              109D221312540A05020C6A2939DAD01AE267386852C9ABEE1EAC69686A6ACC4C
              4D8C3F1C121E616B72F943478CF5D4AAA3ABB71E2ECF35FAAB69B05E047547B5
              6BD2440198B21B7F3F0DE68C497BF9A6ACA827466646FEF320BA2E35185F9C28
              47EE8804E41755424939968B348A00143CB6A5AC2BABB84D33EDC285EA399595
              4DC9D0A8201160641777EF442787C8DE82A14CC0A26BF48AD795DC9723171D3F
              7A784C80413F4BA5547C74D3D4BBD1B357167EBB6CFFEACDDF5CCCD5D3C07D13
              E9E6A29FB3C91EC2209BB9C8D6B1A1FE44186E5C9719F3E68C614973C70F88FE
              D740B4F9E8253C764B16BE3C5E81DAFA76C41B65C48607110E3CA675129EC2E2
              6261341A7EFBD2EAE32F9C3A5F0385DD8A203D0533959AC6719946B866D8DE61
              45BBC28020751BE66677A0B4E43C366FDCF4667373D3DC7F2C5B8F09936EC6FC
              257B576FDE733E57D2D2F934784900A81B443F67E3D576BB5C8809F7275BAA51
              70BE01B32666BEFE8BEB121E1BD3EF5F283632883E3B76098F4CE985BDA76A70
              B4A815D3724231ED865E50EB35707A75929AD47B93D5F1CAFC77BF7EFCC89132
              C487A8F0DCE31328D3524110923714E968309FEF2CC092F527600A76625EBF76
              94171763FBF6ED6F9A5B5AE6BEF8EE4A8C1D3B1EF397E6ADDEFCD5995C68945E
              EC7403E8BFDFBA6E2DC9225A44869246F553A1A8AC11B0BB307B6ABF3772AF4F
              9937AEEFBFC8449741548D63E7094403C311141C80B88840A44605C14168B53B
              DDDAC2FAB6A37F5A7A24ABBCA802D999617876DE6842320FC6DD2967FC287DDF
              BAE71CFEB1FA28C24329C666395170FA0C0EE7ED7EB3B5D53CF795B7DFC3B8B1
              A309447B577F79B83837C440C25AEEDE37FB799AE4FDBF4C3675233AC480607F
              0D0A0927FC4973871377DCD8E38D1923120944713F0D44B7E48423D01880DA66
              0BC6E4C442A994E85CD7D0C3250D792FAF3CA932573460F8C068DC9B9B03ABD5
              2E92731F04F4149E76EF2FC6479F9E408FCC44F48A0CC4A75F1E80B6F4EC9B36
              8B75EE5B6FCCC584D103F0F8FBDFAC8EF657E566271A292BE4F8DCADAA7F8EC6
              655D9918C814E027EA73AD16ABA7624D38395B6946BB53F5D69461898FDEFC53
              998841141A1A84AF29BCD95C0E4C1B954828B53F78F252F3DB2B3E3F0F6B9D19
              A3AF8FC7989169B0D99CE89A566949741F3C568A8DDBCE213D231EBD89C93608
              10157A41340F13C70CC063EFEF5FFDDDC98BB951816A110EBB53FC9FA1B92591
              34451203F9699528AD69819B5229AED22938C56F73E2A641E96FDC3122E1DF61
              A252CC9D9A893D27AB719440943B2C12A161461C3C538B0B152D18951387E070
              D5475F1C2BFFE5E7BB2B8096264C99D4135999E1703A5CDF4BCD3504A2A3DF95
              63FB57C548EFC120325E1544F3977EB37AF3D663B95AB52794756767FF9DD6E9
              9CB22C64496274100C1A350ACB9A2809F2C6109117B960732830E78EA1AFCFBC
              2EF1B1D17DFF0961DD2F2614A54DED18951182B5078A95BF9E94199B77AA3AF5
              F4258B263654136B0AF2CBB850D512DDD0623399DBED7E3A9D3BBBBACD19D862
              A684BFAD19FD06A520D8A4F26E9E5E6E4AA50AE565F53873BA81401483DE91CC
              4407AF0EA28D0772A1748B9BD1BA65D17FA3F1A22A3CA517A2FB3802905EAFC2
              B992066F3DB0CB82F3314E09B3EEBAFE8D99D725CF1B7BF50DD80B701095051B
              B5CA43E76AC252838D39C74BEB0745046AFA1F3DDFD05BA95205D9EDF6C0E850
              7F34B739505BDD02AE074141D993BD0370D801FF20AE3E42D96E865BA3A3D8CA
              28A6CFE1F20E488120A905FAF65254AB52909E1A832CA1897E04441BBECE85C2
              ED9D8B02DDD5C6FF6C1316E13A10253EF13146921A6A1495D443524857D96422
              3B38959875F70D949D25CF1BEF0B6785159741B464C7B9E4B226EBEC92DA9689
              754D96FEED1617054897402854928897029D2470136383D04EE95E5D4D1B510B
              BD67B75107A47D74060843B7B79282F6A763159ECE3B87AC4498A20EBAE63328
              53F6416A5A1CFA248478853581A8BD63EE5B6F3E761944EBF6E62A2417DC8AAE
              D2BCBBFD271B452901209D8619A84EAC339BEDFBEECA4547CAB0DD0ACC9E3D9A
              40944A9AC8CB44DF963441A554A0AEB923E88DAD05CF97D5B767C8B2DBA1542A
              2C0A897844C44249A67022F9A9EDE245BB5DCB9743726480ABB9CDEE6C6CB769
              742E975FA04E1AAF3306A998F52CB50DD0870489AAB5A7CC78B9D8A82240B85A
              5BD0E6502225214A142FD76F3B08DDA5D36F5ACD6D73DF7EEF098C1BDD0F8F2F
              3DB07AF3AA5DB992E4E866A2FF7093250F287833213ECE04BD5A85B317EB0421
              5C76D52BF4031956968989EE9D204034DE979D3DBABC004A3274539B656CDE89
              F3D3540A45AB0CEFFE98F71A5C8D0E57D9E525D7BF27773824F9DE03BF92AC0E
              83C249595942B8C1AAD642B69B2DA1435343EE37041B353241BBA1B201A68860
              01A22B1BBF67696D87DD6A43625C040E9EACC5DA2FBE06CE9F7973F2E46173EF
              FBE518A42585E2A995DFAEDAF8F19777529CA488A8F0105A779AFFD39BD79F65
              326C427C0829128508619E2D4EA9D34DA52B4E92DD1EFD74F7FD93DE9A3132ED
              D1893E265AB4E698B8D9A8B1D5FAF0AEEF2EBDE5618EAE97F206233A364E5529
              626585235ADCB8ED8427C4254518D0DE664551592DF44146515874B4B642E3EF
              FF83CD5A71297ACF65B3C161B3233D251A3A5D00367CBA1B8393FD3F78F2E9BB
              1F76D4D607662587D4FE61CD89951B3FDA3E5329393DE14CFECF7D5BE8FF85BD
              DC7F770E62F3C0292329219800A4140CC4E14BF13DAB5FD9999BFF23BBAB31FB
              57935F9F39AAC76363B2BD37A5CD7AFE73BE291E0DCD6DCF7CB6FBD49F3BB717
              7CC6777B36E08C062BA2FDDC08D65911A0B6911053A0C5AE4185458D72B31F01
              C944F2C985D29A66A2440D1424B4DD1ACD5541247A703A88BE9C48EB91803ED9
              19D8B0E56BBAB6C26AC8C834BB8A0B356FCC1B336D7D7ED32FD6ACFFFA7E8556
              D565D9FE9D26FF53E74B571CFD9F6E3EA3FFD47E3AAFD3A576265FE5F31F5B0B
              B748E34DD0A8D53857DA482C2F43297B4C2D2E7895EB48A20429C14D369B3363
              C4EB336F487F6C744EA207444FBCB29984B512C565F57F5CBBF5D85F3C4CE411
              B15C74F2D3C8247CED483339A122DA73B99C7038DDE2F60FAD9AF7C424D4B529
              70FC1260088C818B6656525E4F59397F3B437105A779A741A353905877D23119
              E909E8357408366CCD839A80E588EB01149DC447CFCF98B0F554FDAD6B371FBF
              1F017A482A15648713A25EC0C0646A75DA3D69A70FF86A2FD8782F8FE33D53A8
              5AE3CD20BD2C265259FADCE1F02402FCBE5229324A9165BABD99A00FFC92F79C
              7F0E87DF4787C29B3ACBDEDD706253DE7BFADEB5E4AB3CFE00099777D3A15041
              D269BD6BE19D3B3FDAEDDEE3BCFD924D3DF76FF8D642E62AAFC8941363496690
              F6B978A9D19BB6D35A905D458244D7F78CB56B65D7D7373D5A6C9835B5EF5B77
              8ECA7C745C4E8207447BF71F849F5E83351B8F2F7E75F1CE0774C41E0C102719
              39C0A0C0D03E40844983DADA469CBF5808738399C0E5141D19FCFC101B1F8FF8
              847852F80A1C2CB443A38C20DBB9515C5A4B09DDE5815CF9956DEEC34E0BD133
              2309E9A34691B03E0085B511EEF030A0AC18CFCD1EF490591534F2C8D99A19B5
              D59528C8CF4756DF7E888E8E22FB3BA0D7EB919098206E7253295568A5F0595D
              5D4D1870233C3C1C26938930E2447171314E9D3A85F6768B188A9AE697929C84
              C4A424444444A0A3A303353535FCE8AEAF6FD813181050D9E0D05BCC161B11B4
              4243D7509263711457581D2E25AF8B9E6F73B95A98A67F56BB1B6AB29F5AA9A0
              ACD9EDE26FB2D0185D34669BDB2DDBD2A3FD86492E473FDF72F037289CA290E6
              41111F4FA789BB23788D14046C765C6E3CD7DABA5AECDFB70FFD060E40686898
              98A35EA7437272321DAB204757A1A5A585E6542B46C46B61341AC5350A0ACE50
              D2DC0C87D58C0B658DD0FBE990969282C4C444848585C162B178D6C2DAC17AF5
              6B229D0B35568D8DE6A5A235D638EC364587D56DC81D97B961DC90B415A3B2BD
              29FEF6DD5F934134D8B8F1C8C677DFDD314DA3530B04D358303CC78F06AAC2B7
              274EA2B4B80826633082424CD09192E6D0C586ABABADA5ACDE8021438641A7D5
              23EFB019C6C0385A0827CE9E2B15A1D2532894C59FC29BADB163584958F7E993
              8EB49B2763C3F663C0C9D540EB31B19894313A02FC75F0F733A8DBDADBD1646E
              8729C89F00AF27835BD09700B5FDAB5D340927D6AE5E8DBD7BF7A1B9B959F4E1
              1F1080A1430763FA6DD371CF9C7BB06DDB76328052188AFBE7BF858B1662F8F0
              1158BB662D4A4A4A187CB2D9DC7A91C075A8A4BA617F7068785380C170E093F5
              EBABC78C19E39A3C69A2CD189D8A55BB8B904F192D9745145D80C4ACCD381898
              6AC28CEB92515C78029F6CF8544FD755CC983123F1B3CF3E1BB27FFF7E79ED8A
              A5037BF5CC78B0C36A158EC8C060A7F05191EF35CF83D74D43A0B713CBF06B83
              C11F797B77E3CE99BF4488D19FB4A40E16728E418307D15AEC265DDA8C75ABD7
              62FF3707D062F6AC45606010CD73A8588BC71F5F807DFBF25072A91C9CA7A888
              7534C44E2FBEF402D9A10FD6ADFD04E5E515E2E63387DD7131C818BCABA8BCE6
              5B0268458F8CF46F972C79AF7EE4B01B6C3372A73A6B6AEA70CFAC5F7A4074A8
              AC9A0CA5C5BA77B62C7F61D186BB75069D60A1B41450A8D120FFDB7C3013F4C8
              E889A0A020A1D09D447F0AF218AE3CDB6C56F2F60B34010B865D3F1CED1D4AEC
              DD730A3D7BA4202D231327088012A936BD5E8770F2FC4B64305E7ABD9F1EC1C1
              21C410AD30A5A5E2524D1BC25CD5B8747A2F852E35B19C412CF2E9D3A7AE1A31
              341A357272060BC6A9AFAF2770193AEFC166E35A3AACB480FE3879F2042A2BAB
              7E707E72720A222322A16226E350C9775D52BF2E0A8576BB155595E5B8545AEA
              2643BAA2A2A23A424282CB1FB8FFBE4533EFBC73C5C73B0BF1D69633CC366408
              090E972C22C8FC29E918DD2F16EFBEFBDE535BB66CBDBBA6B63686C6A6212253
              391C4E891DE7CD7FBC83F113267A81E1464B730B028302C9A84A613CB3D98C20
              323CDF14CF3782359B5B106C3489B5D012A0366DDE84DFCC9FF7BDB968B55A72
              E221F0A744A6A1A1117EBC76F2E56FC7B4B7B7212B2B8B6C7102C78E1DFDDEB9
              0CD4D4D434228B70B1A61E26748B35E1474E7ECACA2FA1A2B28CD642E18A8D8A
              6E8A8C8E2CCFCEEEFFFADBEFBCF39100D1F18222B4A90263562CDE7064D587BB
              A2B8B8AC53CBE8DB5B86B9B90AE78BCEA177EF6C1AA01F19AB0E551432B41A9D
              588400F2F8D8D858319833670A8409FBF4ED8BC307BF11C6D8F4D926100BA28D
              188BC308B308B317F7CBC6F3A370D8DCDC4499820B5ABD167A43205A897124D2
              554194E56DFC740316FEF5B9AB8288D9242DAD87E89FAF575A7289C2825B649A
              1C0EE2E313A121EDD0DCD44840CA27D6B3769E1B17178FF4F41E62A138043634
              360A43D8C921C22844444446C24ACF0B4E9FF486054FBBEFBEFB5E5DB470E102
              A7AD0D9FEE2FC55B5BCF89FEB8CEF6F894540CCB0821F7D6E181FB1FD8B673E7
              CE09571BF7AF1F7A14378E1A2DC20B1BA996989C438E2F6CD5D6D521223C829C
              94F427852AFE3C92C62318940CBC7DDB367CB874F1F7AEC986E7F94447C78A08
              5072A944DC04286415F5316CF830E1200CA233674E0BDBF95A62421252D3D245
              C460C7696E31131B6A852385478423222C921CB2832441BEB0BFAF4D9F3EFDED
              F5EBD73F2C4094977730B5A568F12B368B3C79E55E85B469C3C708098B427252
              148A2F5CA48145222E360135B595A827944F9A328D18249826E8C08EAF76A0A1
              AE464CC062E9407EFE0961A0D65633DADA5AB1E9F3CFC8E3D348B7D960A3D0C5
              719E0DE7D148104053F237E2587E73FA480BA05029851867CDF3F1C72B1A5E7E
              F18516A26D5F6ECF354F5A1737257EDAC8A4A4643FBE4E2101B8EFC01CF4EB3F
              401C74BEE82CF6EEDE8DF4D454E8F47E82294B4B2F89F2049D87AC5E5982554B
              4A2E527F2A8C9F348542839642431BB67DF699F8464A5C5C021A1BEB51555559
              457D5A89218C04A257162C58F057768400BD1A6BF695E0ED6DE7F0BB6969B8AE
              6708DAAC4EE1187FFAD39F96118826D1F3F62B65D3C81B4785C7C427F8B17185
              A753E8E290E5D38DBED73E09C006F7BD66201193B7EFDBB3B34EBA2CCA64BDDE
              2F323E3E41C7203C53780683870E47AFDEBD4592D0D0D08063470E93D4D089B1
              9D2352A8ACAA14999D4EA747AF5EBD0563F31AE90C7E183B6E92703E734B33AD
              C566F853088D8E8E61B697ABAACAAB680C368A440137DD34EA8D152B563C2740
              B47EC3A6995B367CBC32882835FF7C29F6ECD849B1D78FC24980608F3442297B
              1A0FEEC147E721303854502ED71782834D78FDE5178999B4080D09C5C5926231
              685F4CFFFB1B6FA157566F91D5F1DD8F1C56D8EB78FA76BB8DA8DC8C3016D260
              7DD441C06B13B4CA44DC41E1883865414488E955C68C779125F21859A150D917
              2E5CB8BFA2A26A684545397AF4CCC0F41933C9933C618BAFF9CDBEBDD8B97D3B
              323333C1FA2390F49C92BCB18DB4829B169B8D53595D8505BFFB0385603B257A
              76B1782A42F3AB2F2C22B199240C979B7BC79CD1A3472F23E1AD230770126339
              796E3AD2587CA3D6820F8EE2B55999301AD4A228EB15C06A5A6CA5DC259BA0D7
              B2DDEE706CF9E2CB4DE5151553985544E8E5F021EE55BFFC9572D69BBEC68CED
              149A89934E1762A2A296DD3265D21C3A4E4BDD3889494DAFBEFADA31D246F1C5
              172FA07FCE208CBF790A81BF1AC1262322A322B16EE5C7387CE08070F60E6258
              B6A19A988F81C28561ABA51D7564B7DF3EF9344506B3E8C78FE40633F36B64DF
              F4B4344A821C9837F7D1297DFBF6FDDCE5726877ECD8697FE491476501A2D56B
              D6CD5CB966C34A3D698A9ACA1273FE89E34E5E03F27E3B79A3643018C2D8F3EC
              0E3BFEB2F045629E3AAC59B50AD78F1C898124E8D67CBC027B76ED121D5106D4
              5E575FDB545D5DE54FE73BEF9A7D6F00297F2D2F0A8B40CE84B84F5E28362283
              313434D40B22AB17449ED72CA66322239F4C4F4B5968A009F91C8FC7D2D8D86C
              58BE6CD9771486520B0B0BF12809C6DED97DB065F366BA662B6EBF630685811A
              3CFFCC1F91DEA387581453701889481D1AEA6BC80BDD04E84A245246F3D88227
              504859CBE64D1B31FD8E3B904CD9CADF9E7D86C26A0B3172388560EDC2912347
              3E3971E244310616BE220F239B3759EC286FE840540069233286EC29A98B6378
              8E3E0CF1799C451DFFF604E98B8ABFFB19FC7A50786975BB5CCA16B3393A2830
              B08AC0E4E2648E322B7A1D5441E18C96CDA56A6A6A8A0A0909ADE09F2E208D14
              4472E2685A4AD2D363478FC2C58B17F1F2CBAF465042514CE7F89D3A75120B7E
              FF0724932D8E1D3A880E8B1523AEBF9EC47219FEF6973F0B87226D0613392A87
              EF7A5A23FEA595B2B252646567E3815F3F8C7C0A79DBB66EC1CC5FDC85A8E868
              3CFFE7672953EB10AC75D75D33EF1D3C78D0077A921E3B76ECC2238F3CE211D6
              4BDFFFF0EEB7DF59B29C8DACD5A8563534D4DC45B30F20BA376767F79D7DEE5C
              D1876DADED142B1BF0E18A55B01343F082E7E4E410EA73F09767FF8483FBF753
              BA9D483A24FE130A65B9C78F1FD34F9B768B3ED014924708EFA9F05273484888
              585016C23FFA3B4392279633C87206F47F3A2539F9AF7CAC31284084B9BAFA06
              BE967EF1E277BF231199CEA1ECB105BFC194C9D368F29F09F04DBDE5568AFFDF
              E177BF5940749D25BCC844DEE70151ADB84786B5503879290BDDF367CF62F78E
              1D42F0C6C4C761CEEC597093D179BCC4B6D43F9E1E316204284B135F03B7D89C
              E82066658C6844ED0C9E5A8C8BEB2D76110E39F4F840C4DB4AAC350E1E3AC273
              50F5EC99E1D4536861F6A543D4C470BC5729C29BCD6E239257DBB59435311B17
              149C56901DDC0CCA769A5B90D1A8898C88B05FBA74112FBEF012FF10460469D3
              62BA9E5F3ECDF9F7C4263753B6BBF3AB2F497E3460EAB45BB17FFF3778E6E927
              49DBF6A1EBDB612487627B3388384BABA8A8403285FE975E7915674E9EA40C70
              2FA64C9B860062B207EE99C303A468A26110DD3364C8E00FD949F6ECD94D207A
              D403224254FCE9D3A747915E51190CFAC2F6D6B67D4BDF5F8A871E7A08292929
              992FBDF4CA0985A4509D3A7502B3EEBD1F731F795864151CEAF2F2BEC182C7E7
              2336264680E2D65B6FFD6DEFDEBD5FDA4B83183A6C98FED091A3C71A9B9A7AFA
              BC9219896B33FC9C81E4CB027C8D5F2BBC454106D1807EFD9E494B4D798E598A
              6B5262916D36E145EFBFBFF4CBD2D2B2B1F575B5082011FEF7D75E472CE9376E
              8D64B0279FFA030A4EE4238D28BC855E9B42C2443833B7347A7E1380C65448E0
              79963C74F2A449A28ACB9A69CDBA4FF0E2A245C8CAEC05070169F2E449E3C342
              43BFE4109D4A19AABF294CA4F35D6B91629B48F23D738BAF547575112EECB126
              3C7AE4285A9A9A90919121B25366668D5A23E6E5CB8A3894BB282E6A29B4F2E7
              0505A4F7285911BF26C7EC4C6B9D101F2F0CCD4C44CEAEDEB76FDF014A000654
              5268CF1E3000CFFCF1191803FDC5E0EA1A9AF0DB279E4049713192929284760D
              8F8A151285930E1BADAD4C89C8F90BE7B1F0C51731FAA61B85039166C0F28F56
              E0ADD75F13991D97B2860C1D34D26834E6F12DB35C4E59B4E86FDE149FBC8343
              84931656A7D390A73660C99225983AF51641CB2410B7D7D4D48C63E31591281B
              377E02858EBE6824A5BE6EDD5A51E88A8D8D636099274D9A901314643A67A4B4
              9B2EAD252F994ADED4415EE672B85C5A028349A3565753CADCDE61B11868E543
              A9EF7A060E5D5F4BEB6DE4CFD9160EBB238098AD342434F4809618C44459137B
              66BBB989BC5FC2A9D305333EFC60F99A004A6B0B49AF85474561CAD42902943B
              49F09F3E754AB050BBC5829B6EBC1137DC7883A072CE3ADE5BFC9E0063636393
              28DEDD76DB6D8825063A7F5E7C6D09F194F171E6191C125274FB6DD307909E6B
              F50B34228A7492DC05403F04112E8349FAFE7B3C47072518E524F08D24EA592C
              333099D9C40D320AC99B967B4225CF839D8EB3B3E090605126615007D1B80C81
              8164FC0E58C83954A44DF3F6E6CDDFB061C3AB6969A928A0F0CE3A8BD98823C0
              F62FB6A288E6D58B9D82FA4B4E4E7E373C2262170141ED70D803F24FE4FF85EC
              13CE45C62602C6F4DB6F470C85B1823367B0F5F3CF91441186240DEBE4AF870C
              19721D87655F76FCF4D34F794074E0C02150DC1520D213FA79D0DF7D978F9E3D
              7B8A4910E2067EF1C5173BC913027910A5A5A5A2A2C9758D98A868A24693D032
              8306E53CD9B76FF642F69EB88424915A3283F0E0B84316ADFEFE012223E345E4
              450AA1C561366061C9BBF47C4394E7EB4792603BCE0AC223A328C3D27B8A9592
              42A4AEB2D34691C386975E58B489263B95EB2AD524AA99DDD8089C797196C8F5
              91C4C404BCFDCEDBE23D5FDBB4691316FE6D1187061122CACACA8481782F299E
              CE6316E05033EBEE59B78D1C357A439BCD21369C39E5BE320C5F1D44F801887C
              A299536DB7ECF6EEAC28BC0093843611CF25CFBEA5EF393F3653B6EB0362A750
              67E6227BB413902E5DBCA0FB64DDBAD574D034725C7800D128F6974C4613B157
              B4482E8889F2EEBAEBAE7179FBF65999E9B37AF5E2EAF6AF56AF5EFD2EDBC64C
              3AB082F413DB9DD99E323E117188216DB7DE7ACB5866A1AEA27FD6ACBB7F1C44
              5C20F4818859EAC08103A3C8202B48B44671EAEDD9CD90C4C0B8A4EFEFEFFF7C
              6666CF67793B81D25764F6CE1634C92062E3B0F76AB45A510CF364232E41DD5C
              5C63DA7412D52B494708944BB4D004501E0FF76F0C0C10C66375C13FEAE079F4
              FC42C5A5E2B3BA0D6BD72DFBEEF8F119AC31B8F82979C322533FD73F28DDA6B0
              9CDC5927E2B1330B2C5BB61C1F2D5F2E44326797F0EA361BB19D92C63A6BCEEC
              D9C3868F58DEDC6641D78D2C49FAE1AD718A2B4024FF08887C20F8DE67F49ED2
              B75525493FF8E3B9B45ADA3B5F8B8A3F3FA747B5776F9293808AB252E307EFBF
              BFA6B2BC7C9C96A2033394679BD0450C646740EC261D7B57767676E54E4A8458
              1B0D1F3A94250BB66DDB3AFFABAF76BCC0ECC4766202E03E3883D6EB750D37DC
              70E3BDFDFAF5DBEC2B43F8DAB87163FE6F206226CA1403E07D98A3478F62F0E0
              9CE8B2F2CA070B0BCF4EE8B07484D29CAD29A92947D2D3D3169F3B77EEEB4032
              F6C49B6F26DD902940E2592C85E4D53ADC33DF23DB83D375DF160881414DB8A8
              A1ACBADAE976F6E3DF6CE0AF5DF372D171FC25218B5AA59C48C7C6D2259CBC13
              C0D184588AFCD62DA934EA7687DD9E9CB76BD79DDF1E3D82A6C646511B3110EB
              6466F5C60D378D86DEDFE013B09DB5185E78F6B482D3A770605F1EAAAB2AE1A0
              F0C60B18151B8FE1D78FB425A5A47EC08C2B417CD5A173E53A3794BD8EE4BDEB
              4A5648824A3A41C6F52CC134FC998766208E814254B7BD58F381C2CD35522F50
              BCE7891B01F947080E3B9C8EB3FC9C3FF31ECF3FEC0A92EF7CCC09D6F7349F04
              734B93F2C037FB971D3A78B07F435DBD186F7844581B69B0DF4747452DA628E2
              2430600FE9290EE783070F26E68D23066A26207D3180C2FB8364FF21744D03FD
              3512537F151D15F16EFFFE034A78CB859DAF2B88264E1CFFCF83E8C89123183E
              6C2889D3106CF97C1BD163ACA2A8A8481E3776ACACD1AA98A9104599CEAF1E99
              EB01875B144C24D9B30BC180E0AEFD083A4B69E922E918071D44D89135746489
              4A527CE392DD8D948ACFA403C3E8CF4AC7241183257358F302CE7B679DF717D3
              64CF8F513223A9499CDA89AD780B8637E578B2624B86BC4DD06FA7D690D1D59B
              D4143EF999833C8E6B311A0A352A021263BEEB7E56D71B2B2E83E8322349BED7
              E2CE612FCBF898059DA0023AC395F7BB2BE2B5C21713A1F0FEF0050344EA6438
              7450BA7FD8CB42BE819084926A280AACA2F72389A9A325857238DF8DA1D168B7
              BA1C8E42625E2D4B2B3F83DF050AD3C7F6EDDA2934DFC081037F00A27ACA5877
              EFDE03FF80409453689F3871A2F4C9279FC8F10909A256D4AF5F5F9203A69F0E
              A2614387884EB66FFF3F484848C4591270379260D51B74387CE81081280AF73F
              F4F0F78CE4EB4F808A1641E9A5731F13898C8D958ECCB7E2F38F324A9D8536AD
              4A1D460B14C736F60248BAE2DA82916861D9E69227099228D16070BAC58F88D0
              65596F2914F0FC4216DBD7B704DE3B4864057FC4DECD453E3783D5298A841ED6
              B87AE3A2A7E4FD5C8044F6BC03CFDD1E5E8C5D3EBFAB8EEA7CBF0B637545A98F
              8DBCCFF9101B39C859D6519DE190D1C1CF3DB79A287CD7F055B925EFDD3F62A9
              28566A486F1EC8CBC3850B177E1444BB76ED06D70AAB8895274F9E8C356BD688
              2D25AE82337BF136D4D540F43F2E1345D72F83B9800000000049454E44AE4260
              82}
          end
          object GBau: TGauge
            Left = 54
            Top = 85
            Width = 99
            Height = 22
            ForeColor = clHotLight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Progress = 0
          end
          object lbl13: TLabel
            Left = 93
            Top = 71
            Width = 22
            Height = 11
            Caption = '80m'#179
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object EdVlrLiberado: TCurrencyEdit
            Left = 70
            Top = 7
            Width = 95
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
          object EdVolLiberado: TCurrencyEdit
            Left = 70
            Top = 30
            Width = 95
            Height = 19
            Margins.Left = 5
            Margins.Top = 2
            TabStop = False
            Ctl3D = False
            DisplayFormat = ' ,0.00;- ,0.00'
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 1
          end
        end
        object dbg4: TDBGrid
          Left = 1
          Top = 31
          Width = 743
          Height = 573
          Align = alClient
          DataSource = DsConsE120PedLiberado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = dbg4DblClick
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CODREP'
              Title.Alignment = taCenter
              Title.Caption = 'REP.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 30
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NUMCON'
              Title.Alignment = taCenter
              Title.Caption = 'N'#186' CONTROLE'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 90
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NUMPED'
              Title.Alignment = taCenter
              Title.Caption = 'N'#186' PEDIDO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CODCLI'
              Title.Alignment = taCenter
              Title.Caption = 'CLIENTE'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMCLI'
              Title.Alignment = taCenter
              Title.Caption = 'NOME'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 240
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATEMI'
              Title.Alignment = taCenter
              Title.Caption = 'EMISS'#195'O'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATENV'
              Title.Alignment = taCenter
              Title.Caption = 'ENVIO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'VLRBRU'
              Title.Alignment = taCenter
              Title.Caption = 'VALOR'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'VOLUME'
              Title.Alignment = taCenter
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'USUGER'
              Title.Alignment = taCenter
              Title.Caption = 'USU.GER'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 80
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATGER'
              Title.Alignment = taCenter
              Title.Caption = 'DAT.GER'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 80
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'USUCON'
              Title.Alignment = taCenter
              Title.Caption = 'USU.CONF'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATCON'
              Title.Alignment = taCenter
              Title.Caption = 'DAT.CONF'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end>
        end
      end
    end
    object ts4: TTabSheet
      Caption = '     Liberado em Carga     '
      ImageIndex = 3
      object pnl4: TPanel
        Left = 0
        Top = 0
        Width = 915
        Height = 605
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object pnl5: TPanel
          Left = 1
          Top = 1
          Width = 913
          Height = 30
          Align = alTop
          TabOrder = 0
          object lbl4: TLabel
            Left = 5
            Top = 7
            Width = 141
            Height = 13
            Caption = 'LIBERADO EM CARGA  '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 7288576
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object pnl6: TPanel
          Left = 744
          Top = 31
          Width = 170
          Height = 573
          Align = alRight
          BevelOuter = bvLowered
          TabOrder = 1
          object lbl5: TLabel
            Left = 19
            Top = 9
            Width = 46
            Height = 13
            Caption = 'Valor..:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl6: TLabel
            Left = 6
            Top = 32
            Width = 60
            Height = 13
            Caption = 'Volume..:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btnBVisuPreCargas: TSpeedButton
            Left = 17
            Top = 94
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
          object EdVlrLiberadoEmCarga: TCurrencyEdit
            Left = 70
            Top = 7
            Width = 95
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
          object EdVolLiberadoEmCarga: TCurrencyEdit
            Left = 70
            Top = 30
            Width = 95
            Height = 19
            Margins.Left = 5
            Margins.Top = 2
            TabStop = False
            Ctl3D = False
            DisplayFormat = ' ,0.00;- ,0.00'
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 1
          end
        end
        object dbg2: TDBGrid
          Left = 1
          Top = 31
          Width = 743
          Height = 573
          Align = alClient
          DataSource = DsConsE120PedLiberadoEmCarga
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = dbg2DblClick
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CODREP'
              Title.Alignment = taCenter
              Title.Caption = 'REP.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 30
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NUMCON'
              Title.Alignment = taCenter
              Title.Caption = 'N'#186' CONTROLE'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 90
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NUMPED'
              Title.Alignment = taCenter
              Title.Caption = 'N'#186' PEDIDO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CODCLI'
              Title.Alignment = taCenter
              Title.Caption = 'CLIENTE'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMCLI'
              Title.Alignment = taCenter
              Title.Caption = 'NOME'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 240
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATEMI'
              Title.Alignment = taCenter
              Title.Caption = 'EMISS'#195'O'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'VLRBRU'
              Title.Alignment = taCenter
              Title.Caption = 'VALOR'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PRECAR'
              Title.Alignment = taCenter
              Title.Caption = 'PR'#201'-CARGA'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 80
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'VOLUME'
              Title.Alignment = taCenter
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'USUGER'
              Title.Alignment = taCenter
              Title.Caption = 'USU.GER'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATGER'
              Title.Alignment = taCenter
              Title.Caption = 'DAT.GER'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATENV'
              Title.Alignment = taCenter
              Title.Caption = 'ENVIO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'USUCON'
              Title.Alignment = taCenter
              Title.Caption = 'USU.CONF'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATCON'
              Title.Alignment = taCenter
              Title.Caption = 'DAT.CONF'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end>
        end
      end
    end
  end
  object DsConsE120PedAgdConf: TDataSource
    DataSet = Dm1.ConsE120PedAgdConf
    Left = 456
    Top = 64
  end
  object DsConsE120PedSuspenso: TDataSource
    DataSet = Dm1.ConsE120PedSuspenso
    Left = 424
    Top = 192
  end
  object DsConsE120PedLiberado: TDataSource
    DataSet = Dm1.ConsE120PedLiberado
    Left = 400
    Top = 368
  end
  object DsConsE120PedLiberadoEmCarga: TDataSource
    DataSet = Dm1.ConsE120PedLiberadoEmCarga
    Left = 384
    Top = 512
  end
end
