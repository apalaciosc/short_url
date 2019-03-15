class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string :original_url
      t.string :short_url
      t.datetime :date_expiration

      t.timestamps
    end
  end
end
