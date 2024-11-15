pageextension 50013 "UPS100 Posted Prod. Header" extends "CAI Posted Prod. Headers"
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