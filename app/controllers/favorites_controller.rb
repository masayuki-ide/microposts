class FavoritesController < ApplicationController
    
   def create
      @favorite=Micropost.find(params[:favoer_id]) 
      current_user.favorite(@favorite)      
   end
    
   def destroy
      @favorite = current_user.favorite_lists.find(params[:id]).posted
      current_user.unfollow(@favorite)
   end
    
end
