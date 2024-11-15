codeunit 50001 "UPS100 Event Subscribers"
{
    [EventSubscriber(ObjectType::Page, Page::"CAI Settlement Header", 'OnAfterActionEvent', '&Calculate Metal Lines', true, true)]
    procedure ResetAccountabilitOnAfterCalculateMetalLines(var Rec: Record "CAI Settlement Header")
    var
        SettlementLines: Record "CAI Settlement Line";
    begin
        SettlementLines.SetRange(Type, Rec.Type);
        SettlementLines.SetRange("Settlement No.", Rec."Settlement No.");
        SettlementLines.SetFilter(Hedged, '=%1', false);
        if SettlementLines.FindSet() then
            repeat
                SettlementLines.Validate("Acct %", 0);
                SettlementLines.Modify(true);
            until SettlementLines.Next() = 0;
    end;

    [EventSubscriber(ObjectType::Page, Page::"CAI Settlement Header", 'OnAfterActionEvent', '&Calculate Contract Terms', true, true)]
    local procedure PurgeLinesOnAfterCalculateRefiningCharges(var Rec: Record "CAI Settlement Header")
    var
        SettlementLines: Record "CAI Settlement Line";
    begin
        SettlementLines.SetRange(Type, Rec.Type);
        SettlementLines.SetRange("Settlement No.", Rec."Settlement No.");
        SettlementLines.SetFilter(Hedged, '=%1', false);
        SettlementLines.SetRange("Acct %", 0);
        if SettlementLines.FindSet() then
            SettlementLines.DeleteAll;
    end;

    [EventSubscriber(ObjectType::Table, Database::"CAI Lot", 'OnAfterInsertEvent', '', true, true)]
    local procedure CreateHedgesOnAfterInsertLot(Rec: Record "CAI Lot")
    var
        DailyMetalPrice: Record "CAI Daily Metal Price";
        LotHedges: Record "CAI Lot Hedges";
        MetalsToPrice: List of [Code[10]];
        Metal: Code[10];
        MyHedgeNo: Code[20];
    begin
        MetalsToPrice.Add('AU');
        MetalsToPrice.Add('AG');
        MetalsToPrice.Add('PT');
        MetalsToPrice.Add('PD');
        foreach Metal in MetalsToPrice do begin
            if DailyMetalPrice.Get(Today, Metal) then begin
                Clear(LotHedges);
                LotHedges.Init();
                LotHedges."Lot No." := Rec."No.";
                LotHedges."Vendor No." := Rec."Vendor No.";
                LotHedges."Metal Type" := Metal;
                LotHedges."Hedge Date" := TODAY;
                LotHedges."Unit Price" := DailyMetalPrice."Price ($)";
                LotHedges.Insert(true);
            end;
        end;
    end;
}