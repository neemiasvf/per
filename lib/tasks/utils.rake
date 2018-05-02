if Rails.env.development?
  require 'faker'
  require 'factory_bot'
  FactoryBot.find_definitions

  desc 'Generating test data'
  task create_test_data: :environment do
    User.create(full_name: 'Test User', email: 'admin@teste.com', password: '123456', password_confirmation: '123456', confirmed_at: Date.now)
    puts 'Created Test User'

    15.times do
      FactoryBot.create(:gene, user: User.find(1))
    end
  end
end