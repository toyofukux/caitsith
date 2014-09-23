# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Video.find_or_create_by(title: "イングロリアス・バスターズ")
Video.find_or_create_by(title: "モテキ")
Video.find_or_create_by(title: "風立ちぬ")
Thumbnail.find_or_create_by(video_id: 1, url: "http://pds.exblog.jp/pds/1/201007/08/84/d0151584_1114428.jpg")
Thumbnail.find_or_create_by(video_id: 2, url: "http://www.1101.com/moteki_movie/images/head_01.jpg")
Thumbnail.find_or_create_by(video_id: 3, url: "http://blogimg.goo.ne.jp/user_image/06/e6/35e16f0fe23853040642a54b8bdba243.jpg")
