require "ostruct"

class PagesController < ApplicationController
  def home
    # TODO: replace with Administrator.officers.includes(:user)
    @officers = [
      ::OpenStruct.new(rank: "president", user: ::OpenStruct.new(name: "Jane Doe", email: "jane.doe@ieee.org", phone_number: 5551234567)),
      ::OpenStruct.new(rank: "officer", user: ::OpenStruct.new(name: "John Smith", email: "john.smith@ieee.org", phone_number: 5559876543)),
      ::OpenStruct.new(rank: "officer", user: ::OpenStruct.new(name: "Alex Johnson", email: "alex.j@ieee.org", phone_number: nil))
    ]
  end
end
