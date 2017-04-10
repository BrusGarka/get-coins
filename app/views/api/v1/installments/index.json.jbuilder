json.installments do
  json.partial! 'api/v1/installments/installment', collection: @installments, as:  :installment
end

json.totalizers do
  json.monthly_incomes @monthly_incomes
 json.paid_@paid_value
 json.pending_value @pending_value
 json.total_value @total_value
 json.total_remaing @total_remaing
end
