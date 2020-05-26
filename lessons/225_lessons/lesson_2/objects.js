let invoices = {
  unpaid: [],
  paid: [],
  add: function(clientName, amount) {
    let client = { name: clientName, amount: amount };
    this.unpaid.push(client);
  },
};

invoices.totalDue = function() {
  // iterates over the unpaid array and computers the total amount for its' contents
  // returns total at the end of the method
  return this.unpaid.reduce(function(total, currentInvoice) {
    return total + currentInvoice.amount;
  }, 0);
};

invoices.add('Due North Development', 250);
invoices.add('Moonbeam Interactive', 187.50);
invoices.add('Slough Digital', 300);

console.log(invoices.totalDue()); // 737.5

console.log(invoices);

invoices.payInvoice = function(clientName) {
  // Loop over the unpaid invoices and check the name of each invoice
  // If the name matches, push the invoice object over to the paid property
  // If the name does not match, push the invoice object to a new array defined as a local variable in your method
  // when the loop ends, replace the existing unpaid property with the newly created array of remaining unpaid invoices

  let unpaidInvoices = [];

  this.unpaid.forEach(function(invoice) {
    if (invoice.name === clientName) {
      // invoices has to be called by name here, 'this' refers to a different context (so not the invoices object)
      invoices.paid.push(invoice);
    } else {
      unpaidInvoices.push(invoice);
    }
  });

  this.unpaid = unpaidInvoices;
}

invoices.totalPaid = function() {
  // compute and return the total of the paid invoices
  return this.paid.reduce(function(total, currentInvoice) {
    return total + currentInvoice.amount;
  }, 0);
}

console.log(invoices.totalPaid()); // this should log 250

invoices.payInvoice('Due North Development');
invoices.payInvoice('Slough Digital');

console.log(invoices.totalPaid()); // 550
console.log(invoices.totalDue()); // 187.50
