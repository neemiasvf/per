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

  def new_button(model_name)
    content_for :new_button, (content_tag :a,
                                          content_tag(:i, nil, class: 'fas fa-plus') + ' New',
                                          class: 'btn btn-primary', role: 'button', href: send("new_#{model_name}_path"))
  end

  def edit_button(model_name)
    content_for :edit_button, (content_tag :a,
                                           content_tag(:i, nil, class: 'fas fa-edit') + ' Edit',
                                           class: 'btn btn-warning', role: 'button', href: send("edit_#{model_name}_path"))
  end

  def back_button
    content_for :back_button, (content_tag :a,
                                           content_tag(:i, nil, class: 'fas fa-chevron-left') + ' Back',
                                           class: 'btn btn-light', onclick: 'goBack()', role: 'button')
  end

  def save_button
    content_tag :button, content_tag(:i, nil, class: 'fas fa-save') + ' Save',
                type: 'submit', name: 'commit', class: 'btn btn-success'
  end

  def show_button_for_index(model_name, object)
    content_tag :a, 'Show', href: send("#{model_name}_path", object), class: 'btn btn-info'
  end

  def edit_button_for_index(model_name, object)
    content_tag :a, 'Edit', href: send("edit_#{model_name}_path", object), class: 'btn btn-warning'
  end

  def destroy_button_for_index(model_name, object)
    content_tag :a, 'Destroy', href: send("#{model_name}_path", object), data: {method: :delete, confirm: 'Are you sure?'}, rel: :nofollow, class: 'btn btn-danger'
  end
end
