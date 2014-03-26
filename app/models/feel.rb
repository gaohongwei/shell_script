class Feel < ActiveRecord::Base
  has_many :symptoms
  accepts_nested_attributes_for :symptoms ,:allow_destroy => true
  after_create :fill_symptom
  private
  def fill_symptom
    fid=self.id
    Part.all.each do |p|
      pid=p.id
      name=p.name + self.name
      Symptom.create(:name=>name,:part_id=>pid,:feel_id=>fid)
    end
  end
end