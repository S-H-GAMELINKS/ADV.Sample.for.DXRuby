# encoding: shift_jis

#スクリプト描画メソッド
def script_line_draw(line, font)

	#文字位置の初期化
	x = 0; y = 0

	line.each_char do |word|

		Window.draw_font(30 + x, 350 + y, word, font, z:4)

		#文字位置を一つ進める
		x += 30

		if x >= 600 then
			x = 0
			y += 30
		end
	end
end

#スクリプト描画クラス
class Script

	#初期化
	def initialize(text = "")
		@text = text
		@bg = Sprite.new(0, 350, Image.new(640, 480, C_DEFAULT))
		@char = Sprite.new(0, 350, Image.new(640, 480, C_DEFAULT))
		@bgm = nil
		@se = nil
		@window = Sprite.new(0, 350, Image.new(640, 480, C_BLACK))
	end

	#スクリプト読込
	def read(flag)

		case flag
			#プロローグの読込
			when 1
				@text = File.open("DATA/STR/prologue.txt", "r")
			#出雲大社
			when 2
				@text = File.open("DATA/STR/出雲大社.txt", "r")
			#旧大社駅
			when 3
				@text = File.open("DATA/STR/旧大社駅.txt", "r")
			#稲佐の浜
			when 4
				@text = File.open("DATA/STR/稲佐の浜.txt", "r")
			#日御碕灯台
			when 5
				@text = File.open("DATA/STR/日御碕灯台.txt", "r")
			#立久恵峡
			when 6
				@text = File.open("DATA/STR/立久恵峡.txt", "r")
			#須佐神社
			when 7
				@text = File.open("DATA/STR/須佐神社.txt", "r")
			#BADエンド
			when 8
				@text = File.open("DATA/STR/BAD.txt", "r")
			#GOODエンド
			when 9
				@text = File.open("DATA/STR/GOOD.txt", "r")
			#TRUEエンド
			when 10
				@text = File.open("DATA/STR/TRUE.txt", "r")
		end

		return @string = @text.read
	end

	#文字列と各種素材の描画
	def draw(font, messagebox, flag)

		@string.each_line do |line|

			case line
				when /char\d\d/
					line.chomp!
					@char = Sprite.new(150, 0,Image.load("DATA/CHAR/#{line}.png"))
					line.gsub!(/char\d\d/, "")
				when /bg\d\d/
					line.chomp!
					@bg = Sprite.new(0, 0, Image.load("DATA/BG/#{line}.png"))
					line.gsub!(/bg\d\d/, "")
				when /bgm\d\d/
					line.chomp!
					@bgm = Sound.new("DATA/BGM/#{line}.wav"); @bgm.play
					line.gsub!(/bgm\d\d/, "")
				when /se\d\d/
					line.chomp!
					@se = Sound.new("DATA/SE/#{line}.wav"); @se.play
					line.gsub!(/se\d\d/, "")
				when /EOF/
					line.gsub!(/EOF/, "")
						flag = 11
						return flag
				else
					Window.loop do

						@bg.draw; @char.draw; @window.draw

						script_line_draw(line, font)

						#エンターキーで次の文字列を呼び出す
						if Input.mouse_push?(M_LBUTTON); break; end

						#ゲームメニュー呼び出し
						gamemenu_call(messagebox, flag, font)

						#エスケープキーで終了
						exit_message(messagebox)
					end
			end
		end
	end
end