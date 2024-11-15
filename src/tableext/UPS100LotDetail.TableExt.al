tableextension 50004 "UPS100 Lot Detail" extends "CAI Lot Detail"
{
    fields
    {
        field(50000; "Lot SysId"; Guid)
        {
            TableRelation = "CAI Lot".SystemId;
        }
        modify("Gross Weight")
        {
            trigger OnBeforeValidate()
            begin
                CheckHeaderStatus();
            end;
        }
    }

    var
        MyLot: Record "CAI Lot";

    local procedure CheckHeaderStatus()
    begin
        GetHeader();
    end;

    local procedure GetHeader()
    begin
        if MyLot.SystemId <> Rec."Lot SysId" then
            MyLot.GetBySystemId(Rec."Lot SysId");
    end;

}