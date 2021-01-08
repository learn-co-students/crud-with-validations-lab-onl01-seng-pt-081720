class SongsController < ApplicationController
    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(title: params[:song][:title], released: params[:song][:released], release_year: params[:song][:release_year], artist_name: params[:song][:artist_name], genre: params[:song][:genre])
        
        @song.save
        redirect_to song_path(@song)
    end

    def show
        @song = Song.find(params[:id])
    end
    
    def edit
        @song = Song.find(params[:id])   
    end
end