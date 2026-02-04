using {anubhavdb.master as master, 
    anubhavdb.trans as transaction } from '../db/demo';

service Myservice{

    entity StudentSet as projection on master.student;
    entity StandardSet as projection on master.standards;
    entity BookSet as projection on master.books;
    entity Bookrentalset as projection on transaction.rentals;
}