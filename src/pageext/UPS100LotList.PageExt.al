pageextension 50015 "UPS100 Lot List" extends "CAI Lot List"
{
    layout
    {
        addlast(Control1)
        {
            field(netSuitePO; Rec."NetSuite P.O. No.")
            {
                ApplicationArea = All;
                Caption = 'NetSuite P.O. No.';
            }
        }
    }
}