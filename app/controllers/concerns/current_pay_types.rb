# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module CurrentPayTypes extend ActiveSupport::Concern
  private
  def get_pay_types
    pay_types = PayType.all
    @types = Array.new
    pay_types.each do |type|
      @types << type.pay_type
    end
    return @types
  end
end
