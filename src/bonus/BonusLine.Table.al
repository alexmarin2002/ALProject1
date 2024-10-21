table 50001 "MNB Bonus Line"
{
    caption = ' MNB Bonus Line ';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Document no"; Code[20])
        {
            caption = ' Document No. ';
        }
        field(2; type; enum "MNB Bonus Line Type")
        {
            caption = ' Type ';
            DataClassification = CustomerContent;
        }
        field(3; "Item no."; code[20])
        {
            caption = ' Bonus Perc. ';
            TableRelation = if (type = filter(item)) item;
        }
        field(4; " Bonus Perc. "; Integer)
        {
            caption = ' Bonus Perc. ';
            DataClassification = CustomerContent;
            MinValue = 0;
            MaxValue = 0;
        }
    }
    keys
    {
        key(PK; "Document No", Type, "Item No.")
        {
            Clustered = true;
        }
    }
}