pageextension 50104 ConfirmationforESDComment extends "Sales & Receivables Setup"
{
    layout
    {
        addlast(General)
        {
            field("Confirmation for ESD Comment"; Rec."Confirmation for ESD Comment")
            {
                ApplicationArea = All;
                ToolTip = 'Enter any comments related to the ESD (Enterprise Solutions & Development) for this sales & purchase order.';
                // trigger OnValidate()
                // var
                //     ConfirmQst: Label 'Do you want to insert the comment Yes/No?';
                // begin
                //     if Confirm(ConfirmQst) then
                //         Rec."Confirmation for ESD Comment" := true
                //     else
                //         Rec."Confirmation for ESD Comment" := false;
                // end;
            }
        }
    }
}
