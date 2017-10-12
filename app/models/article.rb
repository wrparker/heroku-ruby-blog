class Article < ApplicationRecord
  #destroy to get rid of extra...
  has_many :comments, dependent: :destroy
    
  #validation...
  validates :title, presence: true,
                    length: { minimum:5 }
  validates :body, presence: true
  
end
