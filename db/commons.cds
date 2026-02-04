namespace anubhavdb.commons;

using { Currency } from '@sap/cds/common';

/* ---------- Reusable Types ---------- */

type Guid : UUID;

type Gender : String(1) enum {
    male        = 'M';
    female      = 'F';
    undisclosed = 'U';
};

type PhoneNumber : String(30)
    @assert.format : '^\+?[0-9]{1,3}?[- .]?\(?[0-9]{1,4}\)?[- .]?[0-9]{3,4}[- .]?[0-9]{4}$';

type EmailAddress : String(80)
    @assert.format : '^[A-Za-z0-9._%+-]+@(?!gmail\.com$|yahoo\.com$|outlook\.com$)[A-Za-z0-9.-]+\.[A-Za-z]{2,}$';

/* ---------- Amount ---------- */

type AmountT : Decimal(10,2)
    @( Semantic.amount.currencyCode : 'CURRENCY',
       sap.unit : 'CURRENCY' );

aspect Amount {
    CURRENCY      : Currency;
    GROSS_AMOUNT  : AmountT @(title:'Gross Amount');
    NET_AMOUNT    : AmountT @(title:'Net Amount');
    TAX_AMOUNT    : AmountT @(title:'Tax Amount');
}

/* ---------- Address ---------- */

aspect address {
    HOUSENO : Int32;
    STREET  : String(32);
    CITY    : String(80);
    COUNTRY : String(2);
}
