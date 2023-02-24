class DirectorsController < ApplicationController
  def wisest
    @oldest = Director.where.not({ :dob => nil }).order({ :dob => :asc }).at(0).name
    @age = Director.where.not({ :dob => nil }).order({ :dob => :asc }).at(0).dob.strftime("%B %e, %Y")
    render({ :template => "director_templates/wisest.html.erb"})
  end
  
  def director_details
    # params looks like {"an_id" => "42"}

    @id = params.fetch("an_id")
    @the_director = Director.where({ :id => @id}).at(0)
    render( { :template => "director_templates/show.html.erb"})
  end

  def index
    @list_of_directors = Director.all
    render({ :template => "director_templates/index.html.erb"})
  end

end
