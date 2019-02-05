class GossipsController < ApplicationController

  def new
    @gossip = Gossip.new
    
  end

  def create
    @gossip = Gossip.new(:user => User.find(10), :title => params[:title], :content => params[:content]) # avec xxx qui sont les données obtenues à partir du formulaire

    if @gossip.save # essaie de sauvegarder en base @gossip
      # si ça marche, il redirige vers la page d'index du site
      redirect_to '/'
      flash[:success] = "Success"
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      flash[:error] = "Error"
      render :new
    end

  end

end
