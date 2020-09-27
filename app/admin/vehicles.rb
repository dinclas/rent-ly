ActiveAdmin.register Vehicle do
  permit_params :model, :brand, :plate, :model_year, :manufacture_year
end
