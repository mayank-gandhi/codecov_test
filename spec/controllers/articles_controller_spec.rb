require "rails_helper"

describe ArticlesController, type: :controller do
  before(:each) do
    @articles = create_list(:article, 3)
  end
  describe 'get index' do
    it "render the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "assigns @articles" do
      get :index
      expect(assigns[:articles]).to include(*@articles)
      expect(response).to render_template("index")
    end

    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'get show' do
    it "render the show template" do
      get :show, params: { id: @articles.first.id }
      expect(response).to render_template("show")
    end

    it "should throw error on in valid id" do
      expect{
        get :show, params: { id: -1 }
      }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it "assigns @article" do
      get :show, params: { id: @articles.first.id }
      expect(assigns[:article]).to eq(@articles.first)
      expect(response).to render_template("show")
    end

    it "has a 200 status code" do
      get :show, params: { id: @articles.first.id }
      expect(response.status).to eq(200)
    end
  end
end
