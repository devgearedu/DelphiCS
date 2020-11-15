object DM: TDM
  OldCreateOrder = False
  Height = 468
  Width = 445
  object InsaQuery: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from insa'
      'where dept_code = :code')
    Left = 176
    Top = 120
    ParamData = <
      item
        Name = 'CODE'
        DataType = ftString
        ParamType = ptInput
        Size = 4
      end>
  end
  object InsaQuerySource: TDataSource
    DataSet = InsaQuery
    Left = 232
    Top = 120
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 176
    Top = 40
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 96
    Top = 40
  end
  object Dept: TFDTable
    Active = True
    Filtered = True
    IndexFieldNames = 'CODE'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'DEPT'
    TableName = 'DEPT'
    Left = 40
    Top = 120
  end
  object DeptSource: TDataSource
    DataSet = Dept
    OnDataChange = DeptSourceDataChange
    Left = 96
    Top = 120
  end
  object InsaSource: TDataSource
    DataSet = Insa
    Left = 96
    Top = 184
  end
  object FDMoniFlatFileClientLink1: TFDMoniFlatFileClientLink
    FileName = 'mytrace.txt'
    Tracing = True
    Left = 352
    Top = 112
  end
  object Insa: TFDTable
    Active = True
    BeforeInsert = InsaBeforeInsert
    OnCalcFields = InsaCalcFields
    OnNewRecord = InsaNewRecord
    Filtered = True
    IndexFieldNames = 'ID'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'INSA'
    TableName = 'INSA'
    Left = 40
    Top = 184
    object InsaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object InsaNAME: TStringField
      DisplayLabel = #51060#47492
      DisplayWidth = 10
      FieldName = 'NAME'
      Origin = 'NAME'
      Size = 10
    end
    object InsaAGE: TSmallintField
      DisplayLabel = #45208#51060
      DisplayWidth = 10
      FieldName = 'AGE'
      Origin = 'AGE'
      MaxValue = 60
      MinValue = 20
    end
    object InsaDEPT_CODE: TStringField
      DisplayLabel = #48512#49436#53076#46300
      DisplayWidth = 8
      FieldName = 'DEPT_CODE'
      Origin = 'DEPT_CODE'
      Size = 4
    end
    object InsaSection: TStringField
      DisplayLabel = #54016#47749
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'Section'
      LookupDataSet = Dept
      LookupKeyFields = 'CODE'
      LookupResultField = 'SECTION'
      KeyFields = 'DEPT_CODE'
      Lookup = True
    end
    object InsaIPSA_DATE: TDateField
      DisplayLabel = #51077#49324#51068#51088
      DisplayWidth = 14
      FieldName = 'IPSA_DATE'
      Origin = 'IPSA_DATE'
      DisplayFormat = 'YYYY'#45380'MM'#50900'DD'#51068
    end
    object InsaDuring: TIntegerField
      DisplayLabel = #44540#49549#45380#49688
      FieldKind = fkCalculated
      FieldName = 'During'
      DisplayFormat = '00'#45380
      Calculated = True
    end
    object InsaCLASS: TStringField
      DisplayLabel = #51649#44553
      DisplayWidth = 4
      FieldName = 'CLASS'
      Origin = 'CLASS'
      Size = 4
    end
    object InsaSALARY: TIntegerField
      DisplayLabel = #44553#50668
      DisplayWidth = 14
      FieldName = 'SALARY'
      Origin = 'SALARY'
      DisplayFormat = '#,##0'#50896
    end
    object InsaTax: TFloatField
      DisplayLabel = #49464#44552
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Tax'
      DisplayFormat = '#,##0'#50896
      Calculated = True
    end
    object InsaPHOTO: TBlobField
      DisplayLabel = #49324#51652
      FieldName = 'PHOTO'
      Origin = 'PHOTO'
      Visible = False
    end
    object InsaGRADE: TStringField
      DisplayLabel = #46321#44553
      DisplayWidth = 4
      FieldName = 'GRADE'
      Origin = 'GRADE'
      Size = 1
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'MonitorBy=FlatFile'
      'ConnectionDef=sample')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 40
  end
  object FDGUIxErrorDialog1: TFDGUIxErrorDialog
    Provider = 'Forms'
    Left = 352
    Top = 32
  end
end
