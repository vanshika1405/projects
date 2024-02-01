# spec/models/file_resource_spec.rb

require 'rails_helper'

RSpec.describe FileResource, type: :model do
  it "is valid with valid attributes" do
    file = FileResource.new(name: "Example", file_data: "Example data")
    expect(file).to be_valid
  end

  it "is not valid without a name" do
    file = FileResource.new(file_data: "Example data")
    expect(file).not_to be_valid
  end

  # Add more model tests as needed
end

