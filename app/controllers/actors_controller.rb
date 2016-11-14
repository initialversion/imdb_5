class ActorsController < ApplicationController
  def index
    @actors = Actor.all

    render("actors/index.html.erb")
  end

  def show
    @actor = Actor.find(params[:id])

    render("actors/show.html.erb")
  end

  def new
    @actor = Actor.new

    render("actors/new.html.erb")
  end

  def create
    @actor = Actor.new

    @actor.name = params[:name]
    @actor.bio = params[:bio]
    @actor.image = params[:image]
    @actor.dob = params[:dob]

    save_status = @actor.save

    if save_status == true
      redirect_to("/actors/#{@actor.id}", :notice => "Actor created successfully.")
    else
      render("actors/new.html.erb")
    end
  end

  def edit
    @actor = Actor.find(params[:id])

    render("actors/edit.html.erb")
  end

  def update
    @actor = Actor.find(params[:id])

    @actor.name = params[:name]
    @actor.bio = params[:bio]
    @actor.image = params[:image]
    @actor.dob = params[:dob]

    save_status = @actor.save

    if save_status == true
      redirect_to("/actors/#{@actor.id}", :notice => "Actor updated successfully.")
    else
      render("actors/edit.html.erb")
    end
  end

  def destroy
    @actor = Actor.find(params[:id])

    @actor.destroy

    redirect_to("/actors", :notice => "Actor deleted.")
  end
end
