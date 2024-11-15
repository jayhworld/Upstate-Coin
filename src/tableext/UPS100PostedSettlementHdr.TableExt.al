tableextension 50007 "UPS100PostedSettlementHdr" extends "CAI Posted Settlement Hdr."
{
    fields
    {
        field(50000; "NetSuite P.O. No."; Code[20])
        {
            Caption = 'NetSuite P.O. No.';
            FieldClass = FlowField;
            CalcFormula = lookup("CAI Posted Lot"."NetSuite P.O. No." WHERE("No." = FIELD("Lot No.")));
            Editable = false;

        }
    }
}