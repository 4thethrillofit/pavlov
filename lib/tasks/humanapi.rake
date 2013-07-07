namespace :fetch do
  task :activities => :environment do
    User.fetch_activity_data
  end
end