class GenresController < ApplicationController
    def show
        @genre = Genre.find(params[:id])
    end

    def new
        @genre = Genre.new
    end

    def edit
        @genre = Genre.find(params[:id])
    end

    def update
        @genre = Genre.find(params[:id])
        @genre.update(post_params(params[:genre]))

        redirect_to genre_path(@genre)
    end

    def create
        @genre = Genre.new(post_params(params[:genre]))
        @genre.save
        
        redirect_to genre_path(@genre)
    end

    private

        def post_params(*args)
			params.require(:genre).permit(:name)
		end
end
