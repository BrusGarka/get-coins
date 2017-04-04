case Rails.env
when "development"
	APN = Houston::Client.development
	APN.certificate = File.read('apple_certificates/development.pem')
when "production"
	APN = Houston::Client.production
	APN.certificate = File.read('apple_certificates/production.pem')
end