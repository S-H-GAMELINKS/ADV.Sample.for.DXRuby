# encoding: shift_jis

#�Z�[�u�f�[�^�p�X�N���[���V���b�g1�̓Ǎ�
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

#�Z�[�u�f�[�^�P�̃��[�h
def savedata1_load
	#���[�g�Ǘ��ϐ��ւ̑���i�Z�[�u�f�[�^�̓ǂݍ���)
	flag = File.open("DATA/SAVE/savedata1_flag.txt", "r").read.to_i
	puts flag
	return flag
end

#�Z�[�u�f�[�^�Q�̃��[�h
def savedata2_load
	#���[�g�Ǘ��ϐ��ւ̑���i�Z�[�u�f�[�^�̓ǂݍ���)
	flag = File.open("DATA/SAVE/savedata2_flag.txt", "r").read.to_i
	puts flag
	return flag
end

#�Z�[�u�f�[�^�R�̃��[�h
def savedata3_load
	#���[�g�Ǘ��ϐ��ւ̑���i�Z�[�u�f�[�^�̓ǂݍ���)
	flag = File.open("DATA/SAVE/savedata3_flag.txt", "r").read.to_i
	
	return flag
end

#savedata_load���\�b�h�̒�`
def savedata_load(font, mouse, messagebox)

	savedata1 =  Sprite.new(100, 300, Image.new(250, 30, C_DEFAULT))
	savedata2 =  Sprite.new(100, 350, Image.new(250, 30, C_DEFAULT))
	savedata3 =  Sprite.new(100, 400, Image.new(250, 30, C_DEFAULT))
	back = Sprite.new(100, 450, Image.new(200, 300, C_DEFAULT))

	savedata1_screenshot, savedata2_screenshot, savedata3_screenshot = savedata_screenshot_load()

	#�`�惋�[�v
	Window.loop do

		#�}�E�X�ʒu�̎擾
		mouse.x, mouse.y = Input.mouse_pos_x, Input.mouse_pos_y

		#���[�h�p�I�u�W�F�N�g��
		savedata1.draw; savedata2.draw; savedata3.draw; mouse.draw

		#�e��Q�[�����j���[�̕`��
		Window.draw_font(100, 300, "�Z�[�u�f�[�^�P�����[�h", font)
		Window.draw_font(100, 350, "�Z�[�u�f�[�^�Q�����[�h", font)
		Window.draw_font(100, 400, "�Z�[�u�f�[�^�R�����[�h", font)
		Window.draw_font(100, 450, "BACK", font)

		case mouse
			when savedata1
				#�Z�[�u�f�[�^�摜�̕`��
				Window.draw_scale(100, -100, savedata1_screenshot, 0.5, 0.5, 1)

				if Input.mouse_push?(M_LBUTTON) then
					if messagebox.Popup("�Z�[�u�f�[�^�P�����[�h���܂����H", 10, "DXRuby ADV�T���v��", 4 + 32 ) == 6 then
						flag = savedata1_load()
						return flag
					end
				end

			when savedata2
				#�Z�[�u�f�[�^�摜�̕`��
				Window.draw_scale(100, -100, savedata2_screenshot, 0.5, 0.5, 1)

				if Input.mouse_push?(M_LBUTTON) then
					if messagebox.Popup("�Z�[�u�f�[�^�Q�����[�h���܂����H", 10, "DXRuby ADV�T���v��", 4 + 32 ) == 6 then
						savedata2_load()
						return flag
					end
				end

			when savedata3
				#�Z�[�u�f�[�^�摜�̕`��
				Window.draw_scale(100, -100, savedata3_screenshot, 0.5, 0.5, 1)

				if Input.mouse_push?(M_LBUTTON) then
					if messagebox.Popup("�Z�[�u�f�[�^�R�����[�h���܂����H", 10, "DXRuby ADV�T���v��", 4 + 32 ) == 6 then
						savedata3_load()
						return flag
					end
				end

			when back
				if Input.mouse_push?(M_LBUTTON) then
					break
				end
		end

		#�G�X�P�[�v�L�[�ŏI��
		exit_message(messagebox)
	end
