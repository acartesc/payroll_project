# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |i|
  client = Client.create(name: "Cliente #{i+1}", client_rut:"76.000.00#{i+1}-#{i+1}")
  3.times do |t|
    company = Company.create(business_name: "Empresa #{i+1}-#{t+1}", taxpayer_id_company: "80.000.00#{t+1}-#{t+1}", client_id: i+1)
  end
end

worker = Worker.create(rut: '16.677.723-2', first_name: 'Andrés', middle_name: 'Eduardo', last_name1: 'Cartes',
  last_name2: 'Contreras', birthdate: '09-29-1987', gender: 'Masculino', email: 'acartescc@gmail.com',
  phone: '994677136', address_region: 'Metropolitana de Santiago', address_city: 'Ñuñoa',
  address_street: 'José Manuel Infante', address_number: '2520', address_apartment: '1107', company_id: 1)

family_burdens = FamilyBurden.create([{rut: '24.117.106-k', name: 'Agustina Cartes Reyes', worker_id: 1}, {rut: '15.714.652-1', name: 'Karen Reyes Espinoza', worker_id: 1}])

base_salary = BaseSalary.create(amount: '1000000', worker_id: 1)

health_plan = HealthPlan.create(name: 'Fonasa', deduction: 7, worker_id: 1)

pension_fund = PensionFund.create(name: 'Plan Vital', deduction: 10.41, worker_id: 1)

user = User.create(email: 'acartescc@gmail.com', password:'agus2012',password_confirmation: 'agus2012', role: 1)

10.times do |i|
  User.create(email: "user#{i}@gmail.com", password: 'mypass', password_confirmation: 'mypass', role: 0, created_at: rand(1..10).to_i.day.ago)
end

User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
