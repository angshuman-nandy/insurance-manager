# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



u1=User.create(email: 'admin@gmail.com',password: 'password',password_confirmation: 'password')
Detail.create(email: u1.email, first_name: 'AdminFirstName', last_name: 'AdminLastName', admin: 1, contact_number: 4893823429, address: 'some address',user_id: u1.id)
u2=User.create(email: 'user@gmail.com',password: 'password',password_confirmation: 'password')
Detail.create(email: u2.email, first_name: 'UserFirstName', last_name: 'UserLastname', admin: 0, contact_number: 1233453429, address: 'some differernt address',user_id: u2.id)
c1=Company.create(name:"HDFC life",description: 'HDFC Life is a long-term life insurance provider with its headquarters in Mumbai, offering individual and group insurance.')
p1=Poltype.create(name: "retirement",description: 'some description of plan', company_id: c1.id, duration: 20, sum_insured: 3000000, premium_amount:3000)
c2=Company.create(name:"LIC",description: 'Life Insurance Corporation of India is an Indian state-owned insurance group and investment company headquartered in Mumbai. It is the largest insurance company in India with an estimated asset value of ₹1,560,482 crore.')
p2=Poltype.create(name: "life coverage",description: 'some description of plan', company_id: c2.id, duration: 25, sum_insured: 500000, premium_amount:5000)
m=Policy.create(user_id: u2.id, description: p1.description, sum_insured: p1.sum_insured, premium_amount: p1.premium_amount,commission: 3200, purchase_date: Date.today, mature_date: Date.today() + p1.duration.year, company_id: p1.company_id, poltype_id: p1.id )