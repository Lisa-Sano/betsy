require 'HTTParty'

class ShippingWrapper

  def self.get_rates(destination, weight)
    origin = {:country => "US", :state => "WA", :city => "Seattle", :zip => "98103"}
    #standardizing shipping dimensions
    package = {:weight => weight, :length => 20, :width => 20, :height => 20, :units => "metric"}

    data = HTTParty.get("https://betsy-shipping-service.herokuapp.com/shipping_rates",
         :headers => { 'Accept' => 'application/json' },
         :body => { :destination => {:country => 'US', :state => destination.state, :city => destination.city, :zip => destination.zip },
                   :origin => origin,
                   :package => package})
    return data
  end
end