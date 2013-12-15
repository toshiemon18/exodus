#coding:utf-8
require 'gtk2'

class Exit
	def exit_button
		#プログラムを終了するボタンの生成
		button = Gtk::Button.new("  Exit  ")
		button.signal_connect("clicked") do
			button.signal_connect("clicked") do
				Gtk.main_quit
			end
		end
		
		#フォントと文字サイズを指定
		style = Gtk::Style.new
		style.font_desc = Pango::FontDescription.new("Serif 12")
		
		#ボタンに指定したフォント、文字サイズを適応
		button.child.style = style
		
		return button
		
	end
end
