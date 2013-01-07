namespace :ci do
  desc "Run all server tests"
  task :ut => [:setup_test_db, :test]

  task :setup_test_db => 'db:create_test_db' do
    info "setup test db"
    run "rake db:setup RAILS_ENV=test"
  end

  task :test do
    info "run all test"
    run "rake spec RAILS_ENV=test"
  end
end