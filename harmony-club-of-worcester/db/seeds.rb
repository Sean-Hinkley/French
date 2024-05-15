# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create(title: "«Temp Role»")
Section.create(title: "«Temp Section»", location: "«None»", visible: false, position: 0)
Album.create(title: "«Temp Album»", description: "«None»")
Event.create(title: "«Temp Event»", details: "«None»", eventstart: "Sun, 01 Jan 0 12:00:00.000000000 UTC +00:00", eventend: "Sun, 01 Jan 0 12:00:00.000000000 UTC +00:00")
Page.create(title: "«Temp Page»", section_id: Section.where(title: "«Temp Section»")[0].id, page_type: "«None»", permalink: "«None»", visible: false, position: 0, content: "«None»", destination: "«None»", authenticate: false)
Permission.create(role_id: Role.where(title: "«Temp Role»")[0].id, permissible_type: "Section", permissible_id: Section.where(title: "«Temp Section»")[0].id, allRecords: true, canCreate: false, canUpdate: false, canRead: false, canDelete: false)
Photo.create(album_id: Album.where(title: "«Temp Album»")[0].id, title: "«Temp Photo»", description: "«None»")
Sponsor.create(title: "«Temp Sponsor»", website: "«None»")

User.create(:email => 'dev@hcow.com', :password => 'password', :password_confirmation => 'password')
User.create(:email => 'chickman@baypath.net', :password => 'password', :password_confirmation => 'password')
Role.create(:title => 'Developer')
User.where(email: "dev@hcow.com")[0].roles.append(Role.where(title: "Developer")[0])
User.where(email: "chickman@baypath.net")[0].roles.append(Role.where(title: "Developer")[0])

Permission.create(role_id: Role.where(title: "Developer")[0].id, permissible_type: "Album", allRecords: true, permissible_id: 0, canCreate: true, canRead: true, canUpdate: true, canDelete: true)
Permission.create(role_id: Role.where(title: "Developer")[0].id, permissible_type: "Event", allRecords: true, permissible_id: 0, canCreate: true, canRead: true, canUpdate: true, canDelete: true)
Permission.create(role_id: Role.where(title: "Developer")[0].id, permissible_type: "Page", allRecords: true, permissible_id: 0, canCreate: true, canRead: true, canUpdate: true, canDelete: true)
Permission.create(role_id: Role.where(title: "Developer")[0].id, permissible_type: "Permission", allRecords: true, permissible_id: 0, canCreate: true, canRead: true, canUpdate: true, canDelete: true)
Permission.create(role_id: Role.where(title: "Developer")[0].id, permissible_type: "Photo", allRecords: true, permissible_id: 0, canCreate: true, canRead: true, canUpdate: true, canDelete: true)
Permission.create(role_id: Role.where(title: "Developer")[0].id, permissible_type: "Role", allRecords: true, permissible_id: 0, canCreate: true, canRead: true, canUpdate: true, canDelete: true)
Permission.create(role_id: Role.where(title: "Developer")[0].id, permissible_type: "Section", allRecords: true, permissible_id: 0, canCreate: true, canRead: true, canUpdate: true, canDelete: true)
Permission.create(role_id: Role.where(title: "Developer")[0].id, permissible_type: "Sponsor", allRecords: true, permissible_id: 0, canCreate: true, canRead: true, canUpdate: true, canDelete: true)