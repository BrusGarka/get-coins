json.array!(@monthly_incomes) do |monthly_income|
json.id monthly_income.id
json.month monthly_income.month
json.value monthly_income.value
end
