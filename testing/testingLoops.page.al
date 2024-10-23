page 50003 "TEST Testing Loops"
{
    PageType = card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "TEST CalculatorTable";
    caption = 'Testing Loops';

    layout
    {
        area(Content)
        {
            group(input)
            {
                caption = ' input ';
                field(Number1; value1)
                {
                    Caption = 'First Number';
                    ToolTip = 'Number1';
                }
                field(Number2; value2)
                {
                    Caption = 'Second Number';
                    ToolTip = 'Number2';
                }
                field(Operator; Rec.Operator)
                {
                    Caption = 'Operator';
                    ToolTip = 'Operator';
                }
            }
            group(output)
            {
                caption = ' output ';
                field(Result; result)
                {
                    ApplicationArea = All;
                    Caption = 'Result';
                    ToolTip = 'Operator';
                    Editable = false;
                }
            }
        }
    }

    actions
    {

        area(Processing)
        {
            action(Execute)
            {
                ApplicationArea = All;
                Caption = 'testing';
                ToolTip = 'I am testing the project.';
                Image = ExecuteBatch;

                trigger OnAction()
                begin
                    case Rec.Operator of
                        Rec.Operator::Add:
                            calcResult := value1 + value2;
                        Rec.Operator::Subtract:
                            calcResult := value1 - value2;
                        Rec.Operator::Multiply:
                            calcResult := value1 * value2;
                        Rec.Operator::Divide:
                            if value2 <> 0 then
                                calcResult := value1 / value2
                            else
                                Error('Cannot divide by zero');
                    end;
                    result := calcResult;
                    // Modify(true);
                end;

            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Operator := Rec.Operator::Subtract
    end;

    var

        //result: boolean;
        value1: decimal;
        value2: decimal;
        calcResult: Decimal;
        result: decimal;
        value4: text;
        value5: Enum "TEST Order Status";
}