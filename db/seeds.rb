# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
                      { name: 'Иван', surname: 'Иванов', email: 'ivan.ivanov@mail.ru', password: 'qwert' },
                      { name: 'Петр', surname: 'Петров', email: 'petr.petrov@mail.ru', password: 'qwert' },
                      { name: 'Алексей ', surname: 'Алексеев', email: 'alex.alexeev@mail.ru', password: 'qwert' },
                      { name: 'Амаяк', surname: 'Акопян', email: 'amayak.akopyan@mail.ru', password: 'qwert' }
                    ])

categories = Category.create([
                               { title: 'Frontend' },
                               { title: 'Backend' },
                               { title: 'Database' }
                             ])

tests = Test.create([
                      { title: 'Ruby', level: 2, category: categories[1], author: users[0] },
                      { title: 'PostgreSQL', level: 1, category: categories[2], author: users[0] },
                      { title: 'HTML', level: 0, category: categories[0], author: users[1] },
                      { title: 'JavaScript', level: 1, category: categories[0], author: users[1] },
                      { title: 'Go', level: 6, category: categories[0], author: users[2] }
                    ])

questions = Question.create([
                              {  body: 'Назовите метод, который позволяет добавить метод к одному объекту?',
                                 test: tests[0] },
                              {  body: 'Выберите DML конструкции? ', test: tests[1] },
                              {  body: 'Является ли блок объектом?', test: tests[0] },
                              {  body: 'Какая типизация в GO?', test: tests[4] },
                              {  body: 'Назовите семь примитивных типов JS?', test: tests[3] },
                              {  body: 'Какой тег создает параграф или абзац?', test: tests[2] }
                            ])

answers = Answer.create([
                          { body: 'Singletone methods', correct: true, question: questions[0] },
                          {  body: 'INSERT, SELECT, UPDATE, DELETE', correct: true, question: questions[1] },
                          {  body: 'CREATE, ALTER, DROP', correct: false, question: questions[1] },
                          {  body: 'Нет', correct: true, question: questions[2] },
                          {  body: 'Статическая', correct: true, question: questions[3] },
                          {  body: 'string, number, boolean, symbol, null, undefined и bigin', correct: true,
                             question: questions[4] },
                          {  body: '<p>', correct: true, question: questions[5] }
                        ])
                        
test_passages = TestPassage.create([
                                  {user: users[0], test: tests[0]},
                                  {user: users[0], test: tests[1]},
                                  {user: users[1], test: tests[3]},
                                  {user: users[2], test: tests[3]},
                                  {user: users[3], test: tests[2]},
                                  ])
