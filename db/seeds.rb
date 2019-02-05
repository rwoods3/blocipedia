10.times { FactoryBot.create(:user) }

50.times { FactoryBot.create(:wiki, user: User.all.sample) }