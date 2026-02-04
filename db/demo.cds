namespace anubhavdb;

using {anubhavdb.commons as spiderman} from './commons';
using {cuid,temporal,managed  } from '@sap/cds/common';



context master {

    
    //first table for storing student data
    entity student: spiderman.address{
        key ID: spiderman.Guid;
        NAME: String(80);
        CLASS: Association to one standards;
        GENDER: String(1);
    }

    entity standards{
        Key ID: Int16;
        CLASSNAME: String(10);
        SECTIONS:Int16;
        CLASSTEACHER:String(80);
    }
    entity books{
        key ID: spiderman.Guid;
        BOOKNAME:String(30);
        AUTHOR:String(80);
    }

}

context trans{
    entity rentals: cuid, temporal, managed{
        student: Association to master.student;
        book: Association to master.books;

    }
}