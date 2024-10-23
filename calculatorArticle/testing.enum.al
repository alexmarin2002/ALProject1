enum 50100 "TEST Order Status"
{
    Extensible = true; // Allows other extensions to add members to the enum
    value(0; Open)
    {
        Caption = 'Open';
    }
    value(1; Processing)
    {
        Caption = 'Processing';
    }
    value(2; Shipped)
    {
        Caption = 'Shipped';
    }
    value(3; Delivered)
    {
        Caption = 'Delivered';
    }
    value(4; Canceled)
    {
        Caption = 'Canceled';
    }
}