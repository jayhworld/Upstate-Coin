pageextension 50002 "UPS100LotCard" extends "CAI Lot Card"
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