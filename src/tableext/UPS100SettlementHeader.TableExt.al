tableextension 50012 "UPS100 Settlement Header" extends "CAI Settlement Header"
{
    fields
    {
        field(50000; "NetSuite P.O. No."; Code[20])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("CAI Posted Lot"."NetSuite P.O. No." where("No." = field("Lot No.")));
        }
    }
}