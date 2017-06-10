# encoding: shift_jis

#ヘッダーの読込
require_relative 'SYSTEM/header'

#タイトル名
Window.caption=("DXRuby ADVサンプル")

#マウスポインタ作成
mouse = Sprite.new(0, 0, Image.new(10, 10, C_DEFAULT))

#フォントサイズの指定
font = Font.new(26)

#メッセージボックス生成
messagebox = WIN32OLE.new('WScript.Shell')

#ルート管理変数
flag = 99

#メインループ
Window.loop do

	case flag 

		#タイトル画面
		when 99
			flag = title(mouse, font, messagebox, flag)

		when 1
			script = Script.new; script.read(flag); flag = script.draw(font, messagebox, flag)

		when 2
			script = Script.new; script.read(flag); flag = script.draw(font, messagebox, flag)

		when 3
			script = Script.new; script.read(flag); flag = script.draw(font, messagebox, flag)

		when 4
			script = Script.new; script.read(flag); flag = script.draw(font, messagebox, flag)

		when 5
			script = Script.new; script.read(flag); flag = script.draw(font, messagebox, flag)

		when 6
			script = Script.new; script.read(flag); flag = script.draw(font, messagebox, flag)

		when 7
			script = Script.new; script.read(flag); flag = script.draw(font, messagebox, flag)

		when 8
			script = Script.new; script.read(flag); flag = script.draw(font, messagebox, flag)

		when 9
			script = Script.new; script.read(flag); flag = script.draw(font, messagebox, flag)

		when 10
			script = Script.new; script.read(flag); flag = script.draw(font, messagebox, flag)

		when 11
			#マップの描画
			flag = map(font, messagebox, flag)
	end
end
