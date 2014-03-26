class Part < ActiveRecord::Base
  has_many :symptoms
  accepts_nested_attributes_for :symptoms ,:allow_destroy => true
  after_create :fill_symptom
  private
  def fill_symptom
    pid=self.id
    Feel.all.each do |f|
      fid=f.id
      name=self.name + f.name
      Symptom.create(:name=>name,:part_id=>pid,:feel_id=>fid)
    end
  end
end