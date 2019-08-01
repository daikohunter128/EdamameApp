class Administrator < ActiveRecord::Base
  include EmailHolder
  include PersonalNameHolder
  include PasswordHolder
  
  validates :start_date, presence: true, date: {
    after_or_equal_to: Date.new(2000, 1, 1),
    befor: -> (obj) { 1.year.from_now.to_date },
    allow_blank: true
  }
  
  validates :end_date, date: {
    after: :start_date,
    befor: -> (obj) { 1.year.from_now.to_date },
    allow_blank: true
  }
  
  STOCK = %w(売り切れ), %w(今期終了), %w(10), %w(20), %w(30), %w(40), %w(50)
end

