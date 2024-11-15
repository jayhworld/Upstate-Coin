pageextension 50011 "UPS100Vendor Contract Hdr Lst" extends "CAI Vendor Contract Hdr Lst"
{
    layout
    {
        //nothing needed here....
    }
    actions
    {
        addlast("&Contract")
        {
            action("&Copy Contract")
            {
                ApplicationArea = All;
                Caption = 'C&opy Contract';
                Image = ServiceTasks;

                trigger OnAction()
                var
                    VndContHdr: Record "CAI Vendor Contract Header";
                begin
                    VndContHdr.Reset();
                    VndContHdr.SetFilter("Vendor No.", Rec."Vendor No.");
                    VndContHdr.SetFilter("Contract No.", Rec."Contract No.");
                    IF VndContHdr.FindFirst() then
                        REPORT.RunModal(50000, True, False, VndContHdr);
                end;
            }
        }
    }
}