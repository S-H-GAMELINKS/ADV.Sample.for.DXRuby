# encoding: shift_jis

def title(mouse, font, messagebox, flag)

	#タイトル文字
	title = Sprite.new(0, 0, Image.load("DATA/BG/TITLE.png"))

	#各種メニュー
	start = Sprite.new(490, 30, Image.new(100, 30, C_DEFAULT))
	load = Sprite.new(490, 90, Image.new(100, 30, C_DEFAULT))
	quit = Sprite.new(490, 150, Image.new(100, 30, C_DEFAULT))

	flag_temp = flag

	#メインループ
	Window.loop do

		#マウス位置の取得
		mouse.x, mouse.y = Input.mouse_pos_x, Input.mouse_pos_y

		#タイトル画面の描画
		title.draw; start.draw; load.draw; quit.draw

		case mouse
			#START選択時の処理
			when start
				Window.draw_font(0, 450, "ゲームを開始します", font, color:C_BLACK, z:4)

				#左クリック時の処理
				if Input.mouse_push?(M_LBUTTON) then
					return flag = 1
				end

			#LOAD選択時の処理
			when load
				Window.draw_font(0, 450, "セーブデータをロードします", font, color:C_BLACK, z:4)

				#左クリック時の処理
				if Input.mouse_push?(M_LBUTTON) then
					flag = savedata_load(font, mouse, messagebox)
					return flag
				end
				
			#QUIT選択時の処理
			when quit

				#実行内容の描画
				Window.draw_font(0, 450, "ゲームを終了します", font, color:C_BLACK, z:4)

				#終了確認
				if Input.mouse_push?(M_LBUTTON) then
					#「はい」を押すと終了
					if messagebox.Popup("ゲームを終了を終了しますか？", 10, "DXRuby ADVサンプル", 4 + 32 ) == 6 then
						exit
					end
				end
			else
				if flag_temp != flag then
					return flag
					break
				end
		end

		#エスケープキーで終了
		exit_message(messagebox)
	end

	return flag
end