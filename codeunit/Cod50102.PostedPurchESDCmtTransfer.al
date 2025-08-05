codeunit 50102 PostedPurchESDCmtTransfer
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnBeforeFinalizePosting', '', false, false)]
    local procedure CopyToPurchaseReceipt(var PurchaseHeader: Record "Purchase Header"; var TempPurchLineGlobal: Record "Purchase Line" temporary; var EverythingInvoiced: Boolean; CommitIsSupressed: Boolean; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line")
    var
        PurchaseLine: Record "Purchase Line";
        PurchRcptLine: Record "Purch. Rcpt. Line";
        PurchInvHeader: Record "Purch. Inv. Header";
    begin
        PurchRcptLine."ESD Comment" := PurchaseLine."ESD Comment";
        PurchInvHeader."ESD Comment" := PurchaseLine."ESD Comment";
    end;
}
