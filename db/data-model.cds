namespace anubhav.db;

using {cuid,temporal,managed,Currency} from '@sap/cds/common';

using{anubhavdb.commons as common} from './commons';

context master{
    entity businesspartner{
        key NODE_KEY: common.Guid;
        BP_ROLE: String(2);
        EMAIL_ADDRESS: String(105);
        PHONE_NUMBER:String(32);
        FAX_NUMBER:String(32);
        WEB_ADDRESS:String(42);
        BP_ID:String(32);
        COMPANY_NAME:String(250);
        ADDRESS_GUID: Association to address;
    }

    entity address{
        key NODE_KEY: common.Guid;
        CITY: String(44);
        POSTAL_CODE:String(8);
        STREET:String(44);
        BUILDING:String(128);
        COUNTRY:String(44);
        VAL_START_DATE:Date;
        VAL_END_DATE:Date;
        LATITUDE:Decimal;
        LONGITUDE:Decimal;
        businesspartner:Association to one businesspartner on businesspartner.ADDRESS_GUID = $self
    }

    entity product{
        key NODE_KEY: common.Guid;
        PRODUCT_ID:String(28);
        TYPE_CODE:String(2);
        CATEGORY:String(32);
        DESCRIPTION:localized String(255);
        SUPPLIER_GUID:Association to master.businesspartner;
        TAX_TARIF_CODE: Integer;
        MEASURE_UNIT: String(32);
        WEIGHT_UNIT:String(2);
        WEIGHT_MEASURE:Decimal(5,2);
        CURRENCY_CODE:String(4);
        PRICE:Decimal(15,2);
        WIDTH:Decimal(5,2);
        HEIGHT:Decimal(5,2);
        DEPTH:Decimal(5,2);
        DIM_UNIT:String(2); 
    }

    entity employees: cuid{
        nameFirst: String(40);
        nameMiddle:String(40);
        nameSecond: String(40);
        nameIntials: String(40);
        sex: common.Gender;
        language:String(1);
        phoneNumber: common.PhoneNumber;
        email: common.EmailAddress;
        loginName: String(12);
        Currency: Currency;
        salaryAmount: common.AmountT;
        accountNumber:String(16);
        bankId:String(8);
        bankName:String(64);    

}
}
context transaction{
        entity purchaseorder: common.Amount{
            key NODE_KEY: common.Guid;
            PO_ID: String(40);
            PARTNER_GUID: Association to master.businesspartner;
            LIFE_STATUS: String(1);
            OVERALL_STATUS:String(1);
            Items: Association to many poitems on Items.PARENT_KEY = $self
        }

        entity poitems: common.Amount{
            key NODE_KEY: common.Guid;
            PARENT_KEY: Association to purchaseorder;
            PO_ITEMS_POS: Integer;
            PRODUCT_GUID: Association to master.product;

        }
   }
