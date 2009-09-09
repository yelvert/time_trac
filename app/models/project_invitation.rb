class ProjectInvitation < ActiveRecord::Base
  belongs_to :project
  
  POSSIBLE_INVITE_CODE_CHARS = ("a".."z").to_a+("A".."Z").to_a+(0..9).to_a
  
  before_create :generate_and_attach_invite_code
  
  def generate_and_attatch_invite_code
    self.invite_code = ProjectInvitation.generate_invite_code
  end
  
  def self.generate_invite_code
    code = ""
    until !code.blank?
      12.times {|x| code << POSSIBLE_INVITE_CODE_CHARS[rand(61)].to_s}
      if !ProjectInvitation.find_by_invite_code(code).nil?
        code = ""
      end
    end
    code
  end
end
