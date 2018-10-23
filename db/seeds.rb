User.create!(firstname: "Baozi",
              lastname: "Admin",
              email: "baozi@cutey.com",
              password: "password123",
              password_confirmation: "password123",
              admin: true,
              activated: true,
              activated_at: Time.zone.now)


User.create!(firstname: "Panda",
              lastname: "Non-admin",
              email: "panda@ssssssb.com",
              password: "password123",
              password_confirmation: "password123",
              activated: true,
              activated_at: Time.zone.now)
