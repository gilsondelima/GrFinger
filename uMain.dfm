object formMain: TformMain
  Left = 360
  Top = 119
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'GrFinger - Sample application - Delphi'
  ClientHeight = 518
  ClientWidth = 513
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
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 0
    Width = 404
    Height = 404
  end
  object image: TImage
    Left = 10
    Top = 2
    Width = 399
    Height = 400
    Stretch = True
  end
  object memoLog: TMemo
    Left = 7
    Top = 408
    Width = 498
    Height = 105
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object btEnroll: TButton
    Left = 424
    Top = 152
    Width = 81
    Height = 25
    Caption = 'Enroll'
    Enabled = False
    TabOrder = 1
    OnClick = btEnrollClick
  end
  object btVerify: TButton
    Left = 423
    Top = 184
    Width = 81
    Height = 25
    Caption = 'Verify'
    Enabled = False
    TabOrder = 2
    OnClick = btVerifyClick
  end
  object btIdentify: TButton
    Left = 423
    Top = 216
    Width = 81
    Height = 25
    Caption = 'Identify'
    Enabled = False
    TabOrder = 3
    OnClick = btIdentifyClick
  end
  object btClearDB: TButton
    Left = 423
    Top = 296
    Width = 81
    Height = 25
    Caption = 'Clear database'
    TabOrder = 5
    OnClick = btClearDBClick
  end
  object btClearLog: TButton
    Left = 423
    Top = 328
    Width = 81
    Height = 25
    Caption = 'Clear log'
    TabOrder = 6
    OnClick = btClearLogClick
  end
  object ckBoxAutoIdentify: TCheckBox
    Left = 424
    Top = 360
    Width = 81
    Height = 17
    Caption = 'Auto identify'
    TabOrder = 7
  end
  object ckAutoExtract: TCheckBox
    Left = 423
    Top = 384
    Width = 81
    Height = 17
    Caption = 'Auto Extract'
    Checked = True
    State = cbChecked
    TabOrder = 8
  end
  object btExtract: TButton
    Left = 423
    Top = 248
    Width = 81
    Height = 25
    Caption = 'Extract template'
    Enabled = False
    TabOrder = 4
    OnClick = btExtractClick
  end
  object MainMenu: TMainMenu
    Left = 472
    object mnImage: TMenuItem
      Caption = '&Image'
      object mnImageSave: TMenuItem
        Caption = '&Save...'
        ShortCut = 16467
        OnClick = mnImageSaveClick
      end
      object mnImageLoad: TMenuItem
        Caption = '&Load...'
        ShortCut = 16460
        OnClick = mnImageLoadClick
      end
    end
    object mnOptions: TMenuItem
      Caption = '&Options...'
      ShortCut = 16463
      OnClick = mnOptionsClick
    end
    object mnVersion: TMenuItem
      Caption = '&Version'
      OnClick = mnVersionClick
    end
  end
  object OpenPictureDialog: TOpenPictureDialog
    Left = 440
    Top = 16
  end
  object SavePictureDialog: TSavePictureDialog
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Left = 440
    Top = 48
  end
end
