report 50004 "BSLHP Kontrola Sumarne_GK2"

{
    Caption = 'Kontrola Sumarne_GK2';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = Default;
    dataset
    {
        dataitem(HeaderData; "Integer")
        {
            DataItemTableView = sorting(Number);
            MaxIteration = 1;
            column(HeaderInfo; HeaderInfo) { }
            column(Company_Name_A; CompanyInfo."Name") { }
            column(Address_A; CompanyInfo."Address") { }
            column(Phone_A; CompanyInfo."Phone No.") { }
            column(City_A; CompanyInfo."City") { }
            column(BankName; CompanyInfo."Bank Name") { }
            column(DatiCompany; 'SI') { }
            column(DatiCompany2; 'NO') { }
            column(HeaderPicture; HeaderPicture.Content) { }
            column(FooterPicture; FooterPicture.Content) { }
            column(PeriodFilter; PeriodFilter) { }
            column(PeriodFilter2; PeriodFilter) { }
            column(Date; CurrentDate) { }
            column(PrintLogo; PrintLogo) { }
        }
        dataitem(testing; "Customer")
        {
            column(Numero_Cliente; "No.")
            {

            }
            column(Nome_Cliente; "Name")
            {

            }
            column(Indirizzo_Cliente; "Address")
            {

            }
        }
        // "G/L Account Name" 
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
            column(GLAccountName_GLEntry; "G/L Account Name")
            {
            }

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
                field(PrintLogo; PrintLogo)
                {
                    ApplicationArea = All;

                }
            }
        }
    }
    // pippo
    rendering
    {
        layout(Default)
        {
            Caption = 'Default1';
            Type = RDLC;
            LayoutFile = '.\ALProject1\src\BSLHP Kontrola Sumarne_GK2.rdlc';
        }
    }
    labels
    {
        //TRANSLATE THE FOLLOWING LABELS TO SLOVENINAN / ENGLISH 
        LblReportTitle = 'Elenco Registrazioni Contabili per Conto';
        LblFilters = 'Filters';
        LblPage = 'Page';
        LblTotConto = 'Tot. Conto';
        LblTotGenerale = 'Tot. Generale';
    }
    trigger OnInitReport()
    var
        DateAsText: Text[100];
    begin
        PrintLogo := true;
        CompanyInfo.Get();
        ReportMgt.GetLogos(HeaderPicture, FooterPicture, CompanyInfo."Primary Key");
        CurrentDate := Today;
        DateAsText := Format(CurrentDate, 0, 4);
        Clear(CopyText);
        Clear(HeaderInfo);
        //Code.GetData(1)
        ReportMgt.SetHeaderInfo(CompanyInfo."Name", HeaderInfo);
        //Code.GetData(2)
        ReportMgt.SetHeaderInfo(CompanyInfo."Address", HeaderInfo);
        //Code.GetData(3)
        ReportMgt.SetHeaderInfo(CompanyInfo."City", HeaderInfo);
        //Code.GetData(4)
        ReportMgt.SetHeaderInfo(DateAsText, HeaderInfo);
        //Assign the values
        OnAfterSetHeaderInfo("CompanyInfo", CopyText, HeaderInfo);
    end;

    trigger OnPreReport()
    begin
        PeriodFilter := "G/L Entry".GetFilters; // Where Item is the table of Item
    end;

    var
        CurrentDate: Date;
        PrintLogo: Boolean;
        CompanyInfo: Record "Company Information";
        HeaderPicture, FooterPicture : Record "Tenant Media";
        HeaderInfo, BarcodeBase64, HeaderBase64, FooterBase64, AlternativeLogos : Text;
        ReportMgt: Codeunit "BSL Report Management";

        PeriodFilter: Text;
        CopyText: Text[10];

    local procedure OnAfterSetHeaderInfo(Company_Information: Record "Company Information"; CopyText: Text[50]; var HeaderInfo: Text)
    begin
    end;
}