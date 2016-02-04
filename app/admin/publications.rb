ActiveAdmin.register Publication do
permit_params :title, :description, :file_url

  form :html => { :enctype => "multipart/form-data" } do |f|
     f.inputs do
      f.input :title
      f.input :description
      f.input :file_url
    end
    f.actions
  end

  # Create sections on the index screen
  scope :all, default: true


  # Filterable attributes on the index screen
  filter :title
  filter :description
  filter :created_at

  # Customize columns displayed on the index screen in the table
  index do
    column :title
    actions
  end

  show :title => :title
  show do |publication|
    attributes_table do
      row :id
      row :title
      row :description
      row :created_at
      row :file_url 
    end
    active_admin_comments
  end

end

