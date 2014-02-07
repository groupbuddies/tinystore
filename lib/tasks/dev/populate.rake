namespace :dev do
  desc "Development data for database"
  task :populate => :environment do
    return unless Rails.env.development?

    require 'database_cleaner'
    DatabaseCleaner.clean_with(:truncation)

    puts 'Creating test user mpalhas@gmail.com/mpalhas'
    user = User.create(
      name: 'Miguel Palhas',
      email: 'mpalhas@gmail.com',
      password: 'mpalhas',
      password_confirmation: 'mpalhas',
      confirmed_at: Time.now,
      store_attributes: {
        name: 'Natas',
        slug: 'natas',
        email: 'mpalhas@gmail.com',
        description: 'Aqui vendem-se natas'
      }
    )

    puts 'Creating products'
    2.times do |i|
      user.store.products.create(
        name: "Produto #{i}",
        price: '1.50',
        description: "Description #{i}"
      )
    end
  end
end
