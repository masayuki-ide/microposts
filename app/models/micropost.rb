class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
    
    has_many :favorite_lists, class_name:  "Favorite",
                                     foreign_key: "posted_id",
                                     dependent:   :destroy
  
    has_many :favorite_user, through: :favorite_lists, source: :favoer
  

end
