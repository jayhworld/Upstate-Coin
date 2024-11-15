tableextension 50010 "UPS100 Posted Prod. Order Hdr." extends "CAI Posted Prod. Order Hdr."
{
    fields
    {
        field(50000; "NetSuite P.O. No."; Code[20])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("CAI Posted Lot"."NetSuite P.O. No." where("No." = field("From Lot No.")));
        }
    }
}