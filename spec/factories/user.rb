FactoryBot.define do
	factory(:user) do
		email { Faker::Internet.safe_email }
		password { Faker::Internet.password }
		role { User.roles.keys.sample }
	end
end