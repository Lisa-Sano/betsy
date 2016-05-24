class ShippingsController < ApplicationController

  def getrates
    raise
    @results = HTTParty.post("http://localhost:3000/shipping/rates",
    :body => params.to_json,
    :headers => { 'Content-Type' => 'application/json' } )
  end

  def displayrates

  end

end
