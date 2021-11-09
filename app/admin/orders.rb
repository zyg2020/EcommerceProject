ActiveAdmin.register Order do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :customer_id, :status_id, :province_tax_rate
  #
  # or
  #
  # permit_params do
  #   permitted = [:customer_id, :status_id, :province_tax_rate]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
