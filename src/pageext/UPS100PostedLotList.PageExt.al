pageextension 50016 "UPS100 Posted Lot List" extends "CAI Posted Lot List"
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