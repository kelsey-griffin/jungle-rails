module SalesHelper
  def active_sale?
    Sale.active.any?
  end

  def active_sale_name
    Sale.active[0].name
  end 
  
  def active_sale_percent
    Sale.active[0].percent_off
  end
end