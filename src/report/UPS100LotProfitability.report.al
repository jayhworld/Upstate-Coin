report 50003 "UPS100 Lot Profitability"
{
    DefaultLayout = RDLC;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = './src/report/rdlc/UPS100 Lot Profitability.rdlc';
    Caption = 'Lot Profitability Report';

    dataset
    {
        dataitem("Closed Lot"; "CAI Posted Lot")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";


            trigger OnAfterGetRecord() //"Closed Lot"  
            begin
            end;

        }
        dataitem("UPS100 Lot Profitability"; "UPS100 Lot Profitability")
        {
            column(Type; "UPS100 Lot Profitability".Type)
            {

            }
            column(LotNo; "UPS100 Lot Profitability".LotNo)
            {

            }
            column(Metal; "UPS100 Lot Profitability".Metal)
            {

            }
            column(Purity; "UPS100 Lot Profitability".Purity)
            {

            }
            column(Ozt; "UPS100 Lot Profitability".Ozt)
            {

            }
            trigger OnPreDataItem()
            begin
            end;
        }
    }

    requestpage
    {
        AboutTitle = 'House Lot Profitability';
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(Option)
                {

                }
            }
        }


    }

    var
        MetalType: Record "CAI Metal Type";
        LotProfitFunctions: Codeunit "UPS100 Lot Profit Functions";
        myOSRLot: Record "CAI Posted Lot";
        OSRLotFilter: text;
        CustLotFilter: text;
        CustLotList: List of [code[10]];
        OSRCharges: Decimal;

    trigger OnPreReport()
    begin
        OSRLotFilter := "Closed Lot".GetFilter("No.");
        LotProfitFunctions.GetLotFilter(OSRLotFilter, CustLotFilter);
        LotProfitFunctions.GetOSRAssayValues(OSRLotFilter, "UPS100 Lot Profitability");
        LotProfitFunctions.GetCustAssayValues(CustLotFilter, "UPS100 Lot Profitability");
        LotProfitFunctions.GetVariances("UPS100 Lot Profitability");
    end;

}