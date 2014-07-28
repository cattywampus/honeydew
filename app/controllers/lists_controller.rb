class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @list = List.new list_params

    respond_to do |format|
      if @list.save
        format.js
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
