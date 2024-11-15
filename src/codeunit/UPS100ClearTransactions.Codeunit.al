codeunit 50004 "UPS100 Clear Transactions"
{
    // 11/11/19 DBB - Initial version

    Permissions =
tabledata 17 = rimd,
tabledata 25 = rimd,
tabledata 380 = rimd,
tabledata 5802 = rimd;



    trigger OnRun()
    begin

        ClearAccountingTransactionData();
        ClearRefiningTransactionData();
        Done();
    end;

    var
        DateFilter: Text[50];
        GLEntry: Record "G/L Entry";
        CustLedgerEntry: Record "Cust. Ledger Entry";
        VendorLedgerEntry: Record "Vendor Ledger Entry";
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        SalesShipmentHeader: Record "Sales Shipment Header";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
        PurchRcptHeader: Record "Purch. Rcpt. Header";
        PurchInvHeader: Record "Purch. Inv. Header";
        PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr.";
        BankAccountLedgerEntry: Record "Bank Account Ledger Entry";
        CheckLedgerEntry: Record "Check Ledger Entry";
        BankAccReconciliation: Record "Bank Acc. Reconciliation";
        DetailedCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
        DetailedVendorLedgEntry: Record "Detailed Vendor Ledg. Entry";
        AppliedPaymentEntry: Record "Applied Payment Entry";
        FALedgerEntry: Record "FA Ledger Entry";
        ValueEntry: Record "Value Entry";
        //BankRecHeader: Record "Bank Rec. Header";        
        PostedBankRecHeader: Record "Posted Bank Rec. Header";
        //DepositHeader: Record "Deposit Header";
        DateAsInteger: Integer;
        MyDateExpression: Text;
        ProdOrderDetail: Record "CAI Prod. Order Routing";
        ProdOrderComment: Record "CAI Prod. Order Comment";
        ClosedProdOrderDetail: Record "CAI Posted Prod. Order Rout";
        LaborEntry: Record "CAI Production Entry";
        Lot: Record "CAI Lot";
        TransactionLedger: Record "CAI Inventory Ledger";
        TransactionJournal: Record "CAI Inventory Jnl. Line";
        ProdOrderHeader: Record "CAI Prod. Order Header";
        LotDetail: Record "CAI Lot Detail";
        LaborEntryJournal: Record "CAI Prod. Entry Jnl. Line";
        ClosedProdOrderHeader: Record "CAI Posted Prod. Order Hdr.";
        AssayLine: Record "CAI Prod. Assay Line";
        Container: Record "CAI Inventory Ledger Extend";
        ClosedLot: Record "CAI Posted Lot";
        ClosedAssayLine: Record "CAI Posted Prod. Assay Line";
        SettlementHeader: Record "CAI Settlement Header";
        SettlementLine: Record "CAI Settlement Line";
        ClosedLotDetail: Record "CAI Posted Lot Detail";
        RefiningCharges: Record "CAI Settlement Charge Line";
        RefiningExpenses: Record "CAI Settlement Expense Line";
        ClosedSettlementHeader: Record "CAI Posted Settlement Hdr.";
        ClosedSettlementLine: Record "CAI Posted Settlement Line";
        ClosedRefiningCharges: Record "CAI Posted Settlement Chrg.";
        ClosedRefiningExpenses: Record "CAI Posted Settlement Expns";
        MetalAccountLedger: Record "CAI Metal Account Ledger";
        MetalAccountJournal: Record "CAI Metal Account Jnl. Line";
        ProdTempBarrels: Record "CAI Prod. Order Invnt. Line";
        EstimatedAssayLine: Record "CAI Lot Assay Line";
        LotInTransit: Record "CAI Lot In Transit";
        EstimatedAssayHeader: Record "CAI Lot Assay Hdr.";
        AssayHeader: Record "CAI Prod. Assay Header";
        ClosedAssayHeader: Record "CAI Posted Prod. Assay Hdr.";
        WorkCenterAssay: Record "CAI Work Center Assay";
        ClosedWorkCenterAssay: Record "CAI Posted Work Cntr. Assay";
        CombinedProdOrderHeader: Record "CAI Combined Prod Order Hdr";
        CombinedProdOrderDetail: Record "CAI Combined Prod Order Rtg";
        VendorHedges: Record "CAI Vendor Hedges";
        SuggestContractHeader: Record "CAI Suggest Contract Header";
        SuggestContractDetail: Record "CAI Suggest Contract Detail";
        SuggestContractAssay: Record "CAI Suggest Contract Assay";
        AssaySummary: Record "CAI Assay Summary";
        DailyHedgeEntry: Record "CAI Daily Hedge Entry";
        MyLot: Record "CAI My Lot";
        MyProductionOrder: Record "CAI My Production Order";
        MyRefiningCustomers: Record "CAI My Refining Customer";
        MySettlements: Record "CAI My Settlement";
        ClosedEstimatedAssayLine: Record "CAI Posted Lot Assay Line";
        ClosedEstimatedAssayHeader: Record "CAI Posted Lot Assay Hdr.";
        CAIPMCSLedgerEntry: Record "CAI PMCS Ledger Entry";

    local procedure Done()
    begin
        Message('All Done');
    end;

    local procedure ClearAccountingTransactionData()
    begin
        DateFilter := '01/01/01..%1';
        GLEntry.RESET;
        GLEntry.DELETEALL(TRUE);

        CustLedgerEntry.Reset;
        CustLedgerEntry.SetFilter("Posting Date", DateFilter, Today);
        CustLedgerEntry.DeleteAll(true);

        VendorLedgerEntry.Reset;
        VendorLedgerEntry.SetFilter("Posting Date", DateFilter, Today);
        VendorLedgerEntry.DeleteAll(true);

        PurchaseHeader.Reset;
        PurchaseHeader.SetFilter("Posting Date", DateFilter, Today);
        PurchaseHeader.DeleteAll(true);

        PurchaseLine.Reset;
        PurchaseLine.DeleteAll;

        SalesShipmentHeader.Reset;
        SalesShipmentHeader.SetFilter("Posting Date", DateFilter, Today);
        SalesShipmentHeader.DeleteAll(true);

        SalesInvoiceHeader.Reset;
        SalesInvoiceHeader.SetFilter("Posting Date", DateFilter, Today);
        SalesInvoiceHeader.DeleteAll(true);

        SalesCrMemoHeader.Reset;
        SalesCrMemoHeader.SetFilter("Posting Date", DateFilter, Today);
        SalesCrMemoHeader.DeleteAll(true);

        PurchRcptHeader.Reset;
        PurchRcptHeader.SetFilter("Posting Date", DateFilter, Today);
        PurchRcptHeader.DeleteAll(true);

        PurchInvHeader.Reset;
        PurchInvHeader.SetFilter("Posting Date", DateFilter, Today);
        PurchInvHeader.DeleteAll(true);

        PurchCrMemoHdr.Reset;
        PurchCrMemoHdr.SetFilter("Posting Date", DateFilter, Today);
        PurchCrMemoHdr.DeleteAll(true);

        BankAccountLedgerEntry.Reset;
        BankAccountLedgerEntry.SetFilter("Posting Date", DateFilter, Today);
        BankAccountLedgerEntry.DeleteAll(true);

        CheckLedgerEntry.Reset;
        CheckLedgerEntry.SetFilter("Posting Date", DateFilter, Today);
        CheckLedgerEntry.DeleteAll(true);

        DetailedCustLedgEntry.Reset;
        DetailedCustLedgEntry.SetFilter("Posting Date", DateFilter, Today);
        DetailedCustLedgEntry.DeleteAll(true);

        DetailedVendorLedgEntry.Reset;
        DetailedVendorLedgEntry.SetFilter("Posting Date", DateFilter, Today);
        DetailedVendorLedgEntry.DeleteAll(true);

        AppliedPaymentEntry.Reset;
        AppliedPaymentEntry.SetFilter("Posting Date", DateFilter, Today);
        AppliedPaymentEntry.DeleteAll(true);

        FALedgerEntry.Reset;
        FALedgerEntry.SetFilter("Posting Date", DateFilter, Today);
        FALedgerEntry.DeleteAll(true);

        ValueEntry.Reset;
        ValueEntry.SetFilter("Posting Date", DateFilter, Today);
        ValueEntry.DeleteAll(true);

        /* 08-21-2024 REMOVED DURING V24 UPGRADE //JSP
        BankRecHeader.Reset;
        BankRecHeader.SetFilter("Posting Date", DateFilter, Today);
        BankRecHeader.DeleteAll(true);
        */

        PostedBankRecHeader.Reset;
        PostedBankRecHeader.SetFilter("Posting Date", DateFilter, Today);
        PostedBankRecHeader.DeleteAll(true);

        /* 08-21-2024 REMOVED DURING V24 UPGRADE //JSP
        DepositHeader.Reset;
        DepositHeader.SetFilter("Posting Date", DateFilter, Today);
        DepositHeader.DeleteAll(true);
        */
    end;

    local procedure ClearRefiningTransactionData()
    begin


        LaborEntry.DeleteAll;

        ProdOrderDetail.DeleteAll;

        ProdOrderComment.DeleteAll;

        ClosedProdOrderDetail.DeleteAll;

        Lot.DeleteAll;

        TransactionLedger.DeleteAll;

        TransactionJournal.DeleteAll;

        ProdOrderHeader.DeleteAll;

        LotDetail.DeleteAll;

        LaborEntryJournal.DeleteAll;

        ClosedProdOrderHeader.DeleteAll;

        AssayLine.DeleteAll;

        Container.DeleteAll;




        ClosedLot.DeleteAll;

        ClosedAssayLine.DeleteAll;





        SettlementHeader.DeleteAll;

        SettlementLine.DeleteAll;

        ClosedLotDetail.DeleteAll;

        RefiningCharges.DeleteAll;

        RefiningExpenses.DeleteAll;

        ClosedSettlementHeader.DeleteAll;

        ClosedSettlementLine.DeleteAll;

        ClosedRefiningCharges.DeleteAll;

        ClosedRefiningExpenses.DeleteAll;

        MetalAccountLedger.DeleteAll;

        MetalAccountJournal.DeleteAll;

        ProdTempBarrels.DeleteAll;

        EstimatedAssayLine.DeleteAll;

        LotInTransit.DeleteAll;

        EstimatedAssayHeader.DeleteAll;

        AssayHeader.DeleteAll;

        ClosedAssayHeader.DeleteAll;

        WorkCenterAssay.DeleteAll;

        ClosedWorkCenterAssay.DeleteAll;

        CombinedProdOrderHeader.DeleteAll;

        CombinedProdOrderDetail.DeleteAll;

        VendorHedges.DeleteAll;

        SuggestContractHeader.DeleteAll;

        SuggestContractDetail.DeleteAll;

        SuggestContractAssay.DeleteAll;

        AssaySummary.DeleteAll;

        DailyHedgeEntry.DeleteAll;

        MyLot.DeleteAll;

        MyProductionOrder.DeleteAll;

        MyRefiningCustomers.DeleteAll;

        MySettlements.DeleteAll;

        ClosedEstimatedAssayLine.DeleteAll;

        ClosedEstimatedAssayHeader.DeleteAll;


    end;
}

