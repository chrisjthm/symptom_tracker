require 'spec_helper'

describe Post do

  let(:user) { FactoryGirl.create(:user) }
  before { @post = user.posts.build(symptom: "cough", severity: "high")}

  subject { @post }

  it { should respond_to(:symptom) }
  it { should respond_to(:severity) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
  	before { @post.user_id = nil }
  	it { should_not be_valid }
  end

  describe "with blank symptom" do
    before { @post.symptom = " " }
    it { should_not be_valid }
  end

  describe "with blank severity" do
    before {@post.symptom = " " }
    it {should_not be_valid }
  end

  describe "with symptom that is too long" do
    before { @post.symptom = "a" * 141 }
    it { should_not be_valid }
  end
end