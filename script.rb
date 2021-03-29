require 'bundler'
Bundler.require

require 'require_all'
require_all 'lib'

file_url = "https://s3.amazonaws.com/intercom-take-home-test/customers.txt"
presenter = Invites::Presenter::InvitesAsTxt.new(attributes: [:name, :user_id], sort_key: :user_id )
use_case = Invites::UseCase::CreateGuestsList.new(customer_file: file_url, presenter: presenter)

puts use_case.call(in_range_of_km: 100)