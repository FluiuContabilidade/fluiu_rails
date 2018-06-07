desc "Verify is there is events happenning soon and notify users by email."
task :event_notice => :environment do
  current_day = Time.now.day
  users = User.all
  Appointment.all.each do |e|
    if (e.day.to_i - 2) == current_day
      users.each do |u|
        ApplicationMailer.event_notification_mail(u, e).deliver_now
        # byebug
      end
    end
  end
end
