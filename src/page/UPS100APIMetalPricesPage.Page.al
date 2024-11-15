page 50008 "UPS100APIMetalPricesPage"
{
    APIGroup = 'NetSuite';
    APIPublisher = 'CAISoftware';
    APIVersion = 'v2.0';
    Caption = 'apiMetalPricesPage';
    DelayedInsert = true;
    EntityName = 'dailyMetalPrice';
    EntitySetName = 'dailyMetalPrices';
    PageType = API;
    SourceTable = "CAI Daily Metal Price";
    ODataKeyFields = SystemId;
    ModifyAllowed = true;
    DeleteAllowed = false;
    EntityCaption = 'DailyMetalPrice';
    EntitySetCaption = 'DailyMetalPrices';
    Editable = true;



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
                field(metalType; Rec."Metal Type")
                {
                    Caption = 'Metal Type';
                    ApplicationArea = All;
                }
                field(date; Rec."Date")
                {
                    Caption = 'Date';
                    ApplicationArea = All;
                }
                field(price; Rec."Price ($)")
                {
                    Caption = 'Price ($)';
                    ApplicationArea = All;
                }
                field(market; Rec.Market)
                {
                    Caption = 'Market';
                    ApplicationArea = All;
                }
                field(unitOfMeasure; Rec.UOM)
                {
                    Caption = 'UOM';
                    ApplicationArea = All;
                }
                field(uomFactor; Rec."UOM Factor")
                {
                    Caption = 'UOM Factor';
                    ApplicationArea = All;
                }
            }
        }
    }
}
