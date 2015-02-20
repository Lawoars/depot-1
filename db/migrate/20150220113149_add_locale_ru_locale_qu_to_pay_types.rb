class AddLocaleRuLocaleQuToPayTypes < ActiveRecord::Migration
  def change
    add_column :pay_types, :locale_en, :string
    add_column :pay_types, :locale_qu, :string
    rename_column :pay_types, :pay_type, :locale_ru
  end
end
