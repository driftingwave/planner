module Listable
  extend ActiveSupport::Concern

  included do

    scope :upcoming, -> { where("date_and_time >= ?", DateTime.now).order(:date_and_time) }
    scope :past, -> { where("date_and_time < ?", DateTime.now).order(:date_and_time) }
  end

  module ClassMethods
    def next
      upcoming.load.first
    end
  end
end
