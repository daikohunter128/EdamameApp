class History < ActiveRecord::Base
  #belongs_to :customer, class_name: "Customer", foreign_key: "customer_id"
  
  RESERVATION = %w(
    注文kgを選択
    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13
    14
    15
    16
    17
    18
    19
    20
  )
  
  UNDISPATCHED = %w(
    未発送
    発送済み
  )
  
  validates :reservation, inclusion: { in: RESERVATION, allow_blank: true }
  validates :undispatched, inclusion: { in: UNDISPATCHED, allow_blank: true }
end
