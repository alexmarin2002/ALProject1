table 50110 "TEST CalculatorTable"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Operator"; Enum "TEST OPERATORS")
        {
            Caption = 'Operator';
        }
        field(2; "value1"; Decimal)
        {
            Caption = 'Value1';
        }
        field(3; "value2"; Decimal)
        {
            Caption = 'Value2';
        }
    }
    keys
    {
        key(PK; "Operator", "Value1", "value2")
        {
            Clustered = true;
        }
    }
}