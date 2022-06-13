# Formオブジェクトパターン
class FreshmanStudent
  include ActiveModel::Model
  # 保存したいカラム名をアクセサとして定義
  attr_accessor :code, :last_name, :first_name, :last_name_reading, :first_name_reading, :sex,
                :year_id, :school_grade#, :klass, :number
                #student_idは不要

  # 参考
  # create_table :students do |t|
  #   t.string	  :code,                null: false
  #   t.string	  :last_name,           null: false
  #   t.string	  :first_name,          null: false
  #   t.string	  :last_name_reading,   null: false
  #   t.string	  :first_name_reading,  null: false
  #   t.integer	  :sex,                 unsigned: true, limit: 1, null: false, default: 0
  #   t.timestamps
  # end

  # create_table :annual_students do |t|
  #   t.references	:year,          null: false, foreign_key: true
  #   t.references	:student,       null: false, foreign_key: true
  #   t.string	    :school_grade
  #   t.string	    :klass
  #   t.string	    :number
  #   t.timestamps
  # end

  # validations ...

  # def save
  #   student = Student.create(code: code, ...)
  #   AnnualStudent.create(year_id: xxx, student_id: student.id, ...)
  # end
end