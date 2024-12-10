report 50006 "BSL BSLHP Kontrola Sumarne/GK"
{
    Caption = 'kontrola Sumarne/GK';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Permissions = TableData "Sales Shipment Buffer" = rimd;
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
            column(Date; CurrentDate) { }
            column(PrintLogo; PrintLogo) { }
        }
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
                        case Show of
                            Show::Account:
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
            Caption = 'Default';
            Type = RDLC;
            LayoutFile = '.\ALProject1\src\BSLHP Kontrola Sumarne_GK.rdlc'; //change to your rdlc directory location
        }
    }
    labels
    {
        //TRANSLATE THE FOLLOWING LABELS TO SLOVENINAN / ENGLISH 
        LblReportTitle = 'Elenco valorizzazioni Costi';  //report Title
        LblFilters = 'Filters';   //self explanatory 
        LblPage = 'Page';  //self explanatory 
        LblTotCategoria = 'Tot. Categoria';  //total category amount 
        LblTotGenerale = 'Tot. Generale';  //total general amount
    }
    trigger OnInitReport()
    var
        DateAsText: Text[100];
    begin
        PrintLogo := true;
        CompanyInfo.Get();
        ReportMgt.GetLogos(HeaderPicture, FooterPicture, CompanyInfo."Primary Key");
        CurrentDate := WorkDate();
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
        PeriodFilter := "Value Entry".GetFilters; // Where Item is the table of Item
    end;

    var
        Show: Option Both,Account,"Balance Account";
        PrintLogo: Boolean;
        CurrentDate: Date;
        CompanyInfo: Record "Company Information";
        HeaderPicture, FooterPicture : Record "Tenant Media";
        HeaderInfo, BarcodeBase64, HeaderBase64, FooterBase64, AlternativeLogos : Text;
        ReportMgt: Codeunit "BSL Report Management";
        CopyText: Text[10];
        PeriodFilter: Text;

    local procedure OnAfterSetHeaderInfo(Company_Information: Record "Company Information"; CopyText: Text[50]; var HeaderInfo: Text)
    begin
    end;
}