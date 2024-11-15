pageextension 50014 "UPS100 Settlement Header Card" extends "CAI Settlement Header"
{
    layout
    {
        addlast(General)
        {
            field(netSuitePONo; Rec."NetSuite P.O. No.")
            {
                ApplicationArea = All;
                Caption = 'NetSuite P.O. No.';
            }
        }
    }
}