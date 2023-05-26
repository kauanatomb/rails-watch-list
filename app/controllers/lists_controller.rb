class ListsController < ApplicationController
    before_action :set_list, only: [:show, :destroy]
    def index
        @lists = List.all
    end

    def show
        @bookmark = Bookmark.new
        @review = Review.new(list: @list)
    end

    def new
        @list = List.new
    end

    def create
        @list = List.create(list_params)
        redirect_to list_path(@list)
    end

    def destroy
        @list.destroy
        redirect_to lists_path, status: :see_other
    end

    private

    def set_list
        @list = List.find(params[:id])
    end

    def list_params
        params.require(:list).permit(:name, :photo)
    end
end