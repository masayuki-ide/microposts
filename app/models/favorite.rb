class Favorite < ActiveRecord::Base
  belongs_to :favoer, class_name: "User"
  belongs_to :posted, class_name: "Micropost"
end
