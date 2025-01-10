tableextension 50002 "UPS100Lot" extends "CAI Lot"
{
    fields
    {
        field(50000; "NetSuite P.O. No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50001; "NetSuite Internal ID No."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(50002; "API_UOM"; Code[10])
        {
        }
    }
    trigger OnAfterInsert()
    begin
        if API_UOM <> '' then begin
            "Receiving UOM" := API_UOM;
            Modify()
        end;
    end;
}