class Admin::RemittancesController < Admin::Base
  def index
    time = Time.zone.now
    time_year = time.year
    @customers = Remittance.where(deposit_year: time_year).where(deposit_month: [7, 8])
  end
end
