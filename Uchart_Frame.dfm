object chartFrame: TchartFrame
  Left = 0
  Top = 0
  Width = 430
  Height = 300
  TabOrder = 0
  object DBChart1: TDBChart
    Left = 16
    Top = 16
    Width = 401
    Height = 217
    BackWall.Pen.Width = 4
    BottomWall.Pen.Color = clNavy
    BottomWall.Pen.Width = 7
    Title.Text.Strings = (
      'TDBChart')
    Frame.Width = 4
    Legend.ColorWidth = 25
    Legend.Symbol.Pen.Width = 10
    Legend.Symbol.Width = 25
    Pages.MaxPointsPerPage = 3
    View3DOptions.Zoom = 106
    BevelInner = bvLowered
    TabOrder = 0
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series1: TBarSeries
      BarBrush.Gradient.EndColor = clRed
      DarkPen = 10
      Marks.Style = smsLabelPercent
      Marks.Arrow.Color = clBlack
      Marks.Arrow.Width = 4
      Marks.Callout.Arrow.Color = clBlack
      Marks.Callout.Arrow.Width = 4
      Marks.Callout.ArrowHead = ahLine
      SeriesColor = clRed
      BarWidthPercent = 80
      Gradient.EndColor = clRed
      Sides = 37
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
    end
  end
  object Button1: TButton
    Left = 16
    Top = 239
    Width = 65
    Height = 25
    Caption = #52376#51020
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 87
    Top = 239
    Width = 65
    Height = 25
    Caption = #51060#51204
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 16
    Top = 267
    Width = 65
    Height = 25
    Caption = #45796#51020
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 87
    Top = 267
    Width = 65
    Height = 25
    Caption = #47592#45149
    TabOrder = 4
    OnClick = Button4Click
  end
  object CheckBox1: TCheckBox
    Left = 176
    Top = 243
    Width = 97
    Height = 17
    Caption = '3D'
    Checked = True
    State = cbChecked
    TabOrder = 5
    OnClick = CheckBox1Click
  end
  object ComboBox1: TComboBox
    Left = 176
    Top = 266
    Width = 97
    Height = 21
    ItemIndex = 1
    TabOrder = 6
    Text = '100'
    OnChange = ComboBox1Change
    Items.Strings = (
      '75'
      '100'
      '125')
  end
  object ColorGrid1: TColorGrid
    Left = 288
    Top = 237
    Width = 128
    Height = 60
    TabOrder = 7
    OnChange = ColorGrid1Change
  end
end
