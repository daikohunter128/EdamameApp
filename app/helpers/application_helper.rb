module ApplicationHelper
  include HtmlBuilder
  
  def document_title
    if @title.present?
      "#{@title} - 藤由農園"
    else
      "藤由農園"
    end
  end
end
