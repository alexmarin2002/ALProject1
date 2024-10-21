page 50004 "TEST Calculates Art"
{
    PageType = Document;
    ApplicationArea = All;
    SourceTable = "TEST Calculations Header";
    Caption = 'Calculations Test';
    UsageCategory = Documents;

    layout
    {
        area(Content)
        {
            group(General)
            {
                group("Information")
                {
                    Caption = 'Information';

                    field("No."; Rec."No. Calculations")
                    {
                        ApplicationArea = All;
                        Caption = 'No. Calculations';
                        ToolTip = 'Number of calculations done.';
                    }

                    field("Nr. Article"; Rec."No. Article")
                    {
                        ApplicationArea = All;
                        Caption = 'Article';
                        ToolTip = 'Number of customer.';
                    }

                    field("Description"; Rec."Description")
                    {
                        ApplicationArea = All;
                        Caption = 'Description';
                        ToolTip = 'The Description of the item';
                    }

                    field("VAT%"; testing)
                    {
                        ApplicationArea = All;
                        Caption = 'VAT%';
                        ToolTip = 'VAT to pay';
                    }

                    field("Boolean"; Rec."Boolean")
                    {
                        ApplicationArea = All;
                        Caption = 'PRICE';
                        ToolTip = 'Price';
                    }
                }

                group("Supplier")
                {
                    Caption = 'Supplier';

                    field("Rabat 1"; Rec."Rabat 1")
                    {
                        ApplicationArea = All;
                        Caption = 'Rabat 1';
                        ToolTip = 'Rabat 1';
                    }

                    field("Rabat 2"; Rec."Rabat 2")
                    {
                        ApplicationArea = All;
                        Caption = 'Rabat 2';
                        ToolTip = 'Rabat 2';
                    }

                    field("Rabat 3"; Rec."Rabat 3")
                    {
                        ApplicationArea = All;
                        Caption = 'Rabat 3';
                        ToolTip = 'Rabat 3';
                    }

                    field("Supplier Rebate"; Rec."Supplier Rebate")
                    {
                        ApplicationArea = All;
                        Caption = 'Supplier Rebate';
                        ToolTip = 'Supplier Rebate';
                    }

                    field("Supplier Price"; Rec."Item Price")
                    {
                        ApplicationArea = All;
                        Caption = 'Supplier Price';
                        ToolTip = 'Supplier Price';
                    }
                }

                group("Item Prices")
                {
                    Caption = 'Item Prices';

                    field("Purchase Price"; Rec."Purchase Price")
                    {
                        ApplicationArea = All;
                        Caption = 'Purchase Price';
                        ToolTip = 'Purchase Price';
                    }

                    field("Selling Price"; Rec."Selling Price")
                    {
                        ApplicationArea = All;
                        Caption = 'Selling Price';
                        ToolTip = 'Selling Price';
                    }

                    field("Retail Price Including IVA"; Rec."Retail Price Including IVA")
                    {
                        ApplicationArea = All;
                        Caption = 'Retail Price Including IVA';
                        ToolTip = 'Retail Price Including IVA';
                    }

                    field("Seller Rebate"; Rec."Seller Rebate")
                    {
                        ApplicationArea = All;
                        Caption = 'Seller Rebate';
                        ToolTip = 'Seller Rebate';

                    }

                    field("Margin %"; Rec."Margin %")
                    {
                        ApplicationArea = All;
                        Caption = 'Margin %';
                        ToolTip = 'Margin %';
                    }
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(TestingCal)
            {
                ApplicationArea = All;
                Caption = 'Calculation Test';
                ToolTip = 'Open Calculation Test';
                Image = Customer;
                RunObject = page "TEST Calculates Art";
            }
        }
    }

    var
        testing: decimal;
}