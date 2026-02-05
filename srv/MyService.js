const cds = require('@sap/cds');
const { employees } = cds.entities("anubhav.db.master");

module.exports = (srv) => {

  srv.on('pokymon', req => `Hello ${req.data.name}`);

  srv.on('READ', 'ReadEmployeeSrv', async (req) => {
    // return {
    //   "ID": "2222-22",
    //   "nameFirst": "pikachu"
    // };

    // Calling DB and adding extra logic
        const tx = await cds.tx(req);
        var returndata = [];

        var results = await tx.run(
        SELECT.from(employees).limit(5)
        );

        for (let i = 0; i < results.length; i++) {
        const element = results[i];

        element.nameMiddle = 'badhiya!';
        returndata.push(element);
        }

        return returndata;

        });

};
