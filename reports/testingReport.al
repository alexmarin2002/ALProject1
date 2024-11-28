report 50005 MyReportTesting
{
    Caption = 'Testing Reports';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    // RDLCLayout = './src/layout/LayoutName.rdl';
    dataset
    {
        dataitem("Cliente"; "Customer")
        {

            // DataItemTableView = SORTING("No."); //WHERE(City <> '');
            DataItemTableView = SORTING("City") WHERE("Name" = FILTER(<> ''));
            // Link "Customer" to the "Value Entry" table via "Entry No."
            // DataItemLinkReference ="Cliente".No.; 
            // DataItemLink = "Value Entry"."Entry No." = field("Entry No."); // Link "Entry No." to "Value Entry" field

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
                if "Name" = '' then begin
                    //  Name := 'NO NAME Is empty!!!!';
                    // CurrReport.Skip;
                end;

            end;
        }
        dataitem("Company Information"; "Company Information")
        {
            DataItemTableView = SORTING("Phone No.");
            RequestFilterFields = "Phone No.", "Address 2", "Name";

            column(Company_name; "Name")
            {

            }
            column(HeaderInfo; HeaderInfo)
            {

            }
            column(Logo; "Picture")
            {

            }
            column(phone_number; "Phone No.")
            {

            }
            column(Address_2; "Address 2")
            {

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
        CompanyName2: Record "Company Information";
        HeaderInfo: Text;

    trigger OnInitReport()
    begin

    end;
}