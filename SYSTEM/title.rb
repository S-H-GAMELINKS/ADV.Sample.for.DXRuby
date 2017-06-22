# encoding: shift_jis

#�^�C�g���p�I�u�W�F�N�g����
def title_object

	#�^�C�g������
	title = Sprite.new(0, 0, Image.load("DATA/BG/TITLE.png"))

	#�e�탁�j���[
	start = Sprite.new(490, 30, Image.new(100, 30, C_DEFAULT))
	load = Sprite.new(490, 90, Image.new(100, 30, C_DEFAULT))
	quit = Sprite.new(490, 150, Image.new(100, 30, C_DEFAULT))

	return title, start, load, quit
end

#�^�C�g�����j���[���\�b�h
def title(mouse, font, messagebox, flag)

	#�^�C�g���p�I�u�W�F�N�g����
	title, start, load, quit = title_object

	#���C�����[�v
	Window.loop do

		#�}�E�X�ʒu�̎擾
		mouse.x, mouse.y = Input.mouse_pos_x, Input.mouse_pos_y

		#�^�C�g����ʂ̕`��
		title.draw; start.draw; load.draw; quit.draw

		case mouse
			#START�I�����̏���
			when start
				Window.draw_font(0, 450, "�Q�[�����J�n���܂�", font, color:C_BLACK, z:4)

				#���N���b�N���̏���
				if Input.mouse_push?(M_LBUTTON) then
					return flag = 1
				end

			#LOAD�I�����̏���
			when load
				Window.draw_font(0, 450, "�Z�[�u�f�[�^�����[�h���܂�", font, color:C_BLACK, z:4)

				#���N���b�N���̏���
				if Input.mouse_push?(M_LBUTTON) then
					return flag = savedata_menu(font, mouse, messagebox, flag, 1)
				end
				
			#QUIT�I�����̏���
			when quit

				#���s���e�̕`��
				Window.draw_font(0, 450, "�Q�[�����I�����܂�", font, color:C_BLACK, z:4)

				#�I���m�F
				if Input.mouse_push?(M_LBUTTON) then
					#�u�͂��v�������ƏI��
					if messagebox.Popup("�Q�[�����I�����I�����܂����H", 10, "DXRuby ADV�T���v��", 4 + 32 ) == 6 then
						exit
					end
				end
		end

		#�G�X�P�[�v�L�[�ŏI��
		exit_message(messagebox)
	end

	return flag
end