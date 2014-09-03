# == Schema Information
#
# Table name: stages
#
#  id          :integer          not null, primary key
#  course_id   :integer          not null
#  title       :string(255)      not null
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  date        :date             default(Wed, 03 Sep 2014), not null
#  start_at    :time             default(2000-01-01 09:44:15 UTC), not null
#  end_at      :time             default(2000-01-01 10:44:15 UTC), not null
#

class Stage < ActiveRecord::Base
  # scope macros

  # Concerns macros
  include Select2Concern

  # Constants
  
  # Attributes related macros

  # association macros
  belongs_to :course

  # validation macros
  validates :title, presence: true
  select2_white_list :title

  # callbacks

  # other
  def duration
    (end_at - start_at) / 3600 # to hour
  end

  protected
  # callback methods
end
