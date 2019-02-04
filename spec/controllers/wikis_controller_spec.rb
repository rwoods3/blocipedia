require 'rails_helper'
require 'spec_helper'

RSpec.describe WikisController, type: :controller do
	let(:wiki) { build(:wiki) }
	let(:wiki_title) { Faker::ChuckNorris.fact }
	let(:wiki_body) { Faker::Lorem.sentence(5, false, 50) }

	describe "GET new" do
		it "should return http success status" do
			get :new
			expect(response).to have_http_status(:success)
		end

		it "should render the #new template" do
			get :new
			expect(response).to render_template(:new)
		end

		it "should instantiate @post" do
			get :new
			expect(assigns(:post)).not_to be_nil
		end
	end

	describe "POST create" do
		it "should return success http status" do
			post :create, params: { title: wiki.title, body: wiki.body }
			expect(response).to have_http_status(:success)
		end

		it "should redirect to the #show template" do
			post :create, params: { title: wiki.title, body: wiki.body }
			expect(response).to redirect_to(:show)
		end

		it "should create a new wiki" do
			wiki_count = Wiki.count
			post :create, params: { title: wiki.title, body: wiki.body }
			expect(Wiki.count).to be > wiki_count
		end

		it "should instantiate @post" do
			post :create, params: { title: wiki.title, body: wiki.body }
			expect(assign(:post)).to eq Post.last
		end
	end

	describe "GET edit" do

	end

	describe "GET show" do

	end

	describe "PATCH update" do

	end

	describe "PUT update" do

	end

	describe "DELETE destroy" do

	end
end
