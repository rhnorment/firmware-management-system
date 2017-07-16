# == Schema Information
#
# Table name: email_recipients
#
#  id         :integer          not null, primary key
#  name       :string           default("")
#  email      :string           default("")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EmailRecipient < ApplicationRecord
end
