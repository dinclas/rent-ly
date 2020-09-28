ActiveAdmin.register Vehicle do
  permit_params :model, :brand, :plate, :model_year, :manufacture_year

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :brand, as: :searchable_select, collection: [f.object.brand]
      f.input :model, as: :searchable_select, collection: [f.object.model]
      f.input :plate, length: 7
      f.input :model_year, as: :number, html5: true
      f.input :manufacture_year
    end
    actions
  end
end
