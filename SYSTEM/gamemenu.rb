# encoding: shift_jis

#ゲームメニュー用オブジェクト生成
def gamemenu_object

	menu = Sprite.new(0, 0, Image.load("DATA/BG/GAMEMENU.png"))
	mouse = Sprite.new(0, 350, Image.new(10, 10, C_DEFAULT))
	save = Sprite.new(45, 50, Image.new(100, 30, C_DEFAULT))
	load = Sprite.new(45, 110, Image.new(100, 30, C_DEFAULT))
	config = Sprite.new(45, 170, Image.new(100, 30, C_DEFAULT))
	back = Sprite.new(45, 230, Image.new(100, 30, C_DEFAULT))
	quit = Sprite.new(45, 290, Image.new(100, 30, C_DEFAULT))

	return menu, mouse, save, load, config, back, quit
end

#ゲームメニューメソッド
def gamemenu(messagebox, flag, font)

	#各種メニューボタン＆マウス用オブジェクト生成
	menu, mouse, save, load, config, back, quit = gamemenu_object

	Input.mouse_enable=(true)

	Window.loop do

		#マウス位置の取得
		mouse.x, mouse.y = Input.mouse_pos_x, Input.mouse_pos_y

		#各種メニューの描画
		menu.draw
		save.draw
		load.draw
		config.draw
		back.draw
		quit.draw

		case mouse
			when save
				Window.draw_font(0, 450, "セーブします", font, color:C_BLACK, z:4)

				#左クリック時の処理
				if Input.mouse_push?(M_LBUTTON) then
					#「はい」を押すと終了
					if messagebox.Popup("セーブしますか？", 10, "DXRuby ADVサンプル", 4 + 32 ) == 6 then
						savedata_menu(font, mouse, messagebox, flag, 0)
					end
				end

			when load
				Window.draw_font(0, 450, "ロードします", font, color:C_BLACK, z:4)

				#左クリック時の処理
				if Input.mouse_push?(M_LBUTTON) then
					#「はい」を押すと終了
					if messagebox.Popup("ロードしますか？", 10, "DXRuby ADVサンプル", 4 + 32 ) == 6 then
						flag = savedata_menu(font, mouse, messagebox, flag, 1)
					end
				end

			when config
				Window.draw_font(0, 450, "設定を変更します", font, color:C_BLACK, z:4)

				#左クリック時の処理
				if Input.mouse_push?(M_LBUTTON) then
					#「はい」を押すと終了
					if messagebox.Popup("設定を変更しますか？", 10, "DXRuby ADVサンプル", 4 + 32 ) == 6 then
						exit
					end
				end

			when back
				Window.draw_font(0, 450, "ゲームに戻ります", font, color:C_BLACK, z:4)

				#左クリック時の処理
				if Input.mouse_push?(M_LBUTTON) then
					#「はい」を押すと終了
					if messagebox.Popup("ゲームに戻りますか？", 10, "DXRuby ADVサンプル", 4 + 32 ) == 6 then
						return flag
					end
				end

			when quit
				Window.draw_font(0, 450, "ゲームを終了します", font, color:C_BLACK, z:4)

				#左クリック時の処理
				if Input.mouse_push?(M_LBUTTON) then
					#「はい」を押すと終了
					if messagebox.Popup("ゲームを終了しますか？", 10, "DXRuby ADVサンプル", 4 + 32 ) == 6 then
						exit
					end
				end
		end

		#右クリック時の処理
		if Input.mouse_push?(M_RBUTTON) then
			#「はい」を押すと終了
			if messagebox.Popup("ゲームに戻りますか？", 10, "DXRuby ADVサンプル", 4 + 32 ) == 6 then
				return flag
			end
		end

		#エスケープキーで終了
		exit_message(messagebox)
	end
end

#ゲームメニュー呼び出しメソッド
def gamemenu_call(messagebox, flag, font)

	#右クリック時の処理
	if Input.mouse_push?(M_RBUTTON) then
		#「はい」を押すと終了
		if messagebox.Popup("ゲームメニューに移行しますか？", 10, "DXRuby ADVサンプル", 4 + 32 ) == 6 then
			flag = gamemenu(messagebox, flag, font)
			return flag
		end
	end
end