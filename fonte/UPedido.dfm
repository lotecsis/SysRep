object FPedido: TFPedido
  Left = 0
  Top = 0
  Caption = 'Pedidos de Venda'
  ClientHeight = 652
  ClientWidth = 916
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 916
    Height = 152
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Tag = 1
      Left = 701
      Top = 0
      Width = 215
      Height = 152
      Align = alRight
      Color = 14540253
      ParentBackground = False
      TabOrder = 0
      object BInserir: TBitBtn
        Left = 109
        Top = 3
        Width = 100
        Height = 25
        Caption = 'Inserir'
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
        OnClick = BInserirClick
      end
      object BAlterar: TBitBtn
        Left = 110
        Top = 33
        Width = 100
        Height = 25
        Caption = 'Alterar'
        DoubleBuffered = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333FF3FFFFFFF3FFFF003000000030
          0000773777777737777703330030033300037FFF77F77FFF7773700007330000
          003377777733777777F3303003330030003337F77F3377F77733303073333030
          033337F77F3337F77F3337007333300003333777733337777333330033333000
          33333377F3333777F33333073333330033333377333333773333333333333333
          33333333FF333333FF33333973333337933333377FF333377F33333999333399
          93333337773333777F333339933333399333333773FF33377F33333939733793
          93333337377FF773733333333399993333333333337777333333}
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 1
        TabStop = False
        OnClick = BAlterarClick
      end
      object BExcluir: TBitBtn
        Left = 111
        Top = 63
        Width = 100
        Height = 25
        Caption = 'Excluir'
        DoubleBuffered = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
          3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
          03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
          33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
          0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
          3333333337FFF7F3333333333000003333333333377777333333}
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 2
        TabStop = False
        OnClick = BExcluirClick
      end
      object BCancelar: TBitBtn
        Left = 111
        Top = 93
        Width = 100
        Height = 25
        Caption = 'Cancelar'
        DoubleBuffered = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
          555557777F777555F55500000000555055557777777755F75555005500055055
          555577F5777F57555555005550055555555577FF577F5FF55555500550050055
          5555577FF77577FF555555005050110555555577F757777FF555555505099910
          555555FF75777777FF555005550999910555577F5F77777775F5500505509990
          3055577F75F77777575F55005055090B030555775755777575755555555550B0
          B03055555F555757575755550555550B0B335555755555757555555555555550
          BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
          50BB555555555555575F555555555555550B5555555555555575}
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 3
        OnClick = BCancelarClick
      end
      object BSair: TBitBtn
        Left = 112
        Top = 123
        Width = 100
        Height = 25
        Caption = 'Sair'
        DoubleBuffered = True
        Glyph.Data = {
          26040000424D2604000000000000360000002800000012000000120000000100
          180000000000F0030000120B0000120B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFD1D1CE4C48402D34293040313241333341333442343442343441
          3434423434413434413434423436372F0000FFFFFFFFFFFFFFFFFFFFFFFFC0BE
          C871687B85A4904E8F6926784B257A4B297E4E2C81512E81522E82522D81532D
          81522E85553441340000FFFFFFFFFFFFFFFFFFFFFFFFB9B8E13F3CA9ABA4D0D7
          CDC87D9284537663256541296A442E734A347650357651357752337D53364034
          0000FFFFFFFFFFFFFFFFFFFFFFFFD4D4ED1818B11A18B0A9A8CDEEE8E0C1BEC0
          73877D42685321613D2D6C4730704B31734D2F7C503440340000C8C7E8C4C4DE
          C4C3DEC8C8E19D9CC41D1DBF0000E71514BA9694B7DCDDD0D5CFD3AEACAF5C6B
          63255A3C276C442F6E492E7A4F34403400002221B01E1EC91E1ECD2222CE1818
          C50404DD0101FA0000F1110FBE807EA4CED0C2DBD7DC8E8C8E1F51342469412D
          6C472C774C34403300000000B10000F60000E50000E50000E70101EA0000DB00
          00E50000F70E0DC57975A0D8D5CA888D8B204E3324613D2B65422B7149343F32
          00000F0DB71010FF0101E50101E50101E50000E50000E30000E30000F30A0AF9
          100FC58984B5949787204B32235B3A2A5C3E2A6946343E320000100FB51B1CFF
          0101FB0202FA0303FB0202FB0000FA0101FC1213FE0202EC312FA8B8B3BD8D92
          8C1D452F21563728573B276641343E3200000907B01D1DF01D1DED1D1DEE2121
          ED2525F61313FF1515FF0A09E5403EAA706F725F5D5C888D8B1E402C1B492E22
          4B33235D3D343C3200005B59C14D4EBF4E4EBF5050C03939AD1818C52324FA11
          0FDD544FAEC1C1BF9A9C9B4C4A4B545655284435143A241E3E2B205436333C31
          0000FFFFFFFFFFFFFFFFFFFFFFFFD5D5E82020C10703C86D69B6D1D3CBC3C6C4
          A8AAA9C4C4C59A9C9D0E261811301E1732231B4C31323B300000FFFFFFFFFFFF
          FFFFFFFFFFFFBFBEE62723A57B74B4E6E8DCD4D7D3BFC1C2BDBFBFD1D3D38285
          8512291C0C2A19132C1E19472D323A300000FFFFFFFFFFFFFFFFFFFFFFFFBAB7
          C7706B89E6E8E2E9ECE8CDCFCFBFC1C1B8BABACECED08387860C22150825150F
          261915422932392E0000FFFFFFFFFFFFFFFFFFFFFFFFBBBAB5848478E5E8E5E2
          E5E6CCCECEBFC2C2BDBFBFCACACB68696A02150A0925150B2015123E2531392E
          0000FFFFFFFFFFFFFFFFFFFFFFFFBBBAB77E7D78E4E6E6E7EAEBD5D7D7C9CCCC
          AEB1B0A3A3A35053520010050C27180B2014123E2531392E0000FFFFFFFFFFFF
          FFFFFFFFFFFFBCBBB97D7C78D4D6D5C9CDCEAAAEAE8A8E8E72757688888A4F52
          520011040A2716091F12103E2531392E0000FFFFFFFFFFFFFFFFFFFFFFFFD0CF
          CD4B4A4542403B4A4A4443423D3D3C373B393542403C3A39332D2E282E322A2E
          302A30352D36342E0000}
        ParentDoubleBuffered = False
        TabOrder = 4
        TabStop = False
        OnClick = BSairClick
      end
      object BEnviar: TBitBtn
        Left = 4
        Top = 3
        Width = 100
        Height = 25
        Caption = 'Enviar'
        DoubleBuffered = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
          333333333333337FF3333333333333903333333333333377FF33333333333399
          03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
          99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
          99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
          03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
          33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
          33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
          3333777777333333333333333333333333333333333333333333}
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 5
        TabStop = False
        OnClick = BEnviarClick
      end
      object BImprimir: TBitBtn
        Left = 4
        Top = 33
        Width = 100
        Height = 25
        Caption = 'Imprimir'
        DoubleBuffered = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          0003377777777777777308888888888888807F33333333333337088888888888
          88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
          8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
          8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 6
        OnClick = BImprimirClick
      end
      object BObs: TBitBtn
        Left = 5
        Top = 64
        Width = 100
        Height = 25
        Caption = 'Observa'#231#245'es'
        DoubleBuffered = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
          333333333337FF3333333333330003333333333333777F333333333333080333
          3333333F33777FF33F3333B33B000B33B3333373F777773F7333333BBB0B0BBB
          33333337737F7F77F333333BBB0F0BBB33333337337373F73F3333BBB0F7F0BB
          B333337F3737F73F7F3333BB0FB7BF0BB3333F737F37F37F73FFBBBB0BF7FB0B
          BBB3773F7F37337F377333BB0FBFBF0BB333337F73F333737F3333BBB0FBF0BB
          B3333373F73FF7337333333BBB000BBB33333337FF777337F333333BBBBBBBBB
          3333333773FF3F773F3333B33BBBBB33B33333733773773373333333333B3333
          333333333337F33333333333333B333333333333333733333333}
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 7
        OnClick = BObsClick
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 701
      Height = 152
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 701
        Height = 91
        Align = alTop
        Color = 14540253
        ParentBackground = False
        TabOrder = 0
        OnExit = Panel4Exit
        object Label1: TLabel
          Left = 34
          Top = 31
          Width = 87
          Height = 13
          Caption = 'N'#186' Controle..:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 55
          Top = 75
          Width = 66
          Height = 13
          Caption = 'Emiss'#227'o..:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 256
          Top = 10
          Width = 57
          Height = 13
          Caption = 'Cliente..:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 256
          Top = 36
          Width = 57
          Height = 13
          Caption = 'C. Pgto..:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 4
          Top = 53
          Width = 117
          Height = 13
          Caption = 'Pedido Empresa..:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 245
          Top = 62
          Width = 68
          Height = 13
          Caption = 'Situa'#231#227'o..:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LDsCodCli: TLabel
          Left = 420
          Top = 11
          Width = 4
          Height = 13
        end
        object LDsCodCpg: TLabel
          Left = 420
          Top = 36
          Width = 4
          Height = 13
        end
        object LDsSitPed: TLabel
          Left = 321
          Top = 62
          Width = 4
          Height = 13
        end
        object LCodRep: TLabel
          Left = 489
          Top = 62
          Width = 4
          Height = 13
        end
        object Label13: TLabel
          Left = 14
          Top = 10
          Width = 107
          Height = 13
          Caption = 'Representante..:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EdNumCon: TEdit
          Left = 123
          Top = 26
          Width = 100
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          OnExit = EdNumConExit
          OnKeyDown = EdNumConKeyDown
        end
        object EdDatEmi: TDateEdit
          Left = 123
          Top = 68
          Width = 100
          Height = 19
          Ctl3D = False
          NumGlyphs = 2
          ParentCtl3D = False
          TabOrder = 1
          OnExit = EdDatEmiExit
        end
        object EdCodCli: TEdit
          Left = 316
          Top = 5
          Width = 100
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 2
          OnExit = EdCodCliExit
          OnKeyDown = EdCodCliKeyDown
          OnKeyPress = EdCodCliKeyPress
        end
        object EdCodCpg: TEdit
          Left = 316
          Top = 30
          Width = 100
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 3
          OnExit = EdCodCpgExit
          OnKeyDown = EdCodCpgKeyDown
          OnKeyPress = EdCodCpgKeyPress
        end
        object BNumCon: TBitBtn
          Left = 201
          Top = 27
          Width = 21
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
          TabOrder = 4
          TabStop = False
          OnClick = BNumConClick
        end
        object BCodCli: TBitBtn
          Left = 394
          Top = 7
          Width = 21
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
          TabOrder = 5
          TabStop = False
          OnClick = BCodCliClick
        end
        object BCodCpg: TBitBtn
          Left = 394
          Top = 32
          Width = 21
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
          TabOrder = 6
          TabStop = False
          OnClick = BCodCpgClick
        end
        object EdNumPed: TEdit
          Left = 123
          Top = 47
          Width = 100
          Height = 19
          TabStop = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 7
          OnExit = EdNumPedExit
        end
        object BNumPed: TBitBtn
          Left = 201
          Top = 48
          Width = 21
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
          TabOrder = 8
          TabStop = False
        end
        object EdCodRep: TEdit
          Left = 123
          Top = 5
          Width = 100
          Height = 19
          TabStop = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 9
          OnExit = EdCodRepExit
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 91
        Width = 701
        Height = 61
        Align = alClient
        TabOrder = 1
        object Panel6: TPanel
          Left = 1
          Top = 1
          Width = 699
          Height = 22
          Align = alTop
          BevelOuter = bvLowered
          Color = 14540253
          ParentBackground = False
          TabOrder = 0
          object LEndCli: TLabel
            Left = 16
            Top = 4
            Width = 3
            Height = 12
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
          end
        end
        object Panel9: TPanel
          Left = 1
          Top = 23
          Width = 699
          Height = 37
          Align = alClient
          BevelOuter = bvLowered
          Color = clWhite
          ParentBackground = False
          TabOrder = 1
          object DBDsPro: TDBText
            Left = 92
            Top = 4
            Width = 265
            Height = 15
            DataField = 'DESPRO'
            DataSource = DsConsE120Ipd
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 170
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object DBDSDer: TDBText
            Left = 92
            Top = 20
            Width = 265
            Height = 15
            DataField = 'DESDER'
            DataSource = DsConsE120Ipd
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 170
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object Label7: TLabel
            Left = 24
            Top = 4
            Width = 63
            Height = 13
            Caption = 'Produto..:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 9
            Top = 20
            Width = 78
            Height = 13
            Caption = 'Deriva'#231#227'o..:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LPedEnv: TLabel
            Left = 549
            Top = 14
            Width = 3
            Height = 13
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LPedCon: TLabel
            Left = 624
            Top = 14
            Width = 3
            Height = 13
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
    end
  end
  object Panel7: TPanel
    Left = 0
    Top = 568
    Width = 916
    Height = 84
    Align = alBottom
    Color = 14540253
    ParentBackground = False
    TabOrder = 1
    object Label9: TLabel
      Left = 12
      Top = 39
      Width = 65
      Height = 13
      Caption = 'M'#179' Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 107
      Top = 39
      Width = 69
      Height = 13
      Caption = 'M'#179'  Aberto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 225
      Top = 39
      Width = 73
      Height = 13
      Caption = 'Valor Bruto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 323
      Top = 39
      Width = 85
      Height = 13
      Caption = 'Valor L'#237'quido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel10: TPanel
      Left = 1
      Top = 1
      Width = 914
      Height = 30
      Align = alTop
      Color = 14540253
      ParentBackground = False
      TabOrder = 0
      object Panel12: TPanel
        Left = 1
        Top = 1
        Width = 912
        Height = 28
        Align = alClient
        BevelOuter = bvNone
        Color = 14540253
        ParentBackground = False
        TabOrder = 0
        object Panel13: TPanel
          Left = 789
          Top = 0
          Width = 123
          Height = 28
          Align = alRight
          BevelOuter = bvNone
          Color = 14540253
          ParentBackground = False
          TabOrder = 0
          object BAddProd: TBitBtn
            Left = 10
            Top = 2
            Width = 35
            Height = 25
            DoubleBuffered = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333FF33333333FF333993333333300033377F3333333777333993333333
              300033F77FFF3333377739999993333333333777777F3333333F399999933333
              33003777777333333377333993333333330033377F3333333377333993333333
              3333333773333333333F333333333333330033333333F33333773333333C3333
              330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
              993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
              333333333337733333FF3333333C333330003333333733333777333333333333
              3000333333333333377733333333333333333333333333333333}
            NumGlyphs = 2
            ParentDoubleBuffered = False
            TabOrder = 0
            OnClick = BAddProdClick
          end
          object BExcluiProd: TBitBtn
            Left = 80
            Top = 1
            Width = 35
            Height = 25
            DoubleBuffered = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333333333333333FF33333333333330003333333333333777333333333333
              300033FFFFFF3333377739999993333333333777777F3333333F399999933333
              3300377777733333337733333333333333003333333333333377333333333333
              3333333333333333333F333333333333330033333F33333333773333C3333333
              330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
              993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
              333333377F33333333FF3333C333333330003333733333333777333333333333
              3000333333333333377733333333333333333333333333333333}
            NumGlyphs = 2
            ParentDoubleBuffered = False
            TabOrder = 1
            OnClick = BExcluiProdClick
          end
          object BAltProd: TBitBtn
            Left = 45
            Top = 1
            Width = 35
            Height = 25
            DoubleBuffered = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333333333333FF3FFFFFFF3FFFF003000000030
              0000773777777737777703330030033300037FFF77F77FFF7773700007330000
              003377777733777777F3303003330030003337F77F3377F77733303073333030
              033337F77F3337F77F3337007333300003333777733337777333330033333000
              33333377F3333777F33333073333330033333377333333773333333333333333
              33333333FF333333FF33333973333337933333377FF333377F33333999333399
              93333337773333777F333339933333399333333773FF33377F33333939733793
              93333337377FF773733333333399993333333333337777333333}
            NumGlyphs = 2
            ParentDoubleBuffered = False
            TabOrder = 2
            OnClick = BAltProdClick
          end
        end
      end
    end
    object edVolAbe: TCurrencyEdit
      Left = 107
      Top = 53
      Width = 90
      Height = 19
      Margins.Left = 5
      Margins.Top = 2
      Ctl3D = False
      DisplayFormat = ' ,0.00;- ,0.00'
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
    end
    object EdVlrBru: TCurrencyEdit
      Left = 225
      Top = 53
      Width = 90
      Height = 19
      Margins.Left = 5
      Margins.Top = 2
      Ctl3D = False
      DisplayFormat = ' ,0.00;- ,0.00'
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 2
    end
    object edVlrLiq: TCurrencyEdit
      Left = 323
      Top = 53
      Width = 90
      Height = 19
      Margins.Left = 5
      Margins.Top = 2
      Ctl3D = False
      DisplayFormat = ' ,0.00;- ,0.00'
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 3
    end
    object EdVolPed: TCurrencyEdit
      Left = 9
      Top = 53
      Width = 90
      Height = 19
      Margins.Left = 5
      Margins.Top = 2
      Ctl3D = False
      DisplayFormat = ' ,0.00;- ,0.00'
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 4
    end
    object EdVlrCom: TCurrencyEdit
      Left = 432
      Top = 53
      Width = 90
      Height = 19
      Margins.Left = 5
      Margins.Top = 2
      TabStop = False
      Ctl3D = False
      DisplayFormat = ' ,0.00;- ,0.00'
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 5
      Visible = False
    end
  end
  object Panel8: TPanel
    Left = 0
    Top = 152
    Width = 916
    Height = 416
    Align = alClient
    TabOrder = 2
    object DBGrid2: TDBGrid
      Left = 1
      Top = 1
      Width = 914
      Height = 414
      Align = alClient
      Color = clBtnFace
      DataSource = DsConsE120Ipd
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Verdana'
      TitleFont.Style = []
      Touch.ParentTabletOptions = False
      Touch.TabletOptions = [toPressAndHold]
      OnDrawColumnCell = DBGrid2DrawColumnCell
      OnEnter = DBGrid2Enter
      OnExit = DBGrid2Exit
      OnKeyPress = DBGrid2KeyPress
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'SEQIPD'
          Title.Alignment = taCenter
          Title.Caption = 'Seq.'
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODPRO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = 'Produto'
          Width = 100
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODDER'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = 'Deriva'#231#227'o'
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QTDPED'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. Pedida'
          Width = 80
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QTDABE'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. Aberto'
          Width = 80
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'VLRORI'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr. Prod. Tabela'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TOTDESC'
          Title.Alignment = taCenter
          Title.Caption = '% Desconto'
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PREUNI'
          Title.Alignment = taCenter
          Title.Caption = 'Pre'#231'o Unit.'
          Width = 90
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'VLRBRU'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr. Bruto'
          Width = 80
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PERCOM'
          Title.Alignment = taCenter
          Title.Caption = '% Comiss'#227'o'
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'VLRCOM'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr. Comiss'#227'o'
          Width = 80
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODTPR'
          Title.Alignment = taCenter
          Title.Caption = 'Tab. Pre'#231'o'
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TNSPRO'
          Title.Alignment = taCenter
          Title.Caption = 'Transa'#231#227'o'
          Width = 65
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QTDCAN'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. Cancelada'
          Width = 85
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QTDFAT'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. Faturada'
          Width = 80
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PERIPI'
          Title.Alignment = taCenter
          Title.Caption = '% IPI'
          Width = 50
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'VLRIPI'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr. IPI'
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PERICM'
          Title.Alignment = taCenter
          Title.Caption = '% ICMS'
          Width = 50
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'VLRICM'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr. ICMS'
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'SITIPD'
          Title.Alignment = taCenter
          Title.Caption = 'Sit.'
          Width = 50
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'USUGER'
          Title.Alignment = taCenter
          Title.Caption = 'Usuario Ger.'
          Width = 80
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATGER'
          Title.Alignment = taCenter
          Title.Caption = 'Data Ger.'
          Visible = True
        end>
    end
  end
  object DsE120Ped: TDataSource
    DataSet = Dm1.CadE120Ped
    OnStateChange = DsE120PedStateChange
    Left = 456
    Top = 216
  end
  object DsConsE120Ipd: TDataSource
    DataSet = Dm1.ConsE120Ipd
    Left = 752
    Top = 448
  end
  object Ftp: TIdFTP
    IPVersion = Id_IPv4
    AutoLogin = True
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 816
    Top = 304
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 776
    Top = 368
  end
  object ConsNumPedEmp: TIBQuery
    Database = Dm1.IBDBanco
    Transaction = Dm1.IBDTransacao
    SQL.Strings = (
      'select * from e120ped where numped = :numped')
    Left = 704
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numped'
        ParamType = ptUnknown
      end>
    object ConsNumPedEmpCODEMP: TIntegerField
      FieldName = 'CODEMP'
      Origin = '"E120PED"."CODEMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsNumPedEmpCODFIL: TIntegerField
      FieldName = 'CODFIL'
      Origin = '"E120PED"."CODFIL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsNumPedEmpNUMPED: TIntegerField
      FieldName = 'NUMPED'
      Origin = '"E120PED"."NUMPED"'
    end
    object ConsNumPedEmpNUMCON: TIntegerField
      FieldName = 'NUMCON'
      Origin = '"E120PED"."NUMCON"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsNumPedEmpCODCLI: TIntegerField
      FieldName = 'CODCLI'
      Origin = '"E120PED"."CODCLI"'
    end
    object ConsNumPedEmpTNSPRO: TIBStringField
      FieldName = 'TNSPRO'
      Origin = '"E120PED"."TNSPRO"'
      Size = 5
    end
    object ConsNumPedEmpDATEMI: TDateField
      FieldName = 'DATEMI'
      Origin = '"E120PED"."DATEMI"'
    end
    object ConsNumPedEmpCODREP: TIntegerField
      FieldName = 'CODREP'
      Origin = '"E120PED"."CODREP"'
    end
    object ConsNumPedEmpCODCPG: TIBStringField
      FieldName = 'CODCPG'
      Origin = '"E120PED"."CODCPG"'
      Size = 6
    end
    object ConsNumPedEmpQTDORI: TFloatField
      FieldName = 'QTDORI'
      Origin = '"E120PED"."QTDORI"'
    end
    object ConsNumPedEmpQTDABE: TFloatField
      FieldName = 'QTDABE'
      Origin = '"E120PED"."QTDABE"'
    end
    object ConsNumPedEmpVLRBIP: TFloatField
      FieldName = 'VLRBIP'
      Origin = '"E120PED"."VLRBIP"'
    end
    object ConsNumPedEmpVLRIPI: TFloatField
      FieldName = 'VLRIPI'
      Origin = '"E120PED"."VLRIPI"'
    end
    object ConsNumPedEmpVLRBIC: TFloatField
      FieldName = 'VLRBIC'
      Origin = '"E120PED"."VLRBIC"'
    end
    object ConsNumPedEmpVLRICM: TFloatField
      FieldName = 'VLRICM'
      Origin = '"E120PED"."VLRICM"'
    end
    object ConsNumPedEmpVLRBCO: TFloatField
      FieldName = 'VLRBCO'
      Origin = '"E120PED"."VLRBCO"'
    end
    object ConsNumPedEmpVLRCOM: TFloatField
      FieldName = 'VLRCOM'
      Origin = '"E120PED"."VLRCOM"'
    end
    object ConsNumPedEmpVLRLIQ: TFloatField
      FieldName = 'VLRLIQ'
      Origin = '"E120PED"."VLRLIQ"'
    end
    object ConsNumPedEmpVLRORI: TFloatField
      FieldName = 'VLRORI'
      Origin = '"E120PED"."VLRORI"'
    end
    object ConsNumPedEmpSITPED: TIBStringField
      FieldName = 'SITPED'
      Origin = '"E120PED"."SITPED"'
      FixedChar = True
      Size = 1
    end
    object ConsNumPedEmpUSUGER: TIntegerField
      FieldName = 'USUGER'
      Origin = '"E120PED"."USUGER"'
    end
    object ConsNumPedEmpDATGER: TDateField
      FieldName = 'DATGER'
      Origin = '"E120PED"."DATGER"'
    end
    object ConsNumPedEmpPEDENV: TIBStringField
      FieldName = 'PEDENV'
      Origin = '"E120PED"."PEDENV"'
      FixedChar = True
      Size = 1
    end
    object ConsNumPedEmpDATENV: TDateField
      FieldName = 'DATENV'
      Origin = '"E120PED"."DATENV"'
    end
    object ConsNumPedEmpPEDCON: TIBStringField
      FieldName = 'PEDCON'
      Origin = '"E120PED"."PEDCON"'
      FixedChar = True
      Size = 1
    end
    object ConsNumPedEmpDATCON: TDateField
      FieldName = 'DATCON'
      Origin = '"E120PED"."DATCON"'
    end
    object ConsNumPedEmpUSUCON: TIntegerField
      FieldName = 'USUCON'
      Origin = '"E120PED"."USUCON"'
    end
  end
end
