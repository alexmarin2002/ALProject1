report 50000 "BSLHP Kontrola Sumarne/GK"
{
    Caption = 'Kontrola Sumarne/GK';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = './src/layout/BSLHP Kontrola Sumarne_GK.rdlc';

    dataset
    {
        dataitem("Value Entry"; "Value Entry")
        {
            RequestFilterFields = "Inventory Posting Group", "Posting Date";
            PrintOnlyIfDetail = true;

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

            dataitem("G/L - Item Ledger Relation"; "G/L - Item Ledger Relation")
            {
                DataItemTableView = sorting("G/L Entry No.", "Value Entry No.");
                DataItemLinkReference = "Value Entry";
                DataItemLink = "Value Entry No." = field("Entry No.");
                PrintOnlyIfDetail = true;

                dataitem("G/L Entry"; "G/L Entry")
                {
                    DataItemTableView = sorting("Entry No.");
                    DataItemLinkReference = "G/L - Item Ledger Relation";
                    DataItemLink = "Entry No." = field("G/L Entry No.");
                    RequestFilterFields = "G/L Account No.", "Posting Date";

                    column(EntryNo_GLEntry; "Entry No.")
                    {
                    }
                    column(Amount_GLEntry; Amount)
                    {
                    }
                    column(CreditAmount_GLEntry; "Credit Amount")
                    {
                    }
                    column(DebitAmount_GLEntry; "Debit Amount")
                    {
                    }
                    column(PostingDate_GLEntry; "Posting Date")
                    {
                    }
                    column(GLAccountNo_GLEntry; "G/L Account No.")
                    {
                    }

                    trigger OnPreDataItem()
                    begin
                        Message('cant use ZERO to divide');
                        case Show of
                            Show::Accout:
                                "G/L Entry".SetRange(Amount, "Value Entry"."Cost Posted to G/L");
                            Show::"Balance Account":
                                "G/L Entry".SetRange(Amount, -"Value Entry"."Cost Posted to G/L");
                        end;
                    end;
                }
            }
        }
    }

    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                field(Show; Show)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    var
        Show: Option Both,Accout,"Balance Account";

}