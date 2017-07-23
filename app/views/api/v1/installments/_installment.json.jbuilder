json.id installment.id
json.numnber installment.number
json.receipt installment.receipt_url
json.paid installment.paid
json.value installment.value
json.pay_at installment.pay_at.to_date
json.paid_at installment.paid_at.to_date unless installment.paid_at.nil?
json.created_at installment.created_at.to_date
json.arrearage do 
	json.partial! 'api/v1/arrearages/arrearage', arrearage: installment.arrearage
end


