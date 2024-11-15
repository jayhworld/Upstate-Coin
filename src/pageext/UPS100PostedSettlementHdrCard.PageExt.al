pageextension 50010 "UPS100PostedSettlementHdrCard" extends "CAI Posted Settlement Hdr"
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