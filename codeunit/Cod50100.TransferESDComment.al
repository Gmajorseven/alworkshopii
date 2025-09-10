codeunit 50100 TransferESDComment
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterInitHeaderDefaults', '', false, false)]
    local procedure CopyCustomerComments(var SalesLine: Record "Sales Line"; SalesHeader: Record "Sales Header")
    var
        Customer: Record Customer;
        SalesandRecivableSetup: Record "Sales & Receivables Setup";
        ConfirmQst: Label 'Do you want to insert the comment Yes/No?';
    begin
        SalesandRecivableSetup.Get();
        if Confirm(ConfirmQst) then begin
            SalesandRecivableSetup."Confirmation for ESD Comment" := true;
            if SalesandRecivableSetup."Confirmation for ESD Comment" then
                if Customer.Get(SalesHeader."Sell-to Customer No.") then
                    if Customer."Transfer Comment" then
                        SalesLine."ESD Comment" := Customer."ESD Comment";
        end
        else
            SalesandRecivableSetup."Confirmation for ESD Comment" := false;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterInitHeaderDefaults', '', false, false)]
    local procedure CopyVendorComments(var PurchLine: Record "Purchase Line"; PurchHeader: Record "Purchase Header")
    var
        Vendor: Record Vendor;
        SalesandRecivableSetup: Record "Sales & Receivables Setup";
        ConfirmQst: Label 'Do you want to insert the comment Yes/No?';
    begin
        SalesandRecivableSetup.Get();
        if Confirm(ConfirmQst) then begin
            SalesandRecivableSetup."Confirmation for ESD Comment" := true;
            if SalesandRecivableSetup."Confirmation for ESD Comment" then
                if Vendor.Get(PurchHeader."Buy-from Vendor No.") then
                    if Vendor."Transfer Comment" then
                        PurchLine."ESD Comment" := Vendor."ESD Comment";
        end
        else
            SalesandRecivableSetup."Confirmation for ESD Comment" := false;
    end;
}
