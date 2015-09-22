function initPayments() {
  if (typeof gon !== 'undefined') {
    return braintree.setup(gon.client_token, 'dropin', {
      container: 'dropin'
    });
  }
};
