page 50004 "UPS100 Vendor Metal Balances"
{
    PageType = List;
    Caption = 'Vendor Metal Balances';
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Vendor";
    SourceTableView = where("CAI Refining Customer" = CONST(true));

    layout
    {
        area(Content)
        {
            group(Balances)
            {
                repeater(Rows)
                {

                    field("Vendor No."; Rec."No.")
                    {
                        ApplicationArea = All;
                        Editable = false;
                    }
                    field("Vendor Name"; Rec.Name)
                    {
                        ApplicationArea = All;
                        Editable = false;
                    }
                    field("Total 1"; Bal01)
                    {
                        ApplicationArea = All;
                        Caption = 'Bal01';
                        CaptionClass = '1,5,,' + MetalCaption01;
                        Editable = false;
                        Visible = ShowBalance01;
                    }
                    field("Total 2"; Bal02)
                    {
                        ApplicationArea = All;
                        Caption = 'Bal02';
                        CaptionClass = '1,5,,' + MetalCaption02;
                        Editable = false;
                        Visible = ShowBalance02;
                    }
                    field("Total 3"; Bal03)
                    {
                        ApplicationArea = All;
                        Caption = 'Bal03';
                        CaptionClass = '1,5,,' + MetalCaption03;
                        Editable = false;
                        Visible = ShowBalance03;
                    }
                    field("Total 4"; Bal04)
                    {
                        ApplicationArea = All;
                        Caption = 'Bal04';
                        CaptionClass = '1,5,,' + MetalCaption04;
                        Editable = false;
                        Visible = ShowBalance04;
                    }
                    field("Total 5"; Bal05)
                    {
                        ApplicationArea = All;
                        Caption = 'Bal05';
                        CaptionClass = '1,5,,' + MetalCaption05;
                        Editable = false;
                        Visible = ShowBalance05;
                    }
                    field("Total 6"; Bal06)
                    {
                        ApplicationArea = All;
                        Caption = 'Bal06';
                        CaptionClass = '1,5,,' + MetalCaption06;
                        Editable = false;
                        Visible = ShowBalance06;
                    }
                    field("Total 7"; Bal07)
                    {
                        ApplicationArea = All;
                        Caption = 'Bal07';
                        CaptionClass = '1,5,,' + MetalCaption07;
                        Editable = false;
                        Visible = ShowBalance07;
                    }
                    field("Total 8"; Bal08)
                    {
                        ApplicationArea = All;
                        Caption = 'Bal08';
                        CaptionClass = '1,5,,' + MetalCaption08;
                        Editable = false;
                        Visible = ShowBalance08;
                    }
                    field("Total 9"; Bal09)
                    {
                        ApplicationArea = All;
                        Caption = 'Bal09';
                        CaptionClass = '1,5,,' + MetalCaption09;
                        Editable = false;
                        Visible = ShowBalance09;
                    }
                    field("Total 10"; Bal10)
                    {
                        ApplicationArea = All;
                        Caption = 'Bal10';
                        CaptionClass = '1,5,,' + MetalCaption10;
                        Editable = false;
                        Visible = ShowBalance10;
                    }

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Refresh)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        GetMetalTypes();
        SetColumnHeaders();
        DisplayMetalColumns();
    end;

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        GetMetalBalances(Rec."No.");
    end;


    local procedure GetMetalTypes()
    var
        MetalData: JsonArray;
    begin
        MetalTypeRec.Reset();
        MetalTypeRec.SetCurrentKey(Sequence);
        MetalTypeRec.SetRange("Payable", true);
        if MetalTypeRec.FindSet then
            repeat
                ReportMetalTypes.Add(MetalTypeRec.Type);
            until MetalTypeRec.Next = 0;
        MetalTypeCount := MetalTypeRec.Count;
    end;

    local procedure GetMetalBalances(VendorNo: Code[20])
    var
        jt: JsonToken;
        MetalTypeCode: Code[10];
    begin
        if MetalTypeCount >= 1 then begin
            ReportMetalTypes.Get(0, jt);
            Bal01 := GetMetalBalance(VendorNo, DelChr(format(jt.AsValue.AsText()), '=', '"'));
        end;
        if MetalTypeCount >= 2 then begin
            ReportMetalTypes.Get(1, jt);
            Bal02 := GetMetalBalance(VendorNo, DelChr(format(jt.AsValue.AsText()), '=', '"'));
        end;
        if MetalTypeCount >= 3 then begin
            ReportMetalTypes.Get(2, jt);
            Bal03 := GetMetalBalance(VendorNo, DelChr(format(jt.AsValue.AsText()), '=', '"'));
        end;
        if MetalTypeCount >= 4 then begin
            ReportMetalTypes.Get(3, jt);
            Bal04 := GetMetalBalance(VendorNo, DelChr(format(jt.AsValue.AsText()), '=', '"'));
        end;
        if MetalTypeCount >= 5 then begin
            ReportMetalTypes.Get(4, jt);
            Bal05 := GetMetalBalance(VendorNo, DelChr(format(jt.AsValue.AsText()), '=', '"'));
        end;
        if MetalTypeCount >= 6 then begin
            ReportMetalTypes.Get(5, jt);
            Bal05 := GetMetalBalance(VendorNo, DelChr(format(jt.AsValue.AsText()), '=', '"'));
        end;
        if MetalTypeCount >= 7 then begin
            ReportMetalTypes.Get(6, jt);
            Bal05 := GetMetalBalance(VendorNo, DelChr(format(jt.AsValue.AsText()), '=', '"'));
        end;
        if MetalTypeCount >= 8 then begin
            ReportMetalTypes.Get(7, jt);
            Bal05 := GetMetalBalance(VendorNo, DelChr(format(jt.AsValue.AsText()), '=', '"'));
        end;
        if MetalTypeCount >= 9 then begin
            ReportMetalTypes.Get(8, jt);
            Bal05 := GetMetalBalance(VendorNo, DelChr(format(jt.AsValue.AsText()), '=', '"'));
        end;
        if MetalTypeCount >= 10 then begin
            ReportMetalTypes.Get(9, jt);
            Bal05 := GetMetalBalance(VendorNo, DelChr(format(jt.AsValue.AsText()), '=', '"'));
        end;
    end;

    local procedure GetMetalBalance(VendorNo: Code[20]; MetalType: Code[10]): Decimal
    var
        MetalAccountLedger: Record "CAI Metal Account Ledger";
        myBucket: Integer;
    begin
        MetalTypeRec.Get(MetalType);
        myBucket := MetalTypeRec.Bucket;
        MetalAccountLedger.SetRange("Vendor No.", VendorNo);
        MetalAccountLedger.SetRange("Metal Bucket", myBucket);
        MetalAccountLedger.CalcSums(Quantity);
        exit(MetalAccountLedger.Quantity);
    end;

    local procedure SetColumnHeaders()
    var
        jt: JsonToken;
    begin
        //MetalCaption01
        if MetalTypeCount >= 1 then begin
            ReportMetalTypes.Get(0, jt);
            MetalCaption01 := format(jt.AsValue().AsText());
        end;
        if MetalTypeCount >= 2 then begin
            ReportMetalTypes.Get(1, jt);
            MetalCaption02 := format(jt.AsValue().AsText());
        end;
        if MetalTypeCount >= 3 then begin
            ReportMetalTypes.Get(2, jt);
            MetalCaption03 := format(jt.AsValue().AsText());
        end;
        if MetalTypeCount >= 4 then begin
            ReportMetalTypes.Get(3, jt);
            MetalCaption04 := format(jt.AsValue().AsText());
        end;
        if MetalTypeCount >= 5 then begin
            ReportMetalTypes.Get(4, jt);
            MetalCaption05 := format(jt.AsValue().AsText());
        end;
        if MetalTypeCount >= 6 then begin
            ReportMetalTypes.Get(5, jt);
            MetalCaption06 := format(jt.AsValue().AsText());
        end;
        if MetalTypeCount >= 7 then begin
            ReportMetalTypes.Get(6, jt);
            MetalCaption07 := format(jt.AsValue().AsText());
        end;
        if MetalTypeCount >= 8 then begin
            ReportMetalTypes.Get(7, jt);
            MetalCaption08 := format(jt.AsValue().AsText());
        end;
        if MetalTypeCount >= 9 then begin
            ReportMetalTypes.Get(8, jt);
            MetalCaption09 := format(jt.AsValue().AsText());
        end;
        if MetalTypeCount >= 10 then begin
            ReportMetalTypes.Get(9, jt);
            MetalCaption10 := format(jt.AsValue().AsText());
        end;
    end;

    procedure DisplayMetalColumns()
    begin
        ShowBalance01 := MetalTypeCount >= 1;
        ShowBalance02 := MetalTypeCount >= 2;
        ShowBalance03 := MetalTypeCount >= 3;
        ShowBalance04 := MetalTypeCount >= 4;
        ShowBalance05 := MetalTypeCount >= 5;
        ShowBalance06 := MetalTypeCount >= 6;
        ShowBalance07 := MetalTypeCount >= 7;
        ShowBalance08 := MetalTypeCount >= 8;
        ShowBalance09 := MetalTypeCount >= 9;
        ShowBalance10 := MetalTypeCount >= 10;
    end;

    var
        MetalTypeRec: Record "CAI Metal Type";
        MetalAccountLedger: Record "CAI Metal Account Ledger";
        ReportMetalTypes: JsonArray;
        MetalTypeCount: Integer;
        Bal01: Decimal;
        Bal02: Decimal;
        Bal03: Decimal;
        Bal04: Decimal;
        Bal05: Decimal;
        Bal06: Decimal;
        Bal07: Decimal;
        Bal08: Decimal;
        Bal09: Decimal;
        Bal10: Decimal;
        ShowBalance01: Boolean;
        ShowBalance02: Boolean;
        ShowBalance03: Boolean;
        ShowBalance04: Boolean;
        ShowBalance05: Boolean;
        ShowBalance06: Boolean;
        ShowBalance07: Boolean;
        ShowBalance08: Boolean;
        ShowBalance09: Boolean;
        ShowBalance10: Boolean;
        MetalCaption01: Text[10];
        MetalCaption02: Text[10];
        MetalCaption03: Text[10];
        MetalCaption04: Text[10];
        MetalCaption05: Text[10];
        MetalCaption06: Text[10];
        MetalCaption07: Text[10];
        MetalCaption08: Text[10];
        MetalCaption09: Text[10];
        MetalCaption10: Text[10];
}