class Article < ApplicationRecord
  #validation goes in the model.
  validates :title, presence: true,
                    length: { minimum:5 }
  validates :body, presence: true
end
