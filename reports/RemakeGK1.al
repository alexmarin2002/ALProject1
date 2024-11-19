report 50002 "MyReport"
{
    Caption = 'ReportTEST';
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'MyRDLReport.rdl';
    dataset
    {
        dataitem("Value Entry"; "Value Entry")
        {
            // RequestFilterFields = "Inventory Posting Group", "Posting Date";
            RequestFilterFields = "Entry No.";
            PrintOnlyIfDetail = true;
            DataItemTableView = sorting("Entry No.");
            column(EntryNo_ValueEntry; "Entry No.")
            {
            }
            column(PostingDate_ValueEntry; "Posting Date")
            {
            }
            column(CostPostedtoGL_ValueEntry; "Cost Posted to G/L")
            {
            }
            column(CostAmountActual_ValueEntry; "Cost Amount (Actual)")
            {
            }
            column(InventoryPostingGroup_ValueEntry; "Inventory Posting Group")
            {
            }
            column(GenBusPostingGroup_ValueEntry; "Gen. Bus. Posting Group")
            {
            }
            column(GenProdPostingGroup_ValueEntry; "Gen. Prod. Posting Group")
            {
            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
    }
}