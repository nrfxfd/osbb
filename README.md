# README

Проект сайту ОСББ.
В  підручниках по Ruby on Rails всі автори створюють блог. В навчальних цілях, 
створено блог (в проекті він залишився під назвою "Дошка оголошень").
Черговий раз зустрівши нашого голову ОСББ, вирішив, що сайт для нашого ОСББ значно полегшить йому і бухгалтерші роботу.
(Бухгалтерша, правда пізніше, зрозуміла, що її можуть взагалі звільнити. Тому, при формуванні ТЗ, 
неохоче надавала інформацію, а зараз взагалі морозиться.) 
	
     Основні вимоги до сайта наступні(+ реалізовано, - нереалізовано):
     
Для адміністратора, голови, бухгалтера:

+ облік всіх квартир будинку(номер, площа, кількість мешканців) 
+ облік всіх мешканців будинку(ПІБ, № телефону)                    
+ облік лічильників електроенергії і води 
 (облік опалення відсутній - у нас автономне, тому у кожної квартири
  окремий договір з газопостачальною компанією)
- формування звіту по сумарній заборгованості для окремої квартири і для всього будинку загалом
- формуваня документів для податкової, банку тощо

Для мешканців квартири:

+ авторизація і аутентифікація для кожної квартири
+ передача показників лічильників через окремий кабінет для кожної квартири
- можливість оплати заборгованості для кожної квартири

спочатку для авторизації був прикручений окремий пакет для рельсів і вона проводилась через 
імейл, в тому числі для блогу. Але , мабуть, це буде занадто складно для окремих мешканців
нашого будинку. Тому авторизація проводиться за наступною схемою: Логін - це номер квартири, і пароль
не менше 4-х символів. Прав в такого юзера на сайті не так багато
(обмеження прописано як на фронтенді так і на серверній частині)(+ реалізовано, - нереалізовано):

+ зміна № телефону
+ зміна показників лічильників
- треба реалізувати захист від вводу занадто великих значень показників, як на рівні бізнес-логіки так 
  і на рівні фронтенду
- оплата

Блог, поки що, доступний для всіх, без реєстрації. Пишіть)

Сайт розгорнуто на хмарній платформі Heroku за адресою: https://tkz6.herokuapp.com/
CУБД PostgreSQL. Права адміна надаються певній квартирі прапорцем у БД. Через веб-інтерфейс ця функція не 
реалізована. БД на хост грузиться окремо, через AWS.

Views. 

Головна сторінку сайту з шаблону Bootstrap. Вона знаходиться тут: osbb/app/views/layouts/application.html.erb  -це  html-сторінка,
тільки в ній між символами <%  %> можна писати код на Рубі, який буде виконуватись (якщо <%=  %>, то visible)

osbb/app/views/.......
для кожного контроллера:apartments(квартири), residents (мешканці), counters...(лічильники) є свої представлення (views):
  --show.html.erb   READ
  --new.html.erb    CREATE
  --edit.html.erb   UPDATE