end

#�Z�[�u�f�[�^�P�ɃZ�[�u
def savedata1_save(flag)
	#���[�g�Ǘ��ϐ��̏������݁i�Z�[�u�f�[�^�̏�������)
	File.write("DATA/SAVE/savedata1_flag.txt", flag.to_s)
	puts flag
end

#�Z�[�u�f�[�^�Q�ɃZ�[�u
def savedata2_save(flag)
	#���[�g�Ǘ��ϐ��̏������݁i�Z�[�u�f�[�^�̏�������)
	File.write("DATA/SAVE/savedata2_flag.txt", flag.to_s)
end

#�Z�[�u�f�[�^�R�ɃZ�[�u
def savedata3_save(flag)
	#���[�g�Ǘ��ϐ��̏������݁i�Z�[�u�f�[�^�̏�������)
	File.write("DATA/SAVE/savedata3_flag.txt", flag.to_s)
end

#savedata_save���\�b�h�̒�`
def savedata_save(font, mouse, messagebox, flag)

	savedata1 =  Sprite.new(100, 300, Image.new(250, 30, C_DEFAULT))
	savedata2 =  Sprite.new(100, 350, Image.new(250, 30, C_DEFAULT))
	savedata3 =  Sprite.new(100, 400, Image.new(250, 30, C_DEFAULT))
	back = Sprite.new(100, 450, Image.new(200, 300, C_DEFAULT))

	#�X�N���[���V���b�g�̓Ǎ�
	savedata1_screenshot, savedata2_screenshot, savedata3_screenshot = savedata_screenshot_load()

	#�`�惋�[�v
	Window.loop do

		#�}�E�X�ʒu�̎擾
		mouse.x, mouse.y = Input.mouse_pos_x, Input.mouse_pos_y

		#���[�h�p�I�u�W�F�N�g��
		savedata1.draw; savedata2.draw; savedata3.draw; mouse.draw

		#�e��Q�[�����j���[�̕`��
		Window.draw_font(100, 300, "�Z�[�u�f�[�^�P�����[�h", font)
		Window.draw_font(100, 350, "�Z�[�u�f�[�^�Q�����[�h", font)
		Window.draw_font(100, 400, "�Z�[�u�f�[�^�R�����[�h", font)
		Window.draw_font(100, 450, "BACK", font)

		case mouse
			when savedata1
				#�Z�[�u�f�[�^�摜�̕`��
				Window.draw_scale(100, -100, savedata1_screenshot, 0.5, 0.5, 1)

				if Input.mouse_push?(M_LBUTTON) then
					if messagebox.Popup("�Z�[�u�f�[�^�P�ɃZ�[�u���܂����H", 10, "DXRuby ADV�T���v��", 4 + 32 ) == 6 then
						savedata1_save(flag)
					end
				end

			when savedata2
				#�Z�[�u�f�[�^�摜�̕`��
				Window.draw_scale(100, -100, savedata2_screenshot, 0.5, 0.5, 1)

				if Input.mouse_push?(M_LBUTTON) then
					if messagebox.Popup("�Z�[�u�f�[�^�Q�ɃZ�[�u���܂����H", 10, "DXRuby ADV�T���v��", 4 + 32 ) == 6 then
						savedata2_save(flag)
					end
				end

			when savedata3
				#�Z�[�u�f�[�^�摜�̕`��
				Window.draw_scale(100, -100, savedata3_screenshot, 0.5, 0.5, 1)

				if Input.mouse_push?(M_LBUTTON) then
					if messagebox.Popup("�Z�[�u�f�[�^�R�ɃZ�[�u���܂����H", 10, "DXRuby ADV�T���v��", 4 + 32 ) == 6 then
						savedata3_save(flag)
					end
				end

			when back
				if Input.mouse_push?(M_LBUTTON) then
					break
				end
		end

		#�G�X�P�[�v�L�[�ŏI��
		exit_message(messagebox)
	end
end
