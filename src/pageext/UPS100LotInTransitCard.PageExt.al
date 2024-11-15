pageextension 50001 "UPS100LotInTransitCard" extends "CAI Lot In Transit Card"
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
            field("Material Type"; Rec."Material Type")
            {
                ApplicationArea = All;
                TableRelation = "CAI Miscellaneous Code".Code WHERE("Code Family" = CONST('MATTYPE'),
                                                                    "Code Seq" = FILTER(> 0));
            }
        }
    }
}