pageextension 50105 "Inventory By Location" extends "Planning Worksheet"
{
    layout
    {
        addfirst(FactBoxes)
        {
            part(InventoryFactbox; "Inventory by Location FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "Item No." = field("No."), "Location Code" = field("Location Code");
                // UpdatePropagation = Both;

            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        CurrPage.InventoryFactbox.Page.Update(Rec."No.", Rec."Location Code");
    end;

}
