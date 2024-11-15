pageextension 50012 "UPS100 Prod. Order Header Card" extends "CAI Prod. Order Hdr Card"
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