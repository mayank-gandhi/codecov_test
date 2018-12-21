require "rails_helper"

describe AuthorsController, type: :controller do
  before(:each) do
    @authors = create_list(:author, 3)
  end

  # describe 'get index' do
  #   it "render the index template" do
  #     get :index
  #     expect(response).to render_template("index")
  #   end

  #   it "assigns @authors" do
  #     get :index
  #     expect(assigns[:authors]).to include(*@authors)
  #   end

  #   it "has a 200 status code" do
  #     get :index
  #     expect(response.status).to eq(200)
  #   end
  # end

  describe 'get show' do
    it "render the show template" do
      get :show, params: { id: @authors.first.id }
      expect(response).to render_template("show")
    end

    it "should throw error on in valid id" do
      expect{
        get :show, params: { id: -1 }
      }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it "assigns @author" do
      get :show, params: { id: @authors.first.id }
      expect(assigns[:author]).to eq(@authors.first)
    end

    it "has a 200 status code" do
      get :show, params: { id: @authors.first.id }
      expect(response.status).to eq(200)
    end
  end

  # describe 'get new' do
  #   it "render the new template" do
  #     get :new
  #     expect(response).to render_template("new")
  #   end

  #   it "assigns @author" do
  #     get :new
  #     expect(assigns[:author]).to be_a_new(Author)
  #   end

  #   it "has a 200 status code" do
  #     get :new
  #     expect(response.status).to eq(200)
  #   end
  # end

  # describe 'get edit' do
  #   it "render the edit template" do
  #     get :edit, params: { id: @authors.first.id }
  #     expect(response).to render_template("edit")
  #   end

  #   it "assigns @author" do
  #     get :edit, params: { id: @authors.first.id }
  #     expect(assigns[:author]).to eq(@authors.first)
  #   end

  #   it "has a 200 status code" do
  #     get :edit, params: { id: @authors.first.id }
  #     expect(response.status).to eq(200)
  #   end
  # end

  # describe 'post create' do
  #   context 'with valid data' do
  #     it "redirect to author path" do
  #       post :create, params: { author: attributes_for(:author)}
  #       expect(response).to redirect_to(assigns(:author))
  #     end

  #     it "has a 302 status code" do
  #       post :create, params: { author: attributes_for(:author)}
  #       expect(response.status).to eq(302)
  #     end

  #     it "authors should return proper data" do
  #       name = Faker::Name.name
  #       post :create, params: { author: attributes_for(:author, name: name)}
  #       expect(assigns(:author).name).to eq(name)
  #     end

  #     it "should change count by 1 if Author created" do
  #       expect {
  #         post :create, params: { author: attributes_for(:author)}
  #       }.to change(Author,:count).by(1)
  #     end
  #   end

  #   context 'with invalid data' do
  #     it "should not change count" do
  #       expect {
  #         post :create, params: { author: attributes_for(:author, name: '')}
  #       }.to change(Author,:count).by(0)
  #     end

  #     it 'should render new template with error message' do
  #       post :create, params: { author: attributes_for(:author, name: '')}
  #       expect(response).to render_template("new")
  #       expect(assigns[:author].errors.messages[:name].present?).to be true
  #     end

  #     it "has a 200 status code" do
  #       post :create, params: { author: attributes_for(:author, name: '')}
  #       expect(response.status).to eq(200)
  #     end
  #   end
  # end

  # describe 'Update @author' do
  #   context 'with valid data' do
  #     it 'redirect to author path' do
  #       put :update, params: { id: @authors.first.id, author: attributes_for(:author) }
  #       expect(response).to redirect_to(assigns(:author))
  #     end

  #     it 'should update the updated data' do
  #       name = Faker::Name.name
  #       post :update, params: { id: @authors.first.id, author: attributes_for(:author, name: name)}
  #       expect(assigns(:author).name).to eq(name)
  #     end

  #     it 'has status code 302' do
  #       put :update, params: { id: @authors.first.id, author: attributes_for(:author) }
  #       expect(response.status).to eq(302)
  #     end
  #   end

  #   context 'with invalid data' do
  #     it 'has status code 200' do
  #       put :update, params: { id: @authors.first.id, author: attributes_for(:author, name: '') }
  #       expect(response.status).to eq(200)
  #     end

  #     it 'render edit template' do
  #       put :update, params: { id: @authors.first.id, author: attributes_for(:author, name: '') }
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end

  # describe 'Delete @author' do
  #   it 'should redirect to authors path' do
  #     delete :destroy, params: { id: @authors.first.id }
  #     expect(response).to redirect_to authors_path
  #   end

  #   it 'has status code 302' do
  #     delete :destroy, params: { id: @authors.first.id }
  #     expect(response.status).to eq(302)
  #   end

  #   it 'should delete author' do
  #     delete :destroy, params: { id: @authors.first.id }
  #     expect{ @authors.first.reload }.to raise_error(ActiveRecord::RecordNotFound)
  #   end
  # end
end
