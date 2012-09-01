object Main: TMain
  Left = 450
  Top = 164
  Width = 1142
  Height = 644
  Caption = 'Cryptolytiker'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    1134
    591)
  PixelsPerInch = 96
  TextHeight = 13
  object LeftMenu: TTreeView
    Left = 0
    Top = 0
    Width = 273
    Height = 581
    Anchors = [akLeft, akTop, akBottom]
    Images = ImageList1
    Indent = 19
    TabOrder = 0
    OnClick = LeftMenuClick
    Items.Data = {
      03000000230000000300000003000000FFFFFFFFFFFFFFFF0000000000000000
      0A57696C6C6B6F6D6D656E3B0000000000000000000000FFFFFFFFFFFFFFFF00
      0000000100000022416B7475656C6C65205665727363686CFC7373656C756E67
      7376657266616872656E340000000100000001000000FFFFFFFFFFFFFFFF0000
      0000030000001B586F72205665727363686CFC7373656C756E6773746563686E
      696B2E0000000200000002000000FFFFFFFFFFFFFFFF00000000000000001558
      6F7220456E742F5665727363686CFC7373656C6E270000000300000003000000
      FFFFFFFFFFFFFFFF00000000000000000E586F72204765736368696368746526
      0000000400000004000000FFFFFFFFFFFFFFFF00000000000000000D586F7220
      56657273746568656E370000000000000000000000FFFFFFFFFFFFFFFF000000
      00030000001E416C7465205665727363686CFC7373656C756E67737665726661
      6872656E280000000100000001000000FFFFFFFFFFFFFFFF0000000002000000
      0F43E47361722053636869666672656E380000000100000001000000FFFFFFFF
      FFFFFFFF00000000040000001F56617269616E74652031202847656865696D74
      657874616C70686162657429350000000200000002000000FFFFFFFFFFFFFFFF
      00000000000000001C56617269616E7465203120456E742F5665727363686CFC
      7373656C6E2B0000000200000002000000FFFFFFFFFFFFFFFF00000000000000
      001256617269616E7465203120437261636B656E2E0000000300000003000000
      FFFFFFFFFFFFFFFF00000000000000001556617269616E746520312047657363
      6869636874652D0000000400000004000000FFFFFFFFFFFFFFFF000000000000
      00001456617269616E746520312056657273746568656E310000000100000001
      000000FFFFFFFFFFFFFFFF00000000040000001856617269616E746520322028
      566572736368696562656E29350000000200000002000000FFFFFFFFFFFFFFFF
      00000000000000001C56617269616E7465203220456E742F5665727363686CFC
      7373656C6E2B0000000200000002000000FFFFFFFFFFFFFFFF00000000000000
      001256617269616E7465203220437261636B656E2E0000000300000003000000
      FFFFFFFFFFFFFFFF00000000000000001556617269616E746520322047657363
      6869636874652D0000000400000004000000FFFFFFFFFFFFFFFF000000000000
      00001456617269616E746520322056657273746568656E310000000100000001
      000000FFFFFFFFFFFFFFFF000000000300000018566967656EE872652D566572
      7363686CFC7373656C756E67330000000200000002000000FFFFFFFFFFFFFFFF
      00000000000000001A566967656EE8726520456E742F5665727363686CFC7373
      656C6E2C0000000300000003000000FFFFFFFFFFFFFFFF000000000000000013
      566967656EE8726520476573636869636874652B0000000400000004000000FF
      FFFFFFFFFFFFFF000000000000000012566967656EE872652056657273746568
      656E1F0000000100000001000000FFFFFFFFFFFFFFFF00000000030000000645
      6E69676D61310000000200000002000000FFFFFFFFFFFFFFFF00000000000000
      0018456E69676D6120456E742F5665727363686CFC7373656C6E2A0000000300
      000003000000FFFFFFFFFFFFFFFF000000000000000011456E69676D61204765
      7363686963687465290000000400000004000000FFFFFFFFFFFFFFFF00000000
      0000000010456E69676D612056657273746568656E}
  end
  object MainControl: TPageControl
    Left = 280
    Top = 0
    Width = 849
    Height = 581
    ActivePage = WebTab
    Anchors = [akLeft, akTop, akRight, akBottom]
    Images = ImageList1
    TabOrder = 1
    object XorPage: TTabSheet
      Caption = 'Xor Ent/Verschl'#252'sseln'
      ImageIndex = -1
      DesignSize = (
        841
        552)
      object Label3: TLabel
        Left = 8
        Top = 168
        Width = 32
        Height = 13
        Caption = 'Output'
      end
      object Label4: TLabel
        Left = 8
        Top = 40
        Width = 24
        Height = 13
        Caption = 'Input'
      end
      object Zahl: TLabel
        Left = 8
        Top = 16
        Width = 21
        Height = 13
        Caption = 'Zahl'
      end
      object XorOutput: TMemo
        Left = 8
        Top = 184
        Width = 825
        Height = 89
        Anchors = [akLeft, akTop, akRight]
        Color = clWhite
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object XorInput: TMemo
        Left = 8
        Top = 56
        Width = 825
        Height = 89
        Anchors = [akLeft, akTop, akRight]
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object Button2: TButton
        Left = 8
        Top = 280
        Width = 75
        Height = 25
        Caption = 'Starten'
        TabOrder = 2
        OnClick = Button2Click
      end
      object XorOperationKey: TEdit
        Left = 40
        Top = 16
        Width = 121
        Height = 21
        TabOrder = 3
        Text = '-10'
      end
    end
    object WebTab: TTabSheet
      Caption = 'Webbrowser - '
      ImageIndex = -1
      OnHide = WebTabHide
      OnShow = WebTabShow
      DesignSize = (
        841
        552)
      object WebBrowser: TWebBrowser
        Left = 0
        Top = 0
        Width = 841
        Height = 552
        Align = alClient
        TabOrder = 0
        ControlData = {
          4C000000EB5600000D3900000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
      object WebEdit: TRichEdit
        Left = 0
        Top = 0
        Width = 841
        Height = 514
        Anchors = [akLeft, akTop, akRight, akBottom]
        Lines.Strings = (
          'WebEdit')
        ScrollBars = ssVertical
        TabOrder = 1
        Visible = False
      end
      object WeEditSave: TButton
        Left = 760
        Top = 521
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Speichern'
        TabOrder = 2
        Visible = False
        OnClick = WeEditSaveClick
      end
      object WeEditRev: TButton
        Left = 672
        Top = 521
        Width = 83
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'R'#252'ckg'#228'ngig'
        TabOrder = 3
        Visible = False
        OnClick = WeEditRevClick
      end
    end
    object Ccrypt1: TTabSheet
      Caption = 'C'#228'sar - Variante 1 - Ent/Verschl'#252'sseln'
      ImageIndex = -1
      DesignSize = (
        841
        552)
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 24
        Height = 13
        Caption = 'Input'
      end
      object Label2: TLabel
        Left = 8
        Top = 144
        Width = 32
        Height = 13
        Caption = 'Output'
      end
      object Cinput: TMemo
        Left = 8
        Top = 32
        Width = 825
        Height = 89
        Anchors = [akLeft, akTop, akRight]
        Lines.Strings = (
          'Cinput')
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object COutput: TMemo
        Left = 8
        Top = 160
        Width = 825
        Height = 89
        Anchors = [akLeft, akTop, akRight]
        Color = clWhite
        Lines.Strings = (
          'Memo1')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object Button1: TButton
        Left = 160
        Top = 272
        Width = 75
        Height = 25
        Caption = 'Starten'
        TabOrder = 2
        OnClick = Button1Click
      end
      object Cchoosebox: TComboBox
        Left = 8
        Top = 272
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 3
        Text = 'Verschl'#252'sseln'
        Items.Strings = (
          'Verschl'#252'sseln'
          'Entschl'#252'sseln')
      end
      object CAlphaList: TValueListEditor
        Left = 536
        Top = 272
        Width = 297
        Height = 196
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 4
        TitleCaptions.Strings = (
          'Alphabet'
          'Geheimtextalphabet')
        ColWidths = (
          150
          141)
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'C'#228'sar - Variante 2 - Ent/Verschl'#252'sseln'
      ImageIndex = 3
      DesignSize = (
        841
        552)
      object Label5: TLabel
        Left = 8
        Top = 16
        Width = 51
        Height = 13
        Caption = 'Buchstabe'
      end
      object Label6: TLabel
        Left = 8
        Top = 168
        Width = 32
        Height = 13
        Caption = 'Output'
      end
      object Label7: TLabel
        Left = 8
        Top = 40
        Width = 24
        Height = 13
        Caption = 'Input'
      end
      object CCInput2: TMemo
        Left = 8
        Top = 56
        Width = 825
        Height = 89
        Anchors = [akLeft, akTop, akRight]
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object CCOutput2: TMemo
        Left = 8
        Top = 184
        Width = 825
        Height = 89
        Anchors = [akLeft, akTop, akRight]
        Color = clWhite
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object Button3: TButton
        Left = 160
        Top = 280
        Width = 75
        Height = 25
        Caption = 'Starten'
        TabOrder = 2
        OnClick = Button3Click
      end
      object CChossebox2: TComboBox
        Left = 8
        Top = 280
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 3
        Text = 'Verschl'#252'sseln'
        Items.Strings = (
          'Verschl'#252'sseln'
          'Entschl'#252'sseln')
      end
      object CCKey: TComboBox
        Left = 64
        Top = 16
        Width = 81
        Height = 21
        ItemHeight = 0
        TabOrder = 4
        Text = 'A'
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'C'#228'sar - Variante 2 - Cracken'
      ImageIndex = 4
      DesignSize = (
        841
        552)
      object Label8: TLabel
        Left = 8
        Top = 168
        Width = 32
        Height = 13
        Caption = 'Output'
      end
      object Label9: TLabel
        Left = 8
        Top = 40
        Width = 24
        Height = 13
        Caption = 'Input'
      end
      object CCOutput3: TMemo
        Left = 8
        Top = 184
        Width = 825
        Height = 89
        Anchors = [akLeft, akTop, akRight]
        Color = clWhite
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object CCInput3: TMemo
        Left = 8
        Top = 56
        Width = 825
        Height = 89
        Anchors = [akLeft, akTop, akRight]
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object Button4: TButton
        Left = 8
        Top = 280
        Width = 75
        Height = 25
        Caption = 'Starten'
        TabOrder = 2
        OnClick = Button4Click
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 5
      DesignSize = (
        841
        552)
      object Label10: TLabel
        Left = 8
        Top = 16
        Width = 43
        Height = 13
        Caption = 'Passwort'
      end
      object Label11: TLabel
        Left = 8
        Top = 40
        Width = 24
        Height = 13
        Caption = 'Input'
      end
      object Label12: TLabel
        Left = 8
        Top = 168
        Width = 32
        Height = 13
        Caption = 'Output'
      end
      object VInput: TMemo
        Left = 8
        Top = 56
        Width = 825
        Height = 89
        Anchors = [akLeft, akTop, akRight]
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object VOutput: TMemo
        Left = 8
        Top = 184
        Width = 825
        Height = 89
        Anchors = [akLeft, akTop, akRight]
        Color = clWhite
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object VChoosebox: TComboBox
        Left = 8
        Top = 280
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 2
        Text = 'Verschl'#252'sseln'
        Items.Strings = (
          'Verschl'#252'sseln'
          'Entschl'#252'sseln')
      end
      object Vkey: TEdit
        Left = 64
        Top = 16
        Width = 121
        Height = 21
        TabOrder = 3
      end
      object Button5: TButton
        Left = 160
        Top = 280
        Width = 75
        Height = 25
        Caption = 'Starten'
        TabOrder = 4
        OnClick = Button5Click
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'TabSheet4'
      ImageIndex = 6
      DesignSize = (
        841
        552)
      object Start: TSpeedButton
        Left = 16
        Top = 232
        Width = 33
        Height = 33
        Cursor = crHandPoint
        Hint = 'Maschinenstart'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          500055555555555550E055555555555000E0555555555550E6E0555555555000
          6E055555555500E6E055555555550E6E05555800050006E0555580EEE00E6E05
          55550EEEEEE6E05555550EEEEEEE055555550EE006EE0855555588E006EEE055
          555550EE66EEE05555555508EEEE085555555558000085555555}
        Layout = blGlyphTop
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = StartClick
      end
      object Label13: TLabel
        Left = 14
        Top = 88
        Width = 59
        Height = 16
        Caption = 'Eingabe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 577
        Top = 88
        Width = 63
        Height = 16
        Caption = 'Ausgabe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Reset: TSpeedButton
        Left = 532
        Top = 232
        Width = 33
        Height = 33
        Cursor = crHandPoint
        Hint = 'Reset'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
          3333333777333777FF33339993707399933333773337F3777FF3399933000339
          9933377333777F3377F3399333707333993337733337333337FF993333333333
          399377F33333F333377F993333303333399377F33337FF333373993333707333
          333377F333777F333333993333101333333377F333777F3FFFFF993333000399
          999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
          99933773FF777F3F777F339993707399999333773F373F77777F333999999999
          3393333777333777337333333999993333333333377777333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = ResetClick
      end
      object Coden: TSpeedButton
        Left = 530
        Top = 280
        Width = 33
        Height = 33
        Cursor = crHandPoint
        Hint = 'Nachricht verarbeiten'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          76020000424D7602000000000000760000002800000020000000200000000100
          0400000000000002000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00BBBBBBBBBBBB
          BBBBBBBBBBBBBBBBBBBBBB000BBBBBBBBBBBBBBBBBBBBBBBBBBBB0BBB0000000
          000000BBBBBBBBBBBBBB0BB0BBBBBBBBBBBBB0BBBBBBBBBBBB0B0B0B0B000000
          BBB000BBBBBBBBB0000B0BB0BB0BBBB0B0B0BBBBBB00000BB00BB0BBB0BBBBB0
          B0B0BBBB00B00BBBB00BBB000BBBBBB00B00BBB0BB0BBBBBB00BBBBBBBBBBBBB
          B000BBB000BBBBBBB00BBBBBBBBBBBBBBBBBBBB0BBBBBBBBB00BBBBBBBBBBBBB
          BBBBBB0BB0000BBB000BBBBBBBBBBBBBBBBBBB0B0000BBB0BBBBBBBBBBBBBB00
          0000BB00000BBB0BBBBBBBBBBBBB00000000000000BBB0BBBBBBBBBBBB0000BB
          BBB0000000000BBBBBBBBBBBBB00BBBBBBBBB000BBBBBBBBBBBBBBBBB00BBBBB
          BBBBBB00BBBBBBBBBBBBBBBBB00BBBBBBBBBBB000BBBBBBBBBBBBBBB00BBBBBB
          BBBBBBB00BB0000000BBBBBB00BBBBBBBBBBBBB00BB00BBB00BBBBBB00BBBBBB
          0BBBBBB00BB000B000BBBBBB00BBBBBBB0BBBBB00BB000B000BBBBBB00BBBBB0
          BB0BBBB00BB0000000BBBBBBB00BBBBB0BBBBB00BBB0000000BBBBBBB00BBBBB
          B0BBBB00BBB0000000BBBBBBBB00BBBBBBBBB00BBBBB0BBB0BBBBBBBBB0000BB
          BBB0000BBBBB0BBB0BBBBBBBBBBB000000000BBBBBBB00B00BBBBBBBBBBBB000
          000BBBBBBBBB00000BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
          BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB}
        Layout = blGlyphTop
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Transparent = False
        OnClick = CodenClick
      end
      object Walzenlage: TLabeledEdit
        Left = 101
        Top = 16
        Width = 41
        Height = 24
        Cursor = crHandPoint
        Hint = 'Rotorennummern (1-5)'
        EditLabel.Width = 83
        EditLabel.Height = 16
        EditLabel.Caption = 'Walzenlage'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        LabelPosition = lpLeft
        MaxLength = 3
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Text = '123'
        OnKeyPress = WalzenlageKeyPress
      end
      object Ringe: TLabeledEdit
        Left = 241
        Top = 16
        Width = 41
        Height = 24
        Cursor = crHandPoint
        Hint = 'Verschiebung der "A" - Markierung'
        CharCase = ecUpperCase
        EditLabel.Width = 87
        EditLabel.Height = 16
        EditLabel.Caption = 'Ringstellung'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        LabelPosition = lpLeft
        MaxLength = 3
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Text = 'AAA'
        OnKeyPress = RingeKeyPress
      end
      object Stecker: TLabeledEdit
        Left = 88
        Top = 56
        Width = 209
        Height = 24
        Cursor = crHandPoint
        Hint = 'Vertauschungen definieren'
        EditLabel.Width = 71
        EditLabel.Height = 16
        EditLabel.Caption = 'Steckbrett'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        LabelPosition = lpLeft
        MaxLength = 20
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnKeyPress = SteckerKeyPress
      end
      object Grund: TLabeledEdit
        Left = 391
        Top = 16
        Width = 41
        Height = 24
        Cursor = crHandPoint
        Hint = 'Startposition der Rotoren'
        CharCase = ecUpperCase
        EditLabel.Width = 96
        EditLabel.Height = 16
        EditLabel.Caption = 'Grundstellung'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        LabelPosition = lpLeft
        MaxLength = 3
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Text = 'HDX'
        OnKeyPress = GrundKeyPress
      end
      object Button6: TButton
        Left = 115
        Top = 265
        Width = 20
        Height = 20
        Cursor = crHandPoint
        Caption = 'A'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = Button6Click
      end
      object Button7: TButton
        Left = 250
        Top = 291
        Width = 20
        Height = 20
        Cursor = crHandPoint
        Caption = 'B'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnClick = Button7Click
      end
      object Button8: TButton
        Left = 235
        Top = 265
        Width = 20
        Height = 20
        Cursor = crHandPoint
        Caption = 'G'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        OnClick = Button8Click
      end
      object Button9: TButton
        Left = 205
        Top = 265
        Width = 20
        Height = 20
        Cursor = crHandPoint
        Caption = 'F'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        OnClick = Button9Click
      end
      object Button10: TButton
        Left = 265
        Top = 265
        Width = 20
        Height = 20
        Cursor = crHandPoint
        Caption = 'H'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        OnClick = Button10Click
      end
      object Button11: TButton
        Left = 295
        Top = 265
        Width = 20
        Height = 20
        Cursor = crHandPoint
        Caption = 'J'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        OnClick = Button11Click
      end
      object Button12: TButton
        Left = 190
        Top = 291
        Width = 20
        Height = 20
        Cursor = crHandPoint
        Caption = 'C'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 10
        OnClick = Button12Click
      end
      object Button13: TButton
        Left = 175
        Top = 265
        Width = 20
        Height = 20
        Cursor = crHandPoint
        Caption = 'D'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 11
        OnClick = Button13Click
      end
      object Button14: TButton
        Left = 160
        Top = 240
        Width = 20
        Height = 20
        Cursor = crHandPoint
        Caption = 'E'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 12
        OnClick = Button14Click
      end
      object Button15: TButton
        Left = 310
        Top = 240
        Width = 20
        Height = 20
        Cursor = crHandPoint
        Caption = 'I'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 13
        OnClick = Button15Click
      end
      object Button16: TButton
        Left = 325
        Top = 265
        Width = 20
        Height = 20
        Cursor = crHandPoint
        Caption = 'K'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 14
        OnClick = Button16Click
      end
      object Button17: TButton
        Left = 340
        Top = 291
        Width = 20
        Height = 20
        Cursor = crHandPoint
        Caption = 'L'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 15
        OnClick = Button17Click
      end
      object Button18: TButton
        Left = 100
        Top = 240
        Width = 20
        Height = 20
        Cursor = crHandPoint
        Caption = 'Q'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 16
        OnClick = Button18Click
      end
      object Button19: TButton
        Left = 100
        Top = 291
        Width = 20
        Height = 20
        Cursor = crHandPoint
        Caption = 'P'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 17
        OnClick = Button19Click
      end
      object Button20: TButton
        Left = 190
        Top = 240
        Width = 20
        Height = 20
        Cursor = crHandPoint
        Caption = 'R'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 18
        OnClick = Button20Click
      end
      object Button21: TButton
        Left = 220
        Top = 240
        Width = 20
        Height = 20
        Cursor = crHandPoint
        Caption = 'T'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 19
        OnClick = Button21Click
      end
      object Button22: TButton
        Left = 310
        Top = 291
        Width = 20
        Height = 20
        Cursor = crHandPoint
        Caption = 'M'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 20
        OnClick = Button22Click
      end
      object Button23: TButton
        Left = 280
        Top = 291
        Width = 20
        Height = 20
        Cursor = crHandPoint
        Caption = 'N'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 21
        OnClick = Button23Click
      end
      object Button24: TButton
        Left = 340
        Top = 240
        Width = 20
        Height = 20
        Cursor = crHandPoint
        Caption = 'O'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 22
        OnClick = Button24Click
      end
      object Button25: TButton
        Left = 145
        Top = 265
        Width = 20
        Height = 20
        Cursor = crHandPoint
        Caption = 'S'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 23
        OnClick = Button25Click
      end
      object Button26: TButton
        Left = 280
        Top = 240
        Width = 20
        Height = 20
        Cursor = crHandPoint
        Caption = 'U'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 24
        OnClick = Button26Click
      end
      object Button27: TButton
        Left = 220
        Top = 291
        Width = 20
        Height = 20
        Cursor = crHandPoint
        Caption = 'V'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 25
        OnClick = Button27Click
      end
      object Button28: TButton
        Left = 250
        Top = 240
        Width = 20
        Height = 20
        Cursor = crHandPoint
        Caption = 'Z'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 26
        OnClick = Button28Click
      end
      object Button29: TButton
        Left = 130
        Top = 240
        Width = 20
        Height = 20
        Cursor = crHandPoint
        Caption = 'W'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 27
        OnClick = Button29Click
      end
      object Button30: TButton
        Left = 160
        Top = 291
        Width = 20
        Height = 20
        Cursor = crHandPoint
        Caption = 'X'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 28
        OnClick = Button30Click
      end
      object Button31: TButton
        Left = 130
        Top = 291
        Width = 20
        Height = 20
        Cursor = crHandPoint
        Caption = 'Y'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 29
        OnClick = Button31Click
      end
      object Ende: TBitBtn
        Left = 16
        Top = 280
        Width = 33
        Height = 33
        Cursor = crHandPoint
        Hint = 'stoppt die Enigma'
        Cancel = True
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 30
        OnClick = EndeClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object ReflektorWahl: TRadioGroup
        Left = 448
        Top = 10
        Width = 113
        Height = 65
        Cursor = crHandPoint
        Hint = 'Umkehrwalze'
        Caption = 'Reflektorwahl'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemIndex = 0
        Items.Strings = (
          'Reflektor B'
          'Reflektor C')
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 31
      end
      object Eingabe: TMemo
        Left = 16
        Top = 109
        Width = 553
        Height = 110
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 32
      end
      object Ausgabe: TMemo
        Left = 576
        Top = 109
        Width = 260
        Height = 110
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 33
      end
      object RotorAnzeige: TRichEdit
        Left = 16
        Top = 322
        Width = 817
        Height = 230
        Hint = 'Codiervorgang der Enigma'
        Anchors = [akLeft, akTop, akRight]
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 34
      end
      object RotorenAnzeige: TCheckBox
        Left = 312
        Top = 45
        Width = 121
        Height = 20
        Cursor = crHandPoint
        Hint = 'Anzeige der Rotoren'
        Caption = 'Rotorenanzeige'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 35
        OnClick = RotorenAnzeigeClick
      end
      object Block: TCheckBox
        Left = 312
        Top = 67
        Width = 97
        Height = 20
        Cursor = crHandPoint
        Hint = 'Nachricht in 5-er Bl'#246'cken anzeigen'
        Caption = '5-er Bl'#246'cke'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 36
        OnClick = BlockClick
      end
      object ERO: TCheckBox
        Left = 80
        Top = 88
        Width = 97
        Height = 16
        Cursor = crHandPoint
        Hint = 'Nachricht in 5-er Bl'#246'cken anzeigen'
        Caption = 'ReadOnly'
        Checked = True
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 37
        OnClick = EROClick
      end
      object Einstellung: TRadioGroup
        Left = 390
        Top = 232
        Width = 120
        Height = 80
        Cursor = crHandPoint
        Hint = 'Voreinstellungsm'#246'glichkeiten'
        Caption = 'Voreinstellung'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Items.Strings = (
          'enigmaco'
          'wikipedia'
          'normal')
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 38
        OnClick = EinstellungClick
      end
    end
  end
  object XPManifest1: TXPManifest
    Left = 1096
    Top = 16
  end
  object ImageList1: TImageList
    Left = 1064
    Top = 16
    Bitmap = {
      494C010109000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00F4DCC900F4DC
      C900FEFBF800FEFBF800FEFBF800FEFBF800FEFBF800FEFBF800FEFBF800FEFB
      F800F4DCC900F4DCC900FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00F4DCC900E9AA
      8000FEFBF800FEFBF800FEFBF800FEFBF800FEFBF800FEFBF800FEFBF800FEFB
      F800CA8D6500F4DCC900FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00F4DCC900E9AA
      8000FEFBF800FEFBF800FEFBF800FEFBF800FEFBF800FEFBF800FEFBF800FEFB
      F800CA8D6500F4DCC900FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00F4DCC900E9AA
      8000FEFBF800FEFBF800FEFBF800FEFBF800FEFBF800FEFBF800FEFBF800FEFB
      F800CA8D6500F4DCC900FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00F4DCC900E9AA
      8000E2A47B00E2A47B00E2A47B00E2A47B00E2A47B00D6997000D6997000CA8D
      6500CA8D6500F4DCC900FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00F4DCC900E9AA
      8000E9AA8000E2A47B00E2A47B00E2A47B00E2A47B00E2A47B00D6997000D699
      7000CA8D6500F4DCC900FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00F4DCC900E9AA
      8000E9AA8000E2A47B00E2A47B00E2A47B00E2A47B00E2A47B00D6997000D699
      7000CA8D6500F4DCC900FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00F4DCC900E9AA
      8000E9AA8000E2A47B00E2A47B00E2A47B00E2A47B00E2A47B00E2A47B00D699
      7000CA8D6500F4DCC900FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00F4DCC900E9AA
      8000F9ECE100F9ECE100F9ECE100F9ECE100F9ECE100F9ECE100F9ECE100D699
      7000CA8D6500F4DCC900FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00F4DCC900E9AA
      8000FEFAF600C98D6600FEFAF600FBF1EA00FAF0E800F6E5D800F6E5D800D699
      7000CA8D6500F4DCC900FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00F4DCC900E9AA
      8000FEFAF600C98D6600FBF1EA00FEFAF600FBF1EA00FAF0E800F6E5D800D699
      7000F4DCC900FEFEFE00FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00F4DCC900F4DC
      C900FEFAF600FEFAF600FEFAF600FEFAF600FEFAF600FEFAF600F6E5D800F4DC
      C900FEFEFE00FEFEFE00FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FCFCFC00F6F6F600F6F6
      F600F6F6F600E6E6E600ECECEC00F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600F6F6F600FCFCFC00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00F0F0F000FAFA
      FA00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00F2F2F2008C8C8C008989
      890087919800218ECA0034668000686868008787870089898900898989008989
      89008A8A8A00C4C4C400FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00F6F8FC00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FCFC
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00F4F4F400ECEC
      EC00E6E6E600E4E4E400E2E2E200E2E2E200E6E6E600E8E8E800E4E4E400E6E6
      E600ECECEC00F4F4F400FEFEFE00FEFEFE00FEFEFE00F0F0F0007E8EA400818D
      9F00A0A4AA00CACACA00E8E8E800FCFCFC00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00F0F0F000FFFFFF00EEEE
      EE00EEEEEE007AAFD400218ECA002D5F9D00B5B5B500EBEBEB00EEEEEE00EEEE
      EE00F2F2F200A7A7A700FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00A3B2
      E5000529BE00B3BFE900FEFEFE00FEFEFE00FEFEFE00FEFEFE002C4CC5000F33
      BE00F5F6FC00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00F0F0F000E4E4
      E400DEDEDE00DCDCDC00DADADA00DCDCDC009EBCA5008EB69800DEDEDE00DEDE
      DE00E4E4E400F0F0F000FEFEFE00FEFEFE00FEFEFE00CED0D3007DABDF0085BA
      CA0083B1D2007398C4006E89B4007183A300838C9E00A1A5AC00C2C3C500E4E4
      E400FAFAFA00FEFEFE00FEFEFE00FEFEFE00FEFEFE00F0F0F000FFFFFF00E7E7
      E800E7E7E8008ADBF0005BDDFC00039BF10039649800B7B7B800E4E4E500E7E7
      E800EAEAEB00A7A7A700FEFEFE00FEFEFE00FEFEFE00FEFEFE00A3B2E500062D
      C100052CC100062DC100B3BFE900FEFEFE00FEFEFE002D4EC600052CC100052C
      C1001036BF00F5F6FC00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00EEF8F200C6E7D4007CC4980038A46000B0DDC300FBFD
      FB00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00AFB5BF0081B3CE0071B9
      6B0073B96F0077BB7A0082BF950084BDB3008AB9CE008DB0E10078A2D8006C90
      BE007083A0007F8A98009298A200F0F0F000FEFEFE00F0F0F000FFFFFF00E8E8
      E900E8E8E900E8E8E9008EE3F60056D8FC000293E8004E709900C1C1C100E6E6
      E700EBEBEC00A7A7A700FEFEFE00FEFEFE00FEFEFE00ABB8E7000A34C4000934
      C4000934C4000934C4000A34C400B4BFE9002E50C6000934C4000934C4000934
      C4000934C400133AC100FCFCFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00EAF7F10090D7B40033B473002BB16D002BB16D002BB26E0031B3720087D4
      AE00F9FDFB00FEFEFE00FEFEFE00FEFEFE00FEFEFE0099A5B90087BCC20077BC
      720076BA770075B9750072B8710071B86D0075BA70008CC48900A3CCA6007AB5
      87006F9DA70080AAE400AECDF800B3B6BA00FEFEFE00F0F0F000FFFFFF00A8A8
      A800D9D9D900A8A8A800A8A8A8007ADCF00050D2FB000289DE004A668400A6A6
      A600EAEAEA00A7A7A700FEFEFE00FEFEFE00FEFEFE00C8D0EF000F43DD000C3D
      C8000C3DC8000C3DC8000C3DC8000D3DC8000C3DC8000C3DC8000C3DC8000C3D
      C8000C3ECD002F54D100FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE0072D4AA002ABC7E0025BC7B0025BC7B0026BC7C0028BC7C0027BC7C0039C1
      8500F1FAF600FEFEFE00FEFEFE00FEFEFE00FEFEFE0090A3C20088C0AE007CBE
      78007CBD7D007BBC7C0079BC7A0079BB7A0077BA780073B9740070B96D0078AD
      950099B5DD00BFD6F90094A9C200F0F0F100FEFEFE00F0F0F000FFFFFF00AAAA
      AA00E7E7E700AAAAAA00D8D8D800ADADAD007DE1F60046CBFB00027DD0006276
      8C00DCDCDC00A5A5A500FEFEFE00FEFEFE00FEFEFE00FEFEFE00C8D0EF00134C
      E2001146CD001146CD001146CD001146CD001146CD001146CD001146CD001148
      D3003058D300FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FCFEFD00A8E8
      D10037C7920056CFA10067D3AA0066D3A9003DCA95001FC3880052CFA000CCF0
      E200FEFEFE00FEFEFE00FEFEFE00FEFEFE00F0F0F00091ADD20089C29E0080C0
      7F0080BF820080BF81007FBE80007EBD7F007DBD7E007CBD7D0078BB77008BC2
      9A00B7D4D70094C0DE0098A3B300FEFEFE00FEFEFE00F0F0F000FFFFFF00AAAA
      AA00AAAAAA00E7E7E700AAAAAA00AAAAAA00E7E7E7007EE4FA0036C2FB00016B
      BE00ACBAC900A0A0A000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00C8D0
      EF001857E7001550D2001550D2001550D2001550D2001550D2001652D800325C
      D500FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00EEFAF7007BDD
      BC00C4EFDF00E1F6EE00EEFAF600EDFAF50090E3C80040CE9F00D6F3E900FBFD
      FD00FEFEFE00FEFEFE00FEFEFE00FEFEFE00D2D3D60097BADD0089C4910086C3
      870085C2870084C1860083C1850082C0840081C0830080BF820080BF81007EBE
      7E007DBE7E0084B3D200B3B8BF00FEFEFE00FEFEFE00F0F0F000FFFFFF00ABAB
      AC00BDBDBD00ABABAC00ABABAC00CACACB00ABABAC00D9D9D90085E7FC0025BC
      FB00235F930093939300FCFCFC00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00335ACB001A5BD7001A5BD7001A5BD7001A5BD7001A5BD7001A59D600B6C2
      EA00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00F4FCFA00EBFA
      F500FEFEFE00FEFEFE00E8D6BF00E0C7A700D6F6ED00DFF7F000FEFEFE00FEFE
      FE00F0E4D400F7F1E800FEFEFE00FEFEFE00B7BAC100A3CCDF008DC78E008CC6
      8E008BC58D008AC48C0089C38B0088C38A0086C2880085C2880084C1860083C1
      830084C0900083A9D300D5D5D800FEFEFE00FEFEFE00F0F0F000FFFFFF00ACAC
      AC00CACACA00ACACAC00ACACAC00CACACA00ABABAC00BFBFBF00ACACAC00C1EF
      F900D4D4D40059595E00ECECF300FEFEFE00FEFEFE00FEFEFE00FEFEFE00345C
      CD001E65DC001E65DC001E65DC001E65DC001E65DC001E65DC001E65DC001E62
      DA00B6C2EA00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00F0E3D100B67A2400C99D5E00FAF6F000FCF9F700F5ECE000E3CC
      AA00CDA16000F6EEE200FEFEFE00FEFEFE00A3ACBA009EC6CB0081B67E0089BE
      87008DC48C008FC88F008FC891008EC790008CC68E008BC58D008AC48C0089C5
      87008DC4A60089A4CA00F2F2F200FEFEFE00FEFEFE00F0F0F000FFFFFF00ADAD
      AE00C1C1C200BEBEBF00ADADAE00EFEFF000E5E5E500DBDBDC00DBDBDC00D5D5
      D500E9E9F3006F6FD0000C0C8700FEFEFE00FEFEFE00FEFEFE003460CE00236F
      E100236FE100236FE100236FE100236FE300236FE200236FE100236FE100236F
      E100226CDF00B6C2EA00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00E6CEA800BD7D1C00B66E0000B56E0000B6710600B8740C00B56E0000B771
      0300E4C99F00FEFEFE00FEFEFE00FEFEFE00B0BBCA00B7D1EF00A3BFD20097B7
      BF008BB0A90081AA8F0082B1860085B8850089BE87008DC58C008FC78F008FC9
      8B0097C8BD0091A1BD00FEFEFE00FEFEFE00FEFEFE00F0F0F000FFFFFF00AEAE
      AF00BEBEBF00AEAEAF00D0D0D100F1F1F100E0E0E100A8A8A900868686008989
      8900B8B8BA009999EE00E2E2F600FEFEFE00FEFEFE005E7BD300287AEA002778
      E6002778E6002778E600287BEC003868D600297CF4002778E6002778E6002778
      E6002778E6002675E700F6F8FC00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFD
      FC00C98C2A00BD750000BE760000BE760000BD750000BD740000C0790400D5A4
      5300FCF8F300FEFEFE00FEFEFE00FEFEFE00FDFDFD00F7FAFD00ECF2FA00E0EA
      F800D1DFF600BFD1EE00AAC2DF009CB9CE0091B2BB008AAFA70085AF970082B2
      87009BC5D000A0A8B700FEFEFE00FEFEFE00FEFEFE00F0F0F000FFFFFF00F2F2
      F300F2F2F300F2F2F300F2F2F300F1F1F200DEDEDF00C4C4C400FFFFFF00D5D5
      D500FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE003168D7002C83
      EF002B80EA002C83F000396BD600FEFEFE00CBD3F0002D84F5002B80EA002B80
      EA002E89F90095A7E200FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00F2DFBE00D4983100C77F0000C9830700CF8F1E00D69D3B00E9CC9800FBF7
      EF00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FAFBFD00EBF1F900DDE7F700CEDDF500C0D3F100AAC4
      E500ABC8EF00B4B7BC00FEFEFE00FEFEFE00FEFEFE00F0F0F000FFFFFF00F3F3
      F400F3F3F400F3F3F400F3F3F400F0F0F100DADADA00C6C6C700E3E3E300FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00336B
      D700318EF5003A6DD600FEFEFE00FEFEFE00FEFEFE00CBD3F000308BF5003290
      F90095A7E200FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFDFA00F5E6CA00D7972100DFAE5400F4E4C700F9EFDF00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00F7F9FC00ECF2
      FA00DCE7F500E1E1E200FEFEFE00FEFEFE00FEFEFE00F4F4F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E5E5E400FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE005F7DD400FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00CBD3F0009FAF
      E400FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00F8ECD400F3DCB000FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFDFC00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00F0F0F000CBCACA00A3A1A00077737300FAFAFA00EEEEEE009293
      9500FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00E6E6E300BDBDB700BDBD
      B700BDBDB700BDBDB700BDBDB700BDBDB700BDBDB700BDBDB700BDBDB700BDBD
      B700BDBDB700BDBDB700BDBDB700DEDEDA00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00C0C8
      EC00F0F0FA00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FAFAFA00F2F2
      F200EAEAEA00E0E0E000D6D6D600CECECE00D0D0D000D8D8D800E2E2E200ECEC
      EC00F4F4F400FCFCFC00FEFEFE00FEFEFE00FEFEFE00463D3B00413735003B31
      2E003C322E003D3230003E3431003F343100483C38009C8C8600ECE3E200ECE3
      E100B6B6B700FEFEFE00FEFEFE00FEFEFE001A180B0017130800171308001713
      0800171308001713080017130800171308001713080017130800171308001713
      0800171307007876670072716300DEDEDA00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00889DD400F0F0F8004FAD
      E9009BAEE700AFB7EB00CED3F400FEFEFE00FEFEFE00FEFEFE00F4F4F400E8E8
      E800DEDEDE00C3B5AB00996B4B008B522B00905C3900A7866F00D5D4D400DEDE
      DE00E8E8E800F4F4F400FEFEFE00FEFEFE00F6F6F600372D2B0032282700382E
      2C00392F2C003A312E003B312F003E343100463A3700A4938D00E6DFDD00DDD6
      D400565B5F00F6F6F600FEFEFE00FEFEFE00221F13001F1A0F001F1A0F001F1A
      0F001F1A0F001F1A0F001F1A0F001F1A0F001F1A0F001F1A0F001F1A0F001F1A
      0F001E1A0E009E9D8F0089877C00DEDEDA00FEFEFE00F2F0F000D0CACA00A298
      9800B4ACAC00D2CDCD00ECEAEA00FEFEFE00FEFEFE00548ACF005BA8E5004AA7
      E7004E65CF003FF5FD00A7B2EC00FEFEFE00FEFEFE00FEFEFE00FEFEFE00D8C5
      B800935D3700A97E6000A4775700A3745400A4775600AB806400A6795B009560
      3B00FEFEFE00FEFEFE00FEFEFE00FEFEFE00EDEDED00362D2C00302827003B31
      2F003B32300039302E003B312F003E34310045393600A08F8A00E6DFDD00C9C2
      C1004F606E00C8C8C800FCFCFC00FEFEFE002625180024201400242014002420
      1400242014002420140028241800262216002420140024201400242014002420
      140024201400B0AFA40098968D00DEDEDA00A1979700B2A9A900B5ABAB00B6A8
      A800B4A9A900ACA7A70094898900C4BEBE00C4C8E300ABBBE2002A71CF0072ED
      FF005DF4FF004F66D400AFBCEF00F2F2FC00FEFEFE00FEFEFE00B28B7000A273
      520096613C00996541009B6946009D6B48009D6B49009D6B48009B694600A06F
      4D008F552E00FEFEFE00FEFEFE00FEFEFE00E1E0E000352D2C00302928004036
      34003E3332003C322F003B312E003D322F00463936009D8C8700E5DEDC00B5AE
      AD007795AC00C2C2C200F0F0F000FEFEFE002D2A1E002A251A002A251A002A25
      1A002A251A002A251A00433F3200393529002A251A002B261B002A251A002A25
      1A002A261A00C1C0B900A5A49B00D2D2CE00A59C9C00B9AEAE00BBB0B000C1B6
      B600C1B6B600C1B7B700B6B0B0009F9E9E005183BB007FBEE30062B7E9008CFE
      FF005EF6FF0033BFEC0026C5F000BEC9F400FEFEFE00D8C5B8009D6B48008E54
      2C0090583100935C3700FFFFFF00FFFFFF00FFFFFF00A5877200955F3900935C
      3600945F39008B502700FEFEFE00FEFEFE00D7D6D600342D2C00312A2A00463B
      3900423835003F3432003B302D003C302C0045383400A5938D00E5DEDC009F9A
      980080A3BD00E2E2E200EAEAEA00FCFCFC0032302400332F2400322E2200433F
      320047433600413E31004D4A3C0049463800413E31004D4A3C00383428002F2B
      1F00302C2000D2D2CE00B1AFAA00CDCDC900ABA3A3008F7E7E009C919100C1BC
      BC00CAC7C700C7C5C500BFB5B500C2B8B800C6BDBC0076769E00A0EDFC003EA6
      EA00217FDE002BA5E90085777700FDFDFC00FEFEFE0090583200874A2000884B
      22008B5027008D532B008F552E00FFFFFF00C0ADA1008F5730008F552E008D53
      2B008B50270098633E00C7AB9800FEFEFE00D0CECE00352D2D00342C2C00443A
      3800483D3A00433835003F3330003E322F004136320097888200E7E0DD008C88
      88007C9FB900CECFD000FCFCFC00FEFEFE00393729003D392D003D392D004743
      37005C594A004B483A00444032003C392B0049463700484436003B3729003531
      24003633250076746A006F6E6400CDCDC900B1A9A9009785850085767600D0CE
      CE00D7D7D700D7D7D700CCCCCC00CFD0D000CFD0CD0076AEDF005F6AAC0045A5
      E5007482B9002A86DB005E7BCB00FEFEFE00E3D5CB00945E3900874A2000874A
      2000874A2000874A2000884C2300FFFFFF00BEAA9D00894D2300884C2300874A
      2000874A2000874A20008B502800FEFEFE00C9C7C6003A33320038313000463C
      3A00493F3C00473C38004137330040353300483C3900A5948E00E4DEDB007877
      7900789CB60080878D00FEFEFE00FEFEFE00403E300047433700474337005350
      4300605D4F004A463A00696658005A564900423E32005A574700605D4E00433F
      32003D392C009C9C91008A8A8200CDCDC900B7B1B000C6BCBC00E8E8E800E7E7
      E700E7E7E700E9E9E900B4ADAD00B5ADAC00BBB4B400BFB8B500BBB4B4003E83
      D7008388C400CCC6C500FEFEFE00FEFEFE00A57757008A4E2500874A2000874A
      2000874A2000874A2000874A2000FFFFFF00BDA99B00874A2000874A2000874A
      2000874A2000874A2000945E3900FEFEFE00C5C3C200413C3B003D3837004B42
      40004D4340004B413E00443B3900423937004A403D00A8969000E9E2E0006667
      6A007A9FB900586D7E00FEFEFE00FEFEFE00454335004F4C40006A675900726F
      61005E5A4D00504C4100726F6100636053005F5B4E00726F6100636052004F4C
      400049453900AEAEA6009A9A9300CDCDC90067679D004B7987008F898A00B1A1
      A000B8ABAA00A89C9C007C7C8100787EB100F6F6F900FEFEFE00FAFAFB00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE008D532C00986440008A4E2500874A
      2000874A2000874A2000874A2000FFFFFF00BDA99B00874A2000874A2000874A
      2000874A2000874A200096603B00FEFEFE00C5C3C2004B4745004C454300534A
      4700554B48004E45410048403C00463D3A004F4541009D8D8600E8E1DF005659
      5F0080A5C0007A9DB600FEFEFE00FEFEFE004C4B3C0059564A005E5A4D006D69
      5D006E6A5E005A564B007C796C00737063007B786A00777466005A564B005956
      4A00524F4200C2C2BA00AAAAA500C2C2BC006E6E9E000FD8FF000BD8FE0000DE
      FF0001DAFB0000E0FF0000DAFF0000CCFF000075C500023492000069C000203B
      8C00324A9400022C8E00F4F4F800FEFEFE009864410097623E00A17150009661
      3C00874A2000874A2000EDE3DD00FFFFFF00BDA99B00874A2000874A2000874A
      2000874A2000874A2000935C3600FEFEFE00C8C6C5005954500058534F005D55
      51005D544F00544A46004B423E00453B37004E443F008F807A00C1B3AF00464C
      520082A7C20085ACC800FEFEFE00FEFEFE00504F4100625E5200625E52006764
      5700817E70006F6C5E0085827300848173008582730074716400625E5200625E
      52005A564900C7C6C300ADADA800BDBDB7007676A3000E67B3007676A20013EC
      FF0001F9FF0001F5FB0000CEF80000D1F90000D7FA0000C5FB0000DDFB0000C4
      FB0000D6FC0000C5FC0004389600FAFAFB00BD9C850090583100A27252009F6F
      4D009D6B480097623E008C5129008F562F009E6D4B00874A2000874A2000874A
      2000874A2000874A20008D532B00FEFEFE00D0CECD006965610069635F006961
      5C00655C570059504B005047420049403A00473C36004C403A00A3928C004B54
      5E0083AAC50086ADC900D2D3D400FEFEFE00565546006A675B006A675B007F7D
      6F0089887A007B786B008D8B7D007F7D7000858375008C8A7C00716F63006A67
      5B00605E50008383770078786F00BDBDB7008282AB002DB4EA002860A7003BF7
      FF003FFFFF003FFFFF0023EEFF0028F1FF0028EDFF0027E8FF0028E4FF002AE1
      FF0028DAFF0027B1EE007273A400FEFEFE00FDFCFC008F573000A3745400A070
      4F009E6C4A009B69460099654100C7A99600825F4600925A34008F562F008D53
      2A008A4F2600894E240091593300FEFEFE00D5D4D3007B7A750079746F00746D
      67006D655F0060575200554B46004A403B00443A3500493E38009D8D87004953
      5D007FA4BE0087AECA00838A8F00FEFEFE005C5C4C0073706400737064007572
      6600747166007470650096938600888578007774680094928400929082007573
      66006B685A00A6A59B0093938B00BDBDB7008888AF0067E7FF0089FBFF008EFF
      FF008EFFFF0091FFFF0017B0E700AAAAC700B4B4CE00B4B4CE00B4B4CE00BABA
      D200BCBCD300CACADD00FEFEFE00FEFEFE00FEFEFE00955F3A008B512700A172
      51009F6E4D009D6B48009A664300FFFFFF00E7E0DB00915B3500905731008E54
      2C008B5027008D532B00FAF8F700FEFEFE00DDDCDC008D8E880086847E007D78
      7200736C6600665E58005A514B004E454000493E3A004B403B009C8C86005463
      710081A6C10085ACC9005C728300FEFEFE00646354007B786C007B786C007B78
      6C007B786C007B786C00918E8100898679007B786C00868275008C8A7D007F7C
      700074726400B8B8B100A3A39C00BDBDB700FEFEFE0068689500596595005EA7
      D2005CB5DA005785B400565B8F00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00894D23008F57
      2F00A0704E009E6C4A009B6946009965410096613C00945D3800915A33008F55
      2E008C522A00C2A38E00FEFEFE00FEFEFE00E7E6E600A1A39C008D8D87007F7C
      7700746E69006E66600062595400594F4A004F443F0050454000A79690005768
      77007FA5BF00799DB6005F788A00FEFEFE006868580082807400828074008280
      7400828074008280740082807400828074008280740082807400828074008280
      74007C7A6B00C9C9C400B8B8B300ECECEA00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00884B
      21008A4F26009A6643009C6A47009A66430097633F00955F39008A5026008A4F
      2600C2A38E00FEFEFE00FEFEFE00FEFEFE00FEFEFE00ECECEC00D5D6D500BABB
      BA009A9A9800656564005858570053515000514C4B00575150009A949200FCFC
      FC00FEFEFE00FEFEFE00FEFEFE00FEFEFE00686858007D7A6C007D7B6C007E7B
      6D007E7C6E007E7C6E007F7D6E007F7D6F00807E6F00817E7000817E7000827F
      710081806F00C2C1BA00B8B8B300FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00C7AB9800874B2100884C2300894D2300894D2300884B220091593300FAF8
      F700FEFEFE00FEFEFE00FEFEFE00FEFEFE00424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object MainMenu: TMainMenu
    Images = ImageList1
    Left = 128
    object Datei1: TMenuItem
      Caption = 'Datei'
      object InstalliertePluginsanzeigen1: TMenuItem
        Caption = 'Installierte Plugins anzeigen'
      end
      object Webbrowser1: TMenuItem
        Caption = 'Webbrowser'
        SubMenuImages = ImageList1
        Enabled = False
        object Editieren1: TMenuItem
          Caption = 'Editieren'
          ImageIndex = 5
          OnClick = Editieren1Click
        end
        object N1: TMenuItem
          Caption = '-'
        end
        object Lschen1: TMenuItem
          Caption = 'L'#246'schen'
          ImageIndex = 6
          OnClick = Lschen1Click
        end
      end
    end
    object Credits1: TMenuItem
      Caption = 'Credits'
      OnClick = Credits1Click
    end
  end
end
