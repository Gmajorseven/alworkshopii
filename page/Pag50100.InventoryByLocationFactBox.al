page 50100 "Inventory By Location FactBox"
{
    PageType = CardPart;
    SourceTable = "Item Ledger Entry";
    SourceTableTemporary = true;
    Caption = 'Inventory by Location';
    Editable = false;

    layout
    {
        area(Content)
        {
            field("Item No."; Rec."Item No.")
            {
                ApplicationArea = Planning;
                Visible = false;
            }
            field("Location Code"; Rec."Location Code")
            {
                ApplicationArea = Planning;
                Visible = false;
            }
            field("Remaining Quantity"; Rec."Remaining Quantity")
            {
                ApplicationArea = Planning;
            }

        }
    }
    var

        GlobalItemNo: Code[20];
        GlobalLocationCode: Code[20];

    procedure FilData()
    var
        LocationCode: Code[20];
        RemaimingQty: Decimal;
        num: Integer;
        LocationList: List of [Code[20]];
        ILE: Record "Item Ledger Entry";
    begin
        Rec.DeleteAll();
        ILE.Reset();
        ILE.SetCurrentKey("Location Code");
        ILE.SetAscending("Location Code", true);
        ILE.SetRange("Item No.", GlobalItemNo);
        ILE.SetRange("Location Code", GlobalLocationCode);
        if ILE.FindSet() then
            repeat
                if not LocationList.Contains(ILE."Location Code") then
                    LocationList.Add(ILE."Location Code");
            until ILE.Next() = 0;

        for num := 1 to LocationList.Count() do begin
            LocationCode := LocationList.Get(num);
            ILE.SetRange("Location Code", LocationCode);
            RemaimingQty := 0;
            ILE.CalcSums(Quantity);
            RemaimingQty := ILE.Quantity;

            Rec.Init();
            Rec."Entry No." := num;
            Rec."Item No." := GlobalItemNo;
            Rec."Location Code" := LocationCode;
            Rec."Remaining Quantity" := RemaimingQty;
            Rec.Insert();
        end;
    end;

    internal procedure Update(ItemNo: Code[20]; LocationCode: Code[20])
    begin
        GlobalItemNo := ItemNo;
        GlobalLocationCode := LocationCode;
        FilData();
    end;
}
