json.extract! renter, :id, :first_name, :last_name, :phone, :email, :car_id, :created_at, :updated_at
json.url renter_url(renter, format: :json)
