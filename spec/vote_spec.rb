require 'rails_helper'

describe Vote do
  it { should belong_to :user }
  it { should belong_to :link }

  it "should only let a user vote once for a given link" do
    test_vote = Vote.new({:user_id => 1, :link_id => 2})
    test_vote.save
    test_vote2 = Vote.new({:user_id => 1, :link_id => 2})
    test_vote2.save
    expect(test_vote2.errors.full_messages.first).to eq "User you can only upvote a link once"
  end

  it "should let a user vote for multiple links" do
    test_vote = Vote.new({:user_id => 1, :link_id => 2})
    test_vote.save
    test_vote2 = Vote.new({:user_id => 1, :link_id => 3})
    test_vote2.save
    expect(test_vote2.save).to eq true
  end

  it "should let multiple users vote for a link" do
    test_vote = Vote.new({:user_id => 1, :link_id => 2})
    test_vote.save
    test_vote2 = Vote.new({:user_id => 2, :link_id => 2})
    expect(test_vote2.save).to eq true
  end
end
