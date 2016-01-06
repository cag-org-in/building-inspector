desc "This task is called by the Heroku scheduler add-on"
task :update_consensus_building => :environment do
  `rake db:calculate_consensus`
end
