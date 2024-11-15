page 50003 "UPS100PostedSettlementLines"
{
    PageType = ListPart;
    DelayedInsert = true;
    PopulateAllFields = true;
    UsageCategory = Lists;
    SourceTable = "CAI Posted Settlement Line";
    ODataKeyFields = "Settlement No.", "Line No.";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(settlementNo; Rec."Settlement No.")
                {
                    ApplicationArea = All;
                }
                field(lineNo; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field(metalType; Rec."Metal Type")
                {
                    ApplicationArea = All;
                }
                field(grossWeight; Rec."Gross Weight")
                {
                    ApplicationArea = All;
                }
                field(netWeight; Rec."Net Weight")
                {
                    ApplicationArea = All;
                }
                field(acctpercent; Rec."Acct %")
                {
                    ApplicationArea = All;
                }
                field(paidWeight; Rec."Paid Weight")
                {
                    ApplicationArea = All;
                }
                field(unitPrice; Rec."Unit Price")
                {
                    ApplicationArea = All;
                }
                field(totalValue; Rec."Total Value")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}