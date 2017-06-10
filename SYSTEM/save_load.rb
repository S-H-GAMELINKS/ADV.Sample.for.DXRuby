# encoding: shift_jis

#セーブデータ用スクリーンショット1の読込
def savedata_screenshot_load

	if File.exist?("DATA/SAVE/savedata1.png") then
		savedata1_screenshot = Image.load("DATA/SAVE/savedata1.png")
	else
		savedata1_screenshot = Image.new(640, 480, [0, 0, 0, 0])
	end

	if File.exist?("DATA/SAVE/savedata2.png") then
		savedata2_screenshot = Image.load("DATA/SAVE/savedata2.png")
	else
		savedata2_screenshot = Image.new(640, 480, [0, 0, 0, 0])
	end

	if File.exist?("DATA/SAVE/savedata3.png") then
		savedata3_screenshot = Image.load("DATA/SAVE/savedata3.png")
	else
		savedata3_screenshot = Image.new(640, 480, [0, 0, 0, 0])
	end

	return savedata1_screenshot, savedata2_screenshot, savedata3_screenshot
end

#セーブデータ１のロード
def savedata1_load
	#ルート管理変数への代入（セーブデータの読み込み)
	flag = File.open("DATA/SAVE/savedata1_flag.txt", "r").read.to_i
	puts flag
	return flag
end

#セーブデータ２のロード
def savedata2_load
	#ルート管理変数への代入（セーブデータの読み込み)
	flag = File.open("DATA/SAVE/savedata2_flag.txt", "r").read.to_i
	puts flag
	return flag
end

#セーブデータ３のロード
def savedata3_load
	#ルート管理変数への代入（セーブデータの読み込み)
	flag = File.open("DATA/SAVE/savedata3_flag.txt", "r").read.to_i
	
	return flag
end

#savedata_loadメソッドの定義
def savedata_load(font, mouse, messagebox)

	savedata1 =  Sprite.new(100, 300, Image.new(250, 30, C_DEFAULT))
	savedata2 =  Sprite.new(100, 350, Image.new(250, 30, C_DEFAULT))
	savedata3 =  Sprite.new(100, 400, Image.new(250, 30, C_DEFAULT))
	back = Sprite.new(100, 450, Image.new(200, 300, C_DEFAULT))

	savedata1_screenshot, savedata2_screenshot, savedata3_screenshot = savedata_screenshot_load()

	#描画ループ
	Window.loop do

		#マウス位置の取得
		mouse.x, mouse.y = Input.mouse_pos_x, Input.mouse_pos_y

		#ロード用オブジェクト＆
		savedata1.draw; savedata2.draw; savedata3.draw; mouse.draw

		#各種ゲームメニューの描画
		Window.draw_font(100, 300, "セーブデータ１をロード", font)
		Window.draw_font(100, 350, "セーブデータ２をロード", font)
		Window.draw_font(100, 400, "セーブデータ３をロード", font)
		Window.draw_font(100, 450, "BACK", font)

		case mouse
			when savedata1
				#セーブデータ画像の描画
				Window.draw_scale(100, -100, savedata1_screenshot, 0.5, 0.5, 1)

				if Input.mouse_push?(M_LBUTTON) then
					if messagebox.Popup("セーブデータ１をロードしますか？", 10, "DXRuby ADVサンプル", 4 + 32 ) == 6 then
						flag = savedata1_load()
						return flag
					end
				end

			when savedata2
				#セーブデータ画像の描画
				Window.draw_scale(100, -100, savedata2_screenshot, 0.5, 0.5, 1)

				if Input.mouse_push?(M_LBUTTON) then
					if messagebox.Popup("セーブデータ２をロードしますか？", 10, "DXRuby ADVサンプル", 4 + 32 ) == 6 then
						savedata2_load()
						return flag
					end
				end

			when savedata3
				#セーブデータ画像の描画
				Window.draw_scale(100, -100, savedata3_screenshot, 0.5, 0.5, 1)

				if Input.mouse_push?(M_LBUTTON) then
					if messagebox.Popup("セーブデータ３をロードしますか？", 10, "DXRuby ADVサンプル", 4 + 32 ) == 6 then
						savedata3_load()
						return flag
					end
				end

			when back
				if Input.mouse_push?(M_LBUTTON) then
					break
				end
		end

		#エスケープキーで終了
		exit_message(messagebox)
	end
end

#セーブデータ１にセーブ
def savedata1_save(flag)
	#ルート管理変数の書き込み（セーブデータの書き込み)
	File.write("DATA/SAVE/savedata1_flag.txt", flag.to_s)
	puts flag
end

#セーブデータ２にセーブ
def savedata2_save(flag)
	#ルート管理変数の書き込み（セーブデータの書き込み)
	File.write("DATA/SAVE/savedata2_flag.txt", flag.to_s)
end

#セーブデータ３にセーブ
def savedata3_save(flag)
	#ルート管理変数の書き込み（セーブデータの書き込み)
	File.write("DATA/SAVE/savedata3_flag.txt", flag.to_s)
end

#savedata_saveメソッドの定義
def savedata_save(font, mouse, messagebox, flag)

	savedata1 =  Sprite.new(100, 300, Image.new(250, 30, C_DEFAULT))
	savedata2 =  Sprite.new(100, 350, Image.new(250, 30, C_DEFAULT))
	savedata3 =  Sprite.new(100, 400, Image.new(250, 30, C_DEFAULT))
	back = Sprite.new(100, 450, Image.new(200, 300, C_DEFAULT))

	#スクリーンショットの読込
	savedata1_screenshot, savedata2_screenshot, savedata3_screenshot = savedata_screenshot_load()

	#描画ループ
	Window.loop do

		#マウス位置の取得
		mouse.x, mouse.y = Input.mouse_pos_x, Input.mouse_pos_y

		#ロード用オブジェクト＆
		savedata1.draw; savedata2.draw; savedata3.draw; mouse.draw

		#各種ゲームメニューの描画
		Window.draw_font(100, 300, "セーブデータ１をロード", font)
		Window.draw_font(100, 350, "セーブデータ２をロード", font)
		Window.draw_font(100, 400, "セーブデータ３をロード", font)
		Window.draw_font(100, 450, "BACK", font)

		case mouse
			when savedata1
				#セーブデータ画像の描画
				Window.draw_scale(100, -100, savedata1_screenshot, 0.5, 0.5, 1)

				if Input.mouse_push?(M_LBUTTON) then
					if messagebox.Popup("セーブデータ１にセーブしますか？", 10, "DXRuby ADVサンプル", 4 + 32 ) == 6 then
						savedata1_save(flag)
					end
				end

			when savedata2
				#セーブデータ画像の描画
				Window.draw_scale(100, -100, savedata2_screenshot, 0.5, 0.5, 1)

				if Input.mouse_push?(M_LBUTTON) then
					if messagebox.Popup("セーブデータ２にセーブしますか？", 10, "DXRuby ADVサンプル", 4 + 32 ) == 6 then
						savedata2_save(flag)
					end
				end

			when savedata3
				#セーブデータ画像の描画
				Window.draw_scale(100, -100, savedata3_screenshot, 0.5, 0.5, 1)

				if Input.mouse_push?(M_LBUTTON) then
					if messagebox.Popup("セーブデータ３にセーブしますか？", 10, "DXRuby ADVサンプル", 4 + 32 ) == 6 then
						savedata3_save(flag)
					end
				end

			when back
				if Input.mouse_push?(M_LBUTTON) then
					break
				end
		end

		#エスケープキーで終了
		exit_message(messagebox)
	end
end
