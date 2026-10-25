// Cartlite: tiny cart totals. Prices are integer cents.
function lineTotal(item) {
  return item.priceCents * item.qty;
}

function applyCoupon(subtotalCents, coupon) {
  if (!coupon) return subtotalCents;
  if (coupon.type === 'percent') {
    return subtotalCents - Math.round(subtotalCents * coupon.value / 100);
  }
  if (coupon.type === 'fixed') {
    return subtotalCents - coupon.value;
  }
  return subtotalCents;
}

function cartTotal(items, coupons = []) {
  let total = items.reduce((sum, i) => sum + lineTotal(i), 0);
  for (const c of coupons) total = applyCoupon(total, c);
  return total;
}

module.exports = { lineTotal, applyCoupon, cartTotal };
