report 50003 "BSL MyReportTesting SADASDAS"
{
    Caption = 'Report 2AO';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = './src/layout/LayoutName.rdl';
    dataset
    {
        dataitem(HeaderData; "Integer")
        {
            DataItemTableView = sorting(Number);
            MaxIteration = 1;
            column(HeaderInfo; HeaderInfo) { }
            dataitem("Cliente"; "Customer")
            {
                //  DataItemTableView = SORTING("No."); //WHERE(City <> '');
                DataItemTableView = SORTING("City") WHERE("Name" = FILTER(<> ''));
                //  Link "Customer" to the "Value Entry" table via "Entry No."
                //  DataItemLinkReference ="Cliente".No.; 
                //  DataItemLink = "Value Entry"."Entry No." = field("Entry No."); // Link "Entry No." to "Value Entry" field

                RequestFilterFields = "No.";
                column(Numero_Cliente; "No.")
                {

                }
                column(Nome_Cliente; "Name")
                {

                }
                column(Indirizzo_Cliente; "Address")
                {

                }
                column(Città_Cliente; "City")
                {

                }

                trigger OnAfterGetRecord()

                begin
                    Clear(CopyText);
                    Clear(HeaderInfo);
                    ReportMgt.SetHeaderInfo("Name", HeaderInfo);
                    //5
                    ReportMgt.SetHeaderInfo("Address", HeaderInfo);
                    //6
                    ReportMgt.SetHeaderInfo("Address 2", HeaderInfo);
                    //7
                    ReportMgt.SetHeaderInfo("City", HeaderInfo);
                    //8
                    OnAfterSetHeaderInfo2("Cliente", CopyText, HeaderInfo);
                end;
            }
        }
    }
    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        actions
        {
            area(processing)
            {
                action(LayoutName)
                {

                }
            }
        }
    }
    var
        myInt: Integer;
        reportmgt: Codeunit "BSL Report Management";
        HeaderInfo, BarcodeBase64, HeaderBase64, FooterBase64, AlternativeLogos : Text;
        CompanyInfo: Record "Customer";
        CopyText: Text[10];

    local procedure OnAfterSetHeaderInfo2(Customer: Record "Customer"; CopyText: Text[50]; var HeaderInfo: Text)
    begin
    end;
}