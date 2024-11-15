page 50000 "UPS100APIPostedSettlementHdr"
{
    PageType = API;
    Caption = 'API Posted Settlement Header';
    APIPublisher = 'CAISoftware';
    APIGroup = 'NetSuite';
    APIVersion = 'v2.0';
    EntityName = 'postedSettlement';
    EntitySetName = 'postedSettlements';
    SourceTable = "CAI Posted Settlement Hdr.";
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(systemId; Rec.SystemId)
                {
                    ApplicationArea = All;
                    Caption = 'SystemId';
                }
                field(type; Rec.Type)
                {
                    ApplicationArea = All;
                    Caption = 'Type';
                }
                field(settlementNo; Rec."Settlement No.")
                {
                    ApplicationArea = All;
                    Caption = 'Settlement No.';
                }
                field(vendorNo; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor No.';
                }
                field(vendorName; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor Name';
                }
                field(lotNo; Rec."Lot No.")
                {
                    ApplicationArea = All;
                    Caption = 'Lot No.';
                }
                field(netSuitePoNo; Rec."NetSuite P.O. No.")
                {
                    ApplicationArea = All;
                    Caption = 'NetSuite P.O. No.';
                }
                field(onMetalAccount; Rec."On Metal Account")
                {
                    ApplicationArea = All;
                    Caption = 'On Metal Account';
                }
                part(settlementLines; "UPS100PostedSettlementLines")
                {
                    ApplicationArea = All;
                    Caption = 'Settlement Lines';
                    EntityName = 'postedSettlementLine';
                    EntitySetName = 'postedSettlementLines';
                    SubPageLink = "Settlement No." = FIELD("Settlement No.");
                }
            }
        }
    }
}