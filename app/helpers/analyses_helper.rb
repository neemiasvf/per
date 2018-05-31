module AnalysesHelper
  def status_badge(status)
    case status
      when 'New' then
        content_tag :h5, (content_tag :span, status, class: 'badge col-sm badge-dark')
      when 'Pending' then
        content_tag :h5, (content_tag :span, status, class: 'badge col-sm badge-warning')
      when 'In Progress' then
        content_tag :h5, (content_tag :span, status, class: 'badge col-sm badge-info')
      when 'Completed' then
        content_tag :h5, (content_tag :span, status, class: 'badge col-sm badge-success')
      when 'Canceled' then
        content_tag :h5, (content_tag :span, status, class: 'badge col-sm badge-danger')
      else
        content_tag :h5, (content_tag :span, 'New', class: 'badge col-sm badge-dark')
    end
  end

  def queue_button(analysis)
    content_for :queue_button, (content_tag :a,
                                            content_tag(:i, nil, class: 'fas fa-play') + ' Queue',
                                            class: 'btn btn-primary', role: 'button', href: queue_analysis_path(analysis))
  end
end