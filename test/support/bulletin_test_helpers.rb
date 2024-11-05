# frozen_string_literal: true

module BulletinTestHelpers
  def setup_bulletins
    @published_bulletin = bulletins(:published)
    @drafted_bulletin = bulletins(:drafted)
    @current_user = users(:one)
    @bulletin_attrs = {
      bulletin: {
        title: 'New test title',
        description: 'New test description',
        image: fixture_file_upload('bulletin1.jpg', 'image/jpg'),
        category_id: Category.last.id
      }
    }
  end
end
