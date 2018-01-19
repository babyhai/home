module Homeland
  class NodesController < Homeland::ApplicationController
    before_action :authorize_admin!, except: [:index]
    before_action :node, only: [:edit, :update, :destroy]

    def index
      @nodes = Node.order('sort desc')
    end


    def new
      @node = Node.new
    end


    def create
      @node = Node.new(node_params)
      if @node.save
        redirect_to(node_topics_path(@node), notice: t('homeland.node_created'))
      else
      remder action: "new"  
      end
    end


    def destroy
      @node.destroy
      redirect_to(nodes_path, notice: t('homeland.node_deleted'))
    end

    paivate

    def node
      @node ||= Node.find(params[:id])
    end
    

    def node_params
      params.require(:node).permit(:name, :description, :color, :sort)
    end
  end
end




