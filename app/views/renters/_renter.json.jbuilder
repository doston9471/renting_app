json.extract! renter, :id, :first_name, :middle_name, :last_name, :phone, :passport, :address, :registration, :fact_address, :deposit, :email, :car_id, :created_at, :updated_at
json.url renter_url(renter, format: :json)
