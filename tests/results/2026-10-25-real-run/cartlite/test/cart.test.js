const test = require('node:test');
const assert = require('node:assert');
const { cartTotal, applyCoupon } = require('../src/cart');

test('sums line totals', () => {
  assert.strictEqual(cartTotal([{priceCents: 500, qty: 2}, {priceCents: 250, qty: 1}]), 1250);
});
test('percent coupon', () => {
  assert.strictEqual(applyCoupon(1000, {type: 'percent', value: 10}), 900);
});
test('fixed coupon', () => {
  assert.strictEqual(applyCoupon(1000, {type: 'fixed', value: 300}), 700);
});
