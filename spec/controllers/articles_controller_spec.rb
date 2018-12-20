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
    end

    it "has a 200 status code" do
      get :show, params: { id: @articles.first.id }
      expect(response.status).to eq(200)
    end
  end

  describe 'get new' do
    it "render the new template" do
      get :new
      expect(response).to render_template("new")
    end

    it "assigns @article" do
      get :new
      expect(assigns[:article]).to be_a_new(Article)
    end

    it "has a 200 status code" do
      get :new
      expect(response.status).to eq(200)
    end

    it "for testing this should fail" do
      get :new
      expect(response.status).to_not eq(200)
    end
  end
end
