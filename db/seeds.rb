# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Customer.create(
  first_name: '太郎',
  last_name: '長野',
  first_name_kana: 'タロウ',
  last_name_kana: 'ナガノ',
  email: 'nagano@example.com',
  postcode: '0001111',
  address: '東京都渋谷区代々木神園町3丁目4-7',
  phone_number:'09088885555',
  password: 'nagano',
  password_confirmation: 'nagano'
  )

Customer.create(
  first_name: '道子',
  last_name: '令和',
  first_name_kana: 'ミチコ',
  last_name_kana: 'レイワ',
  email: 'reiwa@example.com',
  postcode: '2223333',
  address: '東京都港区六本木３丁目２−１',
  phone_number:'04044445555',
  password: 'michiko',
  password_confirmation: 'michiko'
  )

Customer.create(
  first_name: '無双',
  last_name: '国士',
  first_name_kana: 'ムソウ',
  last_name_kana: 'コクシ',
  email: 'kokushi@example.com',
  postcode: '4445555',
  address: '東京都新宿区新宿２丁目５−１0',
  phone_number:'04044445555',
  password: 'kokushi',
  password_confirmation: 'kokushi'
  )

Customer.create(
  first_name: '麻子',
  last_name: '雀川',
  first_name_kana: 'アサコ',
  last_name_kana: 'スズメガワ',
  email: 'asako@example.com',
  postcode: '6667777',
  address: '東京都渋谷区神南1-19-11',
  phone_number: '06044442222',
  password: 'asakong',
  password_confirmation: 'asakong',
  )

Admin.create(
  email: 'nagano.cake.infomation@gmail.com',
  password:'nagano',
  password_confirmation:'nagano'
  )


Address.create(
  postcode: '3334444',
  address: '岡山県岡山市北区内山下0-0',
  recieve_name: '伊原木隆子',
  customer_id: 1
  )

Address.create(
  postcode: '5552222',
  address: '大阪府大阪市中央区大手前0-0',
  recieve_name: '吉村 洋子',
  customer_id: 1
  )

Address.create(
  postcode: '6661111',
  address: '福岡県福岡市博多区東公園0-0',
  recieve_name: '服部誠子',
  customer_id: 1
  )

Genre.create(name: 'Cake')
Genre.create(name: 'Cookie')
Genre.create(name: 'prin')
Genre.create(name: 'Candy')

Item.create(
  genre_id: 1,
  name: 'Chocolat',
  image: File.open("./app/assets/images/chocolat.jpeg"),
  introduction: '人気商品「ショコラサンド」。サクッと食感、なめらかな口どけ、リッチで濃厚な味わいをお楽しみいただけます。ギフトにもおすすめです。',
  price_excluding_tax: 1200,
  is_active: true
  )
Item.create(
  genre_id: 1,
  name: 'Pumpkin',
  image: File.open("./app/assets/images/pumpkincake.jpeg"),
  introduction: 'かぼちゃとカスタードクリームにホイップのハーモニー。タルト生地に詰まった香ばしいアーモンドクリームがなめらかで濃厚な味わいを演出してくれます。',
  price_excluding_tax: 2300,
  is_active: true
  )
Item.create(
  genre_id: 1,
  name: 'Cheese',
  image: File.open("./app/assets/images/cheesecake.jpeg"),
  introduction: '濃厚なチーズケーキにブルーベリーを練りこみ、トップにもブルーベリーコンフィチュールを乗せたWブルーベリーチーズケーキです。',
  price_excluding_tax: 2400,
  is_active: true
  )
Item.create(
  genre_id: 1,
  name: 'Belly',
  image: File.open("./app/assets/images/bellycake.jpeg"),
  introduction: 'ホワイトムースとかわいいピンク色のいちごのムースで2層に仕上げ、鮮やかなベリーと黄桃を贅沢に散りばめました。真っ赤なゼリーの層で見た目も華やかです。',
  price_excluding_tax: 2500,
  is_active: true
  )
Item.create(
  genre_id: 2,
  name: 'Assort',
  image: File.open("./app/assets/images/assort.jpeg"),
  introduction: 'カカオ本来の豊かな風味。「大切なひと時に柔らかい気持ちになれるようなクッキーを」という想いを込めて、優しい食感にこだわって作りました。',
  price_excluding_tax: 1200,
  is_active: true
  )
Item.create(
  genre_id: 2,
  name: 'Choco',
  image: File.open("./app/assets/images/choco.jpeg"),
  introduction: 'とろけるチョコチップとアーモンドの食感がたまらない。大切な人へ感謝を込めて。ギフトにもおすすめの一品です。',
  price_excluding_tax: 1200,
  is_active: true
  )
Item.create(
  genre_id: 2,
  name: 'Cute',
  image: File.open("./app/assets/images/cute.jpeg"),
  introduction: 'ギフトでは当店で一番人気の商品。甘酸っぱいオレンジと濃厚クリームチーズのハーモニーが絶品です。8個入りです。',
  price_excluding_tax: 2300,
  is_active: true
  )
Item.create(
  genre_id: 3,
  name: 'Caramel',
  image: File.open("./app/assets/images/caramel.jpeg"),
  introduction: 'キャラメルソースを練り込み、キャラメルの口溶けを感じるようなとろける食感に仕上げました。',
  price_excluding_tax: 1200,
  is_active: true
  )
Item.create(
  genre_id: 2,
  name: 'Special',
  image: File.open("./app/assets/images/special.jpeg"),
  introduction: '地元で集めたオーガニックな素材を使って作った濃厚ミルクプリン。いつもよりちょっとだけリッチに贅沢してみませんか？',
  price_excluding_tax: 1200,
  is_active: true
  )
