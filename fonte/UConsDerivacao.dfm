object FConsDerivacao: TFConsDerivacao
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Deriva'#231#245'es'
  ClientHeight = 237
  ClientWidth = 300
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = -6
    Width = 299
    Height = 213
    DataSource = DsConsE075Der
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CODDER'
        Title.Alignment = taCenter
        Title.Caption = 'Deriva'#231#227'o'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESDER'
        Title.Alignment = taCenter
        Title.Caption = 'Descri'#231#227'o'
        Width = 180
        Visible = True
      end>
  end
  object BSeleciona: TBitBtn
    Left = 0
    Top = 213
    Width = 150
    Height = 25
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
    ModalResult = 1
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 1
  end
  object BCancela: TBitBtn
    Left = 149
    Top = 213
    Width = 150
    Height = 25
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
    ModalResult = 11
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 2
  end
  object ConsE075Der: TIBQuery
    Database = Dm1.IBDBanco
    Transaction = Dm1.IBDTransacao
    SQL.Strings = (
      'select e075der.codder,e075der.desder from e075der'
      '                                      where'
      '                                      e075der.sitder = '#39'A'#39' and'
      '                                      e075der.codemp = 1 and'
      '                                      e075der.codpro = :codpro'
      '                                      order by e075der.codder')
    Left = 216
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codpro'
        ParamType = ptUnknown
      end>
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
  end
  object DsConsE075Der: TDataSource
    DataSet = ConsE075Der
    Left = 112
    Top = 64
  end
end
