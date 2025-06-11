class PoolExclusiveJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ActiveRecord::Base.transaction do
      sleep 10
    end
    puts "Job completed: #{Time.current.strftime("%H:%M:%S")}"
  end
end
