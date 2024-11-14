report 50005 MyReportTesting
{
    Caption = 'Testing Reports';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = './src/layout/LayoutName.rdl';
    dataset
    {

        dataitem("Cliente"; "Customer")
        {

            DataItemTableView = sorting("No.");

            // Link "Customer" to the "Value Entry" table via "Entry No."
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
    trigger OnInitReport()
    begin


    end;

    var
        myInt: Integer;
}