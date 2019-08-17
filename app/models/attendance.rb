class Attendance < ApplicationRecord
	after_create :notice_send
 	def notice_send
		AttendanceMailer.notification_email(self).deliver_now
	end
	belongs_to :event
 	belongs_to :participant ,class_name: "User"
end
