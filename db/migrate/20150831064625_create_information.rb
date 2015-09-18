class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      
      t.string :search_text     #검색어
      
      t.string :song_name       #제목
      t.string :song_singer     #가수
      t.string :song_sheet      #악보
      t.string :song_session    #세션
      t.string :song_text       #가사
      t.string :song_category   #장르
      
      t.timestamps null: false
    end
  end
end
