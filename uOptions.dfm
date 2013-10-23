object formOptions: TformOptions
  Left = 753
  Top = 464
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Options'
  ClientHeight = 392
  ClientWidth = 375
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    000001000200101010000000000028010000260000002020100000000000E802
    00004E0100002800000010000000200000000100040000000000800000000000
    0000000000001000000010000000000000000000800000800000008080008000
    0000800080008080000080808000C0C0C0000000FF0000FF000000FFFF00FF00
    0000FF00FF00FFFF0000FFFFFF00444444444444444448888888888888844800
    00FFFFFFFF844800FFFFFFFFFF844888888888888884488888888888888448F0
    FF00F0F87784480FF0FF0F08778448FF0F00F0F8888448F0F0F0F0F87784480F
    F00F0F08888448FF0FF0F0F8888448F0FF0F0FF8888448888888888888844444
    444444444444444444444444C494000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000280000002000000040000000010004000000
    0000000200000000000000000000100000001000000000000000000080000080
    00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
    000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0044444444444444444444
    4444444444444888888888888888888888888888888448F0000000FFFFFFFFFF
    FFFFFFFF778448FFFFFFFFFFFFFFFFFFFFFFFFFF778448F00000000FFFFFFFFF
    FFFFFFFF778448FFFFFFFFFFFFFFFFFFFFFFFFFF778448F00000FFFFFFFFFFFF
    FFFFFFFF778448FFFFFFFFFFFFFFFFFFFFFFFFFF778448888888888888888888
    88888888888448777777777777777777778F80000084487FF0FF00FF0F00FFF0
    F7888888888448700FF0FFF0FF0FFF0FF78777777784487FFF0FFF0FF0F0F00F
    F78777777784487FF0FFF0FF0FF0F0FFF7888888888448700FFF0FF00F0FF0FF
    F78777777784487F0FF0FF0F0F0FF0FF078777777784487F0FF0FF000F0FF0F0
    F78888888884487FF0FF0FF0FF0F0FF0F787777777844870F0FFF0FFF0FF0F00
    F787777777844870FF0FF0FF0FF0FF0FF78888888884487F0FF0FF00FFF0F0FF
    078888888884487F0FFF00FFFF0FF0F0F78888888884487FF0FFFF0000FF0FF0
    F78888888884487FFF0FFFFFFFF0FF0FF788888888844870FFF00000000FFF0F
    078888888884487F0FFFFFFFFFFF00FF07888888888448777777777777777777
    7788888888844888888888888888888888888888888444444444444444444444
    44444444444444F44F4F4F4444444444444CC4CC49944FFFF4F4F44444444444
    444CC4CC49944444444444444444444444444444444400000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    00000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 177
    Height = 81
    Caption = 'Identify'
    TabOrder = 0
    object Label1: TLabel
      Left = 56
      Top = 20
      Width = 50
      Height = 13
      Caption = 'Threshold:'
    end
    object Label2: TLabel
      Left = 16
      Top = 51
      Width = 90
      Height = 13
      Caption = 'Rotation tolerance:'
    end
    object editIdentThres: TEdit
      Left = 112
      Top = 16
      Width = 57
      Height = 21
      TabOrder = 0
    end
    object editIdentRotTol: TEdit
      Left = 112
      Top = 48
      Width = 57
      Height = 21
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 192
    Top = 8
    Width = 177
    Height = 81
    Caption = 'Verify'
    TabOrder = 1
    object Label3: TLabel
      Left = 56
      Top = 19
      Width = 50
      Height = 13
      Caption = 'Threshold:'
    end
    object Label4: TLabel
      Left = 16
      Top = 51
      Width = 90
      Height = 13
      Caption = 'Rotation tolerance:'
    end
    object editVerifyThres: TEdit
      Left = 112
      Top = 16
      Width = 57
      Height = 21
      TabOrder = 0
    end
    object editVerifyRotTol: TEdit
      Left = 112
      Top = 48
      Width = 57
      Height = 21
      TabOrder = 1
    end
  end
  object btOk: TButton
    Left = 112
    Top = 360
    Width = 65
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 2
    OnClick = btOkClick
  end
  object btCancel: TButton
    Left = 192
    Top = 360
    Width = 65
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = btCancelClick
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 96
    Width = 361
    Height = 81
    Caption = 'Minutiae Colors'
    TabOrder = 4
    object Label5: TLabel
      Left = 16
      Top = 28
      Width = 40
      Height = 13
      Caption = 'Regular:'
    end
    object Label6: TLabel
      Left = 16
      Top = 52
      Width = 33
      Height = 13
      Caption = 'Match:'
    end
    object shMinutiaeColor: TShape
      Left = 64
      Top = 24
      Width = 73
      Height = 17
      Brush.Color = clBlue
      OnMouseDown = shMinutiaeColorMouseDown
    end
    object shMinutiaeColorMatched: TShape
      Left = 64
      Top = 48
      Width = 73
      Height = 17
      Brush.Color = clPurple
      OnMouseDown = shMinutiaeColorMatchedMouseDown
    end
    object Label11: TLabel
      Left = 224
      Top = 32
      Width = 118
      Height = 26
      Caption = 'Double click the color to change it.'
      WordWrap = True
    end
    object cbShowMinutiaeReg: TCheckBox
      Left = 144
      Top = 24
      Width = 57
      Height = 17
      Caption = 'Show'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object cbShowMinutiaeMatch: TCheckBox
      Left = 144
      Top = 48
      Width = 57
      Height = 17
      Caption = 'Show'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
  end
  object GroupBox4: TGroupBox
    Left = 6
    Top = 184
    Width = 361
    Height = 81
    Caption = 'Segments Colors'
    TabOrder = 5
    object Label7: TLabel
      Left = 16
      Top = 28
      Width = 40
      Height = 13
      Caption = 'Regular:'
    end
    object Label8: TLabel
      Left = 16
      Top = 52
      Width = 33
      Height = 13
      Caption = 'Match:'
    end
    object shSegmentColor: TShape
      Left = 64
      Top = 24
      Width = 73
      Height = 17
      Brush.Color = clLime
      OnMouseDown = shSegmentColorMouseDown
    end
    object shSegmentColorMatched: TShape
      Left = 64
      Top = 48
      Width = 73
      Height = 17
      Brush.Color = clPurple
      OnMouseDown = shSegmentColorMatchedMouseDown
    end
    object Label9: TLabel
      Left = 224
      Top = 32
      Width = 118
      Height = 26
      Caption = 'Double click the color to change it.'
      WordWrap = True
    end
    object cbShowSegmentReg: TCheckBox
      Left = 144
      Top = 24
      Width = 57
      Height = 17
      Caption = 'Show'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object cbShowSegmentMatch: TCheckBox
      Left = 144
      Top = 48
      Width = 57
      Height = 17
      Caption = 'Show'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
  end
  object GroupBox5: TGroupBox
    Left = 6
    Top = 272
    Width = 361
    Height = 81
    Caption = 'Minutiae Direction Colors'
    TabOrder = 6
    object Label10: TLabel
      Left = 16
      Top = 28
      Width = 40
      Height = 13
      Caption = 'Regular:'
    end
    object Label12: TLabel
      Left = 16
      Top = 52
      Width = 33
      Height = 13
      Caption = 'Match:'
    end
    object shDirectionColor: TShape
      Left = 64
      Top = 24
      Width = 73
      Height = 17
      Brush.Color = clRed
      OnMouseDown = shDirectionColorMouseDown
    end
    object shDirectionColorMatched: TShape
      Left = 64
      Top = 48
      Width = 73
      Height = 17
      Brush.Color = clPurple
      OnMouseDown = shDirectionColorMatchedMouseDown
    end
    object Label13: TLabel
      Left = 224
      Top = 32
      Width = 118
      Height = 26
      Caption = 'Double click the color to change it.'
      WordWrap = True
    end
    object cbShowDirectionReg: TCheckBox
      Left = 144
      Top = 24
      Width = 57
      Height = 17
      Caption = 'Show'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object cbShowDirectionMatch: TCheckBox
      Left = 144
      Top = 48
      Width = 57
      Height = 17
      Caption = 'Show'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
  end
  object ColorDialog1: TColorDialog
    Ctl3D = True
    Left = 304
    Top = 368
  end
end
