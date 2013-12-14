#coding:utf-8
#処理結果を表示するウィンドウを作成する
$:.unshift File.dirname(__FILE__)
require 'gtk2'
require './sortman.rb'
require './exit.rb'


class Results

	def initialize
		@st_num = 41 #ここを変えると座席数が変わるよ
	end
	
	def results
		#クラスをロード
		rand = Random.new
		exit = Exit.new
		
		#親ウィンドウ作成
		win = Gtk::Window.new
		win.title = "Result"
		
		#デリートイベントに接続
		win.signal_connect("delete_event") do 
			Gtk.main_quit

			false
		end
		
		#デストロイイベントに接続
		win.signal_connect("destroy") do
			Gtk.main_quit
			
			true
		end

		#ウィンドウサイズの設定
		win.border_width = 10
		#テーブルの作成
		table = Gtk::Table.new(7,6,true)

		#make_randで生成した乱数を格納する配列を作成
		random = Array.new(@st_num)
		aftrand = Array.new(@st_num)

		random = rand.make_rand(@st_num)
		#なかみぐちゃぐちゃ〜〜〜
		disturb= random.shuffle

		#initialzeで設定した分のテキストエントリを格納する配列を作成
		entrys = Array.new(@st_num)

		#配列の中身は0からスタートするので、1ずつ足す
		for i in 0..@st_num - 1
			disturb[i] += 1
		end

		#initializeで設定した個数のテキストエントリを作成し、テキストを設定する
		for i in 0..@st_num - 1
			entrys[i] = Gtk::Entry.new
			entrys[i].set_text("                    "+disturb[i].to_s+"番")
			entrys[i].set_editable(false) #エントリ内のテキストの操作を禁止
		end

		#パックするエントリの番号を指定するカウンタ
		count = 0

		for j in 0..5
			for k in 0..6
					table.attach(entrys[count],j,j+1,k,k+1,xop = Gtk::FILL|Gtk::EXPAND,yop = Gtk::FILL|Gtk::EXPAND,5,5)

				#カウンタのインクリメント
				count += 1
			end
		end

		#「黒板」と表示するラベルを作成
		label = Gtk::Label.new("黒板",use_underline = nil)
		label.set_justify(Gtk::JUSTIFY_CENTER) #ラベルの表示位置を中央に設定
		
		#垂直ボックスの作成
		box = Gtk::VBox.new(false,10)

		#Exit.rbのExitクラスからプログラム終了ボタンをロード
		jail_breaker = exit.exit_button

		#ボタンを都合よく配置するための水平ボックスの作成
		hbox = Gtk::HBox.new(true,0)
		
		#水平ボックスに終了ボタンをを格納
		hbox.pack_start(jail_breaker,false,false,200)
		
		#垂直ボックスに各オブジェクトを格納
		box.pack_end(hbox,true,false,10)
		box.pack_end(table,true,false,5)
		box.pack_end(label,false,false,10)

		win.add(box)
		return win
	end
end
