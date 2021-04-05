class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string          :name,              null: false
      t.text            :explanation,       null: false
      t.condition_id    :integer,           null: false
      t.postage_id      :integer,           null: false
      t.area_is         :integer,           null: false
      t.price           :integer,           null: false
      t.day_id          :integer,           null: false
      t.user            :references,        null: false, foregin_key: true    
      t.category_id     :integer,           null: false
      t.timestamps
    end
  end
end
