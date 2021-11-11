ActiveAdmin.register Product do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :price, :previous_price, :image,
                product_categories_attributes: %i[id _destroy product_id category_id]
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :price, :previous_price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    column :name
    column :description
    column :price
    column :previous_price
    column :categories do |product|
      product.categories.map { |bg| bg.name }.join(", ").html_safe
    end
    column :image do |product|
      image_tag product.image, width: 150, height: 150 if product.image.present?
    end
    actions
  end

  show do |product|
    attributes_table do
      row :name
      row :description
      row :price
      row :previous_price
      row :categories do |product|
        product.categories.map { |bg| bg.name }.join(", ").html_safe
      end
      row :image do |product|
        image_tag product.image if product.image.present?
      end
    end
  end

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs          # builds an input field for every attribute
    # let's add this piece:
    f.inputs do
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image) : ""
    end
    f.has_many :product_categories, allow_destroy: true do |n_f|
      n_f.input :category
    end

    f.actions # adds the 'Submit' and 'Cancel' buttons
  end
end
