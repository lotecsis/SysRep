object FConfig: TFConfig
  Left = 0
  Top = 0
  Caption = 'Configura'#231#245'es'
  ClientHeight = 258
  ClientWidth = 517
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 517
    Height = 217
    Align = alTop
    TabOrder = 0
    object Label4: TLabel
      Left = 11
      Top = 4
      Width = 43
      Height = 13
      Caption = 'Usu'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 249
      Top = 70
      Width = 38
      Height = 13
      Caption = 'Chave:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 21
      Top = 97
      Width = 33
      Height = 13
      Caption = 'Login:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 16
      Top = 122
      Width = 38
      Height = 13
      Caption = 'Senha:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 13
      Top = 70
      Width = 41
      Height = 13
      Caption = 'C'#243'digo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 230
      Top = 97
      Width = 57
      Height = 13
      Caption = 'Data Cad.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 235
      Top = 122
      Width = 52
      Height = 13
      Caption = 'Situa'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LNomUsu: TLabel
      Left = 64
      Top = 19
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 26
      Top = 39
      Width = 28
      Height = 13
      Caption = 'Rep.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LDesRep: TLabel
      Left = 60
      Top = 39
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl1: TLabel
      Left = 18
      Top = 147
      Width = 97
      Height = 13
      Caption = 'N'#250'mero Cont. Ini.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 16
      Top = 169
      Width = 99
      Height = 13
      Caption = 'N'#250'mero Cont. Fim'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl3: TLabel
      Left = 6
      Top = 192
      Width = 109
      Height = 13
      Caption = 'N'#250'mero Cont. Atual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdChave: TEdit
      Left = 293
      Top = 62
      Width = 100
      Height = 21
      Color = clMoneyGreen
      TabOrder = 0
    end
    object EdUsuarioLogin: TEdit
      Left = 60
      Top = 89
      Width = 150
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object EdSenhaLogin: TEdit
      Left = 60
      Top = 114
      Width = 150
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object EdDatCad: TEdit
      Left = 293
      Top = 89
      Width = 100
      Height = 21
      ReadOnly = True
      TabOrder = 3
    end
    object EdSitUsu: TEdit
      Left = 293
      Top = 114
      Width = 100
      Height = 21
      ReadOnly = True
      TabOrder = 4
    end
    object EdCodUsu: TEdit
      Left = 60
      Top = 62
      Width = 150
      Height = 21
      ReadOnly = True
      TabOrder = 5
    end
    object edtNumPedIni: TEdit
      Left = 119
      Top = 144
      Width = 91
      Height = 21
      TabStop = False
      Alignment = taCenter
      ReadOnly = True
      TabOrder = 6
    end
    object edtNumPedFim: TEdit
      Left = 119
      Top = 166
      Width = 91
      Height = 21
      TabStop = False
      Alignment = taCenter
      ReadOnly = True
      TabOrder = 7
    end
    object edtNumPedAtu: TEdit
      Left = 119
      Top = 189
      Width = 91
      Height = 21
      TabStop = False
      Alignment = taCenter
      ReadOnly = True
      TabOrder = 8
    end
  end
  object btnLimparBase: TBitBtn
    Left = 6
    Top = 223
    Width = 100
    Height = 30
    Caption = 'Limpar Base'
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
    TabOrder = 1
    OnClick = btnLimparBaseClick
  end
  object btnBAtualizar: TBitBtn
    Left = 412
    Top = 223
    Width = 100
    Height = 30
    Caption = 'Atualizar'
    DoubleBuffered = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
      FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
      990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
      990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
      FFFF3FFFFF3333333F330000033FFFFF0FFF77777F3333337FF30EEE0333FFF0
      00FF7F337FFF333777FF0EEE00033F00000F7F33777F3777777F0EEE0E033000
      00007FFF7F7FF777777700000E00033000FF777773777F3777F3330EEE0E0330
      00FF337FFF7F7F3777F33300000E033000FF337777737F37773333330EEE0300
      03FF33337FFF77777333333300000333333F3333777773333333}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = btnBAtualizarClick
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
    Left = 232
    Top = 24
  end
  object Ftp: TIdFTP
    IPVersion = Id_IPv4
    AutoLogin = True
    ListenTimeout = 1000000000
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    ReadTimeout = 600000000
    Left = 392
    Top = 8
  end
end
