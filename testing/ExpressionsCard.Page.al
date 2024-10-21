page 50002 "TEST Expression Card"
{
    PageType = card;
    ApplicationArea = All;
    UsageCategory = Documents
    ;
    caption = 'Expression Card';
    layout
    {
        area(Content)
        {
            group(input)
            {
                caption = ' input ';
                field(value1; value1)
                {
                    caption = ' value1 ';
                    ToolTip = 'Enter a value for Value1.';
                    ApplicationArea = All;

                }
                field(value4; value4)
                {
                    caption = ' Operatore ';
                    ToolTip = ' Eneter an operator ';
                    ApplicationArea = All;

                }
                field(value2; value2)
                {
                    caption = ' value2 ';
                    ToolTip = 'Enter a value for Value2.';
                    ApplicationArea = All;

                }
            }
            group(output)
            {
                caption = ' output ';

                field(Result; result2)
                {
                    Caption = ' Result ';
                    editable = false;
                    ToolTip = ' The Result of the Operation. ';
                    ApplicationArea = All;
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
                Caption = 'Execute';
                ToolTip = 'Click to calculate the moon.';
                Image = ExecuteBatch;


                trigger OnAction()
                begin
                    Result := Value1 > Value2;
                end;
            }
            action(Execute2)
            {
                ApplicationArea = All;
                Caption = 'testing';
                ToolTip = 'I am testing the project.';
                Image = ExecuteBatch;

                trigger OnAction()
                begin
                    value0 := 0;
                    case value4 of
                        '+':
                            begin
                                value0 := 1;
                                result2 := Value1 + Value2;
                            end;
                        '*':
                            begin
                                value0 := 1;
                                result2 := Value1 * Value2;
                            end;
                        '/':
                            begin
                                value0 := 1;
                                result2 := Value1 / Value2;
                            end;
                        '-':
                            begin
                                value0 := 1;
                                result2 := Value1 - Value2;
                            end;
                        'div':
                            begin
                                value0 := 1;
                                result2 := Value1 div Value2;
                            end;
                        'mod':
                            begin
                                value0 := 1;
                                result2 := Value1 mod Value2;
                            end;
                    end;
                    if (value0 <= 0)
                     then
                        Message('You used a non valid operator!');
                end;
            }
        }
    }
    var
        value0: integer;
        value1: integer;
        value2: integer;
        result: boolean;
        result2: decimal;
        value4: text;
}