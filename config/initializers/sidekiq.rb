Sidekiq.configure_server do |config|
	schedule_file = "config/sidekiq_schedule.yml"

	if File.exists?(schedule_file)
		Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
	end
end

Sidekiq.configure_client do |config|
	config.redis = { size: 1 }
end
