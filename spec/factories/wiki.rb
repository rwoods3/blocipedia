FactoryBot.define do
	factory(:wiki) do
		title { Faker::Lorem.sentence }
		body { Faker::Lorem.sentence(5, false, 50) }
		user
	end
end