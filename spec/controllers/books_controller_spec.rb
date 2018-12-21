require "rails_helper"

describe BooksController, type: :controller do
  before(:each) do
    @books = create_list(:book, 3)
  end

  describe 'get index' do
    it "render the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "assigns @books" do
      get :index
      expect(assigns[:books]).to include(*@books)
    end

    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'get show' do
    it "render the show template" do
      get :show, params: { id: @books.first.id }
      expect(response).to render_template("show")
    end

    it "should throw error on in valid id" do
      expect{
        get :show, params: { id: -1 }
      }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it "assigns @book" do
      get :show, params: { id: @books.first.id }
      expect(assigns[:book]).to eq(@books.first)
    end

    it "has a 200 status code" do
      get :show, params: { id: @books.first.id }
      expect(response.status).to eq(200)
    end
  end

  describe 'get new' do
    it "render the new template" do
      get :new
      expect(response).to render_template("new")
    end

    it "assigns @book" do
      get :new
      expect(assigns[:book]).to be_a_new(Book)
    end

    it "has a 200 status code" do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe 'get edit' do
    it "render the edit template" do
      get :edit, params: { id: @books.first.id }
      expect(response).to render_template("edit")
    end

    it "assigns @book" do
      get :edit, params: { id: @books.first.id }
      expect(assigns[:book]).to eq(@books.first)
    end

    it "has a 200 status code" do
      get :edit, params: { id: @books.first.id }
      expect(response.status).to eq(200)
    end
  end

  describe 'post create' do
    context 'with valid data' do
      it "redirect to book path" do
        post :create, params: { book: attributes_for(:book)}
        expect(response).to redirect_to(assigns(:book))
      end

      it "has a 302 status code" do
        post :create, params: { book: attributes_for(:book)}
        expect(response.status).to eq(302)
      end

      it "books should return proper data" do
        title = Faker::Book.title
        post :create, params: { book: attributes_for(:book, title: title)}
        expect(assigns(:book).title).to eq(title)
      end

      it "should change count by 1 if Book created" do
        expect {
          post :create, params: { book: attributes_for(:book)}
        }.to change(Book,:count).by(1)
      end
    end

    context 'with invalid data' do
      it "should not change count" do
        expect {
          post :create, params: { book: attributes_for(:book, title: '')}
        }.to change(Book,:count).by(0)
      end

      it 'should render new template with error message' do
        post :create, params: { book: attributes_for(:book, title: '')}
        expect(response).to render_template("new")
        expect(assigns[:book].errors.messages[:title].present?).to be true
      end

      it "has a 200 status code" do
        post :create, params: { book: attributes_for(:book, title: '')}
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'Update @book' do
    context 'with valid data' do
      it 'redirect to book path' do
        put :update, params: { id: @books.first.id, book: attributes_for(:book) }
        expect(response).to redirect_to(assigns(:book))
      end

      it 'should update the updated data' do
        title = Faker::Book.title
        post :update, params: { id: @books.first.id, book: attributes_for(:book, title: title)}
        expect(assigns(:book).title).to eq(title)
      end

      it 'has status code 302' do
        put :update, params: { id: @books.first.id, book: attributes_for(:book) }
        expect(response.status).to eq(302)
      end
    end

    context 'with invalid data' do
      it 'has status code 200' do
        put :update, params: { id: @books.first.id, book: attributes_for(:book, title: '') }
        expect(response.status).to eq(200)
      end

      it 'render edit template' do
        put :update, params: { id: @books.first.id, book: attributes_for(:book, title: '') }
        expect(response).to render_template("edit")
      end
    end
  end

  describe 'Delete @book' do
    it 'should redirect to books path' do
      delete :destroy, params: { id: @books.first.id }
      expect(response).to redirect_to books_path
    end

    it 'has status code 302' do
      delete :destroy, params: { id: @books.first.id }
      expect(response.status).to eq(302)
    end

    it 'should delete book' do
      delete :destroy, params: { id: @books.first.id }
      expect{ @books.first.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
