object frmAPiIBGE: TfrmAPiIBGE
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'APi | IBGE'
  ClientHeight = 476
  ClientWidth = 740
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 76
    Width = 283
    Height = 400
    Align = alClient
    Caption = 'Cidades'
    TabOrder = 0
    ExplicitWidth = 279
    ExplicitHeight = 399
    object MemoCidades: TMemo
      Left = 2
      Top = 15
      Width = 279
      Height = 383
      Align = alClient
      CharCase = ecUpperCase
      ScrollBars = ssVertical
      TabOrder = 0
      ExplicitWidth = 275
      ExplicitHeight = 382
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 740
    Height = 38
    Align = alTop
    Caption = 'Estado'
    TabOrder = 1
    ExplicitWidth = 736
    object edtEstados: TEdit
      Left = 2
      Top = 15
      Width = 736
      Height = 21
      Align = alClient
      TabOrder = 0
      Text = 'edtEstados'
      ExplicitWidth = 732
    end
  end
  object GroupBox3: TGroupBox
    Left = 283
    Top = 76
    Width = 261
    Height = 400
    Align = alRight
    Caption = 'Micro regi'#245'es'
    TabOrder = 2
    ExplicitLeft = 279
    ExplicitHeight = 399
    object MemoMicrorregioes: TMemo
      Left = 2
      Top = 15
      Width = 257
      Height = 383
      Align = alClient
      CharCase = ecUpperCase
      ScrollBars = ssVertical
      TabOrder = 0
      ExplicitHeight = 382
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 38
    Width = 740
    Height = 38
    Align = alTop
    Caption = 'Regi'#227'o'
    TabOrder = 3
    ExplicitWidth = 736
    object edtregioes: TEdit
      Left = 2
      Top = 15
      Width = 736
      Height = 21
      Align = alClient
      TabOrder = 0
      Text = 'edtregioes'
      ExplicitWidth = 732
    end
  end
  object GroupBox5: TGroupBox
    Left = 544
    Top = 76
    Width = 196
    Height = 400
    Align = alRight
    Caption = 'Meso regi'#245'es'
    TabOrder = 4
    ExplicitLeft = 540
    ExplicitHeight = 399
    object MemoMesorregioes: TMemo
      Left = 2
      Top = 15
      Width = 192
      Height = 383
      Align = alClient
      CharCase = ecUpperCase
      ScrollBars = ssVertical
      TabOrder = 0
      ExplicitHeight = 382
    end
  end
end
