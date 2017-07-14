class CreateEmailRecipients < ActiveRecord::Migration[5.0]
  def change
    create_table :email_recipients do |t|
      t.string :name, default: ''
      t.string :email, default: ''

      t.timestamps
    end

    add_index :email_recipients, :email
  end
end
