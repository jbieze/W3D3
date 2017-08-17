class CreateShortenedUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :shortened_users do |t|
      t.integer :user_id
      t.integer :shortened_url_id
    end
  end
end
