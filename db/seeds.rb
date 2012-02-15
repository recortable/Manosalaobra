if User.count == 0
# Create admin user (change password!)
  User.create(name: 'Admin', email: "admin@casamasomenos.net", password: 'secret',
              password_confirmation: 'secret', role: 'admin')
end

if Page.count == 0
  Page.create(title: '¿Qué? / ¿Quienes? / ¿Cómo?', content_type: 'markdown')
  Page.create(title: '¿Por qué la participación?', content_type: 'markdown')
end
