 FactoryBot.define do
	factory(:wiki) {
		title { Faker::ChuckNorris.fact }
		body { Faker::Lorem.sentence(5, false, 50) }
	}
end