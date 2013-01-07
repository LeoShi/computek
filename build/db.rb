namespace :db do
  def create_db(db_name)
    create_db = "CREATE DATABASE IF NOT EXISTS #{db_name};"
    run_sql_cmd create_db, "Create database #{db_name} if not existed"

    grand_privileges = "GRANT ALL PRIVILEGES ON #{db_name}.* TO '#{MYSQL.user.name}'@'#{MYSQL.address}' IDENTIFIED BY '#{MYSQL.user.password}'"
    run_sql_cmd grand_privileges, "Create database user and grant privileges"
  end

  def run_sql_cmd(cmd, message)
    sql_cmd = %Q|mysql -u#{MYSQL.root.name} -p#{MYSQL.root.password} -e "#{cmd}"|
    info "#{message} by sql command: #{sql_cmd}"
    system sql_cmd
  end

  desc 'Create database for test env'
  task :create_test_db do
    create_db MYSQL.db.test
  end

  desc 'Create database for production env'
  task :create_prod_db do
    create_db MYSQL.db.prod
  end

  desc 'Create database for development env'
  task :create_dev_db do
    create_db MYSQL.db.dev
  end

  desc 'Restore database from /tmp/shenma_db_backup'
  task :restore_db do
    info "will restore db"
    system "./db.sh 'restore_db shenma'"
  end
end