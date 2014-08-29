require 'rails_helper'

describe User do

  before do
    @user = User.new(name: "Testuser", password: "foobar", password_confirmation: "foobar")
  end

  it { should respond_to :name }
  it { should respond_to :password_digest }
  it { should validate_presence_of :name }
  it { should validate_presence_of :password_digest }
  
end
