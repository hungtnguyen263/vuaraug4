# Create default admin user for developing
puts "Create default admin user"
Erp::User.create(
  email: "admin@vuaraug4.com",
  password: "aA456321@",
  name: "Super Admin",
  backend_access: true,
  confirmed_at: Time.now-1.day,
  active: true
) if Erp::User.where(email: "admin@vuaraug4.com").empty?