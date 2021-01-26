class SongsController < ApplicationController

    def new
        @song = Song.new 
    end

    def create
        @song = Song.new(song_params)
        if @song.valid?
           @song.save
           redirect_to song_path(@song)
        else
             render :new
         end
    end

    def edit
        song_id_finder
    end

    def update
        song_id_finder
        @song.update(song_params)
        if @song.valid?
            redirect_to song_path(@song)
        else
            render :edit
        end

    end

    def show 
        song_id_finder
    end

    def index 
        @songs = Song.all 
    end

    def destroy 
        song_id_finder.destroy 
        redirect_to songs_path
    end

    private
        def song_params
            params.require(:song).permit(:title,:release_year, :genre, :released, :artist_name,)
        end

        def song_id_finder
            @song = Song.find_by_id(params[:id])
        end
end
