require 'HTTParty'

class ShippingWrapper

  def self.get_rates(destination, weight)
    origin = {:country => "US", :state => "WA", :city => "Seattle", :zip => "98103"}
    #standardizing shipping dimensions
    package = {:weight => weight, :length => 20, :width => 20, :height => 20, :units => "metric"}

    hash = { :destination => {:country => 'US', :state => destination.state, :city => destination.city, :zip => destination.zip },
                   :origin => origin,
                   :package => package}

    data = HTTParty.post("https://betsy-shipping-service.herokuapp.com/shipping_rates",
         :headers => { 'Accept' => 'application/json' },
         :body => hash)
    # raise
    # "data" currently returns an error hash:
    #<HTTParty::Response:0x7f84830927e8 parsed_response={"status"=>"500", "error"=>"Internal Server Error"}, @response=#<Net::HTTPInternalServerError 500 Internal Server Error  readbody=true>, @headers={"connection"=>["close"], "content-type"=>["application/json; charset=utf-8"], "content-length"=>["48"], "x-request-id"=>["10d6ff99-43b8-4599-b598-7a579b563d8c"], "x-runtime"=>["0.003376"], "server"=>["WEBrick/1.3.1 (Ruby/2.3.1/2016-04-26)"], "date"=>["Fri, 27 May 2016 22:30:54 GMT"], "via"=>["1.1 vegur"]}>

    return data
  end
end
