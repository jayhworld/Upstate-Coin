codeunit 50005 "UPS100 Lot Profit Functions"
{
    SingleInstance = true;

    procedure GetOSRAssayValues(OSRLotNo: code[20]; var AssayValues: Record "UPS100 Lot Profitability" temporary)
    var
        ClosedLot: Record "CAI Posted Lot";
        PostedProdOrder: Record "CAI Posted Prod. Order Hdr.";
        PostedAssay: Record "CAI Posted Prod. Assay Hdr.";
        PostedAssayLines: Record "CAI Posted Prod. Assay Line";
        LineNo: Integer;
    begin
        PostedProdOrder.SetRange("From Lot No.", OSRLotNo);
        PostedProdOrder.FindFirst();
        PostedAssay.SetRange("No.", PostedProdOrder."Prod. Order No.");
        PostedAssay.SetRange("Selected Assay", true);
        PostedAssay.FindFirst();
        PostedAssayLines.SetRange("No.", PostedAssay."No.");
        PostedAssayLines.SetRange("Assay No.", PostedAssay."Assay No.");
        PostedAssayLines.FindSet();
        repeat
            LineNo += 10;
            WriteAssayLines(LineNo, AssayValues.type::OSR, OSRLotNo, PostedAssayLines."Metal Type", PostedAssayLines."Percentage %", PostedAssayLines.Quantity, AssayValues);
        until PostedAssayLines.Next() = 0;
    end;

    procedure GetCustAssayValues(LotFilter: text; var AssayValues: Record "UPS100 Lot Profitability" temporary)
    var
        InventoryLedger: Record "CAI Inventory Ledger";
        ILRecRef: RecordRef;
        BucketNo: Integer;
        FldNo: Integer;
        FldValue: Decimal;
        FirstFldNo: Integer;
        LastFldNo: Integer;
        FirstFldNoPercent: Integer;
        FldValuePercent: Decimal;
        MaxLimit: Integer;
    begin
        InventoryLedger.SetFilter("No.", LotFilter);
        InventoryLedger.FindSet();
        MetalType.FindSet();
        MaxLimit := MetalType.Count;
        MetalType.reset;
        FirstFldNo := InventoryLedger.FieldNo("Metal Type 1");
        FirstFldNoPercent := InventoryLedger.FieldNo("Metal Type 1 %");
        LastFldNo := FirstFldNo + MaxLimit - 1;
        ILRecRef.GetTable(InventoryLedger);
        repeat
            Clear(BucketNo);
            for FldNo := FirstFldNo to LastFldNo do begin
                BucketNo += 1;
                Evaluate(FldValue, Format(ILRecRef.Field(FldNo)));
                Evaluate(FldValuePercent, Format((ILRecRef.Field(FirstFldNoPercent + (BucketNo - 1)))));
                if FldValue > 0 then begin
                    MetalType.SetRange(Bucket, BucketNo);
                    MetalType.FindFirst();
                    WriteAssayLines(InventoryLedger."Entry No.", AssayValues.Type::CustLot, InventoryLedger."No.", MetalType.Type, FldValuePercent, FldValue, AssayValues);
                end;
            end;
        until (InventoryLedger.Next() = 0);
    end;

    procedure GetVariances(var AssayValues: Record "UPS100 Lot Profitability" temporary)
    var
        myAssayValues: Record "UPS100 Lot Profitability" temporary;
        CustValues: Record "UPS100 Lot Profitability" temporary;
        myVariance: Decimal;
        LineNo: Integer;
    begin
        myAssayValues.DeleteAll();
        myAssayValues := AssayValues;
        CustValues := AssayValues;
        AssayValues.SetRange(Type, AssayValues.Type::OSR);
        AssayValues.FindSet();
        repeat
            LineNo += 10;
            CustValues.SetRange(Type, CustValues.type::CustLot);
            CustValues.SetRange(Metal, AssayValues.Metal);
            CustValues.CalcSums(Ozt);
            myVariance := AssayValues.Ozt - CustValues.Ozt;
            WriteAssayLines(LineNo, AssayValues.Type::Variance, '', AssayValues.Metal, 0, myVariance, myAssayValues)
        until AssayValues.Next() = 0;
        myAssayValues.FindSet();
        repeat
            AssayValues.TransferFields(myAssayValues, true);
            AssayValues.Insert();
        until myAssayValues.Next() = 0;
    end;

    procedure GetLotFilter(OSRLotNo: Code[20]; var CustLotFilter: Text)
    var
        myInventoryLedgerEntry: Record "CAI Inventory Ledger";
    begin
        myInventoryLedgerEntry.SetRange("Lot No.", OSRLotNo);
        if myInventoryLedgerEntry.FindSet() then
            repeat
                CustLotFilter := CustLotFilter + myInventoryLedgerEntry."No." + '|';
            until myInventoryLedgerEntry.Next() = 0;
        CustLotFilter := DelChr(CustLotFilter, '>', '|');
    end;

    local procedure WriteAssayLines(EntryNo: Integer; Type1: Enum "LotProfit Type"; LotNo: code[20]; Metal: code[10]; Purity: Decimal; Ozt: Decimal; var AssayValues: Record "UPS100 Lot Profitability")
    var
    begin
        AssayValues.Type := Type1;
        AssayValues.LotNo := LotNo;
        AssayValues.Metal := Metal;
        AssayValues.Purity := Purity;
        AssayValues.Ozt := Ozt;
        AssayValues.EntryNo := EntryNo;
        AssayValues.Insert();
    end;

    var
        MetalType: Record "CAI Metal Type";
        RefiningSetup: Record "CAI Refining Setup";
}