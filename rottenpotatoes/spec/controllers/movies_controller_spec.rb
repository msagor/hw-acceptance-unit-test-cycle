require 'rails_helper'
require 'extra'
require 'simplecov'
SimpleCov.start 'rails'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

# # then, whenever you need to clean the DB
DatabaseCleaner.clean

RSpec.describe MoviesController, type: :controller do
    
    
    describe "#index" do
        it "view all the movies" do
            movie1 = Movie.create(title: 'movie1', director: 'director1', rating:'G', release_date: '2021-00-01')
            movie2 = Movie.create(title: 'movie2', director: 'director2', rating:'R', release_date: '2021-00-02')
            get :index
            expect(assigns(:movies)).to eq [movie1, movie2]
        end
    end

    describe "#view" do
        it "view movie info" do
            movie0 = Movie.create(title: 'movie0', director: 'director0', rating:'G', release_date: '2021-01-01')
            get :show, id: movie0.id
            expect(response).to render_template :show
        end
    end

    describe "#new" do
        it "creating new movie" do
            get :new
            expect(response).to render_template :new
        end
    end
    

        
end