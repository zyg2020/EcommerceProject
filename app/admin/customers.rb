ActiveAdmin.register Customer do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :username, :password, :first_name, :last_name, :address, :city, :province_id,
                :postal_code, :telephone, :country, :email
  #
  # or
  #
  # permit_params do
  #   permitted = [:username, :password, :first_name, :last_name, :address, :city, :province_id, :postal_code, :telephone, :country, :email]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
