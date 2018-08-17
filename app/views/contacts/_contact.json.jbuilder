json.extract! contact, :id, :street, :city, :postalCode, :phone, :email, :created_at, :updated_at
json.url contact_url(contact, format: :json)
