class CreatePurchaseUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_users do |t|

      t.references :user,     null: false,    foreign_key: true
      t.references :product,  null: false,    foreign_key: true


      t.timestamps
    end
  end
end
