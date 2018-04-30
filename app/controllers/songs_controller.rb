class SongsController < ApplicationController
    def show
        @song = Song.find(params[:id])
    end

    def new
        @song = Song.new
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song = Song.find(params[:id])
        @song.update(post_params(params[:song]))

        redirect_to song_path(@song)
    end

    def create
        @song = Song.new(post_params(params[:song][:name]))
        @song.save

        @artist = Artist.find_or_create_by(artist_id: params[:song][:artist_id])
        

        redirect_to song_path(@song)
    end

    private

        def post_params(*args)
            params.require(:song).permit(args)
        end

        def post_params2(*args)
            params.require(:genre).permit(args)
        end
        def post_params3(*args)
            params.require(:artist).permit(args)
        end
end
