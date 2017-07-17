class Micropost < ApplicationRecord
  #Микросообщение пренадлежит пользователю. 
  belongs_to :user
  #Пользователь имеет_много микросообщений, опция dependent: :destroy приговаривает связанные микросообщения 
  #(т.e., те что принадлежат данному пользователю) быть уничтоженными при уничтожении самого пользователя  
  #has_meny :microposts, dependent: :destroy
  #DESC это SQL для “по убыванию”, т.е., в порядке убывания от новых к старым.
  default_scope -> { order('microposts.created_at DESC') }
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
end
  
