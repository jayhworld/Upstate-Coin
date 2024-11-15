report 50001 "UPS100 Settlement Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './src/report/rdlc/UPS100 Settlement Report.rdlc';

    Caption = 'Settlement';
    UsageCategory = Documents;

    dataset
    {
        dataitem("CAI Posted Settlement Hdr."; "CAI Posted Settlement Hdr.")
        {
            DataItemTableView = SORTING(Type, "Settlement No.");
            RequestFilterFields = "Settlement No.";
            column(Logo; CompanyInformation.Picture)
            {
            }
            column(VendorName; VendorAddressLine1)
            {

            }
            column(ReportDate; TODAY)
            {

            }
            column(SettlementNo_ClosedSettlementHeader; "CAI Posted Settlement Hdr."."Settlement No.")
            {
                IncludeCaption = true;
            }
            column(LotNo_ClosedSettlementHeader; "CAI Posted Settlement Hdr."."Lot No.")
            {
                IncludeCaption = true;
            }
            column(VendorNo_ClosedSettlementHeader; "CAI Posted Settlement Hdr."."Vendor No.")
            {
                IncludeCaption = true;
            }
            column(MaterialType; "CAI Posted Settlement Hdr."."Material Type")
            {

            }
            column(Date_ClosedSettlementHeader; "CAI Posted Settlement Hdr.".Date)
            {
                IncludeCaption = true;
            }
            column(RefiningCharge_ClosedSettlementHeader; "CAI Posted Settlement Hdr."."Refining Charge")
            {
                IncludeCaption = true;
            }
            column(MarketDate_ClosedSettlementHeader; "CAI Posted Settlement Hdr."."Market Date")
            {
                IncludeCaption = true;
            }
            column(OnMetalAccount_ClosedSettlementHeader; "CAI Posted Settlement Hdr."."On Metal Account")
            {
            }
            column(DateReceived; DateReceived)
            {
            }
            column(ProcessWeight; ProcessWeight)
            {
            }
            column(ReceivedUOM; ReceivedUOM)
            {
            }
            column(WeightProcessed; WeightProcessed)
            {
            }
            column(DateProcessed; DateProcessed)
            {

            }
            column(PinWeight; PinWeight)
            {

            }
            column(NetWeightReceived; NetWeightReceived)
            {

            }
            column(VendorAddressLine1; VendorAddressLine1)
            {
            }
            column(VendorAddressLine2; VendorAddressLine2)
            {
            }
            column(VendorAddressLine3; VendorAddressLine3)
            {
            }
            column(VendorAddressLine4; VendorAddressLine4)
            {
            }
            column(VendorAddressLine5; VendorAddressLine5)
            {
            }
            column(Text001; Text001)
            {
            }
            column(MetalCaption1; MetalCaption1)
            {
            }
            column(MetalCaption2; MetalCaption2)
            {
            }
            column(MetalCaption3; MetalCaption3)
            {
            }
            column(MetalCaption4; MetalCaption4)
            {
            }
            column(MetalCaption5; MetalCaption5)
            {
            }
            column(MetalCaption6; MetalCaption6)
            {
            }
            column(MetalCaption7; MetalCaption7)
            {
            }
            column(MetalCaption8; MetalCaption8)
            {
            }
            column(MetalCaption9; MetalCaption9)
            {
            }
            column(MetalCaption10; MetalCaption10)
            {
            }
            column(MetalCaption11; MetalCaption11)
            {
            }
            column(MetalCaption12; MetalCaption12)
            {
            }
            column(MetalCaption13; MetalCaption13)
            {
            }
            column(MetalCaption14; MetalCaption14)
            {
            }
            column(MetalCaption15; MetalCaption15)
            {
            }
            column(MetalCaption16; MetalCaption16)
            {
            }
            column(MetalCaption17; MetalCaption17)
            {
            }
            column(MetalCaption18; MetalCaption18)
            {
            }
            column(MetalCaption19; MetalCaption19)
            {
            }
            column(MetalCaption20; MetalCaption20)
            {
            }
            column(MetalQty1; MetalQty1)
            {
            }
            column(MetalQty2; MetalQty2)
            {
            }
            column(MetalQty3; MetalQty3)
            {
            }
            column(MetalQty4; MetalQty4)
            {
            }
            column(MetalQty5; MetalQty5)
            {
            }
            column(MetalQty6; MetalQty6)
            {
            }
            column(MetalQty7; MetalQty7)
            {
            }
            column(MetalQty8; MetalQty8)
            {
            }
            column(MetalQty9; MetalQty9)
            {
            }
            column(MetalQty10; MetalQty10)
            {
            }
            column(MetalQty11; MetalQty11)
            {
            }
            column(MetalQty12; MetalQty12)
            {
            }
            column(MetalQty13; MetalQty13)
            {
            }
            column(MetalQty14; MetalQty14)
            {
            }
            column(MetalQty15; MetalQty15)
            {
            }
            column(MetalQty16; MetalQty16)
            {
            }
            column(MetalQty17; MetalQty17)
            {
            }
            column(MetalQty18; MetalQty18)
            {
            }
            column(MetalQty19; MetalQty19)
            {
            }
            column(MetalQty20; MetalQty20)
            {
            }
            column(CommentRow1; CommentRow[1])
            {
            }
            column(CommentRow2; CommentRow[2])
            {
            }
            column(CommentRow3; CommentRow[3])
            {
            }
            column(CommentRow4; CommentRow[4])
            {
            }
            column(CommentRow5; CommentRow[5])
            {
            }
            column(MattTypeDesc; MattTypeDesc)
            {

            }
            dataitem("CAI Posted Lot"; "CAI Posted Lot")
            {
                DataItemLink = "No." = FIELD("Lot No.");
                DataItemTableView = SORTING("No.");
                column(WeightToProcess_ClosedLot; "CAI Posted Lot"."Weight To Process")
                {
                }
                column(ReceivingUOM_ClosedLot; "CAI Posted Lot"."Receiving UOM")
                {
                }
                column(GrossWeight_ClosedLot; "CAI Posted Lot"."Gross Weight")
                {
                }
                column(DateReceived_ClosedLot; "CAI Posted Lot"."Date Received")
                {
                }
                column(CustomerRef; "CAI Posted Lot".Reference)
                {

                }
            }
            dataitem("CAI Posted Settlement Line"; "CAI Posted Settlement Line")
            {
                DataItemLink = "Settlement No." = FIELD("Settlement No.");
                DataItemLinkReference = "CAI Posted Settlement Hdr.";
                DataItemTableView = SORTING(Type, "Settlement No.", "Line No.");
                column(SettlementNo_ClosedSettlementLine; "CAI Posted Settlement Line"."Settlement No.")
                {
                }
                column(MetalType_ClosedSettlementLine; "CAI Posted Settlement Line"."Metal Type")
                {
                }
                column(GrossWeight_ClosedSettlementLine; "CAI Posted Settlement Line"."Gross Weight")
                {
                }
                column(Refiner_ClosedSettlementLine; "CAI Posted Settlement Line"."Refiner %")
                {
                }
                column(NetWeight_ClosedSettlementLine; "CAI Posted Settlement Line"."Net Weight")
                {
                }
                column(Acct_ClosedSettlementLine; "CAI Posted Settlement Line"."Acct %")
                {
                }
                column(UnitPrice_ClosedSettlementLine; "CAI Posted Settlement Line"."Unit Price")
                {
                }
                column(LineUOM; "CAI Posted Settlement Line".UOM)
                {

                }
                column(TotalValue_ClosedSettlementLine; "CAI Posted Settlement Line"."Total Value")
                {
                }
                column(PartialMA; PartialMA)
                {
                }
                column(PaidWeight_ClosedSettlementLine; "CAI Posted Settlement Line"."Paid Weight")
                {
                }
                column(AssayPct; AssayPct)
                {
                }
                dataitem("CAI Metal Type"; "CAI Metal Type")
                {
                    DataItemLink = Type = FIELD("Metal Type");
                    DataItemTableView = SORTING(Type);
                    column(Type_MetalType; "CAI Metal Type".Type)
                    {
                    }
                    column(Description_MetalType; "CAI Metal Type".Description)
                    {
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    ClosedProdOrder.SetCurrentKey("Settlement No.", "On Settlement", Settled);
                    ClosedProdOrder.SetRange("Settlement No.", "CAI Posted Settlement Hdr."."Settlement No.");
                    ClosedProdOrder.SetRange(Settled, true);
                    ClosedProdOrder.SetFilter("Prod. Order No.", CopyStr(Description, 1, 20));
                    ClosedProdOrder.CalcSums("Weight Processed", "Moisture %", "Weight to Process");
                    NetWeightReceived := ClosedProdOrder."Weight to Process";
                    if ClosedProdOrder.FindLast() then
                        DateProcessed := ClosedProdOrder."Posting Date";
                    if not ClosedProdOrder.FindFirst then
                        ClosedProdOrder.Init;


                    Clear(AssayPct);
                    ClAssayHead.Reset;
                    ClAssayHead.SetCurrentKey("No.", Type, "Assay No.");
                    ClAssayHead.SetRange("No.", ClosedProdOrder."Prod. Order No.");
                    ClAssayHead.SetFilter("Selected Assay", '%1', true);
                    if ClAssayHead.FindFirst then begin
                        ClAssayLine.Reset;
                        ClAssayLine.SetCurrentKey("No.", Type, "Assay No.", "Metal Type");
                        ClAssayLine.SetRange("No.", ClAssayHead."No.");
                        ClAssayLine.SetRange("Assay No.", ClAssayHead."Assay No.");
                        ClAssayLine.SetRange("Metal Type", "Metal Type");
                        if ClAssayLine.FindFirst then
                            AssayPct := ClAssayLine."Percentage %";
                    end;

                    //\\<REF100.003>  start
                    Clear(PartialMA);
                    if ("CAI Posted Settlement Line"."Paid Weight" <> 0) and ("CAI Posted Settlement Line"."Unit Price" = 0) then
                        PartialMA := true;
                    //\\<REF100.003>  Stop
                end;
            }
            dataitem("CAI Posted Settlement Chrg."; "CAI Posted Settlement Chrg.")
            {
                DataItemLink = "Settlement No." = FIELD("Settlement No.");
                DataItemLinkReference = "CAI Posted Settlement Hdr.";
                DataItemTableView = SORTING("Settlement No.", "Bill A/R Account", "Charge Type", Excluded);
                column(SettlementNo_ClosedRefiningCharges; "CAI Posted Settlement Chrg."."Settlement No.")
                {
                }
                column(ChargeType_ClosedRefiningCharges; "CAI Posted Settlement Chrg."."Charge Type")
                {
                }
                column(Description_ClosedRefiningCharges; "CAI Posted Settlement Chrg.".Description)
                {
                }
                column(Amount_ClosedRefiningCharges; "CAI Posted Settlement Chrg.".Amount * -1)
                {
                }
                column(BillARAccount_ClosedRefiningCharges; Format("CAI Posted Settlement Chrg."."Bill A/R Account"))
                {
                }
                column(Excluded_ClosedRefiningCharges; "CAI Posted Settlement Chrg.".Excluded)
                {
                }
                column(UnitPrice_ClosedRefiningCharges; "CAI Posted Settlement Chrg."."Unit Price")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                CodeTable.SetRange("Code Family", 'MATTYPE');
                CodeTable.SetRange(Code, "CAI Posted Settlement Hdr."."Material Type");
                if CodeTable.FindFirst() then
                    MattTypeDesc := CodeTable.Description;
                ClosedLot.Reset;
                ClosedLot.SetFilter("No.", "CAI Posted Settlement Hdr."."Lot No.");
                if ClosedLot.FindFirst then begin
                    DateReceived := ClosedLot."Date Received";
                    ProcessWeight := ClosedLot."Weight To Process";
                    ReceivedUOM := ClosedLot."Receiving UOM";
                end;

                ClosedProdOrder.SetRange("From Lot No.", "CAI Posted Settlement Hdr."."Lot No.");
                if ClosedProdOrder.FindSet() then begin
                    repeat
                        PinWeight += ClosedProdOrder."Sample Weight";
                    until ClosedProdOrder.Next() = 0;
                end;
                ClosedProdOrder.Reset();

                ClosedProdOrder.SetCurrentKey("Settlement No.", "On Settlement", Settled);
                ClosedProdOrder.SetRange("Settlement No.", "CAI Posted Settlement Hdr."."Settlement No.");
                ClosedProdOrder.SetRange(Settled, false);
                ClosedProdOrder.CalcSums("Weight Processed", "Moisture %", "Weight to Process");
                WeightProcessed := (ClosedProdOrder."Weight Processed" - ClosedProdOrder."Moisture %");
                Vendor.Reset;
                Vendor.SetFilter("No.", "CAI Posted Settlement Hdr."."Vendor No.");
                if Vendor.FindFirst then begin
                    VendorAddressLine1 := Vendor.Name;
                    VendorAddressLine2 := Vendor.Contact;
                    VendorAddressLine3 := Vendor.Address;
                    VendorAddressLine4 := Vendor."Address 2";
                    VendorAddressLine5 := Vendor.City + ', ' + Vendor.County + ' ' + Vendor."Post Code";

                    if VendorAddressLine4 = '' then begin
                        VendorAddressLine4 := VendorAddressLine5;
                        VendorAddressLine5 := '';
                    end;
                end;

                CommentLine.SetFilter("Table Name", '%1', CommentLine."Table Name"::"Closed Settlement");
                CommentLine.SetFilter("No.", "Settlement No.");
                CommentLine.SetFilter(Code, '<>%1', 'SA');
                if CommentLine.Find('-') then
                    repeat
                        CommentLineIDX := CommentLineIDX + 1;
                        if CommentLineIDX < 6 then
                            CommentRow[CommentLineIDX] := CommentLine.Comment;
                    until CommentLine.Next = 0;

                Clear(MetalQty);
                MetalAccountLedger.SetCurrentKey("Vendor No.", "Posting Date", "Entry Type", "Metal Type");
                MetalAccountLedger.SetRange("Vendor No.", "CAI Posted Settlement Hdr."."Vendor No.");
                for x := 1 to MaxMT do begin
                    MetalAccountLedger.SetRange("Metal Type", MetalCaption[x]);
                    MetalAccountLedger.CalcSums(Quantity);
                    MetalQty[x] := MetalAccountLedger.Quantity;
                end;

                MetalQty1 := MetalQty[1];
                MetalQty2 := MetalQty[2];
                MetalQty3 := MetalQty[3];
                MetalQty4 := MetalQty[4];
                MetalQty5 := MetalQty[5];
                MetalQty6 := MetalQty[6];
                MetalQty7 := MetalQty[7];
                MetalQty8 := MetalQty[8];
                MetalQty9 := MetalQty[9];
                MetalQty10 := MetalQty[10];
                MetalQty11 := MetalQty[11];
                MetalQty12 := MetalQty[12];
                MetalQty13 := MetalQty[13];
                MetalQty14 := MetalQty[14];
                MetalQty15 := MetalQty[15];
                MetalQty16 := MetalQty[16];
                MetalQty17 := MetalQty[17];
                MetalQty18 := MetalQty[18];
                MetalQty19 := MetalQty[19];
                MetalQty20 := MetalQty[20];
            end;

            trigger OnPreDataItem()
            begin
                ;
                Clear(MaxMT);
                MetalType.Reset;
                MetalType.SetCurrentKey(Sequence);
                MetalType.SetFilter(Payable, '=%1', true);
                if MetalType.Find('-') then
                    repeat
                        MaxMT := MaxMT + 1;
                        MetalCaption[MaxMT] := MetalType.Type;
                        MetalDesc[MaxMT] := MetalType.Description;
                    until (MetalType.Next = 0);

                MetalCaption1 := MetalCaption[1];
                MetalCaption2 := MetalCaption[2];
                MetalCaption3 := MetalCaption[3];
                MetalCaption4 := MetalCaption[4];
                MetalCaption5 := MetalCaption[5];
                MetalCaption6 := MetalCaption[6];
                MetalCaption7 := MetalCaption[7];
                MetalCaption8 := MetalCaption[8];
                MetalCaption9 := MetalCaption[9];
                MetalCaption10 := MetalCaption[10];
                MetalCaption11 := MetalCaption[11];
                MetalCaption12 := MetalCaption[12];
                MetalCaption13 := MetalCaption[13];
                MetalCaption14 := MetalCaption[14];
                MetalCaption15 := MetalCaption[15];
                MetalCaption16 := MetalCaption[16];
                MetalCaption17 := MetalCaption[17];
                MetalCaption18 := MetalCaption[18];
                MetalCaption19 := MetalCaption[19];
                MetalCaption20 := MetalCaption[20];
            end;

        }

    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(ShowTrace; ShowTrace)
                    {
                        ApplicationArea = All;
                        Caption = 'Show ''Trace'':';
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        RefiningFunctions.StartIt()
    end;

    trigger OnPreReport()
    begin
        CompanyInformation.Get();
        CompanyInformation.CalcFields(Picture);
    end;

    var
        CompanyInformation: Record "Company Information";
        CodeTable: Record "CAI Miscellaneous Code";
        Text001: Label '*  Refining Charges billed to Customer Account - Not Included in Total';
        RefiningFunctions: Codeunit "CAI Refining Functions";
        ShowTrace: Boolean;
        DateReceived: Date;
        ClosedLot: Record "CAI Posted Lot";
        VendorAddressLine1: Text;
        VendorAddressLine2: Text;
        VendorAddressLine3: Text;
        VendorAddressLine4: Text;
        VendorAddressLine5: Text;
        VendorAddressLine6: Text;
        Vendor: Record Vendor;
        ProcessWeight: Decimal;
        WeightProcessed: Decimal;
        ReceivedUOM: Code[10];
        ClosedProdOrder: Record "CAI Posted Prod. Order Hdr.";
        MetalType: Record "CAI Metal Type";
        MetalAccountLedger: Record "CAI Metal Account Ledger";
        MetalDescription: Text[30];
        x: Integer;
        MaxMT: Integer;
        MetalCaption: array[30] of Code[10];
        MetalDesc: array[30] of Text[30];
        MetalQty: array[30] of Decimal;
        MetalCaption1: Text[20];
        MetalCaption2: Text[20];
        MetalCaption3: Text[20];
        MetalCaption4: Text[20];
        MetalCaption5: Text[20];
        MetalCaption6: Text[20];
        MetalCaption7: Text[20];
        MetalCaption8: Text[20];
        MetalCaption9: Text[20];
        MetalCaption10: Text[20];
        MetalCaption11: Text[20];
        MetalCaption12: Text[20];
        MetalCaption13: Text[20];
        MetalCaption14: Text[20];
        MetalCaption15: Text[20];
        MetalCaption16: Text[20];
        MetalCaption17: Text[20];
        MetalCaption18: Text[20];
        MetalCaption19: Text[20];
        MetalCaption20: Text[20];
        MetalQty1: Decimal;
        MetalQty2: Decimal;
        MetalQty3: Decimal;
        MetalQty4: Decimal;
        MetalQty5: Decimal;
        MetalQty6: Decimal;
        MetalQty7: Decimal;
        MetalQty8: Decimal;
        MetalQty9: Decimal;
        MetalQty10: Decimal;
        MetalQty11: Decimal;
        MetalQty12: Decimal;
        MetalQty13: Decimal;
        MetalQty14: Decimal;
        MetalQty15: Decimal;
        MetalQty16: Decimal;
        MetalQty17: Decimal;
        MetalQty18: Decimal;
        MetalQty19: Decimal;
        MetalQty20: Decimal;
        CommentRow: array[5] of Text[80];
        CommentLineIDX: Integer;
        CommentLine: Record "CAI Comment Line";
        AssayPct: Decimal;
        ClAssayHead: Record "CAI Posted Prod. Assay Hdr.";
        ClAssayLine: Record "CAI Posted Prod. Assay Line";
        PartialMA: Boolean;
        MattTypeDesc: Text[30];
        DateProcessed: Date;
        NetWeightReceived: Decimal;
        PinWeight: Decimal;
}