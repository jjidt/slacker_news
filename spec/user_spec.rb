require 'rails_helper'

describe User do

  it { should have_many :links }

  before do
    @user = User.new(name: "Testuser", password: "foobar", password_confirmation: "foobar")
  end

  subject { @user }

  it { should respond_to :name }
  it { should respond_to :password_digest }
  it { should validate_presence_of :name }
  it { should validate_presence_of :password_digest }
  it { should respond_to :password_digest }
  it { should respond_to :password }

  describe "when password is not present" do
    before do
      @user = User.new(name: "Testuser2", password: " ", password_confirmation: " ")
    end

    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  it { should be_valid }
  it { should respond_to :authenticate }

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end


  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user){ User.find_by :name => @user.name }

    describe "with valid password" do
      it "should respond with a valid user" do
        expect(found_user.authenticate("foobar")).to eq @user
      end
    end

    describe "with an invalid password" do
      it "should respond with false for invalid password" do
        expect(found_user.authenticate("barfoo")).to eq false
      end
    end

  end

end
