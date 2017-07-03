class AddIndexToUsersEmail < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :email, unique: true #Индекс сам по себе не обеспечивает уникальность, email но это делает опция unique: true
  end
end
