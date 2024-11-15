table 50000 "UPS100 Lot Profitability"
{
    ///
    ///Used as a temp support table for preparation of the Lot Profitability Report
    DataClassification = CustomerContent;
    TableType = Temporary;

    fields
    {
        field(1; Type; enum "LotProfit Type")
        {
        }
        field(2; LotNo; code[20])
        {
        }
        field(3; Metal; Code[10])
        {

        }
        field(4; Purity; Decimal)
        {

        }
        field(5; Ozt; Decimal)
        {
        }
        field(6; EntryNo; Integer)
        {
        }
    }

    keys
    {
        key(Key1; Type, LotNo, Metal, EntryNo)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}