tableextension 50106 "ESDCommentSales Invoice Header" extends "Sales Invoice Header"
{
    fields
    {
        field(50100; "ESD Comment"; Text[100])
        {
            Caption = 'ESD Comment';
        }
    }
}
