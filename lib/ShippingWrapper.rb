require 'HTTParty'

class ShippingWrapper
 BASE_URL = ""

 def self.get_rates(destination, weight)
  origin = {:state => "WA", :city => "Seattle", :zip => "98103"}
  package = {:weight}
  data = HTTParty.get(BASE_URL + "",
       :headers => { 'Accept' => 'application/json' },
       :body => { :destination => {:state => , :city => , :zip =>  },
                 :origin => origin,
                 :package => package})

end