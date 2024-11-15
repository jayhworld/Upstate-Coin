Report 50000 "Copy Vendor Contract"
{
    Caption = 'Copy Vendor Contract';
    ProcessingOnly = True;

    dataset
    {
        dataitem("CAI Vendor Contract Header"; "CAI Vendor Contract Header")
        {
            DataItemTableView = SORTING("Vendor No.", "Contract No.");

            trigger OnAfterGetRecord()
            begin
                ContractDetail.SETRANGE("Vendor No.", "Vendor No.");
                ContractDetail.SETRANGE("Contract No.", "Contract No.");

                IF RefCustNo = '' THEN
                    ERROR('Copy to Vendor No. cannot be Blank');

                ContractHeaderII.init;
                ContractHeaderII.TransferFields("CAI Vendor Contract Header");
                ContractHeaderII."Vendor No." := RefCustNo;
                ContractHeaderII."Contract No." := '';
                ContractHeaderII.Insert(true);

                IF ContractDetail.FINDSET THEN
                    REPEAT
                        ContractDetailII.TRANSFERFIELDS(ContractDetail);
                        ContractDetailII."Vendor No." := RefCustNo;
                        ContractDetailII."Contract No." := ContractHeaderII."Contract No.";
                        ContractDetailII.INSERT;
                    UNTIL ContractDetail.NEXT = 0;

                VendorRec.GET(ContractHeaderII."Vendor No.");

                MESSAGE('Contract Copied to ' + VendorRec.Name + ' (' + VendorRec."No." + ')');

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Copy Selected Contract To:';
                    field(RefCustNo; RefCustNo)
                    {
                        ApplicationArea = All;
                        Caption = 'Refining Customer Vendor No.:';
                        TableRelation = Vendor."No." where("CAI Refining Customer" = CONST(True));
                    }
                }
            }
        }

        actions
        {
        }
    }

    var
        myInt: Integer;
        RefCustNo: Code[20];
        VendorRec: Record Vendor;
        ContractDetail: Record "CAI Vendor Contract Detail";
        ContractHeaderII: Record "CAI Vendor Contract Header";
        ContractDetailII: Record "CAI Vendor Contract Detail";
}