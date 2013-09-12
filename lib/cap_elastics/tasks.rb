# Written using crazy meta-code cribbed from capistrano_ext so you
# can (and must) 'require' this file rather than 'load' it.
require 'capistrano'

unless Capistrano::Configuration.respond_to?(:instance)
  abort 'cap-elastics requires Capistrano 2'
end

require 'cap_elastics/task_helpers'


Capistrano::Configuration.instance.load do

  namespace :deploy do
    namespace :elastics do
      # include our helper methods, I believe just into this namespace
      # if we do it this way.
      extend CapElastics::TaskHelpers

      desc <<-DESC
      Deploy the app and reindex
      DESC
      task :reindex do
        update_code
        reindex
        create_symlink
        restart
      end
    end
  end

  namespace :elastics do
    desc <<-DESC
    Reindex ElasticSearch.
    DESC
    task :reindex do
      rails     = fetch(:rails, 'script/rails')
      rails_env = fetch(:rails_env, 'production')


      run "cd #{latest_release} && RAILS_ENV=#{rails_env} bundle exec #{rails} runner 'Elastics::LiveReindex.reindex_models'"
    end

  end
end
