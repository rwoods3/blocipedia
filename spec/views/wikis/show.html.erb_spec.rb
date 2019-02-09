require 'rails_helper'
require 'spec_helper'

RSpec.describe 'wikis/show.html.erb', type: :view do
	let(:wiki_body_markdown) { "*This* is an example of markdown, http://www.test.com" }
	let(:wiki_body_expected_html) { "<p><em>This</em> is an example of markdown, <a href=\"http://www.test.com\">http://www.test.com</a></p>\n" }
	let(:user) { create(:user) }
	let(:wiki) { create(:wiki, user: user) }

	it 'should render markdown' do
		wiki.body = wiki_body_markdown
		assign(:wiki, wiki)
		render
		expect(rendered).to include(wiki_body_expected_html)
	end
end