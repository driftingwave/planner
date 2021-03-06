require 'spec_helper'

describe Meeting do
  context "validations" do
    subject { Meeting.new duration: nil }

    it "#date_and_time" do
      should have(1).error_on(:date_and_time)
    end

    it "#duration" do
      should have(1).error_on(:duration)
    end

    it "#lanyrd_url" do
      should have(1).error_on(:lanyrd_url)
    end

    it "#venue" do
      should have(1).error_on(:venue)
    end
  end

  context "#title" do
    subject(:meeting) { Meeting.new(date_and_time: DateTime.new(2014,8,20,18,30)) }

    it "is formatted correctly" do
      meeting.title.should eq("August Meeting")
    end
  end

  context "#end_time" do
    subject(:meeting) { Meeting.new(date_and_time: DateTime.new(2014,8,20,18,30)) }

    it "defaults to two hours after the meeting starts" do
      meeting.end_time.should eq(DateTime.new(2014,8,20,20,30))
    end
  end
end
