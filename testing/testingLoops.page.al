page 50008 "TEST Testing Loops"
{
    PageType = Card;
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
                field(Number1; global1)
                {
                    Caption = 'First Number';
                    ToolTip = 'Number1';
                }
                field(Number2; global2)
                {
                    Caption = 'Second Number';
                    ToolTip = 'Number2';
                }
                field(Operator; Rec."Operator")
                {
                    Caption = 'Operator';
                    ToolTip = 'Number2';
                }
            }
            group(output)
            {
                caption = 'output';
                field(Result; result)
                {
                    ToolTip = 'Number2';
                    Caption = 'Result';
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
                Caption = 'Testing';
                ToolTip = 'I am testing the project.';
                Image = Calculator;
                trigger OnAction()
                begin
                    case Rec.Operator of
                        Rec.Operator::Add:
                            calcResult := global1 + global2;
                        Rec.Operator::Subtract:
                            calcResult := global1 - global2;
                        Rec.Operator::Multiply:
                            calcResult := global1 * global2;
                        Rec.Operator::Divide:
                            if global2 <> 0 then
                                calcResult := global1 / global2
                            else
                                Error('cant use ZERO to divide');
                    end;
                    result := calcResult;
                end;
            }
        }
    }
    var
        global1: Decimal;
        global2: decimal;
        calcResult: Decimal;
        result: Decimal;
}