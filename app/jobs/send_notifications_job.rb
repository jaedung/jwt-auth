class SendNotificationsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    puts "job perform"
  end
end
