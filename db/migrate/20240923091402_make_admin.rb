class MakeAdmin < ActiveRecord::Migration[7.2]
  def change
    user = User.find_by(email: 'test@test.ru')
    user&.update(admin: true)
  end
end
