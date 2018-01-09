object FRelacaoCobranca: TFRelacaoCobranca
  Left = 0
  Top = 0
  Caption = 'Rela'#231#227'o de T'#237'tulos em Atraso'
  ClientHeight = 212
  ClientWidth = 279
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btn1: TBitBtn
    Left = 70
    Top = 68
    Width = 137
    Height = 66
    Caption = 'Visualizar'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = btn1Click
  end
  object frxImpressao: TfrxReport
    Version = '4.8.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42704.708538622700000000
    ReportOptions.LastChange = 42704.740513391200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 216
    Top = 144
    Datasets = <
      item
        DataSet = frxDBClientE301Tcr
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 60.472480000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 260.787570000000000000
          Top = 7.559060000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Rela'#231#227'o de Cobran'#231'a')
          ParentFont = False
        end
        object Date: TfrxMemoView
          Left = 11.338590000000000000
          Top = 30.236240000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Date]  [Time]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          Left = -0.677180000000000000
          Top = 53.913420000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 34.015770000000000000
        ParentFont = False
        Top = 192.756030000000000000
        Width = 718.110700000000000000
        DataSet = frxDBClientE301Tcr
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1NUMTIT: TfrxMemoView
          Left = 175.637910000000000000
          Top = 0.779530000000000000
          Width = 86.929190000000000000
          Height = 30.236220470000000000
          ShowHint = False
          DataField = 'NUMTIT'
          DataSet = frxDBClientE301Tcr
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."NUMTIT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1NOMCLI: TfrxMemoView
          Left = 3.779530000000000000
          Top = 0.779530000000000000
          Width = 158.740137950000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataField = 'NOMCLI'
          DataSet = frxDBClientE301Tcr
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."NOMCLI"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1VCTORI: TfrxMemoView
          Left = 272.126160000000000000
          Top = 0.779530000000000000
          Width = 71.811070000000000000
          Height = 30.236220470000000000
          ShowHint = False
          DataField = 'VCTORI'
          DataSet = frxDBClientE301Tcr
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."VCTORI"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1VCTPRO: TfrxMemoView
          Left = 445.425480000000000000
          Top = 0.779530000000000000
          Width = 71.811070000000000000
          Height = 30.236220470000000000
          ShowHint = False
          DataField = 'VCTPRO'
          DataSet = frxDBClientE301Tcr
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."VCTPRO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1VLRABE: TfrxMemoView
          Left = 594.354670000000000000
          Top = 0.779530000000000000
          Width = 79.370130000000000000
          Height = 30.236220470000000000
          ShowHint = False
          DataField = 'VLRABE'
          DataSet = frxDBClientE301Tcr
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."VLRABE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1VLRORI: TfrxMemoView
          Left = 349.055350000000000000
          Top = 0.779530000000000000
          Width = 68.031540000000000000
          Height = 30.236220470000000000
          ShowHint = False
          DataField = 'VLRORI'
          DataSet = frxDBClientE301Tcr
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."VLRORI"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1vnQtdDias: TfrxMemoView
          Left = 529.134200000000000000
          Top = 0.779530000000000000
          Width = 56.692950000000000000
          Height = 30.236220470000000000
          ShowHint = False
          DataField = 'vnQtdDias'
          DataSet = frxDBClientE301Tcr
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."vnQtdDias"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 30.236240000000000000
        Top = 102.047310000000000000
        Width = 718.110700000000000000
        object Line1: TfrxLineView
          Top = 26.897650000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Top = 1.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 175.637910000000000000
          Top = 1.000000000000000000
          Width = 86.929133860000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'T'#237'tulo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 272.126160000000000000
          Top = 1.000000000000000000
          Width = 71.811023620000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Vct. Ori.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 349.055350000000000000
          Top = 1.000000000000000000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Vlr. Ori.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 445.425480000000000000
          Top = 1.000000000000000000
          Width = 71.811023620000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Vct. Pro.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 594.354670000000000000
          Top = 1.000000000000000000
          Width = 79.370078740000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Vlr. Aberto')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 529.134200000000000000
          Top = 1.000000000000000000
          Width = 56.692913390000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Dias')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 34.015770000000000000
        Top = 249.448980000000000000
        Width = 718.110700000000000000
        object frxDBDataset1TVlrAbe: TfrxMemoView
          Left = 593.354670000000000000
          Top = 6.779530000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'TVlrAbe'
          DataSet = frxDBClientE301Tcr
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."TVlrAbe"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 540.441250000000000000
          Top = 6.559060000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Total')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBClientE301Tcr: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = DmOra.ClientE301Tcr
    BCDToCurrency = False
    Left = 40
    Top = 144
  end
end
