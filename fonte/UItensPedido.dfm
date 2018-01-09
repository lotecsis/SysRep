object FItensPedido: TFItensPedido
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Produtos do Pedido'
  ClientHeight = 412
  ClientWidth = 994
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object dbg1: TDBGrid
    Left = 0
    Top = 21
    Width = 993
    Height = 392
    DataSource = dsItensPedido
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
        FieldName = 'CODPRO'
        Title.Alignment = taCenter
        Title.Caption = 'Produto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODDER'
        Title.Alignment = taCenter
        Title.Caption = 'Deriva'#231#227'o'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPLIPD'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Produto'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTDPED'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Ped.'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTDCAN'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Can.'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTDFAT'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Fat.'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTDABE'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Abe.'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PREUNI'
        Title.Alignment = taCenter
        Title.Caption = 'R$ Unit'#225'rio'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vnVlrPed'
        Title.Alignment = taCenter
        Title.Caption = 'R$ Ped.'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vnVlrAbe'
        Title.Alignment = taCenter
        Title.Caption = 'R$ Abe.'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESDER'
        Title.Alignment = taCenter
        Title.Caption = 'Desc. Deriva'#231#227'o'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TNSPRO'
        Title.Alignment = taCenter
        Title.Caption = 'Transa'#231#227'o'
        Width = 60
        Visible = True
      end>
  end
  object edtDescPedido: TEdit
    Left = -2
    Top = 0
    Width = 996
    Height = 22
    TabStop = False
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object dsItensPedido: TDataSource
    DataSet = DmOra.ItensPedido
    Left = 344
    Top = 96
  end
  object dsCoresPedido: TDataSource
    DataSet = DmOra.CoresPedido
    Left = 600
    Top = 160
  end
end
