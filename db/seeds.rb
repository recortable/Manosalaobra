# encoding: utf-8

if User.count == 0
# Create admin user (change password!)
  User.create(name: 'Admin', email: "admin@casamasomenos.net", password: 'secret',
              password_confirmation: 'secret', role: 'admin')
end

if Page.count == 0
  Page.create(title: '¿Qué? / ¿Quienes? / ¿Cómo?', content_type: 'markdown')
  Page.create(title: '¿Por qué la participación?', content_type: 'markdown')
end


ProposedName.find_or_create_by_value('casacolaborativa')
ProposedName.find_or_create_by_value('habitatcolaborativo')
ProposedName.find_or_create_by_value('colaboracasa')
ProposedName.find_or_create_by_value('cooespacio')
ProposedName.find_or_create_by_value('coohabita')
ProposedName.find_or_create_by_value('coobijo')
ProposedName.find_or_create_by_value('coohab')
ProposedName.find_or_create_by_value('cohabitat')
ProposedName.find_or_create_by_value('coovive')
ProposedName.find_or_create_by_value('comunicasa')
ProposedName.find_or_create_by_value('comunidar')
ProposedName.find_or_create_by_value('comunacasa')
ProposedName.find_or_create_by_value('comunabita')
ProposedName.find_or_create_by_value('habitamos')
ProposedName.find_or_create_by_value('coohabita')
ProposedName.find_or_create_by_value('cohabitando')
ProposedName.find_or_create_by_value('manosalaobra')
ProposedName.find_or_create_by_value('cadacasaesuncaso')
ProposedName.find_or_create_by_value('comopedroporsucasa')
ProposedName.find_or_create_by_value('lacasaolavida')
ProposedName.find_or_create_by_value('casaredonda')
ProposedName.find_or_create_by_value('elpatiodemicasaNOesparticular')
ProposedName.find_or_create_by_value('arshabitandi')
ProposedName.find_or_create_by_value('habitando')
ProposedName.find_or_create_by_value('casamasomenos')
ProposedName.find_or_create_by_value('todoporlacasa')
ProposedName.find_or_create_by_value('asocihabito')
ProposedName.find_or_create_by_value('comunicasa')
ProposedName.find_or_create_by_value('habitamos')
ProposedName.find_or_create_by_value('openhome')
ProposedName.find_or_create_by_value('casabierta')
ProposedName.find_or_create_by_value('masqueunacasa')
ProposedName.find_or_create_by_value('sukna')
ProposedName.find_or_create_by_value('habiaunacasa')
ProposedName.find_or_create_by_value('FAQhouse')
ProposedName.find_or_create_by_value('casaFAQ')
