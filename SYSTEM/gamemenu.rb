# encoding: shift_jis

#�Q�[�����j���[�p�I�u�W�F�N�g����
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

#�Q�[�����j���[���\�b�h
def gamemenu(messagebox, flag, font)

	#�e�탁�j���[�{�^�����}�E�X�p�I�u�W�F�N�g����
	menu, mouse, save, load, config, back, quit = gamemenu_object

	Input.mouse_enable=(true)

	Window.loop do

		#�}�E�X�ʒu�̎擾
		mouse.x, mouse.y = Input.mouse_pos_x, Input.mouse_pos_y

		#�e�탁�j���[�̕`��
		menu.draw
		save.draw
		load.draw
		config.draw
		back.draw
		quit.draw

		case mouse
			when save
				Window.draw_font(0, 450, "�Z�[�u���܂�", font, color:C_BLACK, z:4)

				#���N���b�N���̏���
				if Input.mouse_push?(M_LBUTTON) then
					#�u�͂��v�������ƏI��
					if messagebox.Popup("�Z�[�u���܂����H", 10, "DXRuby ADV�T���v��", 4 + 32 ) == 6 then
						savedata_menu(font, mouse, messagebox, flag, 0)
					end
				end

			when load
				Window.draw_font(0, 450, "���[�h���܂�", font, color:C_BLACK, z:4)

				#���N���b�N���̏���
				if Input.mouse_push?(M_LBUTTON) then
					#�u�͂��v�������ƏI��
					if messagebox.Popup("���[�h���܂����H", 10, "DXRuby ADV�T���v��", 4 + 32 ) == 6 then
						flag = savedata_menu(font, mouse, messagebox, flag, 1)
					end
				end

			when config
				Window.draw_font(0, 450, "�ݒ��ύX���܂�", font, color:C_BLACK, z:4)

				#���N���b�N���̏���
				if Input.mouse_push?(M_LBUTTON) then
					#�u�͂��v�������ƏI��
					if messagebox.Popup("�ݒ��ύX���܂����H", 10, "DXRuby ADV�T���v��", 4 + 32 ) == 6 then
						exit
					end
				end

			when back
				Window.draw_font(0, 450, "�Q�[���ɖ߂�܂�", font, color:C_BLACK, z:4)

				#���N���b�N���̏���
				if Input.mouse_push?(M_LBUTTON) then
					#�u�͂��v�������ƏI��
					if messagebox.Popup("�Q�[���ɖ߂�܂����H", 10, "DXRuby ADV�T���v��", 4 + 32 ) == 6 then
						return flag
					end
				end

			when quit
				Window.draw_font(0, 450, "�Q�[�����I�����܂�", font, color:C_BLACK, z:4)

				#���N���b�N���̏���
				if Input.mouse_push?(M_LBUTTON) then
					#�u�͂��v�������ƏI��
					if messagebox.Popup("�Q�[�����I�����܂����H", 10, "DXRuby ADV�T���v��", 4 + 32 ) == 6 then
						exit
					end
				end
		end

		#�E�N���b�N���̏���
		if Input.mouse_push?(M_RBUTTON) then
			#�u�͂��v�������ƏI��
			if messagebox.Popup("�Q�[���ɖ߂�܂����H", 10, "DXRuby ADV�T���v��", 4 + 32 ) == 6 then
				return flag
			end
		end

		#�G�X�P�[�v�L�[�ŏI��
		exit_message(messagebox)
	end
end

#�Q�[�����j���[�Ăяo�����\�b�h
def gamemenu_call(messagebox, flag, font)

	#�E�N���b�N���̏���
	if Input.mouse_push?(M_RBUTTON) then
		#�u�͂��v�������ƏI��
		if messagebox.Popup("�Q�[�����j���[�Ɉڍs���܂����H", 10, "DXRuby ADV�T���v��", 4 + 32 ) == 6 then
			flag = gamemenu(messagebox, flag, font)
			return flag
		end
	end
end