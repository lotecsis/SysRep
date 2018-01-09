object FObsPed: TFObsPed
  Left = 0
  Top = 0
  Caption = 'Observa'#231#245'es'
  ClientHeight = 314
  ClientWidth = 517
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 21
    Width = 30
    Height = 13
    Caption = 'Seq..:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 43
    Width = 30
    Height = 13
    Caption = 'Obs..:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EdSeqObs: TEdit
    Left = 44
    Top = 13
    Width = 121
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 0
    OnKeyPress = EdSeqObsKeyPress
  end
  object EdObsPed: TMemo
    Left = 44
    Top = 40
    Width = 453
    Height = 89
    CharCase = ecUpperCase
    Lines.Strings = (
      'EDOBSPED')
    MaxLength = 250
    TabOrder = 1
    OnKeyPress = EdObsPedKeyPress
  end
  object DBGrid1: TDBGrid
    Left = 44
    Top = 176
    Width = 453
    Height = 120
    DataSource = DsConsE120Obs
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SEQOBS'
        Title.Alignment = taCenter
        Title.Caption = 'Seq.'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSPED'
        Title.Alignment = taCenter
        Title.Caption = 'Observa'#231#245'es'
        Width = 500
        Visible = True
      end>
  end
  object BConfirma: TBitBtn
    Left = 206
    Top = 135
    Width = 75
    Height = 25
    Caption = 'Gravar'
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
    TabOrder = 3
    OnClick = BConfirmaClick
  end
  object BNovo: TBitBtn
    Left = 44
    Top = 135
    Width = 75
    Height = 25
    Caption = 'Novo'
    DoubleBuffered = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
      333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
      0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
      07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
      07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
      0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
      33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
      B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
      3BB33773333773333773B333333B3333333B7333333733333337}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 4
    OnClick = BNovoClick
  end
  object BAlterar: TBitBtn
    Left = 125
    Top = 135
    Width = 75
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
    TabOrder = 5
    OnClick = BAlterarClick
  end
  object DsCadE120Obs: TDataSource
    DataSet = Dm1.CadE120Obs
    OnStateChange = DsCadE120ObsStateChange
    Left = 376
  end
  object DsConsE120Obs: TDataSource
    DataSet = Dm1.ConsE120Obs
    Left = 264
    Top = 8
  end
end
