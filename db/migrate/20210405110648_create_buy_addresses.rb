class CreateBuyAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :buy_addresses do |t|

      t.timestamps
    end
  end
end
