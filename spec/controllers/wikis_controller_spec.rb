require 'rails_helper'
require 'spec_helper'

RSpec.describe WikisController, type: :controller do
	let(:wiki_title) { Faker::ChuckNorris.fact }
	let(:wiki_body) { Faker::Lorem.sentence(5, false, 50) }
	let(:user) { create(:user, role: User.roles['standard']) }
	let(:user_2) { create(:user, role: User.roles['standard']) }
	let(:wiki) { build(:wiki, user: user) }

	describe "GET new" do
		before(:each) { sign_in user }

		it "should return http success status" do
			get :new
			expect(response).to have_http_status(:success)
		end

		it "should render the #new template" do
			get :new
			expect(response).to render_template(:new)
		end

		it "should instantiate @wiki" do
			get :new
			expect(assigns(:wiki)).not_to be_nil
		end
	end

	describe "POST create" do
		before(:each) { sign_in user }

		it "should return success http status" do
			post :create, params: { wiki: { title: wiki.title, body: wiki.body } }
			expect(response).to have_http_status(:redirect)
		end

		it "should redirect to the #show template" do
			post :create, params: { wiki: { title: wiki.title, body: wiki.body } }
			expect(response).to redirect_to(Wiki.last)
		end

		it "should create a new wiki" do
			wiki_count = Wiki.count
			post :create, params: { wiki: { title: wiki.title, body: wiki.body } }
			expect(Wiki.count).to be > wiki_count
		end

		it "should instantiate @wiki" do
			post :create, params: { wiki: { title: wiki.title, body: wiki.body } }
			expect(assigns(:wiki)).to eq Wiki.last
		end
	end

	describe "GET edit" do

	end

	describe "GET show" do

	end

	describe "PATCH update" do
		it "should update wiki created by another user" do
			sign_in user
			post :create, params: { wiki: { title: wiki.title, body: wiki.body } }
			sign_out user
			sign_in user_2
			expect {
				patch :update, params: { id: Wiki.last, wiki: {title: wiki_title, body: wiki_body} }
			}.to change { Wiki.last.title }.from(wiki.title).to(wiki_title)
			.and change { Wiki.last.body }.from(wiki.body).to(wiki_body)
		end
	end

	describe "PUT update" do

	end

	describe "DELETE destroy" do

	end
end
