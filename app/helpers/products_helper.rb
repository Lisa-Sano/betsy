module ProductsHelper
  def items_for_select(items)
    items.map { |c| [c.name, c.id] }
  end
end
