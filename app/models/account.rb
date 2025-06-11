class Account < ApplicationRecord
  extend HumanToNumber

  encrypts :password, deterministic: true

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  def pool_exclusive_process(duration: 5)
    transaction do
      sleep(duration)
    end
    puts "Job completed: #{Time.current.strftime("%H:%M:%S")}"
  end

  def self.method_missing(method_name, *args, &block)
    return super unless human_to_number(method_name.to_s)

    count = human_to_number(method_name.to_s)
    accounts = count.times.map do |i|
      new(
        name: "user_#{i + 1}",
        email: "user_#{i + 1}@example.com",
        password: "password_#{i + 1}"
      )
    end

    count == 1 ? accounts.first : accounts
  end

  def self.respond_to_missing?(method_name, include_private = false)
    human_to_number(method_name.to_s).present? || super
  end
end
