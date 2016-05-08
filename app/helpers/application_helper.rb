module ApplicationHelper
  def to_money(price_in_cents)
    return nil if price_in_cents.nil?
    "$" + sprintf('%.2f', (price_in_cents / 100.0))
  end
end
