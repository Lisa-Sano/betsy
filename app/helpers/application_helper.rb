module ApplicationHelper
  def to_money(price_in_cents)
    "$" + sprintf('%.2f', (price_in_cents / 100))
  end
end
