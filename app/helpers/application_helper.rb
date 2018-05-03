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

  def new_button(model)
    content_for :new_button, (content_tag :a,
                                          content_tag(:i, nil, class: 'fa fa-plus', 'aria-hidden': true) + ' New',
                                          class: 'btn btn-primary', role: 'button', href: send("new_#{model}_path"))
  end

  def edit_button(model)
    content_for :edit_button, (content_tag :a,
                                           content_tag(:i, nil, class: 'fa fa-edit', 'aria-hidden': true) + ' Edit',
                                           class: 'btn btn-warning', role: 'button', href: send("edit_#{model}_path"))
  end

  def back_button
    content_for :back_button, (content_tag :a,
                                           content_tag(:i, nil, class: 'fa fa-chevron-left', 'aria-hidden': true) + ' Back',
                                           class: 'btn btn-light', onclick: 'goBack()', role: 'button')
  end

  def save_button
    content_tag :button, content_tag(:i, nil, class: 'fa fa-floppy-o', 'aria-hidden': true) + ' Save',
                type: 'submit', name: 'commit', class: 'btn btn-success'
  end
end
