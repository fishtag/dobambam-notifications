after 'development:users' do
  FactoryGirl.create :endpoint, user: User.first
end
