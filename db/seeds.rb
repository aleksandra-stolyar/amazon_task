# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

['customer', 'admin'].each do |role|
  Role.find_or_create_by({name: role})
end

User.create(email: "user@user.com", password: "12345678")
User.create(email: "admin@admin.com", password: "12341234") do |u|
  u.roles << Role.find_by_name('admin')
end

Book.create(title: "Портрет Дориана Грея", price: 80 , amount: 3)
Book.create(title: "Убить пересмешника..", price: 90, amount: 4)
Book.create(title: "Таинственная история Билли Миллигана", price: 90, amount: 5)
Book.create(title: "Rails 4 Гибкая разработка веб-приложений", price: 80, amount: 6)
Book.create(title: "Гарри Поттер и методы рационального мышления", price: 80, amount: 7)
Book.create(title: "Save with Jamie", price: 80, amount: 8)
Book.create(title: "Портрет Дориана Грея", price: 90, amount: 9)
Book.create(title: "Убить пересмешника..", price: 100, amount: 10)
Book.create(title: "Таинственная история Билли Миллигана", price: 80, amount: 11)
Book.create(title: "Rails 4 Гибкая разработка веб-приложений", price: 100, amount: 12)
Book.create(title: "Гарри Поттер и методы рационального мышления", price: 100, amount: 13)
Book.create(title: "Save with Jamie", price: 90, amount: 14)

Category.create(title: "Фанфик")
Category.create(title: "Философский роман")
Category.create(title: "Готическая литература")
Category.create(title: "Художественная литература")
Category.create(title: "Роман воспитания")
Category.create(title: "Триллер")
Category.create(title: "Эпическая фантастика")
Category.create(title: "Психология")
Category.create(title: "Современная проза")
Category.create(title: "Кулинария")
Category.create(title: "Компьютерная литература")

Author.create(first_name: "Элиезер", last_name: "Юдковский")
Author.create(first_name: "Jamie" , last_name: "Oliver")
Author.create(first_name: "Сэм", last_name: "Руби")
Author.create(first_name: "Оскар", last_name: "Уайльд")
Author.create(first_name: "Дэниел", last_name: "Киз")
Author.create(first_name: "Харпер", last_name: "Ли")
