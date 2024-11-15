tableextension 50009 "UPS100 Prod. Order Header" extends "CAI Prod. Order Header"
{
    fields
    {
        field(50000; "NetSuite P.O. No."; Code[20])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("CAI Lot"."NetSuite P.O. No." where("No." = field("From Lot No.")));
        }
    }
}