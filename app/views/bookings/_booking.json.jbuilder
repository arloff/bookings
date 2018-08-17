json.extract! booking, :id, :date_in, :date_out, :status, :requested, :confirmed, :contract_signed, :deposit_payed, :payed, :created_at, :updated_at
json.url booking_url(booking, format: :json)
