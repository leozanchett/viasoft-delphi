object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 381
  ClientWidth = 330
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblNumeroConexoes: TLabel
    Left = 79
    Top = 8
    Width = 159
    Height = 23
    Margins.Left = 50
    Caption = 'Limite de conex'#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    Visible = False
  end
  object con1: TLabeledEdit
    Left = 8
    Top = 318
    Width = 121
    Height = 21
    EditLabel.Width = 57
    EditLabel.Height = 13
    EditLabel.Caption = 'Conection 1'
    NumbersOnly = True
    TabOrder = 0
    Visible = False
    OnChange = con1Change
  end
  object con2: TLabeledEdit
    Left = 8
    Top = 354
    Width = 121
    Height = 21
    EditLabel.Width = 57
    EditLabel.Height = 13
    EditLabel.Caption = 'Conection 2'
    NumbersOnly = True
    TabOrder = 1
    Visible = False
    OnChange = con2Change
  end
  object conectLimit: TLabeledEdit
    Left = 72
    Top = 318
    Width = 153
    Height = 21
    EditLabel.Width = 150
    EditLabel.Height = 13
    EditLabel.Caption = 'Informe o n'#250'mero de conex'#245'es'
    NumbersOnly = True
    TabOrder = 2
    OnChange = conectLimitChange
  end
  object btnConexoes: TButton
    Left = 111
    Top = 350
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    Enabled = False
    TabOrder = 3
    OnClick = btnConexoesClick
  end
  object mPainelConexoes: TMemo
    Left = 8
    Top = 40
    Width = 315
    Height = 257
    TabOrder = 4
  end
  object btnQueryConexoes: TButton
    Left = 176
    Top = 350
    Width = 147
    Height = 25
    Caption = 'Verificiar conex'#245'es existentes'
    Enabled = False
    TabOrder = 5
    Visible = False
    OnClick = btnQueryConexoesClick
  end
end
