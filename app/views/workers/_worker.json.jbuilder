json.extract! worker, :id, :rut, :first_name, :middle_name, :last_name1, :last_name2, :bithdate, :gender, :email, :phone, :address_region, :address_city, :address_street, :address_number, :address_apartment, :created_at, :updated_at
json.url worker_url(worker, format: :json)
