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
  end

  describe 'get edit' do
    it "render the edit template" do
      get :edit, params: { id: @articles.first.id }
      expect(response).to render_template("edit")
    end

    it "assigns @article" do
      get :edit, params: { id: @articles.first.id }
      expect(assigns[:article]).to eq(@articles.first)
    end

    it "has a 200 status code" do
      get :edit, params: { id: @articles.first.id }
      expect(response.status).to eq(200)
    end
  end

  # describe 'post create' do
  #   context 'with valid data' do
  #     it "redirect to article path" do
  #       post :create, params: { article: attributes_for(:article)}
  #       expect(response).to redirect_to(assigns(:article))
  #     end

  #     it "has a 302 status code" do
  #       post :create, params: { article: attributes_for(:article)}
  #       expect(response.status).to eq(302)
  #     end

  #     it "articles should return proper data" do
  #       subject = Faker::Book.title
  #       post :create, params: { article: attributes_for(:article, subject: subject)}
  #       expect(assigns(:article).subject).to eq(subject)
  #     end

  #     it "should change count by 1 if Article created" do
  #       expect {
  #         post :create, params: { article: attributes_for(:article)}
  #       }.to change(Article,:count).by(1)
  #     end
  #   end

  #   context 'with invalid data' do
  #     it "should not change count" do
  #       expect {
  #         post :create, params: { article: attributes_for(:article, subject: '')}
  #       }.to change(Article,:count).by(0)
  #     end

  #     it 'should render new template with error message' do
  #       post :create, params: { article: attributes_for(:article, subject: '')}
  #       expect(response).to render_template("new")
  #       expect(assigns[:article].errors.messages[:subject].present?).to be true
  #     end

  #     it "has a 200 status code" do
  #       post :create, params: { article: attributes_for(:article, subject: '')}
  #       expect(response.status).to eq(200)
  #     end
  #   end
  # end

  # describe 'Update @article' do
  #   context 'with valid data' do
  #     it 'redirect to article path' do
  #       put :update, params: { id: @articles.first.id, article: attributes_for(:article) }
  #       expect(response).to redirect_to(assigns(:article))
  #     end

  #     it 'should update the updated data' do
  #       subject = Faker::Book.title
  #       post :update, params: { id: @articles.first.id, article: attributes_for(:article, subject: subject)}
  #       expect(assigns(:article).subject).to eq(subject)
  #     end

  #     it 'has status code 302' do
  #       put :update, params: { id: @articles.first.id, article: attributes_for(:article) }
  #       expect(response.status).to eq(302)
  #     end
  #   end

  #   context 'with invalid data' do
  #     it 'has status code 200' do
  #       put :update, params: { id: @articles.first.id, article: attributes_for(:article, subject: '') }
  #       expect(response.status).to eq(200)
  #     end

  #     it 'render edit template' do
  #       put :update, params: { id: @articles.first.id, article: attributes_for(:article, subject: '') }
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end

  describe 'Delete @article' do
    it 'should redirect to articles path' do
      delete :destroy, params: { id: @articles.first.id }
      expect(response).to redirect_to articles_path
    end

    it 'has status code 302' do
      delete :destroy, params: { id: @articles.first.id }
      expect(response.status).to eq(302)
    end

    it 'should delete article' do
      delete :destroy, params: { id: @articles.first.id }
      expect{ @articles.first.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
