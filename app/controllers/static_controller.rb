class StaticController < ApplicationController
  
  def index
    @cart = Cart.new
  end

end
