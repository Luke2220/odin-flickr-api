class StaticPagesController < ApplicationController

def index
    if params[:flickr_user_id]
        require 'flickr'
        @flickr = Flickr.new ENV['flickr_api_key'],ENV['flickr_secret_key']
        @list = @flickr.photos.search :user_id => params[:flickr_user_id]
        @urls = Array.new
        @list.each do |img|
            @sizes = @flickr.photos.getSizes :photo_id => img.id
            @urls << @sizes[6].source  
        end
        
        p @flickr.photos.search :user_id => ENV['my_id']
    end
end

private

def static_page_params
params.require(:static_pages).permit(:flickr_user_id)
end

end
