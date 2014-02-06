class Skill < ActiveRecord::Base

  validates :name, :uniqueness => true

  has_many :proficiencies
  has_many :users, through: :proficiencies
  # Remember to create a migration!

  def user_with_proficiency(num)
    # self.class.users.all
    user_id = Proficiency.where(skill_id: self.id, rating: num).first.user_id
    User.find(user_id)
  end

end
