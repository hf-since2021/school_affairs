# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.first.nil?
  year = Year.create(code: "2022", name: "2022年度")
  term = Term.create(code: "1", name: "1学期")
  year_term = YearTerm.create(year_id: year.id, term_id: term.id, code: "2022-1", activity: TRUE)
  user = User.create(name: "admin", password: "test1234", year_term_id: year_term.id)
  user.add_role "admin"
end