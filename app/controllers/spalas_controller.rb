class SpalasController < ApplicationController
  before_action :authenticate_user!,only: [:new, :edit, :create]
    def top
    end
    def index 
      if params[:search] == nil
        @spalas= Spala.all
      elsif params[:search] == ''
        @spalas = Spala.all
      else
        @spalas = Spala.where("name LIKE ? ",'%' + params[:search] + '%')
      end

      @spalas = @spalas.page(params[:page]).per(3)
   
    end
     
    def new
        @spala = Spala.new
      end
    
      def create
        spala = Spala.new(spala_params)
        spala.user_id = current_user.id
        if spala.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
      def show
        @spala = Spala.find(params[:id])
      end
      def edit
    @spala = Spala.find(params[:id])
  end
  def update
    spala = Spala.find(params[:id])
    if spala.update(spala_params)
      redirect_to :action => "index", :id => spala.id
    else
      redirect_to :action => "new"
    end
  end
  def destroy
    spala= Spala.find(params[:id])
    spala.destroy
    redirect_to action: :index
  end
  def menu
   
  end
      private
      def spala_params
        params.require(:spala).permit(:name, :review, :image, :overall)
      end
end
