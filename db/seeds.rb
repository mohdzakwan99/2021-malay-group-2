User.create!(name: "zak",
             email: "zak@mail.com",
             password: "123456",
             password_confirmation: "123456",
             admin: true,
             activated: true,
             activated_at: Time.zone.now )

User.create!(name: "zak",
             email: "zak1@mail.com",
             password: "123456",
             password_confirmation: "123456",
             admin: false,
             activated: true,
             activated_at: Time.zone.now )

Course.create!(name: "COURSE 1",
              description: "DESCRIPTION 1",
              status: "Opening",
              total_month: "6")

Course.create!(name: "COURSE 2",
              description: "DESCRIPTION 2",
              status: "Opening",
              total_month: "6")

Course.create!(name: "COURSE 3",
              description: "DESCRIPTION 3",
              status: "Opening",
              total_month: "6")

Course.create!(name: "COURSE 4",
              description: "DESCRIPTION 4",
              status: "Opening",
              total_month: "6")
