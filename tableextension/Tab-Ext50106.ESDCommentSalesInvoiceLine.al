tableextension 50106 "ESDCommentSales Invoice Line" extends "Sales Invoice Line"
{
    fields
    {
        field(50100; "ESD Comment"; Text[100])
        {
            Caption = 'ESD Comment';
        }
    }
}
