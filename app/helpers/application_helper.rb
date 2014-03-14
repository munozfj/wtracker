module ApplicationHelper
  def page_title(title = nil)
    base="Weight Tracker"
    if title
      content_for(:page_title) { base + ' - ' + title }
    else
      content_for?(:page_title) ? content_for(:page_title) : base 
    end
  end
end
