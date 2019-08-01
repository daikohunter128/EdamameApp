class HistoryPresenter < ModelPresenter
  delegate :reservation, :purchase, :reservation_history, :undispatched, to: :object 
  def reservation
    object.reservation
  end
  
  def purchase
    object.purchase
  end
  
  def reservation_history
    object.reservation_history
  end
  
  def undispatched
    object.undispatched
  end
end