module WikisHelper
	def display_markdown(body)
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
		sanitize(markdown.render(body))
	end
end
