class ListsController < ApplicationController
 before_action :set_board
 before_action :set_list, only: [:show, :edit, :create, :update, :destroy]
 
  def index
    @lists = @board.all_lists
  end

  def show
  end

  def new
    @list = @board.lists.new
  end

  def edit
  end

  def create
    List.create_list(list_params, @board)
      if @list.save
        redirect_to board_lists_path(@board)
      else
        render :new
      end
    end
    
  def update
    List.update_list(@board.list_id, list_params)
    redirect_to board_lists_path(@board)
  end

  def destroy
    List.delete_list(@board.list.id)
    redirect_to board_lists_path(@board)
  end


  private

  def set_board
    @board = Board.single_board(params[:board_id])
  end

  def set_list
    @list = List.single_list(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :priority)
    end
  end


