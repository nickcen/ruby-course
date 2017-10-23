require 'sidekiq'

class PageWorker
  include Sidekiq::Worker

  def perform(url)
    puts "we are downloading #{url}"
  end
end