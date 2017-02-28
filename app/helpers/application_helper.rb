module ApplicationHelper
  def title(page_header)
    content_for :title, page_header ? 'Prediction Engine Rails | ' + page_header.to_s : 'Prediction Engine Rails'
  end

  def page_header(page_header)
    content_for :page_header, page_header ? page_header.to_s : 'Page Header'
  end

  def optional_description(optional_description)
    content_for :optional_description, optional_description ? optional_description.to_s : 'Optional description'
  end
end
