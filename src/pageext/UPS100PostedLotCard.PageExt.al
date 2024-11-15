pageextension 50003 "UPS100PostedLotCard" extends "CAI Posted Lot Card"
{
    layout
    {
        addafter("Hold Material")
        {
            field("NetSuite P.O. No."; Rec."NetSuite P.O. No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }
}