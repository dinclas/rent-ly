ActiveAdmin.register Booking do
  permit_params :vehicle_id, :booking_start_at, :booking_end_at, :cpf
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :vehicle_id, :booking_start_at, :booking_end_at, :cpf
  #
  # or
  #
  # permit_params do
  #   permitted = [:vehicle_id, :booking_start_at, :booking_end_at, :cpf]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.semantic_errors
    f.inputs do
      input :vehicle
      input :booking_start_at, as: :datepicker
      input :booking_end_at, as: :datepicker
      input :cpf
    end
    actions
  end
end
