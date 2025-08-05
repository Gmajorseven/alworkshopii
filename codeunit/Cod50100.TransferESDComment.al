codeunit 50100 TransferESDComment
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterInitHeaderDefaults', '', false, false)]
    local procedure CopyCustomerComments(var SalesLine: Record "Sales Line"; SalesHeader: Record "Sales Header")
    var
        Customer: Record Customer;
    begin
        if Customer.Get(SalesHeader."Sell-to Customer No.") then begin
            if Customer."Transfer Comment" then
                SalesLine."ESD Comment" := Customer."ESD Comment";
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterInitHeaderDefaults', '', false, false)]
    local procedure CopyVendorComments(var PurchLine: Record "Purchase Line"; PurchHeader: Record "Purchase Header")
    var
        Vendor: Record Vendor;
    begin
        if Vendor.Get(PurchHeader."Buy-from Vendor No.") then begin
            if Vendor."Transfer Comment" then
                PurchLine."ESD Comment" := Vendor."ESD Comment";
        end;
    end;
}
