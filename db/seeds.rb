# frozen_string_literal: true

User.create!(name: '山崎　聡之',
             email: 'b.baller-toshi.1st@ezweb.ne.jp',
             password: 'aaaaaa',
             password_confirmation: 'aaaaaa',
             admin: true)

Child.create!(name: '山崎　陽祐',
              sex: '男の子',
              birthday: '2016-10-13',
              user_id: 1,
              child_password: 'TESTES')

Child.create!(name: '山崎　ほのか',
              sex: '女の子',
              birthday: '2019-09-20',
              user_id: 1,
              child_password: 'SAMPLE')

Family.create!(user_id: 1,
               child_id: 1)

Family.create!(user_id: 1,
               child_id: 2)

User.create!(name: 'テストユーザー',
             email: 'sample@example.jp',
             password: 'aaaaaa',
             password_confirmation: 'aaaaaa',
             admin: true)

Child.create!(name: '太郎(長男)',
              sex: '男の子',
              birthday: '2015-09-20',
              user_id: 2,
              child_password: 'TAROUU')

Child.create!(name: '次郎(次男)',
              sex: '男の子',
              birthday: '2016-11-10',
              user_id: 2,
              child_password: 'ZIROUU')

Child.create!(name: '花子(長女)',
              sex: '女の子',
              birthday: '2017-08-10',
              user_id: 2,
              child_password: 'HANAKO')

Child.create!(name: '由香(次女)',
              sex: '女の子',
              birthday: '2018-04-06',
              user_id: 2,
              child_password: 'CHACHA')

Family.create!(user_id: 2,
               child_id: 3)

Family.create!(user_id: 2,
               child_id: 4)

Family.create!(user_id: 2,
               child_id: 5)

Family.create!(user_id: 2,
               child_id: 6)
