namespace :deploy do
  desc "deploy app in production env"
  task :prod => [:migrate_db, :pre_compile, :build_missing_paperclip_styles, :restart_app] do
    info "Deploy app successfully."
  end

  #task :migrate_db => 'db:create_prod_db' do
  task :migrate_db  do
    info "starting migrate db.."
    system "rake db:migrate RAILS_ENV=production" or Rake::Task["db:restore_db"].execute
    info "finished migrate db."

  end

  task :pre_compile do
    info "starting precompile.."

    run "rake assets:precompile RAILS_ENV=production"
    info "finished precompile."

  end

  task :build_missing_paperclip_styles do
    info "build_missing_paperclip_styles..."
    run "RAILS_ENV=production bundle exec rake paperclip:refresh:missing_styles"
  end

  task :restart_app do
    tmp_dir = File.join(APP.root, "tmp")
    FileUtils.mkdir(tmp_dir) unless File.exist? tmp_dir
    file_path = File.join(tmp_dir, "restart.txt")
    run "touch #{file_path}"
    info "finished restart app."
  end
end
