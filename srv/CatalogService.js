module.exports = cds.service.impl(async function(){

    const {POs,EmployeeSet} = this.entities;

    this.on('boost', async(req)=>{
        console.log('aa gaya');
       
           try {
            const ID = req.params[0];
             //start a db transaction
            const tx = cds.tx(req);
            //CDS Query Language - communicate to DB in agnostic manner

            await tx.update(POs).with({
                GROSS_AMOUNT:{ '+=' :2000}
            }).where(ID);
           } 
           catch (error) {
            return "Error"+ error.toString();
           }
    });

    this.on('largestOrder', async(req)=>{
        console.log('aa gaya');
       
           try {
            //start a new DB transaction
            const tx = cds.tx(req);
            //Read the PO with the highest gross amount
            //Read orders desc by gross + get the first record
            const recordData = tx.read(POs).orderBy({
                GROSS_AMOUNT: 'desc'
            }).limit(1);
           } 
           catch (error) {
            return "Error"+ error.toString();
           }
    });

    this.before(['CREATE', 'PATCH'], EmployeeSet, (req) => {

    const salary = Number(req.data.salaryAmount);

    if (salary > 100000) {
      req.reject(400, 'Salary cannot be greater than 100000');
    }
})
})