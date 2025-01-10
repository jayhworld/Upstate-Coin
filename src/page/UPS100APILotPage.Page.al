page 50002 "UPS100APILotPage"
{
    APIGroup = 'NetSuite';
    APIPublisher = 'CAISoftware';
    APIVersion = 'v2.0';
    Caption = 'apiLotPage';
    DelayedInsert = true;
    EntityName = 'lot';
    EntitySetName = 'lots';
    PageType = API;
    SourceTable = "CAI Lot";
    ODataKeyFields = SystemId;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(vendorNo; Rec."Vendor No.")
                {
                    Caption = 'Vendor No.';
                }
                field(reference; Rec.Reference)
                {
                    Caption = 'Reference';
                }
                field(houseLotType; Rec."House Lot Type")
                {
                    Caption = 'House Lot Type';
                }
                field(uOM; Rec.API_UOM)
                {
                    Caption = 'UOM';
                }
                field(netSuitePONo; Rec."NetSuite P.O. No.")
                {
                    Caption = 'NetSuite P.O. No.';
                }
                part(DetailLines; "UPS100APILotDetailLines")
                {
                    ApplicationArea = All;
                    Caption = 'Details', Locked = true;
                    EntityName = 'lotDetail';
                    EntitySetName = 'lotDetails';
                    SubPageLink = "Lot SysID" = FIELD(SystemID);
                }

            }
        }
    }

}
