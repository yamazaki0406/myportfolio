# frozen_string_literal: true

User.create!([{ name: '山崎　聡之',
                email: 'b.baller-toshi.1st@ezweb.ne.jp',
                password: 'aaaaaa',
                password_confirmation: 'aaaaaa',
                admin: true },
              { name: 'テストユーザー',
                email: 'sample@example.jp',
                password: 'aaaaaa',
                password_confirmation: 'aaaaaa',
                admin: false },
              { name: '別のユーザー',
                email: 'other@example.jp',
                password: 'aaaaaa',
                password_confirmation: 'aaaaaa',
                admin: false }])

Child.create!([{ name: '山崎　陽祐',
                 sex: '男の子',
                 birthday: '2016-10-13',
                 user_id: 1,
                 child_password: 'TESTES' },
               { name: '山崎　ほのか',
                 sex: '女の子',
                 birthday: '2019-09-20',
                 user_id: 1,
                 child_password: 'SAMPLE' },
               { name: '太郎(長男)',
                 sex: '男の子',
                 birthday: '2015-09-20',
                 user_id: 2,
                 child_password: 'TAROUU' },
               { name: '次郎(次男)',
                 sex: '男の子',
                 birthday: '2016-11-10',
                 user_id: 2,
                 child_password: 'ZIROUU' },
               { name: '花子(長女)',
                 sex: '女の子',
                 birthday: '2017-08-10',
                 user_id: 2,
                 child_password: 'HANAKO' },
               { name: '由香(次女)',
                 sex: '女の子',
                 birthday: '2018-04-06',
                 user_id: 2,
                 child_password: 'CHACHA' }])

Family.create!([{ user_id: 1, child_id: 1 },
                { user_id: 1, child_id: 2 },
                { user_id: 2, child_id: 3 },
                { user_id: 2, child_id: 4 },
                { user_id: 2, child_id: 5 },
                { user_id: 2, child_id: 6 }])

10.times do |i|
  Micropost.create!(user_id: 2,
                    child_id: 3,
                    created_at: "2019-09-#{i * 2} 14:56:44",
                    content: 'サンプルです。新規作成及び編集の際は、入力可能な文字数が表示されます。' * 7)
end

5.times do |i|
  Micropost.create!(user_id: 3,
                    child_id: 3,
                    created_at: "2019-09-#{i * 4} 14:56:44",
                    content: '別ユーザーの投稿です。自分以外のユーザーが登録した場合、編集はできません。' * 7)
end

10.times do |i|
  Micropost.create!(user_id: 2,
                    child_id: 4,
                    created_at: "2019-09-#{i * 2} 14:56:44",
                    content: 'サンプルです。新規作成及び編集の際は、入力可能な文字数が表示されます。' * 7)
end

5.times do |i|
  Micropost.create!(user_id: 3,
                    child_id: 4,
                    created_at: "2019-09-#{i * 4} 14:56:44",
                    content: '別ユーザーの投稿です。自分以外のユーザーが登録した場合、編集はできません。' * 7)
end

10.times do |i|
  Micropost.create!(user_id: 2,
                    child_id: 5,
                    created_at: "2019-09-#{i * 2} 14:56:44",
                    content: 'サンプルです。新規作成及び編集の際は、入力可能な文字数が表示されます。' * 7)
end

5.times do |i|
  Micropost.create!(user_id: 3,
                    child_id: 5,
                    created_at: "2019-09-#{i * 4} 14:56:44",
                    content: '別ユーザーの投稿です。' * 20)
end

10.times do |i|
  Micropost.create!(user_id: 2,
                    child_id: 5,
                    created_at: "2019-09-#{i * 2} 14:56:44",
                    content: 'サンプルです。' * 40)
end

9.times do |i|
  Growth.create!(date: "2019-0#{i + 1}-01",
                 height: Random.rand(100..120),
                 weight: Random.rand(20..30),
                 child_id: 3,
                 user_id: 2)
end

9.times do |i|
  Growth.create!(date: "2019-0#{i + 1}-01",
                 height: Random.rand(70..90),
                 weight: Random.rand(15..20),
                 child_id: 4,
                 user_id: 2)
end

9.times do |i|
  Growth.create!(date: "2019-0#{i + 1}-01",
                 height: Random.rand(60..80),
                 weight: Random.rand(10..20),
                 child_id: 5,
                 user_id: 2)
end
