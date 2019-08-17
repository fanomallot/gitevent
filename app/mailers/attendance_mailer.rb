class AttendanceMailer < ApplicationMailer
	default from: 'no-reply@monsite.fr'
	def notification_email(attendance)
		@attendance = attendance
		@url = 'http://bigblacksky.fr/login'
		mail(to: @attendance.event.admin.email, subject: 'Merci de nous avoir choisi!')
	end
end
