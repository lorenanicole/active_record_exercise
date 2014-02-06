class User < ActiveRecord::Base

  has_many :proficiencies
  has_many :skills, through: :proficiencies

  def proficiency_for(skill)
    skill_id = self.skills.find_by_name(skill).id
    proficiency = Proficiency.where(skill_id: skill_id, user_id: self.id).first.rating
  end

  def set_proficiency_for(skill, rating)
    skill_id = self.skills.find_by_name(skill).id
    Proficiency.where(skill_id: skill_id, user_id: self.id).first.update_attributes(rating: rating)
  end
  # Remember to create a migration!
end
