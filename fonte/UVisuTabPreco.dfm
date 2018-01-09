object FVisuTabPreco: TFVisuTabPreco
  Left = 0
  Top = 0
  Caption = 'Tabela de Pre'#231'o'
  ClientHeight = 543
  ClientWidth = 668
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 44
    Height = 13
    Caption = 'C'#243'digo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 129
    Top = 8
    Width = 64
    Height = 13
    Caption = 'Descri'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EdCodPro: TEdit
    Left = 8
    Top = 22
    Width = 115
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
    OnChange = EdCodProChange
  end
  object EdDesPro: TEdit
    Left = 129
    Top = 22
    Width = 531
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
    OnChange = EdDesProChange
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 48
    Width = 652
    Height = 455
    DataSource = DsConsE081Itp
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CODPRO'
        Title.Alignment = taCenter
        Title.Caption = 'PRODUTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESPRO'
        Title.Alignment = taCenter
        Title.Caption = 'DESCRI'#199#195'O'
        Width = 400
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PREBAS'
        Title.Alignment = taCenter
        Title.Caption = 'VALOR'
        Width = 95
        Visible = True
      end>
  end
  object BImprimir: TBitBtn
    Left = 464
    Top = 512
    Width = 196
    Height = 25
    Caption = 'Imprimir Tabela Completa'
    DoubleBuffered = True
    Glyph.Data = {
      0E030000424D0E030000000000003600000028000000110000000E0000000100
      180000000000D802000000000000000000000000000000000000BFBFBFBFBFBF
      BFBFBF0000000000000000000000000000000000000000000000000000000000
      00000000BFBFBFBFBFBFBFBFBF00BFBFBFBFBFBF000000BFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBF000000BFBFBFBFBF
      BF00BFBFBF000000000000000000000000000000000000000000000000000000
      000000000000000000000000BFBFBF000000BFBFBF00BFBFBF000000BFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBF00FFFF00FFFF00FFFFBFBFBFBFBFBF000000
      000000000000BFBFBF00BFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBF7F7F7F7F7F7F7F7F7FBFBFBFBFBFBF000000BFBFBF000000BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000BFBFBFBFBFBF00000000BFBFBF000000BFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBF000000BF
      BFBF00000000BFBFBFBFBFBF0000000000000000000000000000000000000000
      00000000000000000000BFBFBF000000BFBFBF00000000000000BFBFBFBFBFBF
      BFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      00BFBFBF000000BFBFBF00000000BFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFF
      000000000000000000000000000000FFFFFF000000000000000000000000BFBF
      BF00BFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF000000BFBFBFBFBFBFBFBFBF00BFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBF000000FFFFFF000000000000000000000000000000FFFFFF000000
      BFBFBFBFBFBFBFBFBF00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000BFBFBFBFBFBF00BFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00000000000000000000000000000000
      0000000000000000000000BFBFBFBFBFBF00}
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = BImprimirClick
  end
  object DsConsE081Itp: TDataSource
    DataSet = Dm1.ConsE081Itp
    Left = 552
    Top = 96
  end
end
