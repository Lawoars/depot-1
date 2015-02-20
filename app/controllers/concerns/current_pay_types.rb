# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module CurrentPayTypes extend ActiveSupport::Concern
  private
  def get_pay_types
    pay_types = PayType.all
    @types = Hash.new
    pay_types.each do |type|
      if I18n.locale.to_s == 'ru'
        @types[type.locale_ru] = type.locale_ru
      elsif I18n.locale.to_s == 'en'
        @types[type.locale_en] = type.locale_ru
      elsif I18n.locale.to_s == 'qu'
        @types[type.locale_qu] = type.locale_ru
      end
    end
    return @types
  end
end
