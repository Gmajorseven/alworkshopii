codeunit 50101 PostedSalesESDCmtTransfer
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesLine', '', false, false)]
    local procedure CopyToSalesInvoiceLine(var SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line"; CommitIsSuppressed: Boolean)
    var
        SalesInvLine: Record "Sales Invoice Line";
    begin
        if SalesLine."ESD Comment" <> '' then begin
            SalesInvLine."ESD Comment" := SalesLine."ESD Comment";
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesShptLineInsert', '', false, false)]
    local procedure CopyToSalesShipmentLine(var SalesShipmentLine: Record "Sales Shipment Line"; SalesLine: Record "Sales Line")
    begin
        if SalesLine."ESD Comment" <> '' then begin
            SalesShipmentLine."ESD Comment" := SalesLine."ESD Comment";
        end;
    end;
}
