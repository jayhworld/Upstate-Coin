pageextension 50008 "UPS100RefCentralRoleCenter" extends "CAI Central Role Center"
{

    actions
    {
        addafter("Periodic Activities")
        {
            group(Lists)
            {
                action("Vendor Metal Balances") { RunObject = Page "UPS100 Vendor Metal Balances"; ApplicationArea = All; }
            }
        }
        // Add changes to page actions here
    }

}