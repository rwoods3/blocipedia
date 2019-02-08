FactoryBot.define do
	factory(:wiki) do
		title { Faker::Lorem.sentence }
		body { Faker::Lorem.sentence(5, false, 50) }
		private { false }
		user
	end
end