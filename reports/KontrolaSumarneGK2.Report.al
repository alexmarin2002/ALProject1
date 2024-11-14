report 50001 "BSLHP Kontrola Sumarne/GK2"
{
    Caption = 'Kontrola Sumarne/GK2';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = './src\layout\BSLHP Kontrola Sumarne_GK2.rdlc';

    dataset
    {

        dataitem("G/L Entry"; "G/L Entry")
        {
            DataItemTableView = sorting("Entry No.");
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
            end;

            trigger OnAfterGetRecord()
            var
                GLItemLedgerRelation: Record "G/L - Item Ledger Relation";
            begin
                GLItemLedgerRelation.SetRange("G/L Entry No.", "Entry No.");

                if not GLItemLedgerRelation.IsEmpty() then
                    CurrReport.Skip();
            end;
        }
    }

    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
            }
        }
    }

}