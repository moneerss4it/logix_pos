
class GetLogoModel {
  String? erpUrl;
  GetLogo? getLogo;

  GetLogoModel({this.erpUrl, this.getLogo});

  GetLogoModel.fromJson(Map<String, dynamic> json) {
    erpUrl = json['erpUrl'];
    getLogo =
    json['getLogo'] != null ? new GetLogo.fromJson(json['getLogo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['erpUrl'] = this.erpUrl;
    if (this.getLogo != null) {
      data['getLogo'] = this.getLogo!.toJson();
    }
    return data;
  }
}

class GetLogo {
  int? facilityId;
  String? facilityName;
  String? facilityName2;
  String? facilityLogo;
  String? facilityPhone;
  String? facilityMobile;
  String? facilityEmail;
  String? facilitySite;
  String? facilityAddress;

  int? updateUserId;

  String? insertDate;
  String? updateDate;

  bool? flagDelete;
  String? billHeader;
  String? billFooter;
  int? accountCash;
  int? accountChequ;
  int? accountCustomer;
  int? accountInvestor;
  int? accountSupplier;
  int? accountChequUnderCollection;
  int? accountCostSales;
  int? accountSalesProfits;
  int? accountInstallmentsUnderCollection;
  int? accountInvestorProfits;
  int? accountSales;
  int? accountFeeManage;
  int? accountProfitInstallment;
  int? accountProfitInstallmentDeferred;
  int? accountMerchandiseInventory;
  int? accountCostGoodsSold;
  int? accountCashSales;
  int? accountReceivablesSales;
  int? accountInventoryTransit;
  int? accountBranches;
  String? accountNameCash;
  String? accountCodeCash;
  String? accountNameChequ;
  String? accountCodeChequ;

  String? accountNameSupplier;
  String? accountCodeSupplier;

  String? accountNameSales;
  String? accountCodeSales;

  String? accountNameCostGoodsSold;
  String? accountCodeCostGoodsSold;

  String? accountNameReceivablesSales;
  String? accountCodeReceivablesSales;

  String? accountNameCostSales;
  String? accountCodeCostSales;

  String? groupIncameName;
  String? groupIncameCode;
  String? groupExpensesName;
  String? groupExpensesCode;
  String? groupAssetsCode;
  String? groupAssetsName;
  String? groupLiabilitiesName;
  String? groupLiabilitiesCode;
  String? groupCopyrightsName;
  String? groupCopyrightsCode;
  String? accountContractorsName;
  String? accountContractorsCode;

  int? groupIncame;
  int? groupExpenses;
  int? groupAssets;
  int? groupLiabilities;
  int? groupCopyrights;
  int? accountContractors;
  int? ccIdProjects;
  int? lnkInoviceInventory;
  int? lnkBillInventroy;
  String? accountDiscountName;
  String? accountDiscountCode;
  int? discountAccountId;
  int? discountCreditAccountId;
  String? accountDiscountCreditName;
  String? accountDiscountCreditCode;

  String? logoPrint;
  String? imgFooter;
  String? idNumber;
  String? noLabourOfficeFile;
  String? commissionerName;
  int? posting;
  int? lnkReInoviceInventory;
  int? lnkReBillInventroy;
  int? lnkTransfersInventory;
  String? stamp;
  int? salesAccountType;
  int? profitAndLossAccountId;
  String? profitAndLossAccountCode;
  String? profitAndLossAccountName;
  bool? usingPurchaseAccount;
  int? purchaseAccountId;
  String? purchaseAccountCode;
  String? purchaseAccountName;
  bool? vatEnable;
  String? vatNumber;
  int? salesVatAccountId;
  String? salesVatAccountCode;
  String? salesVatAccountName;
  int? purchasesVatAccountId;
  String? purchasesVatAccountCode;
  String? purchasesVatAccountName;


  GetLogo(
      {this.facilityId,
        this.facilityName,
        this.facilityName2,
        this.facilityLogo,
        this.facilityPhone,
        this.facilityMobile,
        this.facilityEmail,
        this.facilitySite,
        this.facilityAddress,

        this.updateUserId,

        this.insertDate,
        this.updateDate,

        this.flagDelete,
        this.billHeader,
        this.billFooter,
        this.accountCash,
        this.accountChequ,
        this.accountCustomer,
        this.accountInvestor,
        this.accountSupplier,
        this.accountChequUnderCollection,
        this.accountCostSales,
        this.accountSalesProfits,
        this.accountInstallmentsUnderCollection,
        this.accountInvestorProfits,
        this.accountSales,
        this.accountFeeManage,
        this.accountProfitInstallment,
        this.accountProfitInstallmentDeferred,
        this.accountMerchandiseInventory,
        this.accountCostGoodsSold,
        this.accountCashSales,
        this.accountReceivablesSales,
        this.accountInventoryTransit,
        this.accountBranches,
        this.accountNameCash,
        this.accountCodeCash,
        this.accountNameChequ,
        this.accountCodeChequ,

        this.accountNameSupplier,
        this.accountCodeSupplier,
        this.accountNameSales,
        this.accountCodeSales,

        this.accountNameCostGoodsSold,
        this.accountCodeCostGoodsSold,

        this.accountNameReceivablesSales,
        this.accountCodeReceivablesSales,

        this.accountNameCostSales,
        this.accountCodeCostSales,
        this.groupIncameName,
        this.groupIncameCode,
        this.groupExpensesName,
        this.groupExpensesCode,
        this.groupAssetsCode,
        this.groupAssetsName,
        this.groupLiabilitiesName,
        this.groupLiabilitiesCode,
        this.groupCopyrightsName,
        this.groupCopyrightsCode,
        this.accountContractorsName,
        this.accountContractorsCode,

        this.groupIncame,
        this.groupExpenses,
        this.groupAssets,
        this.groupLiabilities,
        this.groupCopyrights,
        this.accountContractors,
        this.ccIdProjects,
        this.lnkInoviceInventory,
        this.lnkBillInventroy,
        this.accountDiscountName,
        this.accountDiscountCode,
        this.discountAccountId,
        this.discountCreditAccountId,
        this.accountDiscountCreditName,
        this.accountDiscountCreditCode,

        this.logoPrint,
        this.imgFooter,
        this.idNumber,
        this.noLabourOfficeFile,
        this.commissionerName,
        this.posting,
        this.lnkReInoviceInventory,
        this.lnkReBillInventroy,
        this.lnkTransfersInventory,
        this.stamp,
        this.salesAccountType,
        this.profitAndLossAccountId,
        this.profitAndLossAccountCode,
        this.profitAndLossAccountName,
        this.usingPurchaseAccount,
        this.purchaseAccountId,
        this.purchaseAccountCode,
        this.purchaseAccountName,
        this.vatEnable,
        this.vatNumber,
        this.salesVatAccountId,
        this.salesVatAccountCode,
        this.salesVatAccountName,
        this.purchasesVatAccountId,
        this.purchasesVatAccountCode,
        this.purchasesVatAccountName,
      });

  GetLogo.fromJson(Map<String, dynamic> json) {
    facilityId = json['facilityId'];
    facilityName = json['facilityName'];
    facilityName2 = json['facilityName2'];
    facilityLogo = json['facilityLogo'];
    facilityPhone = json['facilityPhone'];
    facilityMobile = json['facilityMobile'];
    facilityEmail = json['facilityEmail'];
    facilitySite = json['facilitySite'];
    facilityAddress = json['facilityAddress'];

    updateUserId = json['updateUserId'];

    insertDate = json['insertDate'];
    updateDate = json['updateDate'];

    flagDelete = json['flagDelete'];
    billHeader = json['billHeader'];
    billFooter = json['billFooter'];
    accountCash = json['accountCash'];
    accountChequ = json['accountChequ'];
    accountCustomer = json['accountCustomer'];
    accountInvestor = json['accountInvestor'];
    accountSupplier = json['accountSupplier'];
    accountChequUnderCollection = json['accountChequUnderCollection'];
    accountCostSales = json['accountCostSales'];
    accountSalesProfits = json['accountSalesProfits'];
    accountInstallmentsUnderCollection =
    json['accountInstallmentsUnderCollection'];
    accountInvestorProfits = json['accountInvestorProfits'];
    accountSales = json['accountSales'];
    accountFeeManage = json['accountFeeManage'];
    accountProfitInstallment = json['accountProfitInstallment'];
    accountProfitInstallmentDeferred = json['accountProfitInstallmentDeferred'];
    accountMerchandiseInventory = json['accountMerchandiseInventory'];
    accountCostGoodsSold = json['accountCostGoodsSold'];
    accountCashSales = json['accountCashSales'];
    accountReceivablesSales = json['accountReceivablesSales'];
    accountInventoryTransit = json['accountInventoryTransit'];
    accountBranches = json['accountBranches'];
    accountNameCash = json['accountNameCash'];
    accountCodeCash = json['accountCodeCash'];
    accountNameChequ = json['accountNameChequ'];
    accountCodeChequ = json['accountCodeChequ'];
       accountNameSupplier = json['accountNameSupplier'];
    accountCodeSupplier = json['accountCodeSupplier'];
    accountNameSales = json['accountNameSales'];
    accountCodeSales = json['accountCodeSales'];
      json['accountNameProfitInstallmentDeferred'];
      accountNameCostGoodsSold = json['accountNameCostGoodsSold'];
    accountCodeCostGoodsSold = json['accountCodeCostGoodsSold'];
    accountNameReceivablesSales = json['accountNameReceivablesSales'];
    accountCodeReceivablesSales = json['accountCodeReceivablesSales'];
       accountNameCostSales = json['accountNameCostSales'];
    accountCodeCostSales = json['accountCodeCostSales'];
     json['accountNameInstallmentsUnderCollection'];
     groupIncameName = json['groupIncameName'];
    groupIncameCode = json['groupIncameCode'];
    groupExpensesName = json['groupExpensesName'];
    groupExpensesCode = json['groupExpensesCode'];
    groupAssetsCode = json['groupAssetsCode'];
    groupAssetsName = json['groupAssetsName'];
    groupLiabilitiesName = json['groupLiabilitiesName'];
    groupLiabilitiesCode = json['groupLiabilitiesCode'];
    groupCopyrightsName = json['groupCopyrightsName'];
    groupCopyrightsCode = json['groupCopyrightsCode'];
    accountContractorsName = json['accountContractorsName'];
    accountContractorsCode = json['accountContractorsCode'];
    groupIncame = json['groupIncame'];
    groupExpenses = json['groupExpenses'];
    groupAssets = json['groupAssets'];
    groupLiabilities = json['groupLiabilities'];
    groupCopyrights = json['groupCopyrights'];
    accountContractors = json['accountContractors'];
    ccIdProjects = json['ccIdProjects'];
    lnkInoviceInventory = json['lnkInoviceInventory'];
    lnkBillInventroy = json['lnkBillInventroy'];
    accountDiscountName = json['accountDiscountName'];
    accountDiscountCode = json['accountDiscountCode'];
    discountAccountId = json['discountAccountId'];
    discountCreditAccountId = json['discountCreditAccountId'];
    accountDiscountCreditName = json['accountDiscountCreditName'];
    accountDiscountCreditCode = json['accountDiscountCreditCode'];
    logoPrint = json['logoPrint'];
    imgFooter = json['imgFooter'];
    idNumber = json['idNumber'];
    noLabourOfficeFile = json['noLabourOfficeFile'];
    commissionerName = json['commissionerName'];
    posting = json['posting'];
    lnkReInoviceInventory = json['lnkReInoviceInventory'];
    lnkReBillInventroy = json['lnkReBillInventroy'];
    lnkTransfersInventory = json['lnkTransfersInventory'];
    stamp = json['stamp'];
    salesAccountType = json['salesAccountType'];
    profitAndLossAccountId = json['profitAndLossAccountId'];
    profitAndLossAccountCode = json['profitAndLossAccountCode'];
    profitAndLossAccountName = json['profitAndLossAccountName'];
    usingPurchaseAccount = json['usingPurchaseAccount'];
    purchaseAccountId = json['purchaseAccountId'];
    purchaseAccountCode = json['purchaseAccountCode'];
    purchaseAccountName = json['purchaseAccountName'];
    vatEnable = json['vatEnable'];
    vatNumber = json['vatNumber'];
    salesVatAccountId = json['salesVatAccountId'];
    salesVatAccountCode = json['salesVatAccountCode'];
    salesVatAccountName = json['salesVatAccountName'];
    purchasesVatAccountId = json['purchasesVatAccountId'];
    purchasesVatAccountCode = json['purchasesVatAccountCode'];
    purchasesVatAccountName = json['purchasesVatAccountName'];
    }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['facilityId'] = this.facilityId;
    data['facilityName'] = this.facilityName;
    data['facilityName2'] = this.facilityName2;
    data['facilityLogo'] = this.facilityLogo;
    data['facilityPhone'] = this.facilityPhone;
    data['facilityMobile'] = this.facilityMobile;
    data['facilityEmail'] = this.facilityEmail;
    data['facilitySite'] = this.facilitySite;
    data['facilityAddress'] = this.facilityAddress;

    data['updateUserId'] = this.updateUserId;

    data['insertDate'] = this.insertDate;
    data['updateDate'] = this.updateDate;

    data['flagDelete'] = this.flagDelete;
    data['billHeader'] = this.billHeader;
    data['billFooter'] = this.billFooter;
    data['accountCash'] = this.accountCash;
    data['accountChequ'] = this.accountChequ;
    data['accountCustomer'] = this.accountCustomer;
    data['accountInvestor'] = this.accountInvestor;
    data['accountSupplier'] = this.accountSupplier;
    data['accountChequUnderCollection'] = this.accountChequUnderCollection;
    data['accountCostSales'] = this.accountCostSales;
    data['accountSalesProfits'] = this.accountSalesProfits;
    data['accountInstallmentsUnderCollection'] =
        this.accountInstallmentsUnderCollection;
    data['accountInvestorProfits'] = this.accountInvestorProfits;
    data['accountSales'] = this.accountSales;
    data['accountFeeManage'] = this.accountFeeManage;
    data['accountProfitInstallment'] = this.accountProfitInstallment;
    data['accountProfitInstallmentDeferred'] =
        this.accountProfitInstallmentDeferred;
    data['accountMerchandiseInventory'] = this.accountMerchandiseInventory;
    data['accountCostGoodsSold'] = this.accountCostGoodsSold;
    data['accountCashSales'] = this.accountCashSales;
    data['accountReceivablesSales'] = this.accountReceivablesSales;
    data['accountInventoryTransit'] = this.accountInventoryTransit;
    data['accountBranches'] = this.accountBranches;
    data['accountNameCash'] = this.accountNameCash;
    data['accountCodeCash'] = this.accountCodeCash;
    data['accountNameChequ'] = this.accountNameChequ;
    data['accountCodeChequ'] = this.accountCodeChequ;
data['accountNameSupplier'] = this.accountNameSupplier;
    data['accountCodeSupplier'] = this.accountCodeSupplier;

    data['accountNameSales'] = this.accountNameSales;
    data['accountCodeSales'] = this.accountCodeSales;

    data['accountNameCostGoodsSold'] = this.accountNameCostGoodsSold;
    data['accountCodeCostGoodsSold'] = this.accountCodeCostGoodsSold;

    data['accountNameReceivablesSales'] = this.accountNameReceivablesSales;
    data['accountCodeReceivablesSales'] = this.accountCodeReceivablesSales;

    data['accountNameCostSales'] = this.accountNameCostSales;
    data['accountCodeCostSales'] = this.accountCodeCostSales;

    data['groupIncameName'] = this.groupIncameName;
    data['groupIncameCode'] = this.groupIncameCode;
    data['groupExpensesName'] = this.groupExpensesName;
    data['groupExpensesCode'] = this.groupExpensesCode;
    data['groupAssetsCode'] = this.groupAssetsCode;
    data['groupAssetsName'] = this.groupAssetsName;
    data['groupLiabilitiesName'] = this.groupLiabilitiesName;
    data['groupLiabilitiesCode'] = this.groupLiabilitiesCode;
    data['groupCopyrightsName'] = this.groupCopyrightsName;
    data['groupCopyrightsCode'] = this.groupCopyrightsCode;
    data['accountContractorsName'] = this.accountContractorsName;
    data['accountContractorsCode'] = this.accountContractorsCode;
  data['groupIncame'] = this.groupIncame;
    data['groupExpenses'] = this.groupExpenses;
    data['groupAssets'] = this.groupAssets;
    data['groupLiabilities'] = this.groupLiabilities;
    data['groupCopyrights'] = this.groupCopyrights;
    data['accountContractors'] = this.accountContractors;
    data['ccIdProjects'] = this.ccIdProjects;
    data['lnkInoviceInventory'] = this.lnkInoviceInventory;
    data['lnkBillInventroy'] = this.lnkBillInventroy;
    data['accountDiscountName'] = this.accountDiscountName;
    data['accountDiscountCode'] = this.accountDiscountCode;
    data['discountAccountId'] = this.discountAccountId;
    data['discountCreditAccountId'] = this.discountCreditAccountId;
    data['accountDiscountCreditName'] = this.accountDiscountCreditName;
    data['accountDiscountCreditCode'] = this.accountDiscountCreditCode;

    data['logoPrint'] = this.logoPrint;
    data['imgFooter'] = this.imgFooter;
    data['idNumber'] = this.idNumber;
    data['noLabourOfficeFile'] = this.noLabourOfficeFile;
    data['commissionerName'] = this.commissionerName;
    data['posting'] = this.posting;
    data['lnkReInoviceInventory'] = this.lnkReInoviceInventory;
    data['lnkReBillInventroy'] = this.lnkReBillInventroy;
    data['lnkTransfersInventory'] = this.lnkTransfersInventory;
    data['stamp'] = this.stamp;
    data['salesAccountType'] = this.salesAccountType;
    data['profitAndLossAccountId'] = this.profitAndLossAccountId;
    data['profitAndLossAccountCode'] = this.profitAndLossAccountCode;
    data['profitAndLossAccountName'] = this.profitAndLossAccountName;
    data['usingPurchaseAccount'] = this.usingPurchaseAccount;
    data['purchaseAccountId'] = this.purchaseAccountId;
    data['purchaseAccountCode'] = this.purchaseAccountCode;
    data['purchaseAccountName'] = this.purchaseAccountName;
    data['vatEnable'] = this.vatEnable;
    data['vatNumber'] = this.vatNumber;
    data['salesVatAccountId'] = this.salesVatAccountId;
    data['salesVatAccountCode'] = this.salesVatAccountCode;
    data['salesVatAccountName'] = this.salesVatAccountName;
    data['purchasesVatAccountId'] = this.purchasesVatAccountId;
    data['purchasesVatAccountCode'] = this.purchasesVatAccountCode;
    data['purchasesVatAccountName'] = this.purchasesVatAccountName;

    return data;
  }
}
