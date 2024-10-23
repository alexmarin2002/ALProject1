permissionSet 50000 "Bonus Registration."
{
    Caption = 'Bonus Registration';
    Assignable = true;
    Permissions = tabledata "MNB Bonus Header" = RIMD,
    tabledata "MNB Bonus Line" = RIMD,
    tabledata "TEST Calculations Header" = RIMD,
    tabledata "TEST CalculatorTable" = RIMD;
}