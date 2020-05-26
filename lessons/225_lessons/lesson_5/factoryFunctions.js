// 1. What are the two disadvantages of working with factory functions?
// - Cannot tell if an object was created from a factory function
// - Each object has a full copy of all the methods, which might be redundant

// 2. Rewrite the code below to use object-literal syntax to generate the returned object:

function makeObj() {
  var obj = {};
  obj.propA = 10;
  obj.propB = 20;
  return obj;
}

function makeObj() {
  return {
    propA: 10,
    propB: 20,
  };
}

// 3.
function createInvoice(services) {
  // implement the factory function here
  var phone;
  var internet;

  if (services) {
    phone = services.phone;
    internet = services.internet;
  }

  return {
    phone: phone || 3000,
    internet: internet || 5500,
    total: function() {
      return this.phone + this.internet;
    },
  };
}

function invoiceTotal(invoices) {
  var total = 0;
  var i;

  for (i = 0; i < invoices.length; i += 1) {
    total += invoices[i].total();
  }

  return total;
}

var invoices = [];
invoices.push(createInvoice());
invoices.push(createInvoice({
  internet: 6500,
}));

invoices.push(createInvoice({
  phone: 2000,
}));

invoices.push(createInvoice({
  phone: 1000,
  internet: 4500,
}));

console.log(invoiceTotal(invoices));             // => 31000

// 4.
function createPayment(services) {
  // implement the factory function here
  var services = services || {};

  return {
    internet: services.internet || 0,
    phone: services.phone || 0,
    amount: services.amount,
    total: function() {
      return this.amount || (this.internet + this.phone);
    },
  };
}

function paymentTotal(payments) {
  var total = 0;
  var i;

  for (i = 0; i < payments.length; i += 1) {
    total += payments[i].total();
  }

  return total;
}

var payments = [];
payments.push(createPayment());
payments.push(createPayment({
  internet: 6500,
}));

payments.push(createPayment({
  phone: 2000,
}));

payments.push(createPayment({
  phone: 1000,
  internet: 4500,
}));

payments.push(createPayment({
  amount: 10000,
}));

console.log(paymentTotal(payments));      // => 24000

// 5.

function createInvoice(services) {
  // implement the factory function here
  var phone;
  var internet;
  var amount = 0;

  if (services) {
    phone = services.phone;
    internet = services.internet;
  }

  return {
    phone: phone || 3000,
    internet: internet || 5500,
    total: function() {
      return this.phone + this.internet;
    },
    addPayment: function(payment) {
      amount += payment.total();
    },
    addPayments: function(payments) {
      payments.forEach(function(payment) {
        amount += payment.total();
      });
    },
    paymentTotal: function() {
      return amount;
    },
    amountDue: function() {
      return this.total() - this.paymentTotal();
    },
  };
}

var invoice = createInvoice({
  phone: 1200,
  internet: 4000,
});

var payment1 = createPayment({
  amount: 2000,
});

var payment2 = createPayment({
  phone: 1000,
  internet: 1200,
});

var payment3 = createPayment({
  phone: 1000,
});

invoice.addPayment(payment1);
invoice.addPayments([payment2, payment3]);
console.log(invoice.amountDue());       // this should return 0
