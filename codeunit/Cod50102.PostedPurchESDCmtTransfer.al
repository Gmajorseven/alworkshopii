codeunit 50102 PostedPurchESDCmtTransfer
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPostPurchLine', '', false, false)]
    local procedure CopyToPurchInvoiceLine(var PurchaseHeader: Record "Purchase Header"; var PurchaseLine: Record "Purchase Line"; CommitIsSupressed: Boolean)
    var
        PurchInvLine: Record "Purch. Inv. Line";
    begin
        if PurchaseLine."ESD Comment" <> '' then begin
            PurchInvLine."ESD Comment" := PurchaseLine."ESD Comment";
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPurchRcptLineInsert', '', false, false)]
    local procedure CopyToPurchRcptLine(var PurchRcptLine: Record "Purch. Rcpt. Line"; PurchaseLine: Record "Purchase Line")
    begin
        if PurchaseLine."ESD Comment" <> '' then begin
            PurchRcptLine."ESD Comment" := PurchaseLine."ESD Comment";
        end;
    end;
}
