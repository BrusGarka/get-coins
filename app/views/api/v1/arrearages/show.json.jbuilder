json.partial! 'api/v1/arrearages/arrearage', arrearage: @arrearage
json.paid_value @arrearage.get_paid_value
json.pending_value @arrearage.get_pending_value