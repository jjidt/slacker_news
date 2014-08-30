require 'rails_helper'

describe Link do
  it { should have_many :comments }
  it { should validate_presence_of :url }
  it { should validate_presence_of :name }
  it { should belong_to :user }
end
