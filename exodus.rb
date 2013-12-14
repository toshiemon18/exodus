#coding:utf-8
$:.unshift File.dirname(__FILE__)
require 'gtk2'
require './main/exit.rb'
require './main/results.rb'

exit = Exit.new
results = Results.new

#ウィンドウ生成
win = Gtk::Window.new
win.title = "Exodus"
#デリートイベントに接続
win.signal_connect("delete_event") do
	false
end

#デストロイイベントに接続
win.signal_connect("destroy") do
	Gtk.main_quit
	
	true
end

#ウィンドウのサイズをリクエスト
win.set_size_request(390,190)

#処理を開始するボタンを作成
beginning = Gtk::Button.new("Start  \n   seat substitute!")
#フォントと文字サイズを指定
style = Gtk::Style.new
style.font_desc = Pango::FontDescription.new("Serif 12")

#ボタンに指定したフォント、文字サイズを適応
beginning.child.style = style

#beginningをclickedイベントに接続
beginning.signal_connect("clicked") do
	obj = results.results
	obj.show_all
	Gtk.main
end

#プログラム終了ボタンをExitクラスからロード
escape = exit.exit_button

#表示結果についての注意を示すラベル
cauntion = Gtk::Label.new("  ※処理結果は出席番号で表示", use_underline = nil)
#お飾りのラベル
dev = Gtk::Label.new("Developed by @toshiemon18", use_underline = nil)
dev.style = style

#水平ボックスを作成(終了ボタンとcauntionを格納)
h = Gtk::HBox.new(true, 0)
#beginningを綺麗に配置するためのボックス
h2 = Gtk::HBox.new(false,0)

#垂直ボックスを作成(最終的なすべてのウィジェットを格納)
v = Gtk::VBox.new(false, 0)

#生成した水平ボックスにボタンとラベルを格納
h.pack_end(escape, false, false, 30)
h.pack_end(cauntion, false, false, 60)
#beginningを格納
h2.pack_start(dev, false, false,20)

#各ウィジェットを垂直ボックスに格納
v.pack_end(h2, false, false, 5)
v.pack_end(h, false, false, 8)
v.pack_end(beginning,true, false, 20)

win.add(v)
win.show_all
Gtk.main
