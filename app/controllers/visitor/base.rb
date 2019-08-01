class Visitor::Base < ApplicationController
  private
  def current_visitor
    if session[:visitor_id]
      @current_visitor ||= Visitor.find_by(id: session[:visitor_id])
    end
  end

  helper_method :current_visitor
end
