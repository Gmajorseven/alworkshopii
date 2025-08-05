codeunit 50101 PostedSalesESDCmtTransfer
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeFinalizePosting', '', false, false)]

    local procedure CopyToSalesShipmentandInv(var SalesHeader: Record "Sales Header"; var TempSalesLineGlobal: Record "Sales Line" temporary; var EverythingInvoiced: Boolean; SuppressCommit: Boolean; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line")
    var
        SalesLine: Record "Sales Line";
        SalesShipmentLine: Record "Sales Shipment Line";
        SalesInvoiceHeader: Record "Sales Invoice Header";
    begin
        SalesShipmentLine."ESD Comment" := SalesLine."ESD Comment";
        SalesInvoiceHeader."ESD Comment" := SalesLine."ESD Comment";
    end;
}
