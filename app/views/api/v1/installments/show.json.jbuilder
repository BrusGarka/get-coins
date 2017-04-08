json.partial! 'api/v1/installments/installment', installment: @installment
json.arrearages do
  json.partial! 'api/v1/arrearages/arrearage', arrearage: @installment.arrearage
end