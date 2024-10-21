table 50006 "TEST Calculations Header"
{
    Caption = 'Calculation Header';
    DataClassification = CustomerContent;
    DrillDownPageId = "TEST Calculates Art";
    LookupPageId = "TEST Calculates Art";
    fields
    {
        field(1; "No. Calculations"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'No.Calculations';
        }
        field(2; "No. Article"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No. Article';
            TableRelation = Item."No.";
            trigger OnValidate()
            var
                ItemRec: Record Item;
            begin
                if ItemRec.Get("No. Article") then begin
                    Rec."Description" := ItemRec.Description;
                    GetItemPrice("No. Article");
                end else
                    Error('Item No. not found');
            end;
        }
        field(3; "Description"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
            Editable = false;
        }
        field(4; "VAT"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'VAT%';
        }
        field(5; "Boolean"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Use Price';
        }
        field(6; "Rabat 1"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Rabat 1';
            ToolTip = 'Rabat 1';
        }
        field(7; "Rabat 2"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Rabat 2';
            ToolTip = 'Rabat 2';
        }
        field(8; "Rabat 3"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Rabat 3';
            ToolTip = 'Rabat 3';
        }
        field(9; "Supplier Rebate"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Supplier Rebate';
            ToolTip = 'Supplier Rebate';
        }
        field(10; "Item Price"; Decimal)

        {
            DataClassification = CustomerContent;
            Caption = 'Supplier Price';
            ToolTip = 'Supplier Price';
            Editable = false;
        }
        field(11; "Purchase Price"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Purchase Price';
            ToolTip = 'Purchase Price';
        }
        field(12; "Selling Price"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Selling Price';
            ToolTip = 'Selling Price';
        }
        field(13; "Retail Price Including IVA"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Retail Price Including IVA';
            ToolTip = 'Retail Price Including IVA';
        }
        field(14; "Seller Rebate"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Seller Rebate';
            ToolTip = 'Seller Rebate';
        }
        field(15; "Margin %"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Margin %';
            ToolTip = 'Margin %';
        }
    }
    keys
    {
        key(PK; "No. Article")
        {
            Clustered = true;
        }
    }
    procedure GetItemPrice(ItemNo: Code[20])
    var
        ItemRec: Record Item;
    begin
        if ItemRec.Get(ItemNo) then
            Rec."Item Price" := ItemRec."Unit Cost"
        else
            Rec."Item Price" := 0;
    end;
}