json.installments do
  json.partial! 'api/v1/arrearages/arrearage', collection: @arrearages, as: arrearage
end

